 
INSERT INTO "users" (  "userlogin", "userpass", "createdon", "email", "acl", "disabled", "options", "role_id") VALUES(  'admin', '$2y$10$GsjC.thVpQAPMQMO6b4Ma.olbIFr2KMGFz12l5/wnmxI1PEqRDQf.', '2017-01-01', 'admin@admin.admin', 'a:2:{s:9:"aclbranch";N;s:6:"onlymy";N;}', 0, 'a:6:{s:8:"defstore";s:2:"19";s:7:"deffirm";i:0;s:5:"defmf";s:1:"2";s:8:"pagesize";s:2:"15";s:11:"hidesidebar";i:0;s:8:"mainpage";s:15:"\\App\\Pages\\Main";}', 1);

INSERT INTO "roles" (  "rolename", "acl") VALUES(  'admins', 'a:9:{s:7:"aclview";N;s:7:"acledit";N;s:6:"aclexe";N;s:9:"aclcancel";N;s:8:"aclstate";N;s:9:"acldelete";N;s:7:"widgets";N;s:7:"modules";N;s:9:"smartmenu";s:1:"8";}');

UPDATE users set  role_id=(select role_id  from "roles"  where  rolename='admins' limit 1)  where  userlogin='admin' ;
 
INSERT INTO "stores" (  "storename", "description") VALUES(  'Основной склад', '');
INSERT INTO "mfund" (  "mf_name", "description", "branch_id", "detail") VALUES(  'Каса', '', NULL, '<detail><beznal>0</beznal><btran></btran><bank><![CDATA[]]></bank><bankacc><![CDATA[]]></bankacc></detail>');

INSERT INTO "firms" (  "firm_name", "details", "disabled") VALUES(  'Наша  фирма', '', 0);
INSERT INTO "customers" ( "customer_name", "detail", "email", "phone", "status", "city", "leadstatus", "leadsource", "createdon") VALUES( 'Физ. лицо', '<detail><code></code><discount></discount><bonus></bonus><type>0</type><fromlead>0</fromlead><jurid></jurid><shopcust_id></shopcust_id><isholding>0</isholding><holding>0</holding><viber></viber><nosubs>1</nosubs><user_id>4</user_id><holding_name><![CDATA[]]></holding_name><address><![CDATA[]]></address><comment><![CDATA[Условный контрагент если нужно  кого то  выбрать.]]></comment></detail>', '', '', 0, '', NULL, NULL, '2021-04-28');


  
  
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
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 2, 'ABC анализ', 'ABC', '', 0);
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
INSERT INTO "metadata" ( "meta_type", "description", "meta_name", "menugroup", "disabled") VALUES( 3, 'Роботы, услуги', 'SerList', '', 0);а
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

  


INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(2, 105, 'Основная  зарплата', 'осн', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(3, 200, 'Всего начислено', 'вс. нач', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(4, 600, 'Всего удержано', 'вс. уд', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(5, 900, 'К выдаче', 'К выдаче', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(6, 850, 'Аванс', 'Аванс', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(7, 220, 'НДФЛ', 'НДФЛ', 0);
INSERT INTO "saltypes" ("st_id", "salcode", "salname", "salshortname", "disabled") VALUES(8, 300, 'ЕСВ', 'ЕСВ', 0);

INSERT INTO "options" ("optname", "optvalue") VALUES('api', 'a:3:{s:3:\"exp\";s:0:\"\";s:3:\"key\";s:4:\"test\";s:5:\"atype\";s:1:\"1\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('common', 'YTozOTp7czo5OiJxdHlkaWdpdHMiO3M6MToiMCI7czo4OiJhbWRpZ2l0cyI7czoxOiIwIjtzOjEwOiJkYXRlZm9ybWF0IjtzOjU6ImQubS5ZIjtzOjExOiJwYXJ0aW9udHlwZSI7czoxOiIxIjtzOjQ6ImN1cnIiO3M6MjoiZ3IiO3M6NjoicGhvbmVsIjtzOjI6IjEwIjtzOjY6InByaWNlMSI7czoxODoi0KDQvtC30L3QuNGH0L3QsNGPIjtzOjY6InByaWNlMiI7czoxNDoi0J7Qv9GC0L7QstCw0Y8iO3M6NjoicHJpY2UzIjtzOjA6IiI7czo2OiJwcmljZTQiO3M6MDoiIjtzOjY6InByaWNlNSI7czowOiIiO3M6ODoiZGVmcHJpY2UiO3M6MjoiMTAiO3M6ODoic2hvcG5hbWUiO3M6MjA6ItCd0LDRiNCwICDRhNC40YDQvNCwIjtzOjg6InRzX2JyZWFrIjtzOjI6IjYwIjtzOjg6InRzX3N0YXJ0IjtzOjU6IjA5OjAwIjtzOjY6InRzX2VuZCI7czo1OiIxODowMCI7czoxMToiY2hlY2tzbG9nYW4iO3M6ODoi0KLQtdGB0YIiO3M6MTE6ImF1dG9hcnRpY2xlIjtpOjE7czoxMDoidXNlc251bWJlciI7aToxO3M6MTA6InVzZXNjYW5uZXIiO2k6MTtzOjk6InVzZWltYWdlcyI7aToxO3M6MTU6InNob3dhY3RpdmV1c2VycyI7aToxO3M6MTA6InVzZWNhdHRyZWUiO2k6MDtzOjk6InVzZWJyYW5jaCI7aTowO3M6MTA6Im5vYWxsb3dmaXoiO2k6MDtzOjEwOiJhbGxvd21pbnVzIjtpOjE7czo2OiJ1c2V2YWwiO2k6MTtzOjY6ImNhcGNoYSI7aTowO3M6OToibnVtYmVydHRuIjtpOjA7czoxNjoidXNlbW9iaWxlcHJpbnRlciI7aTowO3M6MTE6ImxlYWRzb3VyY2VzIjthOjM6e2k6MTYyMTM2NzY1MjtPOjEyOiJBcHBcRGF0YUl0ZW0iOjI6e3M6MjoiaWQiO2k6MTYyMTM2NzY1MjtzOjk6IgAqAGZpZWxkcyI7YToxOntzOjQ6Im5hbWUiO3M6Njoi0LrQutC6Ijt9fWk6MTYyMTM2NzczNTtPOjEyOiJBcHBcRGF0YUl0ZW0iOjI6e3M6MjoiaWQiO2k6MTYyMTM2NzczNTtzOjk6IgAqAGZpZWxkcyI7YToxOntzOjQ6Im5hbWUiO3M6MTg6ItC90L3QvdC90L3QvdC90L3QvSI7fX1pOjE2MjEzNjgyMDk7TzoxMjoiQXBwXERhdGFJdGVtIjoyOntzOjI6ImlkIjtpOjE2MjEzNjgyMDk7czo5OiIAKgBmaWVsZHMiO2E6MTp7czo0OiJuYW1lIjtzOjM6IjExMSI7fX19czoxMjoibGVhZHN0YXR1c2VzIjthOjE6e2k6MTYyMTM2NzY2MztPOjEyOiJBcHBcRGF0YUl0ZW0iOjI6e3M6MjoiaWQiO2k6MTYyMTM2NzY2MztzOjk6IgAqAGZpZWxkcyI7YToxOntzOjQ6Im5hbWUiO3M6MzoieXl5Ijt9fX1zOjE0OiJwcmludG91dHFyY29kZSI7aTowO3M6MTU6InByaW50b3V0YmFyY29kZSI7aToxO3M6MTE6InNhbGVzb3VyY2VzIjthOjI6e2k6MTYyMjUxNTkyNTtPOjEyOiJBcHBcRGF0YUl0ZW0iOjI6e3M6MjoiaWQiO2k6MTYyMjUxNTkyNTtzOjk6IgAqAGZpZWxkcyI7YToxOntzOjQ6Im5hbWUiO3M6MTI6ItC+0YTQu9Cw0LnQvSI7fX1pOjE2MjI1MTU5Mzk7TzoxMjoiQXBwXERhdGFJdGVtIjoyOntzOjI6ImlkIjtpOjE2MjI1MTU5Mzk7czo5OiIAKgBmaWVsZHMiO2E6MTp7czo0OiJuYW1lIjtzOjQ6ItCY0JwiO319fXM6MTQ6Im5vY2hlY2thcnRpY2xlIjtpOjE7czo4OiJzaG93Y2hhdCI7aToxO3M6MTY6InVzZW1vYmlsZXNjYW5uZXIiO2k6MDtzOjEwOiJleHBvcnR4bHN4IjtpOjA7fQ==');
INSERT INTO "options" ("optname", "optvalue") VALUES('disc', 'a:4:{s:8:\"firstbay\";s:2:\"11\";s:6:\"bonus1\";s:0:\"\";s:6:\"level2\";s:0:\"\";s:6:\"bonus2\";s:0:\"\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('discount', 'a:6:{s:8:\"firstbay\";s:2:\"11\";s:6:\"bonus1\";s:3:\"1.1\";s:6:\"level2\";s:0:\"\";s:6:\"bonus2\";s:0:\"\";s:6:\"summa1\";s:3:\"100\";s:6:\"summa2\";s:0:\"\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('food', 'a:5:{s:8:\"worktype\";s:1:\"2\";s:9:\"pricetype\";s:6:\"price1\";s:8:\"delivery\";i:1;s:6:\"tables\";i:1;s:4:\"pack\";i:1;}');
INSERT INTO "options" ("optname", "optvalue") VALUES('printer', 'a:15:{s:7:\"pheight\";s:0:\"\";s:8:\"pa4width\";s:0:\"\";s:6:\"pwidth\";s:4:\"100%\";s:9:\"pdocwidth\";s:4:\"70mm\";s:8:\"pmaxname\";s:1:\"7\";s:9:\"pricetype\";s:6:\"price1\";s:11:\"barcodetype\";s:4:\"C128\";s:9:\"pfontsize\";s:2:\"28\";s:12:\"pdocfontsize\";s:2:\"16\";s:5:\"pname\";i:1;s:5:\"pcode\";i:1;s:8:\"pbarcode\";i:1;s:7:\"pqrcode\";i:1;s:6:\"pprice\";i:1;s:6:\"pcolor\";i:0;}');
INSERT INTO "options" ("optname", "optvalue") VALUES('salary', 'a:4:{s:13:\"codebaseincom\";s:3:\"105\";s:10:\"coderesult\";s:3:\"900\";s:4:\"calc\";s:219:\"v200 = v105\r\n//податки\r\nv220 =  v200 * 0.18\r\nv300 =  v200 * 0.22\r\n//всього  утримано\r\nv600 =v200  - v220- v300\r\n//на руки\r\nv900 =v200  - v600-v850\r\n\r\n\r\n//приклад\r\nif(invalid){\r\n   \r\n}  \";s:11:\"codeadvance\";s:3:\"850\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('shop', 'a:19:{s:7:\"defcust\";s:1:\"1\";s:11:\"defcustname\";s:29:\"Леонид Мартынюк\";s:9:\"defbranch\";N;s:9:\"ordertype\";s:1:\"2\";s:12:\"defpricetype\";s:6:\"price1\";s:5:\"email\";s:15:\"softman@ukr.net\";s:8:\"shopname\";s:18:\"Наш магаз7\";s:12:\"currencyname\";s:6:\"грн\";s:8:\"uselogin\";i:0;s:9:\"usefilter\";i:0;s:13:\"createnewcust\";i:0;s:11:\"usefeedback\";i:0;s:11:\"usemainpage\";i:0;s:7:\"aboutus\";s:16:\"PHA+PGJyPjwvcD4=\";s:7:\"contact\";s:0:\"\";s:8:\"delivery\";s:0:\"\";s:4:\"news\";s:0:\"\";s:5:\"pages\";a:2:{s:4:\"news\";O:12:\"App\\DataItem\":2:{s:2:\"id\";N;s:9:\"\0*\0fields\";a:4:{s:4:\"link\";s:4:\"news\";s:5:\"title\";s:11:\"kkkrrrrrrrr\";s:5:\"order\";s:1:\"2\";s:4:\"text\";s:24:\"PHA+ZWVlZWVlZWVlPC9wPg==\";}}s:8:\"about_us\";O:12:\"App\\DataItem\":2:{s:2:\"id\";N;s:9:\"\0*\0fields\";a:4:{s:4:\"link\";s:8:\"about_us\";s:5:\"title\";s:9:\"О нас\";s:5:\"order\";s:1:\"3\";s:4:\"text\";s:32:\"PHA+PGI+0J4g0L3QsNGBPC9iPjwvcD4=\";}}}s:5:\"phone\";s:0:\"\";}');
INSERT INTO "options" ("optname", "optvalue") VALUES('val', 'a:2:{s:7:\"vallist\";a:2:{i:1642675955;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1642675955;s:9:\"\0*\0fields\";a:3:{s:4:\"code\";s:3:\"USD\";s:4:\"name\";s:10:\"Долар\";s:4:\"rate\";s:2:\"28\";}}i:1642676126;O:12:\"App\\DataItem\":2:{s:2:\"id\";i:1642676126;s:9:\"\0*\0fields\";a:3:{s:4:\"code\";s:4:\"EURO\";s:4:\"name\";s:8:\"Євро\";s:4:\"rate\";s:2:\"33\";}}}s:8:\"valprice\";i:0;}');
INSERT INTO "options" ("optname", "optvalue") VALUES('version', '6.5.0');

