<table class="ctable" border="0"  >

    <tr>
        <td align="center" colspan="4">
            <h4> Отчет по производству </h4>
        </td>
    </tr>
    <tr>

        <td colspan="4">
            Период с <b>{{datefrom}}</b> по <b>{{dateto}}</b> <br>
        </td>
    </tr>
    {{#parea}}
    <tr>

        <td colspan="4">
            Производственный участок <b>{{parea}}</b><br>
        </td>
    </tr>
    {{/parea}}
    <tr>

        <td colspan="4">
            <h5> Списано на производство </h5>
        </td>
    </tr>

    <tr style="font-weight: bolder;">


        <th style="border: solid black 1px">Наименование</th>

        <th style="border: solid black 1px">Код</th>
        <th align="right" style="border: solid black 1px">Кол.</th>


        <th align="right" style="border: solid black 1px">Сумма</th>
       </tr>
        {{#_detail}}
    <tr>


        <td>{{name}}</td>

        <td align="right">{{code}}</td>
        <td align="right">{{qty}}</td>


        <td align="right">{{summa}}</td>

    </tr>
    {{/_detail}}
    <tr>

        <td align="right" colspan="3">
            <b> На суму </b>
        </td>
        <td align="right"><b>{{sum1}}</b></td>
    </tr>

    <tr>

        <td colspan="4"><br>
            <h5> Оприходовано с  производства </h5>
        </td>
    </tr>

    <tr style="font-weight: bolder;">


        <th style="border: solid black 1px">Наименование</th>

        <th style="border: solid black 1px">Код</th>
        <th align="right" style="border: solid black 1px">Кол.</th>


        <th align="right" style="border: solid black 1px">Сумма</th>
      </tr>
        {{#_detail2}}
    <tr>


        <td>{{name}}</td>

        <td align="right">{{code}}</td>
        <td align="right">{{qty}}</td>


        <td align="right">{{summa}}</td>

    </tr>
    {{/_detail2}}
    <tr>

        <td align="right" colspan="3">
            <b> На суму </b>
        </td>
        <td align="right"><b>{{sum2}}</b></td>
    </tr>
    
   {{#ismove}}
      <tr>

        <td colspan="4">
            <h5> Перемещено между этапами </h5>
        </td>
    </tr>

    <tr style="font-weight: bolder;">


        <th style="border: solid black 1px">Наименование</th>

        <th style="border: solid black 1px">Код</th>
        <th   align="right" style="border: solid black 1px">Кол.</th>
        <th   align="right" style="border: solid black 1px"> </th>

 
       </tr>
        {{#_detail4}}
     <tr>


        <td>{{name}}</td>

        <td align="right">{{code}}</td>
        <td   align="right">{{qty}}</td>
        <td   align="right"> </td>
  

    </tr>
    {{/_detail4}}
    {{/ismove}}    
    
    
    
    <tr>

        <td colspan="4"><br>
            <h5> Готово к производству </h5>
             Состоянием на <b> {{currdate}} </b>
             <br><small>Полуфабрикаты и готовая продукция, которые могут быть изготовлены по комплектам. 
                    Если материал или комплектующие входят в несколько позиций, будут показаны все варианты.
              </small>
        </td>
    </tr>

    <tr style="font-weight: bolder;">


        <th style="border: solid black 1px">Наименование</th>

        <th style="border: solid black 1px">Код</th>
        <th colspan="2" align="right" style="border: solid black 1px">Кол.</th>

    </tr>


        {{#_detail3}}
    <tr>


        <td>{{name}}</td>

        <td align="right">{{code}}</td>
        <td colspan="2" align="right">{{qty}}</td>




    </tr>
    {{/_detail3}}

</table>


