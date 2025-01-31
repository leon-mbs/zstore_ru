<?php
namespace App;

use \App\Entity\User;
use \App\Entity\Customer;
use \App\Helper  as H;

/**
* класс для  работы  с  телеграм  ботом
*/
class ChatBot{
   
  private  $token;   

  function __construct($token  ) {
   
       $this->token = $token;
       
  }    
  
  public function doGet($command,$p=null){
          
     $url ="https://api.telegram.org/bot".$this->token."/".$command; 
     
     if(is_array($p)){
           $url .= "?". http_build_query($p)  ;
     }
     
     $ch = curl_init($url);
     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
     curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
     curl_setopt($ch, CURLOPT_HEADER, false);

     $resultQuery = curl_exec($ch);
     curl_close($ch);   
        
     return json_decode($resultQuery,true);    
      
  }
  
   public function getUpdates(){
        $ret= $this->doGet('getUpdates') ;
        if($ret['ok'] !== true ) {
            return array();
        }
        
        $u = array_pop($ret['result'])  ;
        $this->onMessage($u['message'])  ;
        
        
   }

   public function onHook(){
       global  $logger;
       
       $request = file_get_contents('php://input');
   
       $ret = json_decode($request,true)   ;
            
        $logger->info($request);
        if(false === $this->onMessage($ret['message']) ){
            $logger->error("bot answer " . $request );              
        };
          
       
    
   }
  
   public function onMessage(  $msg){
        global  $logger;
    
        if(!is_array($msg)) {
            $logger->error("bot message" . $msg );            
            return  false;
        }
        
      /*  $logger->info($msg['chat']['id'] );
        $logger->info($msg['from']['id'] );
        $logger->info($msg['from']['last_name'] );
        $logger->info($msg['from']['first_name'] );
        $logger->info($msg['from']['username']);
        $logger->info($msg['text']);
        $logger->info( \App\Helper::fdt( $msg['date'] ) );             
        */   
         
        $text = $msg['text'] ;
        $chat_id = $msg['chat']['id'] ;
        if(strpos($text,"/help")===0) {
           $this->sendMessage($chat_id, H::l( "btcommands", H::PhoneL())   ) ;
           
        }
        if(strpos($text,"login") === 0) {
            $s = \App\Util::strtoarray($text) ;
            if(count($s) != 3){
               $this->sendMessage($chat_id,"Login fail") ; 
               return;
            }
            $user = H::login($s[1], $s[2]);

            if ($user instanceof User) {
                $user->chat_id = $chat_id;
                $user->save();
                $this->sendMessage($chat_id,"Login OK") ; 
                return;    
            } ;
     
            $c = \App\Entity\Customer::getByPhone($s[1]);
            if (  $c = null) {
               $this->sendMessage($chat_id,"Login fail") ; 
               return;
            }
            
            if (  ($c->passw ??'') != $s[2]) {
                $this->sendMessage($chat_id,"Login fail") ; 
                return;
            } 
                
            if (  $c instanceof \App\Entity\Customer) {
                $c->chat_id = $chat_id;
                $c->save();
                $this->sendMessage($chat_id,"Login OK") ; 
                return;    
            } ;
           
            
        }
        if(strpos($text,"logout")===0) {
           $u = $this->getUser($chat_id)  ;
           if($u != null){
               $u->chat_id = '';
               $u->save();
               $this->sendMessage($chat_id,"Logout OK") ;
           } else {
               $this->sendMessage($chat_id,H::l("btunotlogined")) ;               
           }
           
        }
        
  
        return  true;
  
   }
  
   public function sendMessage( $chat_id, $msg){

         $this->doGet('sendMessage',array('chat_id'=>$chat_id,'text'=>$msg)) ; 
   }
   
   private function getUser($chat_id){
          foreach(User::find("disabled <> 1")  as $user) {
              if($user->chat_id == $chat_id){
                  return $user;
              }              
          }

          $customer = \App\Entity\Customer::getFirst("detail like '%<chat_id>{$chat_id}</chat_id>%'") ;
          if($customer instanceof \App\Entity\Customer){
              return $customer;
          }
          
          return null;
          
   }
  
  
 
}