<font bold="true">a</font>
    {{#ischeck}}
<text>Чек {{document_number}}</text>
    {{/ischeck}}
    {{^ischeck}}
<text>Счет {{document_number}}</text>
    {{/ischeck}}
    
<font >a</font>
<text>от {{date}}</text>
<align>left</align>

    {{#fiscalnumber}}
<text>Фискальный чек</text>
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
    
   {{#ischeck}}    
   
    
        {{#form1}}
 <text>Форма оплаты: наличные</text>        
        {{/form1}}
        {{#form2}}
 <text>Форма оплаты: безнал</text>        
        {{/form2}}    
 
        {{#trans}}
 <text>№ транзакци  {{trans}}</text>        
          
        {{/trans}}     
<text>Кассир: {{username}}</text>    
   {{/ischeck}}
 

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
<text>Скидка: {{totaldisc}}</text>
 
    {{/isdisc}}
   {{#bonus}}
 <text>Списано бонусов: {{bonus}}</text>
 
    {{/bonus}}

 <text>К оплате: {{payamount}}</text>
 
    {{#ischeck}} 
 
 <text>Оплата: {{payed}}</text>
 {{#exchange}}
 <text>Сдача: {{exchange}}</text>
 {{/exchange}} 
 
    {{/ischeck}} 
     
    {{/prepaid}}
    {{#addbonus}}
 <text>Насчитано: {{addbonus}}</text>
 
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
 