<table class="ctable" border="0" cellspacing="0" cellpadding="2">
    <tr>
        <td colspan="4" align="center">
            <b> {{opname}} № {{document_number}} от {{document_date}}</b> <br>
        </td>
    </tr>
  
 
    <tr>
        <td colspan="2">
            <b>Наименование:</b> {{eqname}}
        </td>
        <td colspan="2">
            <b>Инв. номер:</b> {{invnumber}}
        </td>
   </tr> 
 

   {{#isamount }}
    <tr>
        <td colspan="4">
          <b>Сумма:</b>   {{amount }}
        </td>
    </tr>
   {{/isamount }}   
   {{#iscust }}
    <tr>
        <td colspan="4">
          <b>Контрагент:</b>   {{customer_name }}  
        </td>
    </tr>
   {{/iscust }}   
 
    <tr>
        <td colspan="4">
          {{#ispa}}
          <b>Производственный участок:</b>   {{item_name}}   &nbsp;&nbsp;&nbsp;&nbsp;
          {{/ispa}} 
           {{#isemp}}
            <b>Ответственный</b> {{store_name}}
          {{/isemp}} 
        </td>
    </tr>
   {{#isitem }}  
    <tr>
        <td colspan="4">
          <b>ТМЦ:</b>   {{item_name}}   <b>Склад</b> {{store_name}}
        </td>
 </tr>        
  {{/isitem }}     
    <tr>
        <td colspan="4">
            {{{notes}}}
        </td>
    </tr>
     

    <tr>    
        <td colspan="4" > 
        <br>    Подпись ___________
        </td>
        

    </tr>

</table>


