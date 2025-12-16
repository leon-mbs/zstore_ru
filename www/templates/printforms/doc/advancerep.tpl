<table class="ctable" border="0" cellspacing="0" cellpadding="2">
    <tr>
        <td colspan="6" align="center">
            <b> Авансовый отчет № {{document_number}} от {{date}}</b> <br>
        </td>
    </tr>
    {{#isdetail}}
    <tr>
        <td><b>На склад:</b> </td> 
        <td colspan="5">
             {{to}}
        </td>
    </tr>

   {{#storeemp}}
    <tr>
         <td><b>На сотрудника:</b> </td> 
       <td colspan="5">
             {{storeemp}}
        </td>
    </tr>
 
    {{/storeemp}}    
     {{/isdetail}} 
    <tr>
          <td><b>От сотрудника:</b> </td> 
      <td colspan="5">
             {{emp}}
        </td>
    </tr>
    {{#examount}}
    <tr>
         <td><b>Сумма возврата:</b> </td> 
       <td colspan="5">
             {{examount}}
        </td>
    </tr>
   {{/examount}}  
  {{#spentamount}}
    <tr>
         <td><b>Сумма затрат:</b> </td> 
       <td colspan="5">
             {{spentamount}}
        </td>
    </tr>
   <tr>
         <td><b>Тип затрат:</b> </td> 
       <td colspan="5">
             {{spenttypename}}
        </td>
    </tr>
   {{/spentamount}}  

    {{#isdetail}}  
    <tr style="font-weight: bolder;">
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Наименование</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Код</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;"></th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Ед.</th>


        <th align="right" width="50px" style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Кол.</th>
        <th align="right" width="50px" style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Цена</th>
        <th align="right" width="50px" style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Сумма</th>

    </tr>
    {{#_detail}}
    <tr>

        <td>{{item_name}}</td>
        <td>{{item_code}}</td>

        <td align="right">{{snumber}}</td>
        <td>{{msr}}</td>
        <td align="right">{{quantity}}</td>
        <td align="right">{{price}}</td>
        <td align="right">{{amount}}</td>

    </tr>
    {{/_detail}}
    <tr style="font-weight: bolder;">
        <td style="border-top:1px #000 solid;" colspan="6" align="right">На сумму:</td>
        <td style="border-top:1px #000 solid;" align="right">{{total}}</td>
    </tr>
    
    {{/isdetail}}  
    
    
    <tr>
        <td colspan="6">
            {{{notes}}}
        </td>

    </tr>
</table>



