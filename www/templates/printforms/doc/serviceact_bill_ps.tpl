<align>center</align>
<font bold="true">a</font>
<text>
   {{#isfinished}}  Акт выполненых работ {{/isfinished}} 
          {{^isfinished}}  Квитанция к {{/isfinished}} 
         {{document_number}}
</text>
<font >a</font>
<text>от {{date}}</text>
<align>left</align>
<text> {{firmname}}</text>
    {{#shopname}}
<text> {{shopname}}</text>
    {{/shopname}}
<text> {{address}}</text>    
<text>Тел. {{phone}}</text>    
<text> {{customer_name}}</text>    

    {{#isdevice}}
<text>Принято от клиента:</text>       
<text>{{device}}</text>       
<text>с/н {{serial}}</text>       
    {{/isdevice}}
    {{#iswork}}
<text>Работы:</text>       
    {{#slist}}

<row>
  <col length="22" >{{service_name}}</col>
  <col align="right" length="10" >{{amount}}</col>
</row>
    {{/slist}}

   {{/iswork}}  
  
    {{#isitems}}
<text>Комплектующие:</text>       
 
    {{#ilist}}
 
<row>
  <col length="22" >{{itemname}}</col>
  <col align="right" length="10" >{{amount}}</col>
</row>
    
    {{/ilist}}
    {{/isitems}}
   
    {{#istotal}}
<align>right</align>
<text>Всего: {{total}}</text>
    {{/istotal}}


    {{#ispay}}
<align>left</align> 
<text>Оплаты:</text>  
 
    {{#plist}}
    
<row>
  <col length="22" >{{pdate}}</col>
  <col align="right" length="10" >{{ppay}}</col>
</row>    
    
 

    {{/plist}}
    {{/ispay}}
   
<text>{{gar}}</text>      
 <newline ></newline>   
 <text>Исполнитель ________</text>  
 <newline ></newline>  
 <text>Клиент ________</text>  
 <newline ></newline>  
 