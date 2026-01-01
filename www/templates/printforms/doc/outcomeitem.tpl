<table class="ctable" border="0" cellspacing="0" cellpadding="2">
    <tr>
        <td colspan="6" align="center">
            <b>Списание ТМЦ № {{document_number}} от {{date}}</b> <br>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <b> Со склада:</b> {{from}}
        </td>

    </tr>
   {{#storeemp}}
    <tr>
        <td colspan="6">
            <b>С сотрудника:</b> {{storeemp}}
        </td>
    </tr>
 
    {{/storeemp}}       
    <tr>
        <td colspan="6">{{{notes}}}</td>
    </tr>


    <tr style="font-weight: bolder;">

        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Назва</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Код</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;"></th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Ед.</th>


        <th align="right"   style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Кол.</th>
        <th align="right"   style="border-top:1px #000 solid;border-bottom:1px #000 solid;">На сумму</th>

    </tr>
    {{#_detail}}
    <tr>

        <td>{{item_name}}</td>
        <td>{{item_code}}</td>

        <td align="right">{{snumber}}</td>
        <td>{{msr}}</td>
        <td align="right">{{quantity}}</td>
        <td align="right">{{sum}}</td>

    </tr>
    {{/_detail}}
    <tr>
        <td align="right" colspan="5"><b>Всего:</b></td>
          <td align="right">{{amount}}</td>
    </tr>   
</table>



