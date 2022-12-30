SET NAMES 'utf8';
   
 
INSERT INTO `users` (`user_id`, `userlogin`, `userpass`, `createdon`, `email`, `acl`, `disabled`, `options`, `role_id`) VALUES(4, 'admin', '$2y$10$GsjC.thVpQAPMQMO6b4Ma.olbIFr2KMGFz12l5/wnmxI1PEqRDQf.', '2017-01-01', 'admin@admin.admin', 'a:2:{s:9:"aclbranch";N;s:6:"onlymy";N;}', 0, 'a:6:{s:8:"defstore";s:2:"19";s:7:"deffirm";i:0;s:5:"defmf";s:1:"2";s:8:"pagesize";s:2:"15";s:11:"hidesidebar";i:0;s:8:"mainpage";s:15:"\\App\\Pages\\Main";}', 1);

INSERT INTO `roles` (`role_id`, `rolename`, `acl`) VALUES(1, 'admins', 'a:9:{s:7:"aclview";N;s:7:"acledit";N;s:6:"aclexe";N;s:9:"aclcancel";N;s:8:"aclstate";N;s:9:"acldelete";N;s:7:"widgets";N;s:7:"modules";N;s:9:"smartmenu";s:1:"8";}');

UPDATE users set  role_id=(select role_id  from roles  where  rolename='admins' limit 0,1 )  where  userlogin='admin' ;

 
INSERT INTO `stores` (  `storename`, `description`) VALUES(  'Основной склад', '');
INSERT INTO `mfund` (`mf_id`, `mf_name`, `description`, `branch_id`, `detail`) VALUES(2, 'Касса', '', NULL, '<detail><beznal>0</beznal><btran></btran><bank><![CDATA[]]></bank><bankacc><![CDATA[]]></bankacc></detail>');

INSERT INTO `firms` (  `firm_name`, `details`, `disabled`) VALUES(  'Наша  фирма', '', 0);
INSERT INTO `customers` ( `customer_name`, `detail`, `email`, `phone`, `status`, `city`, `leadstatus`, `leadsource`, `createdon`) VALUES( 'Физ. лицо', '<detail><code></code><discount></discount><bonus></bonus><type>0</type><fromlead>0</fromlead><jurid></jurid><shopcust_id></shopcust_id><isholding>0</isholding><holding>0</holding><viber></viber><nosubs>1</nosubs><user_id>4</user_id><holding_name><![CDATA[]]></holding_name><address><![CDATA[]]></address><comment><![CDATA[Условный контрагент если  нужно кого-то  указать.]]></comment></detail>', '', '', 0, '', NULL, NULL, '2021-04-28');


  
  
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Склады', 'StoreList', 'Товары', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Номенклатура', 'ItemList', 'Товары', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Сотрудники', 'EmployeeList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Категории товарвв', 'CategoryList', 'Товары', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Контрагенты', 'CustomerList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Приходная накладная', 'GoodsReceipt', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Расходная накладная', 'GoodsIssue', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Общий журнал', 'DocList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Гарантмйный талон', 'Warranty', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Движение по складу', 'ItemActivity', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'ABC анализ', 'ABC', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Услуги, работы', 'ServiceList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Акт выполненых работ', 'ServiceAct', 'Услуги', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Возврат от покупателя', 'ReturnIssue', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Наряды', 'TaskList', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Наряд', 'Task', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Оплата по произволству', 'EmpTask', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Звкупки', 'Income', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Продажи', 'Outcome', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Заказы клиентов', 'OrderList', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Заказ', 'Order', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Оприходование с  производства', 'ProdReceipt', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Списание в производство', 'ProdIssue', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Отчет  по  производству', 'Prod', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Производственные участки', 'ProdAreaList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Продажи', 'GIList', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Оборудование и ОС', 'EqList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Закупки', 'GRList', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Заявка поставщику', 'OrderCust', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Заявки поставщикам', 'OrderCustList', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Прайс', 'Price', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Возврат поставщику', 'RetCustIssue', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Перекомплектация (расфасовка)', 'TransItem', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Кассы, счета', 'MFList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Журнал платежей', 'PayList', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Движение по денежным  счетам', 'PayActivity', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Приходный ордер', 'IncomeMoney', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Расходный ордер', 'OutcomeMoney', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Финансовые результаты', 'PayBalance', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Инвентаризация', 'Inventory', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Счет, входящий', 'InvoiceCust', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Счет-фактура', 'Invoice', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 5, 'Импорт', 'Import', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Движение ТМЦ', 'StockList', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Кассовый чек', 'POSCheck', 'Продажи', 1);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Товары в пути', 'CustOrder', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Списанние ТМЦ', 'OutcomeItem', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Оприходование ТМЦ', 'IncomeItem', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 5, 'АРМ кассира', 'ARMPos', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Работы, услуги', 'SerList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Товары на складе', 'ItemList', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 5, 'Экспорт', 'Export', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Выплата зарплаты', 'OutSalary', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Отчет по  зарплате', 'SalaryRep', 'Зарплата', 0);

INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 4, 'Контракты', 'ContractList', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Перемещение ТМЦ', 'MoveItem', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Робочее время', 'Timestat', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Товарно-транспортная накладная', 'TTN', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Неликвидные товары', 'NoLiq', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Расчеты с  поставщиками', 'PaySelList', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Расчеты с  покупателями', 'PayBayList', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Перемещение средств', 'MoveMoney', 'Касса и платежи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Заказ общепит', 'OrderFood', 'Общепит', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 5, 'АРМ кассира (общепит)', 'ARMFood', 'Общепит', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Журнал доставок', 'DeliveryList', 'Общепит', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 5, 'АРМ кухни (бара)', 'ArmProdFood', 'Общепит', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Доходы  и затраты', 'IOState', '', 0);
INSERT INTO `metadata` (  `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES(  2, 'Заказыные товары', 'ItemOrder', 'Продажи', 0);
INSERT INTO `metadata` (  `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 5, 'Скидки и акции', 'Discounts', '', 0);
INSERT INTO `metadata` (`meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES(  1, 'Начисление зарплаты', 'CalcSalary', 'Зарплата', 0);
INSERT INTO `metadata` (`meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES(  4, 'Начисления и удержания', 'SalaryTypeList', '', 0);

INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Произ. процессы', 'ProdProcList', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 3, 'Произ. этапы', 'ProdStageList', 'Производство', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 1, 'Перемещение партий ТМЦ', 'MovePart', 'Склад', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Возврат покупателей', 'Returnselled', 'Продажи', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Возврат поставщикам', 'Returnbayed', 'Закупки', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES(  1, 'Оказаные услуги', 'IncomeService', 'Услуги', 0);
INSERT INTO `metadata` (`meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Состояние  складов', 'StoreItems', 'Склад', 0);
INSERT INTO `metadata` (  `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES(  3, 'Товары у поставщиков', 'CustItems', '', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Акт сверки', 'CompareAct', 'Контрагенты', 0);
INSERT INTO `metadata` ( `meta_type`, `description`, `meta_name`, `menugroup`, `disabled`) VALUES( 2, 'Зарезервированные товары', 'Reserved', 'Склад', 0);

  


INSERT INTO `saltypes` (`st_id`, `salcode`, `salname`, `salshortname`, `disabled`) VALUES(2, 105, 'Основная  зарплата', 'осн', 0);
INSERT INTO `saltypes` (`st_id`, `salcode`, `salname`, `salshortname`, `disabled`) VALUES(3, 200, 'Всего начислено', 'вс. нач', 0);
INSERT INTO `saltypes` (`st_id`, `salcode`, `salname`, `salshortname`, `disabled`) VALUES(4, 600, 'Всего удержано', 'вс. уд', 0);
INSERT INTO `saltypes` (`st_id`, `salcode`, `salname`, `salshortname`, `disabled`) VALUES(5, 900, 'К выдаче', 'К выдаче', 0);
INSERT INTO `saltypes` (`st_id`, `salcode`, `salname`, `salshortname`, `disabled`) VALUES(6, 850, 'Аванс', 'Аванс', 0);
INSERT INTO `saltypes` (`st_id`, `salcode`, `salname`, `salshortname`, `disabled`) VALUES(7, 220, 'НДФЛ', 'НДФЛ', 0);
INSERT INTO `saltypes` (`st_id`, `salcode`, `salname`, `salshortname`, `disabled`) VALUES(8, 300, 'ЕСВ', 'ЕСВ', 0);


INSERT INTO `options` (`optname`, `optvalue`) VALUES('api', 'a:3:{s:3:\"exp\";s:0:\"\";s:3:\"key\";s:4:\"test\";s:5:\"atype\";s:1:\"1\";}');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('common', 'YTozOTp7czo5OiJxdHlkaWdpdHMiO3M6MToiMCI7czo4OiJhbWRpZ2l0cyI7czoxOiIwIjtzOjEwOiJkYXRlZm9ybWF0IjtzOjU6ImQubS5ZIjtzOjExOiJwYXJ0aW9udHlwZSI7czoxOiIxIjtzOjQ6ImN1cnIiO3M6MjoiZ3IiO3M6NjoicGhvbmVsIjtzOjI6IjEwIjtzOjY6InByaWNlMSI7czoxODoi0KDQvtC30L3QuNGH0L3QsNGPIjtzOjY6InByaWNlMiI7czoxNDoi0J7Qv9GC0L7QstCw0Y8iO3M6NjoicHJpY2UzIjtzOjA6IiI7czo2OiJwcmljZTQiO3M6MDoiIjtzOjY6InByaWNlNSI7czowOiIiO3M6ODoiZGVmcHJpY2UiO3M6MjoiMTAiO3M6ODoic2hvcG5hbWUiO3M6MjA6ItCd0LDRiNCwICDRhNC40YDQvNCwIjtzOjg6InRzX2JyZWFrIjtzOjI6IjYwIjtzOjg6InRzX3N0YXJ0IjtzOjU6IjA5OjAwIjtzOjY6InRzX2VuZCI7czo1OiIxODowMCI7czoxMToiY2hlY2tzbG9nYW4iO3M6MDoiIjtzOjExOiJhdXRvYXJ0aWNsZSI7aToxO3M6MTA6InVzZXNudW1iZXIiO2k6MTtzOjEwOiJ1c2VzY2FubmVyIjtpOjE7czo5OiJ1c2VpbWFnZXMiO2k6MTtzOjE1OiJzaG93YWN0aXZldXNlcnMiO2k6MTtzOjEwOiJ1c2VjYXR0cmVlIjtpOjA7czo5OiJ1c2VicmFuY2giO2k6MDtzOjEwOiJub2FsbG93Zml6IjtpOjA7czoxMDoiYWxsb3dtaW51cyI7aToxO3M6NjoidXNldmFsIjtpOjE7czo2OiJjYXBjaGEiO2k6MDtzOjk6Im51bWJlcnR0biI7aTowO3M6MTY6InVzZW1vYmlsZXByaW50ZXIiO2k6MDtzOjExOiJsZWFkc291cmNlcyI7YTozOntpOjE2MjEzNjc2NTI7TzoxMjoiQXBwXERhdGFJdGVtIjoyOntzOjI6ImlkIjtpOjE2MjEzNjc2NTI7czo5OiIAKgBmaWVsZHMiO2E6MTp7czo0OiJuYW1lIjtzOjY6ItC60LrQuiI7fX1pOjE2MjEzNjc3MzU7TzoxMjoiQXBwXERhdGFJdGVtIjoyOntzOjI6ImlkIjtpOjE2MjEzNjc3MzU7czo5OiIAKgBmaWVsZHMiO2E6MTp7czo0OiJuYW1lIjtzOjE4OiLQvdC90L3QvdC90L3QvdC90L0iO319aToxNjIxMzY4MjA5O086MTI6IkFwcFxEYXRhSXRlbSI6Mjp7czoyOiJpZCI7aToxNjIxMzY4MjA5O3M6OToiACoAZmllbGRzIjthOjE6e3M6NDoibmFtZSI7czozOiIxMTEiO319fXM6MTI6ImxlYWRzdGF0dXNlcyI7YToxOntpOjE2MjEzNjc2NjM7TzoxMjoiQXBwXERhdGFJdGVtIjoyOntzOjI6ImlkIjtpOjE2MjEzNjc2NjM7czo5OiIAKgBmaWVsZHMiO2E6MTp7czo0OiJuYW1lIjtzOjM6Inl5eSI7fX19czoxNDoicHJpbnRvdXRxcmNvZGUiO2k6MDtzOjE1OiJwcmludG91dGJhcmNvZGUiO2k6MTtzOjExOiJzYWxlc291cmNlcyI7YToyOntpOjE2MjI1MTU5MjU7TzoxMjoiQXBwXERhdGFJdGVtIjoyOntzOjI6ImlkIjtpOjE2MjI1MTU5MjU7czo5OiIAKgBmaWVsZHMiO2E6MTp7czo0OiJuYW1lIjtzOjE0OiLQvtGE0YTQu9Cw0LnQvSI7fX1pOjE2MjI1MTU5Mzk7TzoxMjoiQXBwXERhdGFJdGVtIjoyOntzOjI6ImlkIjtpOjE2MjI1MTU5Mzk7czo5OiIAKgBmaWVsZHMiO2E6MTp7czo0OiJuYW1lIjtzOjQ6ItCY0JwiO319fXM6MTQ6Im5vY2hlY2thcnRpY2xlIjtpOjE7czo4OiJzaG93Y2hhdCI7aToxO3M6MTY6InVzZW1vYmlsZXNjYW5uZXIiO2k6MDtzOjEwOiJleHBvcnR4bHN4IjtpOjA7fQ==');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('disc', 'a:4:{s:8:\"firstbay\";s:2:\"11\";s:6:\"bonus1\";s:0:\"\";s:6:\"level2\";s:0:\"\";s:6:\"bonus2\";s:0:\"\";}');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('discount', 'a:6:{s:8:\"firstbay\";s:2:\"11\";s:6:\"bonus1\";s:3:\"1.1\";s:6:\"level2\";s:0:\"\";s:6:\"bonus2\";s:0:\"\";s:6:\"summa1\";s:3:\"100\";s:6:\"summa2\";s:0:\"\";}');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('food', 'a:5:{s:8:\"worktype\";s:1:\"2\";s:9:\"pricetype\";s:6:\"price1\";s:8:\"delivery\";i:1;s:6:\"tables\";i:1;s:4:\"pack\";i:1;}');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('modules', 'YTo5OntzOjc6Im9jc3RvcmUiO2k6MDtzOjQ6InNob3AiO2k6MTtzOjEwOiJ3b29jb21lcmNlIjtpOjA7czozOiJwcG8iO2k6MDtzOjI6Im5wIjtpOjA7czo2OiJwcm9tdWEiO2k6MDtzOjk6InBhcGVybGVzcyI7aTowO3M6NToiaXNzdWUiO2k6MDtzOjQ6Im5vdGUiO2k6MDt9');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('printer', 'a:15:{s:7:\"pheight\";s:0:\"\";s:8:\"pa4width\";s:0:\"\";s:6:\"pwidth\";s:4:\"100%\";s:9:\"pdocwidth\";s:4:\"70mm\";s:8:\"pmaxname\";s:1:\"7\";s:9:\"pricetype\";s:6:\"price1\";s:11:\"barcodetype\";s:4:\"C128\";s:9:\"pfontsize\";s:2:\"28\";s:12:\"pdocfontsize\";s:2:\"16\";s:5:\"pname\";i:1;s:5:\"pcode\";i:1;s:8:\"pbarcode\";i:1;s:7:\"pqrcode\";i:1;s:6:\"pprice\";i:1;s:6:\"pcolor\";i:0;}');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('salary', 'YTo0OntzOjEzOiJjb2RlYmFzZWluY29tIjtzOjM6IjEwNSI7czoxMDoiY29kZXJlc3VsdCI7czozOiI5MDAiO3M6NDoiY2FsYyI7czoyMTY6InYyMDAgPSB2MTA1DQovL9C90LDQu9C+0LPQuA0KdjIyMCA9ICB2MjAwICogMC4xOA0KdjMwMCA9ICB2MjAwICogMC4yMg0KLy/QstGB0LXQs9C+INGD0LTQtdGA0LbQsNC90L4NCnY2MDAgPXYyMDAgIC0gdjIyMC0gdjMwMA0KLy/QvdCwINGA0YPQutC4DQp2OTAwID12MjAwICAtIHY2MDAtdjg1MA0KDQoNCi8v0L3QsNC/0YDQuNC80LXRgA0KaWYoaW52YWxpZCl7DQogICANCn0gICI7czoxMToiY29kZWFkdmFuY2UiO3M6MzoiODUwIjt9');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('shop', 'YToyMDp7czo3OiJkZWZjdXN0IjtzOjE6IjEiO3M6MTE6ImRlZmN1c3RuYW1lIjtzOjI5OiLQm9C10L7QvdC40LQg0JzQsNGA0YLRi9C90Y7QuiI7czo5OiJkZWZicmFuY2giO047czo5OiJvcmRlcnR5cGUiO3M6MToiMCI7czoxMjoiZGVmcHJpY2V0eXBlIjtzOjY6InByaWNlMSI7czo1OiJlbWFpbCI7czowOiIiO3M6ODoic2hvcG5hbWUiO3M6MTc6ItCd0LDRiCDQvNCw0LPQsNC3IjtzOjEyOiJjdXJyZW5jeW5hbWUiO3M6Njoi0YDRg9CxIjtzOjg6InVzZWxvZ2luIjtpOjA7czo5OiJ1c2VmaWx0ZXIiO2k6MDtzOjEzOiJjcmVhdGVuZXdjdXN0IjtpOjA7czoxMToidXNlZmVlZGJhY2siO2k6MDtzOjExOiJ1c2VtYWlucGFnZSI7aTowO3M6NzoiYWJvdXR1cyI7czoxNjoiUEhBK1BHSnlQand2Y0Q0PSI7czo3OiJjb250YWN0IjtzOjA6IiI7czo4OiJkZWxpdmVyeSI7czowOiIiO3M6NDoibmV3cyI7czowOiIiO3M6NToicGFnZXMiO2E6Mjp7czo0OiJuZXdzIjtPOjEyOiJBcHBcRGF0YUl0ZW0iOjI6e3M6MjoiaWQiO047czo5OiIAKgBmaWVsZHMiO2E6NDp7czo0OiJsaW5rIjtzOjQ6Im5ld3MiO3M6NToidGl0bGUiO3M6MTE6Imtra3JycnJycnJyIjtzOjU6Im9yZGVyIjtzOjE6IjIiO3M6NDoidGV4dCI7czoyNDoiUEhBK1pXVmxaV1ZsWldWbFBDOXdQZz09Ijt9fXM6ODoiYWJvdXRfdXMiO086MTI6IkFwcFxEYXRhSXRlbSI6Mjp7czoyOiJpZCI7TjtzOjk6IgAqAGZpZWxkcyI7YTo0OntzOjQ6ImxpbmsiO3M6ODoiYWJvdXRfdXMiO3M6NToidGl0bGUiO3M6OToi0J4g0L3QsNGBIjtzOjU6Im9yZGVyIjtzOjE6IjMiO3M6NDoidGV4dCI7czozMjoiUEhBK1BHSSswSjRnMEwzUXNOR0JQQzlpUGp3dmNEND0iO319fXM6NToicGhvbmUiO3M6MDoiIjtzOjEwOiJzYWxlc291cmNlIjtzOjE6IjAiO30=');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('val', 'YToyOntzOjc6InZhbGxpc3QiO2E6Mjp7aToxNjQyNjc1OTU1O086MTI6IkFwcFxEYXRhSXRlbSI6Mjp7czoyOiJpZCI7aToxNjQyNjc1OTU1O3M6OToiACoAZmllbGRzIjthOjM6e3M6NDoiY29kZSI7czozOiJVU0QiO3M6NDoibmFtZSI7czoxMjoi0JTQvtC70LvQsNGAIjtzOjQ6InJhdGUiO3M6MjoiMjgiO319aToxNjQyNjc2MTI2O086MTI6IkFwcFxEYXRhSXRlbSI6Mjp7czoyOiJpZCI7aToxNjQyNjc2MTI2O3M6OToiACoAZmllbGRzIjthOjM6e3M6NDoiY29kZSI7czo0OiJFVVJPIjtzOjQ6Im5hbWUiO3M6ODoi0JXQstGA0L4iO3M6NDoicmF0ZSI7czoyOiIzMyI7fX19czo4OiJ2YWxwcmljZSI7aTowO30=');
INSERT INTO `options` (`optname`, `optvalue`) VALUES('version', '6.5.0');
