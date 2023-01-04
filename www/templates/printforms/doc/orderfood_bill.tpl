<table class="ctable" border="0" cellpadding="1" cellspacing="0" {{{printw}}}>
    <tr>
        <td colspan="3">Чек {{document_number}}</td>
    </tr>
 
    <tr>

        <td colspan="3">от {{time}}</td>
    </tr>
    <tr>

        <td colspan="2"> {{firm_name}}</td>
    </tr>
    <tr>

        <td colspan="3">ІНН {{inn}}</td>
    </tr>
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

    <tr>
        <td colspan="3">Терминал: {{pos_name}}</td>
    </tr>
    <tr>
        <td colspan="3">Кассир:</td>
    </tr>
    <tr>
        <td colspan="3"> {{username}}</td>
    </tr>


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
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">Скидка:</td>
        <td align="right">{{paydisc}}</td>
    </tr>
    {{/isdisc}}
   {{#delbonus}}
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">Списано бонусов::</td>
        <td align="right">{{delbonus}}</td>
    </tr>
    {{/delbonus}}

    
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">К оплате:</td>
        <td align="right">{{payamount}}</td>
    </tr>
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">Оплата:</td>
        <td align="right">{{payed}}</td>
    </tr>
    <tr style="font-weight: bolder;">
        <td colspan="2" align="right">Сдача:</td>
        <td align="right">{{exchange}}</td>
    </tr>
    {{/prepaid}}
    {{#addbonus}}
    <tr >
        <td colspan="2" align="right">Насчитано бонусов::</td>
        <td align="right">{{addbonus}}</td>
    </tr>
    {{/addbonus}}
    {{#allbonus}}
    <tr >
        <td colspan="2" align="right">Всего бонусов::</td>
        <td align="right">{{allbonus}}</td>
    </tr>
    {{/allbonus}}
    
    <tr style="font-weight: bolder;">
        <td colspan="3"><br>{{checkslogan}}</td>

    </tr>
       <tr>                    
                        <td colspan="3" > 
                            {{{docqrcode}}}
                        </td>

                    </tr>      
</table>