<table class="ctable" cellspacing="0" cellpadding="1">
    <tr   style="font-weight: bolder;">
        <td colspan="4">
            <h3 style="font-size: 16px;">АВС анализ '{{type}}' с {{from}} по {{to}}</h3>
        </td>
    </tr>
    <tr style="font-weight: bolder;">

        <th   style="border-bottom:1px #000 solid;">Название</th>
        <th   style="border-bottom:1px #000 solid;" align="right">Знач. </th>
        <th   style="border-bottom:1px #000 solid;" align="right">%</th>
        <th   style="border-bottom:1px #000 solid;"></th>
    </tr>
    {{#_detail}}
    <tr>

        <td    >{{name}}</td>
        <td   class="{{color}}" align="right">{{value}} </td>
        <td   class="{{color}}" align="right">{{perc}} </td>
        <td   class="{{color}}">{{group}}</td>

    </tr>
    {{/_detail}}
    <tr>

        <td   align="right"><b>Всего A:</b></td>
        <td   align="right"><b>{{totala}}</b> </td>
        <td   align="right"> </td>
        <td  > </td>

    </tr>
    <tr>

        <td   align="right"><b>Всего B:</b></td>
        <td   align="right"><b>{{totalb}}</b> </td>
        <td   align="right"> </td>
        <td  ></td>

    </tr>
    <tr>

        <td   align="right"><b>Всего C:</b></td>
        <td   align="right"><b>{{totalc}}</b> </td>
        <td   align="right"> &nbsp;</td>
        <td  ></td>

    </tr>
    <tr>

        <td   align="right"><b>Всего:</b></td>
        <td   align="right"><b>{{total}}</b> </td>
        <td   align="right"> &nbsp;</td>
        <td  ></td>

    </tr>

</table>


