<table class="ctable" border="0" cellspacing="0" cellpadding="2">


    <tr>
        <td></td>
        <td><b>Поставщик</b></td>
        <td colspan="6">{{customer_name}}</td>
    </tr>
    {{#isfirm}}
    <tr>
        <td></td>

        <td valign="top"><b>Покупатель</b></td>
        <td colspan="6">{{firm_name}}</td>

    </tr>
    {{/isfirm}}
    {{#iscontract}}
    <tr>

        <td></td>

        <td valign="top"><b>Договор</b></td>
        <td colspan="6">{{contract}} от {{createdon}}</td>


    </tr>
    {{/iscontract}}
   {{#outnumber}}
    <tr>
        <td></td>

        <td valign="top"><b>Внеш. номер</b></td>
        <td colspan="6">{{outnumber}}</td>

    </tr>
    {{/outnumber}}
    <tr>
        <td></td>

        <td valign="top"><b>Склад</b></td>
        <td colspan="6">{{storename}}</td>

    </tr>
    
    <tr>
        <td></td>
        <td><b>Основание</b></td>
        <td colspan="6">{{basedoc}}</td>
    </tr>
    <tr>
        <td colspan="9">{{{notes}}}</td>
    </tr>
    
     {{#isval}}
    <tr style="font-weight: bolder;">
       <td></td>
        <td><b>Валюта</b></td>
        <td colspan="6">{{valname}}   ({{rate}})</td>
        
        
    </tr>
    {{/isval}}    
    <tr>
        <td style="font-weight: bolder;font-size: larger;" align="center" colspan="6" valign="middle">
            <br> Накладная № {{document_number}} от {{date}} <br><br>
        </td>
    </tr>

    <tr style="font-weight: bolder;">
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;" width="30">№</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Наименование</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Артикул</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Штрих-код</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;"></th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Ед.</th>

        <th style="text-align: right;border-top:1px #000 solid;border-bottom:1px #000 solid;" width="50">Кол.</th>
        <th style="text-align: right;border-top:1px #000 solid;border-bottom:1px #000 solid;" width="60">Цена</th>
        <th style="text-align: right;border-top:1px #000 solid;border-bottom:1px #000 solid;" width="80">Сумма</th>
    </tr>
    {{#_detail}}
    <tr>
        <td align="right">{{no}}</td>
        <td>{{itemname}}</td>
        <td>{{itemcode}}</td>
        <td>{{barcode}}</td>
        <td align="right">{{snumber}}</td>
        <td>{{msr}}</td>

        <td align="right">{{quantity}}</td>
        <td align="right">{{price}}</td>
        <td align="right">{{amount}}</td>
    </tr>
    {{/_detail}}
    <tr style="font-weight: bolder;">
        <td style="border-top:1px #000 solid;" colspan="8" align="right">На сумму:</td>
        <td style="border-top:1px #000 solid;" align="right">{{total}}</td>
    </tr>
 
    {{#isdisc}}
    <tr style="font-weight: bolder;">
        <td colspan="8" align="right">Скидка:</td>
        <td align="right">{{disc}}</td>
    </tr>
    {{/isdisc}}
    {{#isnds}}
    <tr style="font-weight: bolder;">
        <td colspan="8" align="right">НДС:</td>
        <td align="right">{{nds}}</td>
    </tr>
    {{/isnds}}
   {{#delivery}}
    <tr style="font-weight: bolder;">
        <td colspan="8" align="right">Доставка:</td>
        <td align="right">{{delivery}}</td>
    </tr>
    {{/delivery}}
 
   {{#payamount}}
    <tr style="font-weight: bolder;">
        <td colspan="8" align="right">Всего:</td>
        <td align="right">{{payamount}}</td>
    </tr>
    {{/payamount}} 
  
     {{#isprep}}  
    <tr style="font-weight: bolder;">
        <td colspan="8" align="right">Предоплата:</td>
        <td align="right">{{prepaid}}</td>
    </tr>
     {{/isprep}}    
  
   {{#payed}}  
    <tr style="font-weight: bolder;">
        <td colspan="8" align="right">Оплата:</td>
        <td align="right">{{payed}}</td>
    </tr>
     {{/payed}}  

     
</table>

