 
ALTER TABLE stores ADD disabled smallint  DEFAULT 0  ;
ALTER TABLE mfund  ADD disabled smallint   DEFAULT 0  ;
 
INSERT INTO "metadata" (meta_type, description, meta_name, menugroup, disabled) VALUES( 2, 'OLAP анализ', 'OLAP', 'Аналитика', 0);
UPDATE "metadata"  set  menugroup ='Аналитика' where meta_name = 'ABC' ; 
 
 
DELETE  FROM "options" WHERE  optname='version' ;
INSERT INTO "options" (optname, optvalue) values('version','6.6.0');    
 
