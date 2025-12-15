<?php

namespace App\Pages\Register;

use App\Application as App;
use App\Entity\Doc\Document;
use App\Helper as H;
 
use App\Entity\Customer;
use App\System;
use Zippy\Html\DataList\DataView;
use Zippy\Html\DataList\Paginator;
use Zippy\Html\DataList\ArrayDataSource;
use Zippy\Html\Form\Date;
use Zippy\Html\Form\DropDownChoice;
use Zippy\Html\Form\Form;
use Zippy\Html\Form\CheckBox;
use Zippy\Html\Form\SubmitButton;
use Zippy\Html\Form\TextInput;
use Zippy\Html\Form\TextArea;
use Zippy\Html\Form\AutocompleteTextInput;
use Zippy\Html\Label;
use Zippy\Html\Link\ClickLink;
use Zippy\Html\Panel;

/**
 * журнал  продаж
 */
class GIList extends \App\Pages\Base
{
    private $_doc = null;

    /**
     *
     * @param mixed $doc Документ  должен  быть  показан  в  просмотре
     * @return DocList
     */
    public function __construct($doc = 0) {
        parent::__construct();
        if (false == \App\ACL::checkShowReg('GIList')) {
            App::RedirectHome() ;
        }

        $this->add(new Panel("listpan"));
        $this->listpan->add(new Form('filter'))->onSubmit($this, 'filterOnSubmit');

        $this->listpan->filter->add(new TextInput('searchnumber'));
        $this->listpan->filter->add(new TextInput('searchtext'));
        $this->listpan->filter->add(new DropDownChoice('status', array(0 => 'Відкриті', 1 => 'Нові', 2 => 'Відправлені', 5 => 'Готові до відправки', 3 => 'Всі'), 0));

        $this->listpan->filter->add(new DropDownChoice('salesource', H::getSaleSources(), 0));
        $this->listpan->filter->add(new DropDownChoice('fstore', \App\Entity\Store::getList(), 0));
        $this->listpan->filter->add(new AutocompleteTextInput('searchcust'))->onText($this, 'OnAutoCustomer');
 
        $doclist = $this->listpan->add(new DataView('doclist', new GoodsIssueDataSource($this), $this, 'doclistOnRow'));

        $this->listpan->add(new Paginator('pag', $doclist));
        $doclist->setPageSize(H::getPG());
        $this->listpan->add(new ClickLink('csv', $this, 'oncsv'));

        $this->add(new Panel("statuspan"))->setVisible(false);

        $this->statuspan->add(new Form('statusform'));

        $this->statuspan->statusform->add(new SubmitButton('bsend'))->onClick($this, 'statusOnSubmit');
        $this->statuspan->statusform->add(new SubmitButton('bdevivered'))->onClick($this, 'statusOnSubmit');
        $this->statuspan->statusform->add(new SubmitButton('bttn'))->onClick($this, 'statusOnSubmit');
        $this->statuspan->statusform->add(new SubmitButton('bgi'))->onClick($this, 'statusOnSubmit');
        $this->statuspan->statusform->add(new SubmitButton('bgar'))->onClick($this, 'statusOnSubmit');
        $this->statuspan->statusform->add(new SubmitButton('bret'))->onClick($this, 'statusOnSubmit');
     
        $this->statuspan->statusform->add(new SubmitButton('bdecl'))->onClick($this, 'statusOnSubmit');

        $this->statuspan->statusform->add(new TextInput('ship_number'));

        $this->statuspan->add(new \App\Widgets\DocView('docview'));

        $this->listpan->doclist->Reload();

  
        if ($doc > 0) {
            $this->_doc = Document::load($doc);
            $this->showOn();
           
        }
    }

    public function filterOnSubmit($sender) {

        $this->statuspan->setVisible(false);

        $this->listpan->doclist->Reload();
        if (count($this->listpan->doclist->getDataRows()) == 1) {
            $r = array_pop($this->listpan->doclist->getDataRows());

            $this->_doc = $r->getDataItem();
            $this->showOn();
        }

    }

