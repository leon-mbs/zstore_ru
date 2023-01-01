<align>center</align>
<font bold="true">a</font>
<text>Накладная {{document_number}}</text>
<font >a</font>
<text>от {{date}}</text>
<align>left</align>
<text>Продавец: {{firm_name}}</text>
<text>Тел. {{phone}}</text>
<text>Покупатель: {{customer_name}}</text>
<separator>-</separator>
 {{#_detail}}
 <text>{{tovar_name}}</text>
<row>
  <col align="right" length="12" >{{quantity}}</col>
  <col align="right" length="10" >{{price}}</col>
  <col align="right" length="10" >{{amount}}</col>
</row>
{{/_detail}}
<font bold="true">a</font>
<separator>-</separator>
<align>right</align>
<text>Всего: {{total}}</text>
<newline ></newline>
