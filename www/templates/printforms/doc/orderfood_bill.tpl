<table class="ctable" border="0" cellpadding="1" cellspacing="0" {{{printw}}}>
    {{#ischeck}}
    <tr>
        <td colspan="3">Чек {{document_number}}</td>
    </tr>
    {{/ischeck}}    
    {{^ischeck}}
    <tr>
        <td colspan="3">Счет {{document_number}}</td>
    </tr>
    {{/ischeck}}    
    
    {{#fiscalnumber}}
    <tr>
        <td colspan="3">Фискальный чек</td>
    </tr>
    <tr>
        <td colspan="3">ФН чека {{fiscalnumber}}</td>
    </tr>
    {{/fiscalnumber}}
 
    <tr>

        <td colspan="3">от {{time}}</td>
    </tr>
    <tr>

        <td colspan="3"> {{firm_name}}</td>
    </tr>
  {{#inn}}
    <tr>

        <td colspan="3">ИНН {{inn}}</td>
    </tr>
 {{/inn}} 
 {{#tin}}
    <tr>

        <td colspan="3">ОКПО {{tin}}</td>
    </tr>
 {{/tin}} 
    {{#shopname}}
    <tr>
        <td colspan="3"> {{shopname}}</td>
    </tr>
    {{/shopname}}

    <tr>

        <td colspan="3"> {{address}}</td>
    </tr>
    <tr>
        <td colspan="3"> {{phone}}</td>
    </tr>
    {{#customer_name}}
    <tr>
        <td colspan="3"> Покупатель:</td>
    </tr>
    <tr>
        <td colspan="3"> {{customer_name}}</td>
    </tr>

    {{/customer_name}}

    {{#ischeck}}
      <tr>
       <td colspan="3">
      {{#form1}}
          Форма оплаты: наличные
        {{/form1}}
        {{#form2}}
          Форма оплаты: безнал
        {{/form2}}    
    
    </td>
    </tr>    
    
  
   {{#trans}}
    <tr>
       <td colspan="3" > 
          № транзакции:  {{trans}}
       </td>
    </tr> 
  {{/trans}}    
    <tr>
        <td colspan="3">Терминал: {{pos_name}}</td>
    </tr>
    <tr>
        <td colspan="3">Кассир: {{username}}</td>
    </tr>
    {{/ischeck}}


    {{#_detail}}
    <tr>
        <td colspan="3">{{tovar_name}}</td>

    </tr>


    <tr>

        <td colspan="2" align="right">{{quantity}}</td>
        <td align="right">{{amount}}</td>
    </tr>
    {{/_detail}}
    <tr>
        <td colspan="2" align="right">Всего:</td>
        <td align="right">{{total}}</td>
    </tr>

    {{^prepaid}}
    {{#isdisc}}
    <tr  >
        <td colspan="2" align="right">Скидка:</td>
        <td align="right">{{totaldisc}}</td>
    </tr>
    {{/isdisc}}
   {{#bonus}}
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">Списано бонусов::</td>
        <td align="right">{{bonus}}</td>
    </tr>
    {{/bonus}}

    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">К оплате:</td>
        <td style="font-size:larger" align="right">{{payamount}}</td>
    </tr>
    
    {{#ischeck}}    
    
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">Оплата:</td>
        <td align="right">{{payed}}</td>
    </tr>
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">Сдача:</td>
        <td align="right">{{exchange}}</td>
    </tr>
    {{/ischeck}}
    
    {{/prepaid}}
    {{#addbonus}}
    <tr >
        <td colspan="2" align="right">Насчитано бонусов:</td>
        <td align="right">{{addbonus}}</td>
    </tr>
    {{/addbonus}}
    {{#allbonus}}
    <tr >
        <td colspan="2" align="right">Всего бонусов:</td>
        <td align="right">{{allbonus}}</td>
    </tr>
    {{/allbonus}}
    
    {{#promo}}   
    <tr style="font-weight: bolder;">
        <td colspan="3">Промокод {{promo}}</td>

    </tr>
   {{/promo}}   
   {{#checkslogan}}   
    <tr style="font-weight: bolder;">
        <td colspan="3"><br>{{checkslogan}}</td>

    </tr>
   {{/checkslogan}}   

                      
                    
</table>