    public function doclistOnRow(\Zippy\Html\DataList\DataRow $row) {
        $doc = $row->getDataItem();


        $row->add(new ClickLink('number', $this, 'showOnClick'))->setValue($doc->document_number);

        $row->add(new Label('date', H::fd($doc->document_date)));
        $row->add(new Label('onotes', $doc->notes));
        $row->add(new Label('amount', H::fa(($doc->payamount > 0) ? $doc->payamount : ($doc->amount > 0 ? $doc->amount : ""))));
        $row->add(new Label('order', $doc->headerdata['order'] ?? ''));
        $row->add(new Label('customer', $doc->customer_name));

        $row->add(new Label('state', Document::getStateName($doc->state)));
 
        $row->add(new Label('ispay'))->setVisible(false) ;
        $row->add(new Label('istruck'))->setVisible(false) ;
        if($doc->state >=4) {
            if($doc->payamount > 0 &&  $doc->payamount > $doc->payed) {
                $row->ispay->setVisible(true);
            }
            if($doc->meta_name=='Invoice') {
                $n = $doc->getChildren('GoodsIssue')+$doc->getChildren('TTN');
                $row->istruck->setVisible(count($n)==0);

            }
            if($doc->meta_name=='GoodsIssue') {
                if($doc->payamount == ($doc->headerdata['prepaid']??0 ) )  {
                   $row->ispay->setVisible(false);    
                }
            }
            if($doc->state==9) {
               $row->ispay->setVisible(false);    
            }            
            
        }
        $row->add(new ClickLink('show'))->onClick($this, 'showOnClick');
        $row->add(new ClickLink('edit'))->onClick($this, 'editOnClick');
        if ($doc->state < Document::STATE_EXECUTED) {
            $row->edit->setVisible(true);
        } else {
            $row->edit->setVisible(false);
        }
        if ($doc->document_id == ($this->_doc->document_id ?? 0)) {
            $row->setAttribute('class', 'table-success');
        }
    }

    public function statusOnSubmit($sender) {
        if (\App\ACL::checkChangeStateDoc($this->_doc, true, true) == false) {
            return;
        }

        $state = $this->_doc->state;

        if ($sender->id == "bsend") {

            $this->_doc->headerdata['sentdate'] = H::fd(time());
            $this->_doc->headerdata['document_date'] = time();
            $this->_doc->save();

            if ($this->_doc->state < 4) {
                $this->_doc->updateStatus(Document::STATE_EXECUTED);
            }

            $this->_doc->updateStatus(Document::STATE_INSHIPMENT);

            $this->_doc->save();

            $this->setSuccess('Відправлено');
        }

        if ($sender->id == "bdevivered") {
            $this->_doc->updateStatus(Document::STATE_DELIVERED);


            // $this->_doc->updateStatus(Document::STATE_CLOSED);
        }

        if ($sender->id == "bdecl") {
            $dec = $this->statuspan->statusform->ship_number->getText();
            if (strlen($dec) > 0) {
                $this->_doc->headerdata['ship_number'] = $dec;
            }
            $this->_doc->save();
            $this->setSuccess("Збережено");
            $this->statuspan->setVisible(false);
        }
        if ($sender->id == "bttn") {

            App::Redirect("\\App\\Pages\\Doc\\TTN", 0, $this->_doc->document_id);
        }
        if ($sender->id == "bgi") {

            App::Redirect("\\App\\Pages\\Doc\\GoodsIssue", 0, $this->_doc->document_id);
        }

        if ($sender->id == "bgar") {
            App::Redirect("\\App\\Pages\\Doc\\Warranty", 0, $this->_doc->document_id);
        }
        if ($sender->id == "bret") {
            App::Redirect("\\App\\Pages\\Doc\\ReturnIssue", 0, $this->_doc->document_id);
        }

        $this->listpan->doclist->Reload(false);

        $this->statuspan->setVisible(false);

        $this->updateStatusButtons();
    }

