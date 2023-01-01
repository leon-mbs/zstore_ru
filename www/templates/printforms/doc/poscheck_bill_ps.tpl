<font bold="true">a</font>
<text>Чек {{document_number}}</text>
<font >a</font>
<text>от {{date}}</text>
<align>left</align>

<text>{{firm_name}}</text>   
<text>ІНН {{inn}}</text>   
<text>{{shopname}}</text>   
  {{#shopname}}
<text>{{shopname}}</text>   
  {{/shopname}}
<text>{{address}}</text>    
 
    {{#customer_name}}
<text>Покупатель: {{customer_name}}</text>    

    {{/customer_name}}
<text>Терминал: {{pos_name}}</text>    
<text>Кассир: {{username}}</text>    

 

<separator>-</separator>
    {{#_detail}}
<text>{{tovar_name}}</text>     
 
 <row>
  <col align="right" length="22" >{{quantity}}</col>
  <col align="right" length="10" >{{amount}}</col>
</row>
 
    {{/_detail}}
<separator>-</separator>
<font bold="true">a</font>

<align>right</align>
<text>Всего: {{total}}</text>
<font >a</font>
 

    {{^prepaid}}
    {{#isdisc}}
<text>Скидка: {{paydisc}}</text>
 
    {{/isdisc}}
   {{#delbonus}}
 <text>Списано бонусiв: {{delbonus}}</text>
 
    {{/delbonus}}

 <text>К оплате: {{payamount}}</text>
 <text>Оплата: {{payed}}</text>
 {{#exchange}}
 <text>Сдача: {{exchange}}</text>
 {{/exchange}} 
    {{/prepaid}}
    
    
        {{#nal}}
 <text>Форма оплаты: нал</text>        

        {{/nal}}
        {{^nal}}
 <text>Форма оплаты: безнал</text>        

        {{/nal}}    
    
        {{#trans}}
 <text>№ транзакции  {{trans}}</text>        
          
        {{/trans}}    
    {{#addbonus}}
 <text>Насчитано бонусов: {{addbonus}}</text>
 
    {{/addbonus}}
    {{#allbonus}}

 <text>Всего бонусов: {{allbonus}}</text>
 
    {{/allbonus}}
    
 
<font bold="true">a</font>
<align>center</align>
<newline ></newline>
<text>  {{checkslogan}}</text>    
{{#docqrcodeurl}}
<font >a</font>
<newline ></newline>
<qrcode type="code128"> {{docqrcodeurl}}</qrcode>
{{/docqrcodeurl}}
<newline ></newline>
 
   