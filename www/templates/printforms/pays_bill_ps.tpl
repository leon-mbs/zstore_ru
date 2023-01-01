<align>center</align>
<font bold="true">a</font>
<text>Квитанция об  оплате</text>
<newline ></newline>
<font >a</font>
<align>left</align>
<text>Основание {{document_number}}</text>
<text>{{firm_name}}</text>
<text>{{customer_name}}</text>
<text>Оплаты:</text>
{{#plist}}
<row>
  <col length="22">{{pdate}}</col><col align="right" length="10" >{{ppay}}</col>
</row>
{{/plist}}
<font bold="true">a</font>
<align>right</align>
<text>Всего: {{pall}}</text>
<newline ></newline>

 


 