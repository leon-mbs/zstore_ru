<?php

//синхронизация  с  опенкартом

require_once 'init.php';

$status_name = "Ожидание";    //  статус  импортируемого  заказа

try {
    $conn = \ZDB\DB::getConnect();

    $logger->info("Синхронизация с опенкарт ");

    \App\Modules\OCStore\Helper::connect() ;

    $user = \App\Entity\User::getByLogin('admin') ;
    \App\System::setUser($user)   ;

    $statuses =  \App\System::getSession()->statuses;
    if(is_array($statuses)== false  || count($statuses)==0) {

        $logger->error("Проблемы с соежинением");

        return;
    }
    $status = -1;
    foreach($statuses as  $k=>$v) {
        if($v==$status_name) {
            $status = $k;
        }
    }
    if($status == -1) {
        $logger->error("Не нейден статус " . $status_name);
        return;
    }
    $modules = \App\System::getOptions("modules");

    $site = $modules['ocsite'];
    $apiname = $modules['ocapiname'];
    $key = $modules['ockey'];
    $site = trim($site, '/');

    $url = $site . '/index.php?route=api/login';

    $fields = array(
        'username' => $apiname,
        'key' => $key
    );

    $json = \App\Modules\OCStore\Helper::do_curl_request($url, $fields);


    if ($json === false) {
        return;
    }
    $data = json_decode($json, true);
    if ($data==null) {
        $logger->error($json);
        return;
    }
    if (is_array($data) && count($data) == 0) {
        $logger->error('Нет данных ответа');
        return;
    }

    if (is_array($data['error'])) {
        $logger->error(implode(' ', $data['error']));
        return;
    } elseif (strlen($data['error']) > 0) {
        $logger->error($data['error']);
        return;
    }

    if (strlen($data['success']) > 0) {

        if (strlen($data['api_token']) > 0) { //версия 3
            $token = "api_token=" . $data['api_token'];
        }
        if (strlen($data['token']) > 0) { //версия 2.3
            $token = "token=" . $data['token'];
        }
        if(strlen($token)==0) {
            echo  "Помилка. См. лог";
            return;
        }
        echo  "<br>Соединение  успешно";
        $logger->info("Соединение  успешно");
    }

    //список  артикулов
    $url = $site . '/index.php?route=api/zstore/articles&' . $token;
    $json = \App\Modules\OCStore\Helper::do_curl_request($url);
    if ($json === false) {
        return;
    }
    $data = json_decode($json, true);
    if (strlen($data['error']) > 0) {
        $logger->error($data['error']);
        return;
    }
    $articles = array();
    foreach($data['articles'] as $a) {
        if(strlen($a) > 0) {
            $articles[] = $a;
        }
    }


    $qlist = array();
    $plist = array();
    $newitems = array();
    $items = \App\Entity\Item::find("disabled <> 1 ");
    foreach ($items as $item) {
        if (strlen($item->item_code) == 0) {
            continue;
        }


        $qlist[$item->item_code] = $item->getQuantity();
        $plist[$item->item_code] = $item->getPrice($modules['ocpricetype']);



    }
    unset($items);

    //обновление  количеств
    if(true) {
        $data = json_encode($qlist);

        $fields = array(
            'data' => $data
        );
        $url = $site. '/index.php?route=api/zstore/updatequantity&' . $token;
        $json = \App\Modules\OCStore\Helper::do_curl_request($url, $fields);
        if ($json === false) {
            return;
        }
        $data = json_decode($json, true);

        if ($data['error'] != "") {
            $logger->error($data['error']);
            return;
        }

        echo  "<br>Обновлено количество";
        $logger->info("Обновлено количество");
    }

    //обновление  цен
    if(true) {
        $data = json_encode($plist);

        $fields = array(
            'data' => $data
        );
        $url = $site. '/index.php?route=api/zstore/updateprice&' . $token;
        $json = \App\Modules\OCStore\Helper::do_curl_request($url, $fields);
        if ($json === false) {
            return;
        }
        $data = json_decode($json, true);

        if ($data['error'] != "") {
            $logger->error($data['error']);
            return;
        }


        $logger->info("Обновлены цени");
        echo  "<br>Обновлены цени";
    }

    //импорт товаров
    if(true) {

        $url = $site . '/index.php?route=api/zstore/getproducts&' . $token;
        $json = \App\Modules\OCStore\Helper::do_curl_request($url, $fields);
        if ($json === false) {
            return;
        }
        $data = json_decode($json, true);


        if ($data['error'] != "") {
            $logger->error($data['error']);
            return;
        }

        foreach ($data['products'] as $product) {

            if (strlen($product['sku']) == 0) {
                continue;
            }

            $item = \App\Entity\Item::getFirst("item_code=" . \App\Entity\Item::qstr($product['sku']));
            if($item instanceof \App\Entity\Item) {
                $item->itemname = str_replace('&quot;', '"', $product['name']);
                $item->save();
            } else {
                $item = new  \App\Entity\Item();
                $item->itemname = str_replace('&quot;', '"', $product['name']);
                $item->item_code = $product['sku'];
                $item->bar_code = $product['sku'];
                $item->save();

            }


        }
    }


    //импорт заказов

    if(true) {

        $fields = array(
            'status_id' => $status
        );

        $url = $site . '/index.php?route=api/zstore/orders&' . $token;
        $json = \App\Modules\OCStore\Helper::do_curl_request($url, $fields);
        if ($json === false) {
            return;
        }
        $data = json_decode($json, true);


        if ($data['error'] != "") {
            $logger->error($data['error']);
            return;
        }

        $neworders = array();

        foreach ($data['orders'] as $ocorder) {


            $cnt  = $conn->getOne("select count(*) from documents_view where (meta_name='Order' or meta_name='TTN') and content like '%<ocorder>{$ocorder['order_id']}</ocorder>%'")  ;

            if (intval($cnt) > 0) { //уже импортирован
                continue;
            }


            $order = new \App\DataItem($ocorder);

            $neworders[$ocorder['order_id']] = $order;
        }

        $i = 0;
        foreach ($neworders as $shoporder) {


            $neworder = \App\Entity\Doc\Document::create('Order');


            $neworder->document_number = $neworder->nextNumber();
            $neworder->document_date = strtotime($shoporder->date_added);

            if (strlen($neworder->document_number) == 0) {
                $neworder->document_number = 'OC00001';
            }
            $neworder->customer_id = $modules['occustomer_id'];
            $total =0;
            $j=0;           //товары
            $tlist = array();
            foreach ($shoporder->_products_ as $product) {
                //ищем по артикулу
                if (strlen($product['sku']) == 0) {
                    continue;
                }
                $code = \App\Entity\Item::qstr($product['sku']);

                $tovar = \App\Entity\Item::getFirst('item_code=' . $code);
                if ($tovar == null) {


                    continue;
                }
                $tovar->quantity = $product['quantity'];
                $tovar->price = str_replace(',', '.', $product['price']);
                $desc = '';
                if (array($product['_options_'])) {
                    foreach ($product['_options_'] as $k => $v) {
                        $desc = $desc . $k . ':' . $v . ';';
                    }
                }
                //$tovar->octoreoptions = serialize($product['_options_']);
                $tovar->desc = $desc;
                $j++;
                $tovar->rowid = $j;
                $total  = $total +  ($tovar->quantity * $tovar->price) ;

                $tlist[$j] = $tovar;
            }
            if(count($tlist)==0) {
                return;
            }
            $neworder->packDetails('detaildata', $tlist);
            $neworder->amount = \App\Helper::fa($total);
            $neworder->payamount = \App\Helper::fa($shoporder->total);
            $neworder->headerdata['payamount']  = $neworder->payamount;
            $neworder->headerdata['totaldisc']  = $neworder->amount - $neworder->payamount;

            $neworder->headerdata['salesource'] = $modules['ocsalesource'];


            $neworder->headerdata['outnumber'] = $shoporder->order_id;
            $neworder->headerdata['ocorder'] = $shoporder->order_id;
            $neworder->headerdata['ocorderback'] = 0;
            $neworder->headerdata['pricetype'] = 'price1';
            $neworder->headerdata['store'] = \App\Helper::getDefStore();

            $neworder->notes = "OC номер:{$shoporder->order_id};";

            $neworder->headerdata['occlient'] = $shoporder->firstname . ' ' . $shoporder->lastname;
            $neworder->notes .= " Клієнт:" . $shoporder->firstname . ' ' . $shoporder->lastname . ";";
            $cust= null;
            if ($shoporder->customer_id > 0 && $modules['ocinsertcust'] == 1) {
                $cust = \App\Entity\Customer::getFirst("detail like '%<shopcust_id>{$shoporder->customer_id}</shopcust_id>%'");
                if ($cust == null) {
                    $cust = new \App\Entity\Customer();
                    $cust->shopcust_id = $shoporder->customer_id;
                    $cust->customer_name = $shoporder->firstname . ' ' . $shoporder->lastname;
                    $cust->address = $shoporder->shipping_city . ' ' . $shoporder->shipping_address_1;
                    $cust->type = \App\Entity\Customer::TYPE_BAYER;
                    $cust->phone = \App\Util::handlePhone($shoporder->telephone);
                    $cust->email = $shoporder->email;
                    $cust->comment = "Клiєнт OpenCart";
                    $cust->save();
                }
                $neworder->customer_id = $cust->customer_id;
            }


            if (strlen($shoporder->email) > 0) {
                $neworder->notes .= " Email:" . $shoporder->email . ";";
            }
            if (strlen($shoporder->telephone) > 0) {
                $neworder->notes .= " Тел:" . $shoporder->telephone . ";";
            }
            $neworder->notes .= " Адреса:" . $shoporder->shipping_city . ' ' . $shoporder->shipping_address_1 . ";";
            $neworder->notes .= " Оплата:" . $shoporder->payment_method . ";";
            $neworder->notes .= " Комментар:" . $shoporder->comment . ";";
            $neworder->save();
            $neworder->updateStatus(\App\Entity\Doc\Document::STATE_NEW);

            if($modules['ocsetpayamount']==1) {
                $neworder->updateStatus(\App\Entity\Doc\Document::STATE_WP);
            } else {
                $neworder->updateStatus(\App\Entity\Doc\Document::STATE_INPROCESS);
            }



            $i++;
        }

        $logger->info("Импортировно {$i} заказов ");
        echo  "<br>Импортировно {$i} заказов ";
    }

  //обновление  статусов
    if(true) {
  
        
        $status = -1;
        foreach($statuses as  $k=>$v) {
            if($v=="Доставлено") {  // статус  опенкарте  
                $status = $k;
            }
        }
        if($status == -1) {
            $logger->error("Не найден статус " . $status_name);
            return;
        }        
        
        $eorders = \App\Entity\Doc\Document::find("meta_name='Order' and content like '%<ocorderback>0</ocorderback>%' and state <> " . \App\Entity\Doc\Document::STATE_NEW);
        $elist = array();
        foreach ($eorders as $order) {
            $elist[$order->headerdata['ocorder']] = $status; 
        } 
      
        $data = json_encode($elist);
        $fields = array(
            'data' => $data
        );
        $url = $site . '/index.php?route=api/zstore/updateorder&' . $token;
        $json = \App\Modules\OCStore\Helper::do_curl_request($url, $fields);
        if ($json === false) {
            return;
        }
        $data = json_decode($json, true);


        if ($data['error'] != "") {
            $logger->error($data['error']);
            return;
        }      
        foreach ($eorders as $order) {
             $order->headerdata['ocorderback'] = 1;
             $order->save();
        }
     
      
   }    
    
    
    die;

} catch (Exception $e) {
    echo $e->getMessage();
    $logger->error($e);
}
