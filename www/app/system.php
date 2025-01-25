<?php

namespace App;

use App\Entity\User;

/**
 * Класс  содержащи  методы  работы   с  наиболее  важными
 * системмными  данными
 */
class System
{
    const CURR_VERSION= "6.6.5";
  
    private static $_options = array();   //  для кеширования  
    private static $_cache   = array();   //  для кеширования

    /**
     * Возвращает  текущего  юзера
     * @return  User
     */
    public static function getUser() {
        $user = Session::getSession()->user;
        if ($user == null) {
            $user = new User();
            self::setUser($user);
        }
        return $user;
    }

    /**
     * Устанавливавет  текущего  юзера  в  системме
     *
     * @param User $user
     */
    public static function setUser(User $user) {
        Session::getSession()->user = $user;
    }

    public static function getBranch() {

        return Session::getSession()->branch_id;
    }

    public static function setBranch(int $branch_id) {
        Session::getSession()->branch_id = $branch_id;
    }
  
    public static function getCustomer() {

        return (int)Session::getSession()->customer_id;
    }

    public static function setCustomer(int $customer_id) {
        Session::getSession()->customer_id = $customer_id;
    }

    /**
     * Возвращает  сессию
     * @return  Session
     */
    public static function getSession() {

        return Session::getSession();
    }
    
    
    /**
     * Возвращает набор  параметром  по  имени набора
     *
     * @param mixed $group
     * @param mixed $reload
 
     */
     public static function getOptions($group,$reload= false ) {

        $opp  = Session::getSession()->options ??[] ;
        if(!is_array($opp))  {
            $opp=[];
        }       
       
        if(isset($opp[$group]) && $reload==false  ) {
            return $opp[$group];
        }
       
       
        $conn = \ZDB\DB::getConnect();

        $rs = $conn->GetOne("select optvalue from options where optname='{$group}' ");
        
        if($group=='version')  {
           return $rs; 
        }
        if (strlen($rs) > 0) {
            if(strpos($rs,':')>0) {
                $d =  @unserialize($rs);
                $opp[$group]  = $d;
                Session::getSession()->options = $opp;
                return $d;
            }   

            $d =    @unserialize(@base64_decode($rs));
            $opp[$group]  = $d;
            Session::getSession()->options = $opp;
            return $d;
            
        }

        
    }

    /**
     * возвращает настройку
     *
     * @param mixed $group
     * @param mixed $option
     */
    public static function getOption($group, $option) {

        $options = self::getOptions($group);

        return $options[$option];
    }

    /**
     * Записывает набор  параметров  по имени набора
     *
     * @param mixed $group
     * @param mixed $options
     */
    public static function setOptions($group, $options) {
     
        $options = serialize($options);
        $options = base64_encode($options) ;
        $conn = \ZDB\DB::getConnect();
        $conn->Execute(" delete from options where  optname='{$group}' ");
        $conn->Execute(" insert into options (optname,optvalue) values ('{$group}'," . $conn->qstr($options) . " ) ");
        Session::getSession()->options = [];
    }
    /**
    * установить отьедный параметр
    *
    * @param mixed $group
    * @param mixed $option
    * @param mixed $value
    */
    public static function setOption($group, $option, $value) {

        $options = self::getOptions($group);
        $options[$option]  = $value;

        self::setOptions($group, $options) ;
    }

   
    public static function setCache($key, $data) {
        self::$_cache[$key] = $data;
    }

    public static function getCache($key) {

        if (isset(self::$_cache[$key])) {
            return self::$_cache[$key];
        }
        return null;
    }

    public static function setSuccessMsg($msg) {
        Session::getSession()->smsg = $msg;
    }

    public static function getSuccesMsg() {
        return Session::getSession()->smsg;
    }

  
    public static function setErrorMsg($msg,$toppage=false) {
       if($toppage) 
          Session::getSession()->emsgtp = $msg;
       else 
          Session::getSession()->emsg = $msg;   
    }

    public static function getErrorMsg( ) {
        return Session::getSession()->emsg;
    }
    public static function getErrorMsgTopPage( ) {
        return Session::getSession()->emsgtp;
    }

    public static function setWarnMsg($msg) {
        Session::getSession()->wmsg = $msg;
    }

    public static function getWarnMsg() {
        return Session::getSession()->wmsg;
    }

    public static function setInfoMsg($msg ) {
        Session::getSession()->imsg = $msg;
    }

    public static function getInfoMsg() {
        return Session::getSession()->imsg;
    }
    public static function clean() {
        self::$_cache = [] ;
        self::$_cache = [] ;
    }
}
