 
INSERT INTO "users" (  "userlogin", "userpass", "createdon", "email", "acl", "disabled", "options", "role_id") VALUES(  'admin', '$2y$10$GsjC.thVpQAPMQMO6b4Ma.olbIFr2KMGFz12l5/wnmxI1PEqRDQf.', '2017-01-01', 'admin@admin.admin', 'a:2:{s:9:"aclbranch";N;s:6:"onlymy";N;}', 0, 'a:6:{s:8:"defstore";s:2:"19";s:7:"deffirm";i:0;s:5:"defmf";s:1:"2";s:8:"pagesize";s:2:"15";s:11:"hidesidebar";i:0;s:8:"mainpage";s:15:"\\App\\Pages\\Main";}', 1);

INSERT INTO "roles" (  "rolename", "acl") VALUES(  'admins', 'a:9:{s:7:"aclview";N;s:7:"acledit";N;s:6:"aclexe";N;s:9:"aclcancel";N;s:8:"aclstate";N;s:9:"acldelete";N;s:7:"widgets";N;s:7:"modules";N;s:9:"smartmenu";s:1:"8";}');

UPDATE users set  role_id=(select role_id  from "roles"  where  rolename='admins' limit 1)  where  userlogin='admin' ;
 
INSERT INTO "stores" (  "storename", "description") VALUES(  'Основной склад', '');
INSERT INTO "mfund" (  "mf_name", "description", "branch_id", "detail") VALUES(  'Касса', '', NULL, '<detail><beznal>0</beznal><btran></btran><bank><![CDATA[]]></bank><bankacc><![CDATA[]]></bankacc></detail>');

INSERT INTO "firms" (  "firm_name", "details", "disabled") VALUES(  'Наша  фирма', '', 0);
INSERT INTO "customers" ( "customer_name", "detail", "email", "phone", "status", "city", "leadstatus", "leadsource", "createdon") VALUES( 'Физ. лицо', '<detail><code></code><discount></discount><bonus></bonus><type>0</type><fromlead>0</fromlead><jurid></jurid><shopcust_id></shopcust_id><isholding>0</isholding><holding>0</holding><viber></viber><nosubs>1</nosubs><user_id>4</user_id><holding_name><![CDATA[]]></holding_name><address><![CDATA[]]></address><comment><![CDATA[Умовний контрагент якщо треба  когось  вказати.]]></comment></detail>', '', '', 0, '', NULL, NULL, '2021-04-28');


  
  

INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Склады', 'StoreList', 'Товары', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Номенклатура', 'ItemList', 'Товары', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Сотрудники', 'EmployeeList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Категории товарвв', 'CategoryList', 'Товары', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Контрагенты', 'CustomerList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Приходная накладная', 'GoodsReceipt', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Расходная накладная', 'GoodsIssue', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Общий журнал', 'DocList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Гарантмйный талон', 'Warranty', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Движение по складу', 'ItemActivity', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'ABC анализ', 'ABC', 'Аналитика', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Услуги, работы', 'ServiceList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Акт выполненых работ', 'ServiceAct', 'Услуги', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Возврат от покупателя', 'ReturnIssue', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Наряды', 'TaskList', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Наряд', 'Task', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Оплата по произволству', 'EmpTask', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Звкупки', 'Income', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Продажи', 'Outcome', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Заказы клиентов', 'OrderList', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Заказ', 'Order', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Оприходование с  производства', 'ProdReceipt', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Списание в производство', 'ProdIssue', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Отчет  по  производству', 'Prod', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Производственные участки', 'ProdAreaList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Продажи', 'GIList', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Оборудование и ОС', 'EqList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Закупки', 'GRList', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Заявка поставщику', 'OrderCust', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Заявки поставщикам', 'OrderCustList', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Прайс', 'Price', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Возврат поставщику', 'RetCustIssue', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Перекомплектация (расфасовка)', 'TransItem', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Кассы, счета', 'MFList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Журнал платежей', 'PayList', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Движение по денежным  счетам', 'PayActivity', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Приходный ордер', 'IncomeMoney', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Расходный ордер', 'OutcomeMoney', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Финансовые результаты', 'PayBalance', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Инвентаризация', 'Inventory', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Счет, входящий', 'InvoiceCust', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Счет-фактура', 'Invoice', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 5, 'Импорт', 'Import', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Движение ТМЦ', 'StockList', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Кассовый чек', 'POSCheck', 'Продажи', 1);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Товары в пути', 'CustOrder', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Списанние ТМЦ', 'OutcomeItem', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Оприходование ТМЦ', 'IncomeItem', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 5, 'АРМ кассира', 'ARMPos', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Работы, услуги', 'SerList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Товары на складе', 'ItemList', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 5, 'Экспорт', 'Export', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Выплата зарплаты', 'OutSalary', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Отчет по  зарплате', 'SalaryRep', 'Зарплата', 0);

INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 4, 'Контракты', 'ContractList', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Перемещение ТМЦ', 'MoveItem', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Робочее время', 'Timestat', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Товарно-транспортная накладная', 'TTN', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Неликвидные товары', 'NoLiq', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Расчеты с  поставщиками', 'PaySelList', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Расчеты с  покупателями', 'PayBayList', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Перемещение средств', 'MoveMoney', 'Касса и платежи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Заказ общепит', 'OrderFood', 'Общепит', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 5, 'АРМ кассира (общепит)', 'ARMFood', 'Общепит', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Журнал доставок', 'DeliveryList', 'Общепит', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 5, 'АРМ кухни (бара)', 'ArmProdFood', 'Общепит', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Доходы  и затраты', 'IOState', '', 0);
INSERT INTO "metadata" (  "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES(  2, 'Заказыные товары', 'ItemOrder', 'Продажи', 0);
INSERT INTO "metadata" (  "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 5, 'Скидки и акции', 'Discounts', '', 0);
INSERT INTO "metadata" ("meta_type", "description", "meta_name", "menugroup", "disabled") VALUES(  1, 'Начисление зарплаты', 'CalcSalary', 'Зарплата', 0);
INSERT INTO "metadata" ("meta_type", "description", "meta_name", "menugroup", "disabled") VALUES(  4, 'Начисления и удержания', 'SalaryTypeList', '', 0);

INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Произ. процессы', 'ProdProcList', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Произ. этапы', 'ProdStageList', 'Производство', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 1, 'Перемещение партий ТМЦ', 'MovePart', 'Склад', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Возврат покупателей', 'Returnselled', 'Продажи', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Возврат поставщикам', 'Returnbayed', 'Закупки', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES(  1, 'Оказаные услуги', 'IncomeService', 'Услуги', 0);
INSERT INTO "metadata" ("meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Состояние  складов', 'StoreItems', 'Склад', 0);
INSERT INTO "metadata" (  "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES(  3, 'Товары у поставщиков', 'CustItems', '', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Акт сверки', 'CompareAct', 'Контрагенты', 0);
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'Зарезервированные товары', 'Reserved', 'Склад', 0);
INSERT INTO "metadata" (meta_type, description, meta_name, menugroup, disabled) VALUES( 2, 'OLAP анализ', 'OLAP', 'Аналитика', 0);

  
  


INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(2, 105, 'Основная  зарплата', 'осн', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(3, 200, 'Всего начислено', 'вс. нач', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(4, 600, 'Всего удержано', 'вс. уд', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(5, 900, 'К выдаче', 'К выдаче', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(6, 850, 'Аванс', 'Аванс', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(7, 220, 'НДФЛ', 'НДФЛ', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(8, 300, 'ЕСВ', 'ЕСВ', 0);

INSERT INTO "options" ("optname", "optvalue") VALUES('api', 'a:3:{s:3:\"exp\";s:0:\"\";s:3:\"key\";s:4:\"test\";s:5:\"atype\";s:1:\"1\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('common', 'a:39:{s:9:\"qtydigits\";s:1:\"0\";s:8:\"amdigits\";s:1:\"0\";s:10:\"dateformat\";s:5:\"d.m.Y\";s:11:\"partiontype\";s:1:\"1\";s:4:\"curr\";s:2:\"gr\";s:6:\"phonel\";s:2:\"10\";s:6:\"price1\";s:17:\"Роздрiбна\";s:6:\"price2\";s:12:\"Оптова\";s:6:\"price3\";s:0:\"\";s:6:\"price4\";s:0:\"\";s:6:\"price5\";s:0:\"\";s:8:\"defprice\";s:2:\"10\";s:8:\"shopname\";s:19:\"Наша  фiрма\";s:8:\"ts_break\";s:2:\"60\";s:8:\"ts_start\";s:5:\"09:00\";s:6:\"ts_end\";s:5:\"18:00\";s:11:\"checkslogan\";s:8:\"Тест\";s:11:\"autoarticle\";i:1;s:10:\"usesnumber\";i:1;s:10:\"usescanner\";i:1;s:9:\"useimages\";i:1;s:15:\"showactiveusers\";i:1;s:10:\"usecattree\";i:0;s:9:\"usebranch\";i:0;s:10:\"noallowfiz\";i:0;s:10:\"allowminus\";i:1;s:6:\"useval\";i:1;s:6:\"capcha\";i:0;s:9:\"numberttn\";i:0;s:16:\"usemobileprinter\";i:0;s:11:\"leadsources\";a:3:{i:1621367652;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1621367652;s:9:\"\0*\0fields\";a:1:{s:4:\"name\";s:6:\"ккк\";}}i:1621367735;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1621367735;s:9:\"\0*\0fields\";a:1:{s:4:\"name\";s:18:\"ннннннннн\";}}i:1621368209;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1621368209;s:9:\"\0*\0fields\";a:1:{s:4:\"name\";s:3:\"111\";}}}s:12:\"leadstatuses\";a:1:{i:1621367663;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1621367663;s:9:\"\0*\0fields\";a:1:{s:4:\"name\";s:3:\"yyy\";}}}s:14:\"printoutqrcode\";i:0;s:15:\"printoutbarcode\";i:1;s:11:\"salesources\";a:2:{i:1622515925;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1622515925;s:9:\"\0*\0fields\";a:1:{s:4:\"name\";s:12:\"офлайн\";}}i:1622515939;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1622515939;s:9:\"\0*\0fields\";a:1:{s:4:\"name\";s:4:\"??М\";}}}s:14:\"nocheckarticle\";i:1;s:8:\"showchat\";i:1;s:16:\"usemobilescanner\";i:0;s:10:\"exportxlsx\";i:0;}');
INSERT INTO "options" ("optname", "optvalue") VALUES('disc', 'a:4:{s:8:\"firstbay\";s:2:\"11\";s:6:\"bonus1\";s:0:\"\";s:6:\"level2\";s:0:\"\";s:6:\"bonus2\";s:0:\"\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('discount', 'a:6:{s:8:\"firstbay\";s:2:\"11\";s:6:\"bonus1\";s:3:\"1.1\";s:6:\"level2\";s:0:\"\";s:6:\"bonus2\";s:0:\"\";s:6:\"summa1\";s:3:\"100\";s:6:\"summa2\";s:0:\"\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('food', 'a:5:{s:8:\"worktype\";s:1:\"2\";s:9:\"pricetype\";s:6:\"price1\";s:8:\"delivery\";i:1;s:6:\"tables\";i:1;s:4:\"pack\";i:1;}');
INSERT INTO "options" ("optname", "optvalue") VALUES('printer', 'a:15:{s:7:\"pheight\";s:0:\"\";s:8:\"pa4width\";s:0:\"\";s:6:\"pwidth\";s:4:\"100%\";s:9:\"pdocwidth\";s:4:\"70mm\";s:8:\"pmaxname\";s:1:\"7\";s:9:\"pricetype\";s:6:\"price1\";s:11:\"barcodetype\";s:4:\"C128\";s:9:\"pfontsize\";s:2:\"28\";s:12:\"pdocfontsize\";s:2:\"16\";s:5:\"pname\";i:1;s:5:\"pcode\";i:1;s:8:\"pbarcode\";i:1;s:7:\"pqrcode\";i:1;s:6:\"pprice\";i:1;s:6:\"pcolor\";i:0;}');
INSERT INTO "options" ("optname", "optvalue") VALUES('salary', 'a:4:{s:13:\"codebaseincom\";s:3:\"105\";s:10:\"coderesult\";s:3:\"900\";s:4:\"calc\";s:219:\"v200 = v105\r\n//податки\r\nv220 =  v200 * 0.18\r\nv300 =  v200 * 0.22\r\n//всього  утримано\r\nv600 =v200  - v220- v300\r\n//на руки\r\nv900 =v200  - v600-v850\r\n\r\n\r\n//приклад\r\nif(invalid){\r\n   \r\n}  \";s:11:\"codeadvance\";s:3:\"850\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('shop', 'a:19:{s:7:\"defcust\";s:1:\"1\";s:11:\"defcustname\";s:29:\"Леонид Мартынюк\";s:9:\"defbranch\";N;s:9:\"ordertype\";s:1:\"2\";s:12:\"defpricetype\";s:6:\"price1\";s:5:\"email\";s:15:\"softman@ukr.net\";s:8:\"shopname\";s:18:\"Наш магаз7\";s:12:\"currencyname\";s:6:\"грн\";s:8:\"uselogin\";i:0;s:9:\"usefilter\";i:0;s:13:\"createnewcust\";i:0;s:11:\"usefeedback\";i:0;s:11:\"usemainpage\";i:0;s:7:\"aboutus\";s:16:\"PHA+PGJyPjwvcD4=\";s:7:\"contact\";s:0:\"\";s:8:\"delivery\";s:0:\"\";s:4:\"news\";s:0:\"\";s:5:\"pages\";a:2:{s:4:\"news\";O:12:\"App\\DataItem\":2:{s:2:\"id\";N;s:9:\"\0*\0fields\";a:4:{s:4:\"link\";s:4:\"news\";s:5:\"title\";s:11:\"kkkrrrrrrrr\";s:5:\"order\";s:1:\"2\";s:4:\"text\";s:24:\"PHA+ZWVlZWVlZWVlPC9wPg==\";}}s:8:\"about_us\";O:12:\"App\\DataItem\":2:{s:2:\"id\";N;s:9:\"\0*\0fields\";a:4:{s:4:\"link\";s:8:\"about_us\";s:5:\"title\";s:9:\"О нас\";s:5:\"order\";s:1:\"3\";s:4:\"text\";s:32:\"PHA+PGI+0J4g0L3QsNGBPC9iPjwvcD4=\";}}}s:5:\"phone\";s:0:\"\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('val', 'a:2:{s:7:\"vallist\";a:2:{i:1642675955;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1642675955;s:9:\"\0*\0fields\";a:3:{s:4:\"code\";s:3:\"USD\";s:4:\"name\";s:10:\"Долар\";s:4:\"rate\";s:2:\"28\";}}i:1642676126;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1642676126;s:9:\"\0*\0fields\";a:3:{s:4:\"code\";s:4:\"EURO\";s:4:\"name\";s:8:\"Євро\";s:4:\"rate\";s:2:\"33\";}}}s:8:\"valprice\";i:0;}');
INSERT INTO "options" ("optname", "optvalue") VALUES('version', '6.5.0');

