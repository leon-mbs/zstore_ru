<table class="ctable" border="0" cellpadding="2" cellspacing="0">
    <tr>
        <td colspan="5">
            Исполнитель: {{customer_name}}
        </td>


    </tr>
    {{#isfirm}}
    <tr>
        <td colspan="5">
          Заказчик: {{firm_name}}
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
   <tr>
        <td colspan="5">{{{notes}}}</td>
    </tr>
    
    <tr style="font-weight: bolder;">
        <td colspan="5" align="center">
            Полученные услуги № {{document_number}} от {{date}}
        </td>
    </tr>

</table>
<br>
<table class="ctable" width="600" cellspacing="0" cellpadding="1" border="0">
    <tr style="font-weight: bolder;">
        <th width="20" style="border: 1px solid black;">№</th>
        <th style="border: 1px solid black;">Наименование</th>
        <th style="border: 1px solid black;">Описание</th>
        <th style="border: 1px solid black;" align="right">Стоимость</th>
        <th style="border: 1px solid black;" align="right">Сумма</th>
        {{#hasitems}}
        <th style="border: 1px solid black;" align="right">ТМЦ</th>
            
        {{/hasitems}}
    </tr>
    {{#_detail}}
    <tr>
        <td valign="top">{{no}}</td>
        <td valign="top">{{service_name}}</td>

        <td  valign="top">{{desc}}</td>

        <td valign="top" align="right">{{price}}</td>
        <td valign="top" align="right">{{amount}}</td>
         {{#hasitems}}  
           <td  > 
           <table style="font-size:smaller"  >
               <tr> <td >Наименование</td>
                <td align="right">&nbsp;Кол.&nbsp;</td>
                <td align="right">Цена</td></tr>
             {{#items}}
               <tr> <td  >{{itemname}}</td>
                <td align="right">{{qty}}</td>
                <td align="right">{{price}}</td>
                </tr>
             {{/items}}
             </table>
           </td>
         {{/hasitems}}

    </tr>
    {{/_detail}}
    <tr style="font-weight: bolder;">
        <td colspan="4" style="border-top: 1px solid black;" align="right">Всего:</td>
        <td style="border-top: 1px solid black;" align="right">{{total}}</td>
    </tr>
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

</table>


