 <table class="table  table-sm">
   <tr><th colspan="2">{{name}}</th></tr>
   <tr><td>Тел.</td><td>{{phone}}</td></tr>
   <tr><td>ОКПО</td><td>{{edrpou}}</td></tr>
   {{#smscode}} 
   <tr><td colspan="2">   СМС код &nbsp;&nbsp;<b>{{smscode}}   </b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a {{{click}}} href="javascript:void(0);return false;">Отправить</a>   
   <br><small> Отправка  кода на телефон для проверки номера   </small>
   </td></tr>
  {{/smscode}}
   
   {{#email}}
     <tr><td>E-mail</td><td>{{{email}}}</td></tr>
   {{/email}}  
   {{#viber}}
     <tr><td>Viber</td><td>{{{viber}}}</td></tr>
   {{/viber}}  
   {{#telega}}
     <tr><td>Телеграм</td><td>{{{telega}}}</td></tr>
   {{/telega}}  
   {{#address}}   
     <tr><td>Адрес </td><td>{{address}}</td></tr>
   {{/address}}   
      
   {{#bonus}}
   <tr><td>Бонусы</td><td>   {{bonus}}</td></tr>
   {{/bonus}}
  {{#dolg}}
   <tr><td>Долг  </td><td>   {{dolg}} <small>(+дебет -кредит)</small></td></tr>
   {{/dolg}}
  {{#disc}}
   <tr><td>Постоянная скидка</td><td>   {{disc}}</td></tr>

   {{/disc}}
   <tr><td>Покупок на  сумму</td><td>   {{sumall}}</td></tr>
   
   {{#comment}}   
   <tr><td colspan="2">Примечание: {{comment}}</td></tr>
   {{/comment}}    
   
   {{#last}}
     <tr><td colspan="2"> Последний документ: {{last}} от {{lastdate}} на сумму  {{lastsum}}. Статус {{laststatus}}</td></tr>
     <tr><td colspan="2"> Последние товары: </td></tr>
     <tr><td colspan="2"> 
         <table      style="font-size:smaller">
            {{#goods}}
             <tr><td >{{itemname}} </td><td class="text-nowrap  ">{{item_code}}</td></tr>
            {{/goods}}
         
         </table>
       </td></tr>
      
      
     
   {{/last}}
   

 </table>