<table class="ctable" border="0" cellpadding="2" cellspacing="0">
    <tr>
        <td colspan="5">
            Заказчик: {{customer_name}}
        </td>


    </tr>
    {{#isfirm}}
    <tr>
        <td colspan="5">
            Исполнитель: {{firm_name}}
        </td>

    </tr>
    {{/isfirm}}
    {{#iscontract}}
    <tr>
        <td colspan="5">
            Договор: {{contract}} от {{createdon}}
        </td>

    </tr>
    {{/iscontract}}

    {{#isdevice}}
    <tr>
        <td colspan="5">
            Изделие, материалы: {{device}} с/н: {{devsn}}
        </td>

    </tr>
    {{/isdevice}}
    <tr style="font-weight: bolder;">
        <td colspan="5" align="center">
           
          {{#isfinished}}  Акт выполненных работ {{/isfinished}} 
          {{^isfinished}}  Квитанция к {{/isfinished}} 
           № {{document_number}} от {{date}}
        </td>
    </tr>

</table>
<br>
<table class="ctable" width="600" cellspacing="0" cellpadding="1" border="0">
    <tr style="font-weight: bolder;">
        <th width="20" style="border: 1px solid black;">№</th>
        <th style="border: 1px solid black;">Наименование</th>
        <th style="border: 1px solid black;"> </th>
        <th style="border: 1px solid black;" align="right">Стоимость</th>
        <th style="border: 1px solid black;" align="right">Сумма</th>

    </tr>
    {{#_detail}}
    <tr>
        <td>{{no}}</td>
        <td>{{service_name}}</td>

        <td>{{desc}}</td>

        <td align="right">{{price}}</td>
        <td align="right">{{amount}}</td>

    </tr>
    {{/_detail}}
    <tr style="font-weight: bolder;">
        <td colspan="4" style="border-top: 1px solid black;" align="right">Всего:</td>
        <td style="border-top: 1px solid black;" align="right">{{total}}</td>
    </tr>
    {{#isdisc}}
    <tr style="font-weight: bolder;">
        <td colspan="4" align="right">Скидка:</td>
        <td align="right">{{paydisc}}</td>
    </tr>
    {{/isdisc}}    
   {{#payamount}}
    <tr style="font-weight: bolder;">
        <td colspan="4" align="right">К оплате:</td>
        <td align="right">{{payamount}}</td>
    </tr>
    {{/payamount}} 
   {{#payed}}  
    <tr style="font-weight: bolder;">
        <td colspan="4" align="right">Оплата:</td>
        <td align="right">{{payed}}</td>
    </tr>
     {{/payed}}  
    <tr>
        <td colspan="5"><br>
            Гарантия: {{gar}}
        </td>
    </tr>
    <tr>
        <td colspan="5">{{{notes}}}</td>
    </tr>

</table>


