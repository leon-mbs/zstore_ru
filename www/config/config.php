<?php


$_config = array('common'=>[],'db'=>[],'smtp'=>[],'dbpg_example'=>[]) ;
$_config['common']['loglevel'] = 200  ;//DEBUG = 100,INFO = 200,WARNING = 300,ERROR = 400;
 
$_config['db']['host'] = 'localhost'  ;
$_config['db']['name'] = 'zstoreru'  ;
$_config['db']['user'] = 'root'  ;
$_config['db']['pass'] = 'root'  ;
 


$_config['smtp']['usesmtp'] = false ; //если false использктся sendmail. Заполняется  только  поле user, с ящика  которого отсылает sendmail
$_config['smtp']['host'] = 'smtp.google.com' ;
$_config['smtp']['port'] = 587 ;
$_config['smtp']['user'] = 'admin.google.com' ;
$_config['smtp']['emailfrom'] = 'admin.google.com' ;
$_config['smtp']['pass'] = 'пароль' ;
$_config['smtp']['tls'] = true ;

 
  
 
 