<table class="ctable" border="0" cellspacing="0" cellpadding="2">
          
        <tr> <td colspan="3">Заказ {{document_number}}</td>  </tr>
       <tr>  <td colspan="3"> Время {{time}} &nbsp;&nbsp;&nbsp;&nbsp;Стол {{table}}</td>  </tr>
        {{#detail}}
       <tr>  <td  >   {{itemname}} </td><td> {{qty}}</td><td>  <small> {{myself}} </small> </td> </tr>
        {{/detail}} 
   <tr>  <td colspan="3">   {{notes}}</td>  </tr>
            
    </tr>
    </table>