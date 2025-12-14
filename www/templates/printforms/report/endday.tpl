<table class="ctable" border="0"   cellpadding="2" cellspacing="0">

    <tr style="font-size:larger; font-weight: bolder;">
        <td align="center" colspan="5">
            Конец   дня  {{date}}
        </td>
    </tr>
   <tr style="  font-weight: bolder;">
        <td   colspan="5">
            По пользователях
        </td>
    </tr>
 
    <tr style="font-weight: bolder;">


        <th style="border: solid black 1px"> Iм'я</th>

        <th colspan="2" style="border: solid black 1px">Счет</th>
        <th  align="right" style="border: solid black 1px">Приход</th>
        <th  align="right" style="border: solid black 1px">Расход</th>
        


    </tr>
    {{#_detail}}
    <tr>


        <td>{{username}}</td>
        <td colspan="2">{{mf_name}}</td>
        <td  align="right" >{{dt}}</td>
        <td  align="right" >{{ct}}</td>
         
       


    </tr>
    {{/_detail}}
    
    {{#showmf}}
    <tr style="  font-weight: bolder;">
        <td   colspan="5">
            По денежных счетах
        </td>
    </tr>

    <tr style="font-weight: bolder;">


        <th   style="border: solid black 1px"> Счет

        <th align="right"  style="border: solid black 1px">Начало
        <th align="right"  style="border: solid black 1px">Приход
        <th align="right"  style="border: solid black 1px">Расход
        <th align="right" style="border: solid black 1px">Конец
     
        


    </tr>
    {{#_detail2}}
    <tr>


        <td  >{{mf_name}}</td>
        <td align="right" >{{b}}</td>
        <td align="right" >{{dt}}</td>
        <td align="right" >{{ct}}</td>
        <td align="right" >{{e}}</td>

     
   


    </tr>
    {{/_detail2}}  
  {{/showmf}}
</table>
<br> 

