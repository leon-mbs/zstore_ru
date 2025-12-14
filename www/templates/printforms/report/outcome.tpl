<table class="ctable" border="0" cellpadding="2" cellspacing="0">


    <tr>

        <td align="center" colspan="6">
            Период с {{datefrom}} по {{dateto}} <br> <br>
        </td>
    </tr>
    {{#_type1}}
    <tr style="font-size:larger; font-weight: bolder;">
        <td align="center" colspan="5">
            Продажи по товарам <br><br>
        </td>
    </tr>
    <tr style="font-weight: bolder;">
        <th align="center" style="border: solid black 1px">Док.</th>
        <th style="border: solid black 1px">Наименование</th>
        <th style="border: solid black 1px">Код</th>

        <th align="right" style="border: solid black 1px">Кол.</th>
        <th align="right" style="border: solid black 1px">На сумму</th>
      {{^noshowpartion}}
        <th align="right" style="border: solid black 1px">Прибыль</th>
        <th align="right" style="border: solid black 1px">Приб.,%</th>
      {{/noshowpartion}}


    </tr>
    {{#_detail}}
    <tr>


        <td align="right">{{docs}}</td>
        <td>{{name}}</td>
        <td>{{code}}</td>

        <td align="right">{{qty}}</td>
        <td align="right">{{summa}}</td>

      {{^noshowpartion}}


        {{#navarsign}}
        <td align="right">{{navar}}</td>
        {{/navarsign}}
        {{^navarsign}}
        <td align="right" style="color:red">{{navar}}</td>
        {{/navarsign}}
        <td align="right" >{{navarproc}}</td>
      {{/noshowpartion}}


    </tr>
    {{/_detail}}
    <tr><td colspan="4"></td><td align="right" ><b>{{totsumma}}</b></td>
      {{^noshowpartion}}

    <td align="right" ><b>{{totnavar}}</b></td> 
    <td align="right" ><b>{{totnavarproc}}</b></td> 
      {{/noshowpartion}}
    
 
    </tr>

</table>
{{/_type1}}
{{#_type2}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по покупателямы <br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">
    <th align="center"  style="border: solid black 1px">Док.</th>
    <th colspan="3" style="border: solid black 1px">Наименование</th>


    <th align="right" style="border: solid black 1px; ">На сумму</th>
    
        {{^noshowpartion}}

    <th align="right" style="border: solid black 1px">Прибыль</th>
    <th align="right" style="border: solid black 1px">Приб.,%</th>
    {{/noshowpartion}}

    <th></th>    
</tr>
{{#_detail}}
<tr>
        <td>{{docs}}</td>


    <td colspan="3">{{name}}</td>


    <td align="right">{{summa}}</td>
    {{^noshowpartion}}
    
    <td align="right">{{navar}}</td>
        <td align="right" >{{navarproc}}</td>
    {{/noshowpartion}}
    
    <td></td>  
</tr>
{{/_detail}}
<tr><td colspan="4"></td><td align="right" ><b>{{totsumma}}</b></td>
    {{^noshowpartion}}

<td align="right" ><b>{{totnavar}}</b> </td> 
<td align="right" ><b>{{totnavarproc}}</b> </td> 

    {{/noshowpartion}}

</tr>

</table>
{{/_type2}}
{{#_type3}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по датам <br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">
     <th align="center"  style="border: solid black 1px">Док.</th>
   <th style="border: solid black 1px;width:120px;">Дата</th>

    <th align="right" style="border: solid black 1px;width:100px;">На сумму</th>
    <th></th>
    <th></th>
    <th></th>

</tr>
{{#_detail}}
<tr>
         <td align="right">{{docs}}</td>


    <td>{{dt}}</td>


    <td align="right">{{summa}}</td>
    <td></td>
    <td></td>
    <td></td>

</tr>
{{/_detail}}
<tr><td colspan="3" align="right" ><b>{{totsumma}}</b></td> <td   > </td><td   > </td><td   > </td> </tr>

</table>
{{/_type3}}
{{#_type4}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Услуги и работы <br><br>
    </td>
</tr>
<tr style="font-weight: bolder;">
     <th align="center"  style="border: solid black 1px">Док.</th>
   <th style="border: solid black 1px">Наименование</th>


    <th align="right" style="border: solid black 1px; ">На сумму</th>
    <th align="right" style="border: solid black 1px; ">Прибыль</th>
    <th align="right" style="border: solid black 1px; ">Приб.,%</th>
   
    <th></th>
</tr>
{{#_detail}}
<tr>
        <td align="right">{{docs}}</td>
        <td align="right">{{name}}</td>


 

    <td align="right">{{summa}}</td>
    <td align="right">{{navar}}</td>
    <td align="right">{{navarproc}}</td>
 
    <td></td>
</tr>
{{/_detail}}
 <tr><td colspan="2"></td>
 <td align="right" ><b>{{totsumma}}</b></td>
   

    <td align="right" ><b>{{totnavar}}</b></td> 
    <td align="right" ><b>{{totnavarproc}}</b></td> 
    <td></td>   
    
 
</table>
{{/_type4}}

{{#_type5}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по  категориях <br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">
     <th align="center"  style="border: solid black 1px">Док.</th>
   <th colspan="3" style="border: solid black 1px">Наименование</th>


    <th align="right" style="border: solid black 1px; ">На сумму</th>
 
     {{^noshowpartion}}

    <th align="right" style="border: solid black 1px">Прибыль</th>
    <th align="right" style="border: solid black 1px">Приб.,%</th>
    {{/noshowpartion}}

    <th></th>
</tr>
{{#_detail}}
<tr>
        <td align="right">{{docs}}</td>


    <td colspan="3">{{name}}</td>


    <td align="right">{{summa}}</td>
      {{^noshowpartion}}

  <td align="right">{{navar}}</td>
        <td align="right" >{{navarproc}}</td>
  
    {{/noshowpartion}}
  
    <td></td>
</tr>
{{/_detail}}
<tr><td colspan="4" ></td> <td align="right" ><b>{{totsumma}}</b></td> 
    {{^noshowpartion}}

<td align="right"   > <b>{{totnavar}}</b></td>
<td align="right"   > <b>{{totnavarproc}}</b></td>
    {{/noshowpartion}}

 </tr>

</table>
{{/_type5}}     

{{#_type6}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по  компаниямы <br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">
      <th align="center"  style="border: solid black 1px">Док.</th>
  <th colspan="3" style="border: solid black 1px">Наименование</th>


    <th align="right" style="border: solid black 1px; ">На суму</th>
      {{^noshowpartion}}

    <th align="right" style="border: solid black 1px">Прибыль</th>
    <th align="right" style="border: solid black 1px">Приб.,%</th>
    {{/noshowpartion}}

    <th></th>
</tr>
{{#_detail}}
<tr>

       <td align="right">{{docs}}</td>

    <td colspan="3">{{name}}</td>


    <td align="right">{{summa}}</td>
     {{^noshowpartion}}

   <td align="right">{{navar}}</td>
        <td align="right"  >{{navarproc}}</td>
   
    {{/noshowpartion}}
   
    <td></td>
</tr>
{{/_detail}}
<tr><td colspan="4" ></td> <td align="right" ><b>{{totsumma}}</b></td>
    {{^noshowpartion}}

 <td align="right"   > <b>{{totnavar}}</b></td>
 <td align="right"   > <b>{{totnavarproc}}</b></td>
    {{/noshowpartion}}
 

  </tr>

</table>
{{/_type6}}     

{{#_type7}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по складам <br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">
     <th align="center"  style="border: solid black 1px">Док.</th>
   <th colspan="3" style="border: solid black 1px">Наименование</th>


    <th align="right" style="border: solid black 1px; ">На сумму</th>
     {{^noshowpartion}}

   <th align="right" style="border: solid black 1px">Прибыль</th>
   <th align="right" style="border: solid black 1px">Приб.,%</th>
    {{/noshowpartion}}

    <th></th>
</tr>
{{#_detail}}
<tr>

         <td align="right">{{docs}}</td>

    <td colspan="3">{{name}}</td>


    <td align="right">{{summa}}</td>
      {{^noshowpartion}}

  <td align="right">{{navar}}</td>
        <td align="right" >{{navarproc}}</td>
  
    {{/noshowpartion}}
  
    <td></td>
</tr>
{{/_detail}}
<tr><td colspan="4" ></td> <td align="right" ><b>{{totsumma}}</b></td>
     {{^noshowpartion}}

 <td align="right"   > <b>{{totnavar}}</b></td>
 <td align="right"   > <b>{{totnavarproc}}</b></td>
    {{/noshowpartion}}
 
 </tr>

</table>
{{/_type7}}     
{{#_type8}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по источникам <br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">
    <th align="center"  style="border: solid black 1px">Док.</th>
    <th colspan="2" style="border: solid black 1px">Наименование</th>

         <th align="right" style="border: solid black 1px">Кол.</th>

    <th align="right" style="border: solid black 1px; ">На сумму</th>
      {{^noshowpartion}}

    <th align="right" style="border: solid black 1px">Прибыль</th>
    <th align="right" style="border: solid black 1px">Приб.,%</th>
    {{/noshowpartion}}

    
</tr>
{{#_detail}}
<tr>
        <td align="right">{{docs}}</td>


    <td colspan="2">{{name}}</td>


    <td align="right">{{qty}}</td>
    <td align="right">{{summa}}</td>
      {{^noshowpartion}}

  <td align="right">{{navar}}</td>
        <td align="right" >{{navarproc}}</td>
  
    {{/noshowpartion}}
     
</tr>
{{/_detail}}
<tr><td colspan="4" ></td> <td align="right" ><b>{{totsumma}}</b></td> 
    {{^noshowpartion}}

    <td align="right"   > <b>{{totnavar}}</b></td>
    <td align="right"   > <b>{{totnavarproc}}</b></td>
    {{/noshowpartion}}

   </tr>

</table>
{{/_type8}}     
{{#_type12}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по брендам  {{brand}}<br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">
     <th align="center"  style="border: solid black 1px">Док.</th>
   <th colspan="2" style="border: solid black 1px">Наименование</th>

          <th align="right" style="border: solid black 1px">Кол.</th>

    <th align="right" style="border: solid black 1px; ">На сумму</th>
      {{^noshowpartion}}

  <th align="right" style="border: solid black 1px">Прибыыль</th>
  <th align="right" style="border: solid black 1px">Приб.,%</th>
    {{/noshowpartion}}

  
</tr>
{{#_detail}}
<tr>
        <td align="right">{{docs}}</td>


    <td colspan="2">{{name}}</td>


    <td align="right">{{qty}}</td>
    <td align="right">{{summa}}</td>
    {{^noshowpartion}}

    <td align="right">{{navar}}</td>
        <td align="right" >{{navarproc}}</td>
    
    {{/noshowpartion}}
    
</tr>
{{/_detail}}
<tr><td colspan="4" ></td> <td align="right" ><b>{{totsumma}}</b></td> 
    {{^noshowpartion}}
<td align="right"   > <b>{{totnavar}}</b></td>
<td align="right"   > <b>{{totnavarproc}}</b></td>
    {{/noshowpartion}}

  </tr>

</table>
{{/_type12}}
{{#_type13}}
<tr style="font-size:larger; font-weight: bolder;">
    <td align="center" colspan="5">
        Продажи по  поставщикам <br> <br>
    </td>
</tr>
<tr style="font-weight: bolder;">

    <th colspan="4" style="border: solid black 1px">Наименование</th>


    <th align="right" style="border: solid black 1px; ">На сумму</th>
    
        {{^noshowpartion}}

    <th align="right" style="border: solid black 1px">Прибыль</th>
    <th align="right" style="border: solid black 1px">Приб.,%</th>
    {{/noshowpartion}}

    <th></th>    
</tr>
{{#_detail}}
<tr>
   


    <td colspan="4">{{name}}</td>


    <td align="right">{{summa}}</td>
    {{^noshowpartion}}
    
    <td align="right">{{navar}}</td>
        <td align="right" >{{navarproc}}</td>
    {{/noshowpartion}}
    
    <td></td>  
</tr>
{{/_detail}}
<tr><td colspan="4"></td><td align="right" ><b>{{totsumma}}</b></td>
    {{^noshowpartion}}

<td align="right" ><b>{{totnavar}}</b> </td> 
<td align="right" ><b>{{totnavarproc}}</b> </td> 

    {{/noshowpartion}}

</tr>

</table>
{{/_type13}}