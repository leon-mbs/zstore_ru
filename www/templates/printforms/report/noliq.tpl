<table class="ctable" border="0"   cellpadding="2" cellspacing="0">

    <tr style="font-size:larger; font-weight: bolder;">
        <td align="center" colspan="8">
            Нелтквидные товары
        </td>
    </tr>
 
    <tr style="font-weight: bolder;">


        <th style="border: solid black 1px"> Наименование</th>

        <th style="border: solid black 1px">Код</th>
        <th style="border: solid black 1px">Категория</th>
        <th style="border: solid black 1px">Бренд</th>
        <th style="border: solid black 1px">Склад</th>
        <th style="border: solid black 1px">Ячейка</th>
        <th align="right" style="border: solid black 1px">Цена</th>
        <th align="right" style="border: solid black 1px">На складе</th>


    </tr>
    {{#_detail}}
    <tr>


        <td>{{itemname}}</td>
        <td>{{item_code}}</td>
        <td>{{cat_name}}</td>
        <td>{{brand}}</td>
        <td>{{store}}</td>
        <td>{{cell}}</td>

        <td align="right">{{price}}</td>
        <td align="right">{{qty}}</td>


    </tr>
    {{/_detail}}


  

</table>
<br>  

