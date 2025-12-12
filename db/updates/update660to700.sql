SET NAMES 'utf8';

 

CREATE TABLE crontask (
  id int(11) NOT NULL AUTO_INCREMENT,
  created datetime NOT NULL,
  tasktype varchar(64) DEFAULT NULL,
  taskdata text DEFAULT NULL,
  starton datetime DEFAULT NULL,
  PRIMARY KEY (id)
) 
 ENGINE = InnoDB DEFAULT CHARSET=utf8;    
    
CREATE TABLE  taglist (
  id int(11) NOT NULL AUTO_INCREMENT,
  tag_type smallint(6) NOT NULL,
  item_id int(11) NOT NULL,
  tag_name varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE promocodes (
  id int(11) NOT NULL AUTO_INCREMENT,
  code varchar(16) NOT NULL,
  type tinyint(4) NOT NULL,
  enddate  DATE DEFAULT null,
  disabled tinyint(1) NOT NULL default 0,
  details text DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

ALTER TABLE promocodes
ADD UNIQUE INDEX code (code)   ; 

DROP TABLE IF EXISTS custacc;
    
CREATE TABLE custacc (
  ca_id bigint(20) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  document_id int(11) DEFAULT NULL,
  optype tinyint(4) NULL,
  amount decimal(10, 2) NOT NULL,
  createdon date DEFAULT NULL,
  PRIMARY KEY (ca_id),
  KEY customer_id (customer_id),
  KEY document_id (document_id)
) ENGINE = INNODB  DEFAULT CHARSET = utf8;  


DROP TABLE IF EXISTS custitems  ;

CREATE TABLE custitems (
  custitem_id int(11) NOT NULL AUTO_INCREMENT,
  item_id int(11)   NULL,
  customer_id int(11) NOT NULL,
  quantity decimal(10, 3) DEFAULT NULL,
  price decimal(10, 2) NOT NULL DEFAULT '0.00',
  cust_code varchar(255) NOT NULL,
  cust_name varchar(255) NOT NULL,
  brand varchar(255) NOT NULL,
  store varchar(255) NOT NULL,
  bar_code varchar(64) NOT NULL,
  details TEXT DEFAULT NULL,
  updatedon date NOT NULL,
  PRIMARY KEY (custitem_id),
  KEY item_id (item_id) ,
  KEY customer_id (customer_id)
) ENGINE = INNODB  DEFAULT CHARSET = utf8;

CREATE TABLE  eqentry (
  id int NOT NULL AUTO_INCREMENT,
  eq_id int NOT NULL,
  optype smallint NOT NULL,
  amount decimal(10, 2) DEFAULT NULL,
  document_id int DEFAULT NULL,
  KEY (eq_id) ,
  KEY (document_id) ,
  PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ; 

CREATE TABLE shop_articles (
  id int NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  shortdata text DEFAULT NULL,
  longdata longtext NOT NULL,
  createdon date NOT NULL,
  isactive tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;  


CREATE TABLE  substitems (
  id bigint NOT NULL AUTO_INCREMENT,
  itemname varchar(255) NOT NULL ,
  origcode varchar(255) NOT NULL ,
  origbrand varchar(255) DEFAULT NULL ,
  substcode varchar(255) NOT NULL ,
  substbrand varchar(255) DEFAULT NULL ,
  customer_id int DEFAULT NULL,
   
  KEY (origcode) ,
  PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;  

ALTER TABLE paylist CHANGE paytype paytype mediumint NOT NULL;

ALTER TABLE customers ADD INDEX (phone);

ALTER TABLE messages ADD checked tinyint(1) NULL;     

ALTER TABLE eventlist ADD event_type tinyint(4) NULL default 0;     
ALTER TABLE eventlist ADD details text NULL;     
ALTER TABLE eventlist ADD createdby int(11) DEFAULT NULL;
ALTER TABLE eventlist CHANGE user_id user_id int NULL ;
ALTER TABLE eventlist CHANGE customer_id customer_id int NULL ;

 
ALTER TABLE note_topics ADD ispublic   tinyint(1) DEFAULT 0;
ALTER TABLE note_topicnode ADD islink  tinyint(1) DEFAULT 0;

ALTER TABLE equipments ADD pa_id int(11) DEFAULT  NULL;
ALTER TABLE equipments ADD emp_id int(11) DEFAULT  NULL;
ALTER TABLE equipments ADD invnumber  varchar(255) DEFAULT NULL;
ALTER TABLE equipments ADD  type  smallint DEFAULT 0;
ALTER TABLE equipments ADD branch_id INT NULL ;

ALTER TABLE documents ADD INDEX (state);
ALTER TABLE documents ADD   INDEX parent_id (parent_id)   ; 
ALTER TABLE documents ADD   INDEX document_number (document_number)   ; 

ALTER TABLE employees ADD   INDEX login (login)   ; 

ALTER TABLE metadata  ADD   INDEX meta_name (meta_name)   ; 

ALTER TABLE parealist ADD notes  varchar(255) DEFAULT NULL;
ALTER TABLE parealist  ADD  disabled  tinyint(1) DEFAULT 0;
ALTER TABLE parealist  ADD  branch_id  int(11) DEFAULT null;

ALTER TABLE store_stock ADD emp_id int(11) DEFAULT NULL;    
ALTER TABLE store_stock ADD INDEX  (emp_id) ; 
ALTER TABLE store_stock ADD customer_id int(11) DEFAULT NULL;    

 
ALTER TABLE entrylist ADD createdon DATE DEFAULT NULL ;
ALTER TABLE entrylist ADD cost decimal(11, 2) DEFAULT 0 ;

ALTER TABLE roles ADD disabled  tinyint(1) DEFAULT 0;
 
ALTER TABLE empacc ADD notes varchar(255) DEFAULT NULL;
ALTER TABLE contracts ADD state int(6) DEFAULT 0;
ALTER TABLE files ADD user_id int  DEFAULT NULL;



DROP VIEW if exists cust_acc_view;


DROP VIEW if exists documents_view;
 
CREATE VIEW documents_view
AS
SELECT
  d.document_id AS document_id,
  d.document_number AS document_number,
  d.document_date AS document_date,
  d.user_id AS user_id,
  d.content AS content,
  d.amount AS amount,
  d.meta_id AS meta_id,
  u.username AS username,
  d.customer_id AS customer_id,
  c.customer_name AS customer_name,
  d.state AS state,
  d.notes AS notes,
  d.payamount AS payamount,
  d.payed AS payed,
  d.parent_id AS parent_id,
  d.branch_id AS branch_id,
  b.branch_name AS branch_name,
    
  case 
    when d.state=9 then 1 
    when d.state=15 then 3  
    when d.state=22 then 15  
    when d.state=18 then 20  
    when d.state=14 then 30  
    when d.state=16 then 40  
    when d.state in(7,11,20) then 45  
    when d.state =3  then 70  
    when d.state = 21 then 75  
 
    when d.state in(19,2) then 80  
    when d.state = 8 then 90
    when d.state = 1 then 100
         
    else 50 end  AS priority ,
    
  d.lastupdate AS lastupdate,
  metadata.meta_name AS meta_name,
  metadata.description AS meta_desc
FROM documents d
  LEFT JOIN users_view u
    ON d.user_id = u.user_id
  LEFT JOIN customers c
    ON d.customer_id = c.customer_id
  JOIN metadata
    ON metadata.meta_id = d.meta_id
  LEFT JOIN branches b
    ON d.branch_id = b.branch_id ;

DROP VIEW messages_view  ;

CREATE VIEW messages_view
AS
SELECT
  messages.message_id AS message_id,
  messages.user_id AS user_id,
  messages.created AS created,
  messages.message AS message,
  messages.item_id AS item_id,
  messages.item_type AS item_type,
  messages.checked AS checked,
  users_view.username AS username
FROM (messages
  LEFT JOIN users_view
    ON ((messages.user_id = users_view.user_id)));
    
    

 

 
DROP VIEW IF EXISTS customers_view  ;

CREATE VIEW customers_view  
AS
SELECT 
  customers.customer_id AS customer_id,
  customers.customer_name AS customer_name,
  customers.detail AS detail,
  customers.email AS email,
  customers.phone AS phone,
  customers.status AS status,
  customers.city AS city,
  customers.leadstatus AS leadstatus,
  customers.leadsource AS leadsource,
  customers.createdon AS createdon,
  customers.country AS country,
  customers.passw AS passw,
  (SELECT
      COUNT(0)
    FROM messages m
    WHERE ((m.item_id = customers.customer_id)
    AND (m.item_type = 2))) AS mcnt,
  (SELECT
      COUNT(0)
    FROM files f
    WHERE ((f.item_id = customers.customer_id)
    AND (f.item_type = 2))) AS fcnt,
  (SELECT
      COUNT(0)
    FROM eventlist e
    WHERE ((e.customer_id = customers.customer_id)
    AND (e.eventdate >= NOW()))) AS ecnt
FROM customers;


 

DROP VIEW entrylist_view;
    
CREATE VIEW entrylist_view 
AS
SELECT
  entrylist.entry_id AS entry_id,
  entrylist.document_id AS document_id,
  entrylist.quantity AS quantity,
  documents.customer_id AS customer_id,
  entrylist.stock_id AS stock_id,
  entrylist.service_id AS service_id,
  entrylist.tag AS tag,
  entrylist.createdon AS createdon,
  store_stock.item_id AS item_id,
  store_stock.partion AS partion,
  case when entrylist.createdon  is NULL  then documents.document_date else entrylist.createdon  end      AS document_date,
  entrylist.cost AS cost,
  entrylist.outprice AS outprice
FROM entrylist
  LEFT JOIN store_stock 
    ON entrylist.stock_id = store_stock.stock_id
  JOIN documents
    ON entrylist.document_id = documents.document_id;    
    
    

   
DROP VIEW eventlist_view;

CREATE VIEW eventlist_view
AS
SELECT
  e.event_id AS event_id,
  e.user_id AS user_id,
  e.eventdate AS eventdate,
  e.title AS title,
  e.description AS description,
  e.customer_id AS customer_id,
  e.isdone AS isdone,
  e.createdby AS createdby,
  e.event_type AS event_type,
  e.details AS details,
  c.customer_name AS customer_name,
  uv.username AS username,
  uv2.username AS createdname
FROM ((eventlist e
  LEFT JOIN customers c
    ON (e.customer_id = c.customer_id))
  LEFT JOIN users_view uv
    ON ((uv.user_id = e.user_id))      
  LEFT JOIN users_view uv2
    ON ((uv2.user_id = e.createdby))) ;    
    

 

  
    
DROP VIEW IF EXISTS custacc_view;    
    
CREATE
VIEW custacc_view
AS
SELECT
  e.ca_id AS ca_id,
  e.customer_id AS customer_id,
  e.document_id AS document_id,
  e.optype AS optype,
  d.notes AS notes,
  e.amount AS amount,
  COALESCE(e.createdon, d.document_date) AS createdon,
  d.document_number AS document_number,
  c.customer_name AS customer_name
FROM ((custacc e
  LEFT JOIN documents d
    ON ((d.document_id = e.document_id)))
  JOIN customers c
    ON ((c.customer_id = e.customer_id))) ;
    
  


 

DROP VIEW IF EXISTS item_cat_view  ;

CREATE VIEW item_cat_view
AS
SELECT
  ic.cat_id AS cat_id,
  ic.cat_name AS cat_name,
  ic.detail AS detail,
  ic.parent_id AS parent_id,
  COALESCE((SELECT
      COUNT(*)
    FROM items i
    WHERE i.cat_id = ic.cat_id), 0) AS itemscnt  ,
    COALESCE((SELECT
      COUNT(*)
    FROM item_cat ic2
    WHERE ic.cat_id = ic2.parent_id), 0) AS childcnt
FROM item_cat ic   ;

 

 

 
CREATE
VIEW equipments_view
AS
SELECT
  e.eq_id AS eq_id,
  e.eq_name AS eq_name,
  e.detail AS detail,
  e.disabled AS disabled,
  e.description AS description,
  e.branch_id AS branch_id,
  e.invnumber AS invnumber,
  e.pa_id AS pa_id,
  e.emp_id AS emp_id,
  p.pa_name AS pa_name,
  employees.emp_name AS emp_name
FROM ((equipments e
  LEFT JOIN employees
    ON ((employees.employee_id = e.emp_id)))
  LEFT JOIN parealist p
    ON ((p.pa_id = e.pa_id))); 
 
   

 

CREATE
VIEW eqentry_view
AS
SELECT
  e.id AS id,
  e.eq_id AS eq_id,
  d.document_date AS document_date,
  e.optype AS optype,
  e.amount AS amount,
  e.document_id AS document_id,
  d.document_number AS document_number,
  d.notes AS notes
FROM (eqentry e
  JOIN documents d
    ON ((e.document_id = d.document_id)))  ;
 

DROP VIEW if exists note_topicnodeview  ;

CREATE
VIEW note_topicnodeview
AS
SELECT
  note_topicnode.topic_id AS topic_id,
  note_topicnode.node_id AS node_id,
  note_topicnode.tn_id AS tn_id,
  note_topicnode.islink AS islink,
  note_topics.title AS title,
  note_topics.content AS content 
   
FROM note_topics
  JOIN note_topicnode
    ON note_topics.topic_id = note_topicnode.topic_id
  JOIN note_nodes
    ON note_topicnode.node_id = note_nodes.node_id    ;
 

DROP VIEW store_stock_view;

CREATE VIEW store_stock_view
AS
SELECT
  st.stock_id AS stock_id,
  st.item_id AS item_id,
  st.partion AS partion,
  st.store_id AS store_id,
  st.customer_id AS customer_id,
  st.emp_id AS emp_id,
  i.itemname AS itemname,
  i.item_code AS item_code,
  i.cat_id AS cat_id,
  i.msr AS msr,
  i.item_type AS item_type,
  i.bar_code AS bar_code,
  i.cat_name AS cat_name,
  i.disabled AS itemdisabled,
  stores.storename AS storename,
  st.qty AS qty,
  st.snumber AS snumber,
  st.sdate AS sdate,
  employees.emp_name AS emp_name
FROM  store_stock st
  JOIN items_view i
    ON  i.item_id = st.item_id  AND  i.disabled <> 1 
  JOIN stores
    ON  stores.store_id = st.store_id  AND  stores.disabled <> 1 
  LEFT JOIN employees
    ON  employees.employee_id  = st.emp_id ;

DROP VIEW custitems_view;

CREATE VIEW custitems_view
AS
SELECT
  s.custitem_id AS custitem_id,
  s.cust_name AS cust_name,
  COALESCE(s.item_id, 0) AS item_id,
  s.customer_id AS customer_id,
  s.quantity AS quantity,
  s.price AS price,
  s.cust_code AS cust_code,
  s.brand AS brand,
  s.store AS store,
  s.bar_code AS bar_code,
  s.details AS details,
  s.updatedon AS updatedon,
  c.customer_name AS customer_name,
   i.item_code 
FROM custitems s
  JOIN customers c
    ON s.customer_id = c.customer_id
  LEFT JOIN items i ON  s.item_id = i.item_id 
  WHERE c.status <> 1   ;
 
DROP VIEW prodstage_view; 
 
CREATE VIEW  prodstage_view
AS
SELECT
  ps.st_id AS st_id,
  ps.pp_id AS pp_id,
  ps.pa_id AS pa_id,
  ps.state AS state,
  ps.stagename AS stagename,
  ps.detail AS detail,
  pr.procname AS procname,
  pr.state AS procstate,
  pa.pa_name AS pa_name
FROM prodstage ps
  JOIN prodproc pr
    ON pr.pp_id = ps.pp_id 
  JOIN parealist pa
    ON pa.pa_id = ps.pa_id ;  
 
DROP VIEW prodproc_view; 
 
CREATE
VIEW prodproc_view
AS
SELECT
  p.pp_id AS pp_id,
  p.procname AS procname,
  p.basedoc AS basedoc,
  
  p.state AS state,

  COALESCE((SELECT
      COUNT(0)
    FROM prodstage ps
    WHERE (ps.pp_id = p.pp_id)), NULL) AS stagecnt,
  p.detail AS detail
FROM prodproc p ;

DROP VIEW roles_view  ;

CREATE VIEW roles_view
AS
SELECT
  `roles`.`role_id` AS `role_id`,
  `roles`.`rolename` AS `rolename`,
  `roles`.`disabled` AS `disabled`,
  `roles`.`acl` AS `acl`,
  (SELECT
      COALESCE(COUNT(0), 0)
    FROM `users`
    WHERE (`users`.`role_id` = `roles`.`role_id`)) AS `cnt`
FROM `roles`; 
 
 
DROP VIEW empacc_view ;

CREATE VIEW empacc_view
AS
SELECT
  e.ea_id AS ea_id,
  e.emp_id AS emp_id,
  e.document_id AS document_id,
  e.optype AS optype,
  case when e.notes is not null then e.notes else d.notes end AS notes,
  e.amount AS amount,
  COALESCE(e.createdon, d.document_date) AS createdon,
  d.document_number AS document_number,
  em.emp_name AS emp_name
FROM ((empacc e
  LEFT JOIN documents d
    ON ((d.document_id = e.document_id)))
  JOIN employees em
    ON ((em.employee_id = e.emp_id))) ;

DROP VIEW contracts_view ;    
    
CREATE VIEW contracts_view
AS
SELECT
  co.contract_id AS contract_id,
  co.customer_id AS customer_id,
 
  co.createdon AS createdon,
  co.contract_number AS contract_number,
  co.state AS state,
 
  co.details AS details,
  cu.customer_name AS customer_name

FROM contracts co
  JOIN customers cu
    ON co.customer_id = cu.customer_id  ;    
 
    


 

INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 1, 'Офисный документ', 'OfficeDoc', '', 0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 3, 'Офис', 'OfficeList', '', 0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 2, 'Прогноз продаж', 'PredSell', 'Аналитика', 0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 2, 'Управленческий баланс', 'Balance', '', 0);  
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 2, 'Кафе', 'OutFood', 'Продажи', 1);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 3, 'Платежный календарь', 'PayTable', 'Касса и платежи', 0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 1, 'Повернення з виробництва', 'ProdReturn', 'Производство', 1);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 2, 'Комісійні товари', 'ItemComission', 'Закупки', 0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 1, 'Операції з ОЗ та  НМА', 'EQ', '', 0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 1, 'Перемiщення мiж етапами', 'ProdMove', 'Производство', 1);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES( 1, 'Авансовий звiт', 'AdvanceRep', 'Касса и платежи',   0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES(  2, 'Закриття дня', 'EndDay', 'Касса и платежи',     0);
INSERT INTO metadata (meta_type, description, meta_name, menugroup, disabled) VALUES(  3, 'Замiни ТМЦ', 'SubstItems', 'Склад',     0);

UPDATE metadata set menugroup ='Закупки' where meta_name='CustItems';
  
 
  
  
  delete from options where  optname='version' ;
  insert into options (optname,optvalue) values('version','7.0.0'); 
  


 