    public function updateStatusButtons() {

        $this->statuspan->statusform->bdevivered->setVisible(true);
        $this->statuspan->statusform->bttn->setVisible(true);
        $this->statuspan->statusform->bgi->setVisible(true);
        $this->statuspan->statusform->bret->setVisible(true);
        $this->statuspan->statusform->bsend->setVisible(true);
        $this->statuspan->statusform->bgar->setVisible(true);

        $this->statuspan->statusform->ship_number->setVisible(false);
        $this->statuspan->statusform->bdecl->setVisible(false);


        $state = $this->_doc->state;

        //готов  к  отправке
        if ($state == Document::STATE_READYTOSHIP) {
            $this->statuspan->statusform->bdevivered->setVisible(false);
            $this->statuspan->statusform->bret->setVisible(false);

        }
        //отправлен
        if ($state == Document::STATE_INSHIPMENT) {
            $this->statuspan->statusform->bsend->setVisible(false);
        }
        // Доставлен
        if ($state == Document::STATE_DELIVERED) {

            $this->statuspan->statusform->bdevivered->setVisible(false);
            $this->statuspan->statusform->bsend->setVisible(false);
        }


        if ($this->_doc->meta_name == 'TTN' && $this->_doc->state == Document::STATE_READYTOSHIP) {

            $this->statuspan->statusform->bgi->setVisible(false);
        }

        if ($this->_doc->meta_name == 'GoodsIssue') {
 
            $this->statuspan->statusform->bdevivered->setVisible(false);
            $this->statuspan->statusform->ship_number->setVisible(false);
            $this->statuspan->statusform->bgi->setVisible(false);
        }
        if ($this->_doc->meta_name == 'POSCheck') {
            $this->statuspan->statusform->bdevivered->setVisible(false);
            $this->statuspan->statusform->ship_number->setVisible(false);
            $this->statuspan->statusform->bgi->setVisible(false);
        }
        if ($this->_doc->meta_name == 'Invoice') {

            $this->statuspan->statusform->bsend->setVisible(false);
            $this->statuspan->statusform->bdevivered->setVisible(false);
            $this->statuspan->statusform->bret->setVisible(false);
            $this->statuspan->statusform->bgar->setVisible(false);
            $this->statuspan->statusform->bgi->setVisible(true);
        }
        if ($this->_doc->meta_name == 'ReturnIssue') {

            $this->statuspan->statusform->bsend->setVisible(false);
            $this->statuspan->statusform->bdevivered->setVisible(false);
            $this->statuspan->statusform->bttn->setVisible(false);
            $this->statuspan->statusform->bret->setVisible(false);
            $this->statuspan->statusform->bgar->setVisible(false);
            $this->statuspan->statusform->bgi->setVisible(false);
        }

        if ($this->_doc->meta_name == 'TTN' && $this->_doc->state != Document::STATE_DELIVERED) {
            $this->statuspan->statusform->ship_number->setVisible(true);
            $this->statuspan->statusform->bdecl->setVisible(true);
            $this->statuspan->statusform->bgi->setVisible(false);
        }
        
        //прячем лишнее
        if ($this->_doc->meta_name == 'TTN') {
            if ($this->_doc->headerdata['delivery'] < 3) { //не  служба  доставки
                $this->statuspan->statusform->ship_number->setVisible(false);
                $this->statuspan->statusform->bdecl->setVisible(false);
            }

            if ( strlen($this->_doc->headerdata['ship_number'] ??'') >0)  { //не  служба  доставки
                $this->statuspan->statusform->ship_number->setVisible(false);
                $this->statuspan->statusform->bdecl->setVisible(false);

            }

            $this->statuspan->statusform->bttn->setVisible(false);
            $this->statuspan->statusform->bgi->setVisible(false);
        }        
    }

    //просмотр


    public function showOnClick($sender) {
        $this->_doc = $sender->owner->getDataItem();
        if (false == \App\ACL::checkShowDoc($this->_doc, true)) {
            return;
        }
        $this->showOn();
    }

