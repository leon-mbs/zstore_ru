<?php


$_config = array('common'=>[],'db'=>[],'smtp'=>[],'dbpg_example'=>[]) ;
 
$_config['common']['salt']     = 'qwerty';
$_config['common']['loglevel'] = 100  ;//DEBUG = 100,INFO = 200,WARNING = 300,ERROR = 400;
 
$_config['db']['host'] = 'localhost'  ;
$_config['db']['name'] = 'zstore'  ;
$_config['db']['user'] = 'root'  ;
$_config['db']['pass'] = 'root'  ;

$_config['smtp']['usesmtp'] = false ; //если false использктся sendmail. Заполняется  только  поле user, с ящика  которого отсылает sendmail
$_config['smtp']['host'] = 'smtp.google.com' ;
$_config['smtp']['port'] = 587 ;
$_config['smtp']['user'] = 'admin.google.com' ;
$_config['smtp']['emailfrom'] = 'admin.google.com' ;
$_config['smtp']['pass'] = 'пароль' ;
$_config['smtp']['tls'] = true ;

//пример  для  PosgreSQl
$_config['db_example']['host'] = 'localhost'  ;
$_config['db_example']['name'] = 'test1'  ;
$_config['db_example']['user'] = 'postgres'  ;
$_config['db_example']['pass'] = 'root'  ; 
$_config['db_example']['padriverss'] = 'postgres'  ; 
 
  
 
 