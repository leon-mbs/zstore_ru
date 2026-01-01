<table class="ctable"  >
    <tr>
        <td colspan="6">
            Исполнитель: {{customer_name}}
        </td>


    </tr>
    {{#isfirm}}
    <tr>
        <td colspan="6">
          Заказчик: {{firm_name}}
        </td>

    </tr>
    {{/isfirm}}
    {{#iscontract}}
    <tr>
        <td colspan="6">
            Договор: {{contract}} от {{createdon}}
        </td>

    </tr>
    {{/iscontract}}

 
   <tr>
        <td colspan="6">{{{notes}}}</td>
    </tr>
    
    <tr style="font-weight: bolder;">
        <td colspan="6" align="center">
            Полученые услуги № {{document_number}} от {{date}}
        </td>
    </tr>

</table>
<br>
<table class="ctable" width="600" cellspacing="0" cellpadding="1" border="0">
    <tr style="font-weight: bolder;">
        <th width="20" style="border: 1px solid black;">№</th>
        <th style="border: 1px solid black;">Наименование</th>
        <th style="border: 1px solid black;">Описание</th>
        <th style="border: 1px solid black;" align="right">Кол.</th>
        <th style="border: 1px solid black;" align="right">Стоимость</th>
        <th style="border: 1px solid black;" align="right">Сумма</th>
 
         
     
    </tr>
    {{#_detail}}
    <tr>
        <td valign="top">{{no}}</td>
        <td valign="top">{{service_name}}</td>

        <td  valign="top">{{desc}}</td>

        <td valign="top" align="right">{{qty}}</td>
        <td valign="top" align="right">{{price}}</td>
        <td valign="top" align="right">{{amount}}</td>
 

    </tr>
    {{/_detail}}
    <tr style="font-weight: bolder;">
        <td colspan="5" style="border-top: 1px solid black;" align="right">Всего:</td>
        <td style="border-top: 1px solid black;" align="right">{{total}}</td>
    </tr>
   {{#payamount}}
    <tr style="font-weight: bolder;">
        <td colspan="5" align="right">К оплате:</td>
        <td align="right">{{payamount}}</td>
    </tr>
    {{/payamount}} 
   {{#payed}}  
    <tr style="font-weight: bolder;">
        <td colspan="5" align="right">Оплата:</td>
        <td align="right">{{payed}}</td>
    </tr>
     {{/payed}}  
    <tr>
        <td colspan="6"><br>
              {{notes}}
        </td>
    </tr>
   {{#hasitems}}
    <tr style="font-weight: bolder;">
        <th width="20" style="border: 1px solid black;">№</th>
        <th style="border: 1px solid black;">Наименование</th>
        <th style="border: 1px solid black;">Код</th>
        <th style="border: 1px solid black;" align="right">Кол.</th>
        <th style="border: 1px solid black;" align="right">Цена</th>
        <th style="border: 1px solid black;" align="right">Сумма</th>
 
         
     
    </tr>
    {{#_detail2}}
    <tr>
        <td valign="top">{{no}}</td>
        <td valign="top">{{itemname}}</td>

        <td  valign="top">{{item_code}}</td>

        <td valign="top" align="right">{{qty}}</td>
        <td valign="top" align="right">{{price}}</td>
        <td valign="top" align="right">{{amount}}</td>
 

    </tr>
    {{/_detail2}}   
   
    <tr style="font-weight: bolder;">
        <td colspan="5" align="right">Всего:</td>
        <td align="right">{{stotal}}</td>
    </tr>   
   {{/hasitems}}
</table>