    public function showOn() {


        $this->statuspan->setVisible(true);
        $this->statuspan->statusform->ship_number->setText($this->_doc->headerdata['ship_number']??'');
        $this->statuspan->docview->setDoc($this->_doc);

        $this->listpan->doclist->Reload(false);
        $this->updateStatusButtons();
        $this->goAnkor('dankor');
    }

    public function editOnClick($sender) {
        $doc = $sender->getOwner()->getDataItem();
        if (false == \App\ACL::checkEditDoc($doc, true)) {
            return;
        }

        App::Redirect("\\App\\Pages\\Doc\\" . $doc->meta_name, $doc->document_id);
    }

    public function oncsv($sender) {
        $list = $this->listpan->doclist->getDataSource()->getItems(-1, -1, 'document_id');
        $header = array();
        $data = array();

        $i = 0;
        foreach ($list as $d) {
            $i++;
            $data['A' . $i] = H::fd($d->document_date);
            $data['B' . $i] = $d->document_number;
            $data['C' . $i] = $d->headerdata['order'];
            $data['D' . $i] = $d->customer_name;
            $data['E' . $i] = $d->amount;
            $data['F' . $i] = $d->notes;
        }

        H::exportExcel($data, $header, 'selllist.xlsx');
    }

    public function OnAutoCustomer($sender) {
        return Customer::getList($sender->getText(), 1, true);
    }    
    
   
  
   
 
}

/**
 *  Источник  данных  для   списка  документов
 */
class GoodsIssueDataSource implements \Zippy\Interfaces\DataSource
{
    private $page;

    public function __construct($page) {
        $this->page = $page;
    }

    private function getWhere() {
        $user = System::getUser();
        $common = System::getOptions("common");
        $actualdate = $common['actualdate'] ??  strtotime('2023-01-01') ;
        
        $conn = \ZDB\DB::getConnect();

        $actualdate =   $conn->DBDate($actualdate  );
        
        $where = "   meta_name  in('GoodsIssue', 'Invoice','POSCheck','ReturnIssue' ,'Warranty','TTN' )  and document_date >= ".$actualdate;

        $salesource = $this->page->listpan->filter->salesource->getValue();
        if ($salesource > 0) {
            $where .= " and   content like '%<salesource>{$salesource}</salesource>%' ";
        }

        $status = $this->page->listpan->filter->status->getValue();
        if ($status == 0) {
            $where .= "  and    state >3 and  state  not in(14,5,9 )        ";
        }
        if ($status == 1) {
            $where .= " and  state =  " . Document::STATE_NEW;
        }
        if ($status == 2) {
            $where .= " and state = " . Document::STATE_INSHIPMENT;
        }
        if ($status == 5) {
            $where .= " and state = " . Document::STATE_READYTOSHIP;
        }

      
        $cust = $this->page->listpan->filter->searchcust->getKey();
        if ($cust > 0) {
            $where = $where . " and customer_id = " . $cust;
        }

        $store_id = $this->page->listpan->filter->fstore->getValue();
        if ($store_id > 0) {
            $where .= " and   content like '%<store>{$store_id}</store>%' ";
        }

        $st = trim($this->page->listpan->filter->searchtext->getText());
        if (strlen($st) > 2) {
            $st = $conn->qstr('%' . $st . '%');

            $where .= " and  (  notes like {$st} or    content like {$st}  )";
        }
        $sn = trim($this->page->listpan->filter->searchnumber->getText());
        if (strlen($sn) > 1) { // игнорируем другие поля
            $sn = $conn->qstr('%' . $sn . '%');
            $where = "  meta_name in('GoodsIssue', 'Invoice','POSCheck','ReturnIssue' ,'Warranty','TTN' )  and document_number like  {$sn}    ";
        }

        return $where;
    }

    public function getItemCount() {
        return Document::findCnt($this->getWhere());
    }

    public function getItems($start, $count, $sortfield = null, $asc = null) {
        $docs = Document::find($this->getWhere(), "priority desc,document_id desc", $count, $start);

        return $docs;
    }

    public function getItem($id) {

    }

}
