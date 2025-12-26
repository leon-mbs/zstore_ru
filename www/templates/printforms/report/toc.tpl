<table class="ctable" cellspacing="0" cellpadding="1">
    <tr    >
        <td align="center" colspan="3">
            <h4  >Ограничения системмы </h4>
        </td>
    </tr>
 
    {{#isdetail1}}
  <tr    >
        <td  colspan="3"  >
            <b  >Актуальность складов  </b>   
        </td>
    </tr>    
 <tr  >
        <td  colspan="3"  >
            <small  > Товары, которых не оказалось на складе на момент заказа </small>   
        </td>
    </tr>  
   <tr>
       
        <th   style="border: solid black 1px"  >Товар </th>
        <th   style="border: solid black 1px"  >Артикул </th>
        <th   style="border: solid black 1px" align="right">На сумму </th>

    </tr>      
    {{#_detail1}}
    <tr>
       
        <td    >{{ name}} </td>
        <td    >{{code}} </td>
        <td    align="right">{{amount}} </td>

    </tr>
    {{/_detail1}}
    
    {{/isdetail1}}
 
 
    {{#isdetail2}}
  <tr    >
        <td  colspan="3"  >
           <br> <b  >Задержка  отправки   </b>   
        </td>
    </tr>    
 <tr  >
        <td  colspan="3"  >
            <small  >Средняя задержка отправки товара по заказу. <br>Для заказов с разницей между датой заказа и отправкой более двух дней   </small>   
        </td>
    </tr>  
   <tr>
       
        <th   style="border: solid black 1px"  >Товар </th>
        <th   style="border: solid black 1px"  >Артикул </th>
        <th   style="border: solid black 1px" align="right">Дни </th>

    </tr>      
    {{#_detail2}}
    <tr>
       
        <td    >{{ name}} </td>
        <td    >{{code}} </td>
        <td    align="right">{{days}} </td>

    </tr>
    {{/_detail2}}
    
    {{/isdetail2}}
    
    
  {{#isdetail3}}
  <tr    >
        <td  colspan="3"  >
           <br> <b  >Задержка поставок   </b>   
        </td>
    </tr>    
 <tr  >
        <td  colspan="3"  >
            <small  >Средняя задержка поставки ТМЦ. Для заявок с разницей между датой создания и с закрытием (создание входного счета или приходной накладной) <br> более двух дней   </small>   
        </td>
    </tr>  
   <tr>
       
        <th   style="border: solid black 1px"  >Товар </th>
        <th   style="border: solid black 1px"  >Артикул </th>
        <th   style="border: solid black 1px" align="right">Дни </th>

    </tr>      
    {{#_detail3}}
    <tr>
       
        <td    >{{ name}} </td>
        <td    >{{code}} </td>
        <td    align="right">{{days}} </td>

    </tr>
    {{/_detail3}}
    
    {{/isdetail3}}    
   
   
  {{#isdetail4}}
  <tr    >
        <td  colspan="3"  >
           <br> <b  > Задержка поставок после оплаты   </b>   
        </td>
    </tr>    
 <tr  >
        <td  colspan="3"  >
            <small  >Средняя задержка поставки ТМЦ после оплаты. Задержка создания приходной накладной – более двух дней после оплаты входящего счета   </small>   
        </td>
    </tr>  
   <tr>
       
        <th colspan="2"  style="border: solid black 1px"  >Поставщик </th>
     
        <th   style="border: solid black 1px" align="right">Дни </th>

    </tr>      
    {{#_detail4}}
    <tr>
       
        <td colspan="2"   >{{ name}} </td>
       
        <td    align="right">{{days}} </td>

    </tr>
    {{/_detail4}}
    
    {{/isdetail4}}    
       
   
    
</table>


