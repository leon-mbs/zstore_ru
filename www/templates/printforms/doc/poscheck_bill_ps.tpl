<font bold="true">a</font>
<text>Чек {{document_number}}</text>
<font >a</font>
<text>от {{date}}</text>
<align>left</align>

    {{#fiscalnumber}}
< 
<text>ФН чека {{fiscalnumber}}</text>
    {{/fiscalnumber}}
 

<text>{{firm_name}}</text> 
{{#inn}}  
<text>ИНН {{inn}}</text>   
{{/inn}}  
{{#tin}}  
<text>ОКПО {{tin}}</text>   
{{/tin}}  
<text>{{shopname}}</text>   
  {{#shopname}}
<text>{{shopname}}</text>   
  {{/shopname}}
<text>{{address}}</text>    
 
    {{#customer_name}}
<text>Покупатель: {{customer_name}}</text>    

    {{/customer_name}}
    
    
    
    
        {{#form1}}
 <text>Форма оплаты: Наличные</text>        
        {{/form1}}
        {{#form2}}
 <text>Форма оплаты: Безнал</text>        
        {{/form2}}    
        {{#form3}}
 <text>Форма оплати: Прочее</text>        
        {{/form3}}    
     
        {{#trans}}
 <text>№ транзакции {{trans}}</text>        
          
        {{/trans}}      
    
<text>Терминал: {{pos_name}}</text>    
<text>Кассир: {{username}}</text>    

 

<separator>-</separator>
    {{#_detail}}
<text>{{tovar_name}}</text>     
 
 <row>
  <col align="right" length="14" >{{quantity}}</col>
  <col align="right" length="8" >{{price}}</col>
  <col align="right" length="10" >{{amount}}</col>
</row>
 
    {{/_detail}}
<separator>-</separator>
<font bold="true">a</font>

<align>right</align>
<text>Всего: {{total}}</text>
<font >a</font>
 

  
    {{#totaldisc}}
<text>Скидка: {{totaldisc}}</text>
 
    {{/totaldisc}}
   {{#delbonus}}
 <text>Списано бонусов: {{delbonus}}</text>
 
    {{/delbonus}}
   {{#prepaid}}
 <text>Предоплата: {{prepaid}}</text>
 
    {{/prepaid}}

 <text>До сплати: {{payamount}}</text>
 <text>Оплата: {{payed}}</text>
 {{#exchange}}
 <text>Сдача: {{exchange}}</text>
 {{/exchange}} 
 

 
        
          
    {{#addbonus}}
 <text>Насчитано бонуслв: {{addbonus}}</text>
 
    {{/addbonus}}
    {{#allbonus}}

 <text>Всего бонусов: {{allbonus}}</text>
 
    {{/allbonus}}
    
{{#promo}}
<text> Промокод {{promo}}</text>  
{{/promo}}  
 
<font bold="true">a</font>
<align>center</align>
<newline ></newline>

{{#checkslogan}}
<text>  {{checkslogan}}</text>
{{/checkslogan}}



 
<newline ></newline>
 
   