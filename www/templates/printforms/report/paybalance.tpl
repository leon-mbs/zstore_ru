<table  class="ctable"  >
 
    <tr style="font-size:larger; font-weight: bolder;">
        <td align="center" colspan="3">
            Доходы и расходы
        </td>
    </tr>
   
    <tr>

        <td align="center" colspan="3">
            Период с {{datefrom}} по {{dateto}} <br>
        </td>
    </tr>
     <tr>
        <td colspan="3">
            <b>Доъоды</b>
        </td>
    </tr>


    {{#_detail}}
    <tr>

        <td>{{type}}</td>

        <td align="right">{{in}}</td>
        <td></td>
    </tr>
    {{#docdet}}
   
    
    <tr>

        <td style="font-size:smaller">&nbsp;&nbsp;{{docdesc}}</td>

        <td style="font-size:smaller" align="right">{{indet}}</td>
       <td></td>
    </tr>   
    {{/docdet}}
    
    {{/_detail}}
    <tr style="font-weight: bolder;">

        <td align="right">Всего:</td>

        <td align="right">{{tin}}</td>
        <td></td>
    </tr>
    <tr>

        <td colspan="3">
            <b>Расходы</b> 
        </td>
    </tr>


    {{#_detail2}}
    <tr>

        <td>{{type}}</td>

        <td align="right">{{out}}</td>
        <td></td>
    </tr>            
    {{#docdet}}
    
    <tr>

        <td style="font-size:smaller">&nbsp;&nbsp;{{docdesc}}</td>

        <td style="font-size:smaller" align="right">{{indet}}</td>
       <td></td>
    </tr>   
    {{/docdet}}    
    
    {{/_detail2}}
    <tr style="font-weight: bolder;">

        <td align="right">Всего:</td>

        <td align="right">{{tout}}</td>
        <td></td>
    </tr>
    <tr style="font-weight: bolder;">

        <td align="right">Баланс:</td>

        <td align="right">{{total}}</td>
        <td></td>
    </tr>

   {{#is3}}    
    
   
     <tr> 
        <td colspan="3"> <br>
            <b>Детализация по ТМЦ </b>
        </td>       
    </tr>    
    
     {{#_detail3}}
    <tr>

        <td>{{type}}</td>

        <td align="right">{{out}}</td>
        <td></td>
    </tr>
     {{/_detail3}}
   {{/is3}}  
   
  {{#isfin}}  
  <tr style="font-weight: bolder;">

        <td> <br>Финансовые показатели</td>

        <td></td>
        <td></td>

    </tr>
    <tr>
        <td>Проход:</td>
        <td align="right"> {{tu}} </td>
        <td>
            <i class="fa fa-info-circle  " data-toggle="tooltip" data-placement="top"
               title="Выручка (отпускная цена на количество) минус затраты основной деятельности (затраты на закупку)"></i>
        </td>
    </tr>
    <tr>
        <td>Переменные  затраты :</td>
        <td align="right"> {{tvc}} </td>
        <td>
            <i class="fa fa-info-circle  " data-toggle="tooltip" data-placement="top"
               title="Затраты основной деятельности"></i>
        </td>
    </tr>
    <tr>
        <td>Операционные затраты:</td>
        <td align="right">{{OP}}  </td>
        <td>
            <i class="fa fa-info-circle  " data-toggle="tooltip" data-placement="top"
               title="Все затраты минус  переменные  затраты "></i>
        </td>
    </tr>
    <tr>
        <td>Чистая прибыль:</td>
        <td align="right"> {{PR}} </td>
        <td>
            <i class="fa fa-info-circle  " data-toggle="tooltip" data-placement="top"
               title="Проход минус операционные расходы (выручка минус все расходы)"></i>
        </td>
    </tr>
   {{#isinv}}   
    <tr>
        <td>Инвестиции:</td>
        <td align="right"> {{inv}} </td>
        <td>
            <i class="fa fa-info-circle  " data-toggle="tooltip" data-placement="top"
               title="ТМЦ на складе и ОС на балансе"></i>
        </td>
    </tr>
    <tr>
        <td>Отдача  от инвестиций (ROI),%:</td>
        <td align="right"> {{ROI}} </td>
        <td>
            <i class="fa fa-info-circle  " data-toggle="tooltip" data-placement="top"
               title="Проход на инвестиции"></i>
        </td>
    </tr>
    {{/isinv}}     
    {{/isfin}}     
</table>


