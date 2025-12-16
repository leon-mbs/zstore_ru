<table class="ctable" border="0" cellspacing="0" cellpadding="2"  >

     {{#customer_name}}
    <tr>
        <td></td>
        <td valign="top"><b>Покупатель</b></td>
 
        <td colspan="6"> {{customer_name}}</b> 
          {{#phone}} Тел. {{phone}}  {{/phone}} 
        </td>
    </tr>
      {{/customer_name}} 
      
  
 
   {{#edrpou}}
    <tr>
        <td></td>
        <td valign="top">ОКПО</td>
        <td colspan="6">{{edrpou}}</td>
    </tr>
     {{/edrpou}}       
      
      {{#iscustaddress}}
    
      <tr>
        <td></td>
        <td valign="top">Адрес</td>
        <td colspan="6">{{custaddress}}</td>
    </tr>    
    {{/iscustaddress}}      
      
      
    {{#isfirm}}
    <tr>
        <td></td>

        <td valign="top"><b>Продавец</b></td>
       <td colspan="6"> {{firm_name}} 
        {{#fphone}} Тел.  {{fphone}}  {{/fphone}} 
          
        </td>

    </tr>
   {{#fedrpou}}
    <tr>
        <td></td>
        <td valign="top">ОКПО</td>
        <td colspan="6">{{fedrpou}}</td>
    </tr>
     {{/fedrpou}}  
    {{#finn}}
    <tr>
        <td></td>
        <td valign="top">МНН</td>
        <td colspan="6">{{finn}}</td>
    </tr>
     {{/finn}}           
   
      
    {{/isfirm}}
    {{#isfop}}
    <tr>

        <td></td>
        <td><b> Продавец</b></td>
        <td colspan="7"> {{fop_name}} </td>

    </tr> 
    <tr>
        <td></td>
        <td valign="top">ОКПО</td>
        <td colspan="7">{{fop_edrpou}}</td>
    </tr>       
   {{/isfop}}    
   
     <tr>
        <td></td>
        <td valign="top">Адрес</td>
        <td colspan="7">{{address}}</td>
    </tr>      
    {{#isbank}}
    <tr>

        <td></td>
        <td> р/р</td>
        <td colspan="8">{{bankacc}}    {{bank}}</td>

    </tr>
    {{/isbank}}  
     {{#iban}}
    <tr>

        <td></td>
        <td> IBAN</td>
        <td colspan="8">{{iban}}   </td>

    </tr>
    {{/iban}}     
    {{#iscontract}}
    <tr>

        <td></td>

        <td valign="top"><b>Договор</b></td>
        <td colspan="6">{{contract}} от {{createdon}}</td>


    </tr>
    {{/iscontract}}
    
    <tr>
        <td></td>
        <td valign="top"><br>Списано с</td>
        <td colspan="6"><br>{{store_name}}</td>
    </tr>
 
    {{#order}}
    <tr>
        <td></td>
        <td><b>Заказ</b></td>
        <td colspan="6">{{order}}</td>
    </tr>
    {{/order}}
    <tr>
        <td colspan="8">{{{notes}}}</td>
    </tr>


    <tr>
        <td style="font-weight: bolder;font-size: larger;" align="center" colspan="8" valign="middle">
            Расходная накладная № {{document_number}} от {{date}} <br>
        </td>
    </tr>

    <tr style="font-weight: bolder;">
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;" width="30">№</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;text-align: left;">Наименование</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;text-align: left;">Код</th>
        <th style="border-top:1px #000 solid;border-bottom:1px #000 solid;">Ед.</th>

        <th style="text-align: right;border-top:1px #000 solid;border-bottom:1px #000 solid;"  >Кол.</th>
        <th style="text-align: right;border-top:1px #000 solid;border-bottom:1px #000 solid;"  >Ск. %</th>
        <th style="text-align: right;border-top:1px #000 solid;border-bottom:1px #000 solid;"  >Цена  {{#nds}} (без НДС)  {{/nds}}</th>
        <th style="text-align: right;border-top:1px #000 solid;border-bottom:1px #000 solid;"  >Сумма</th>
    </tr>
    {{#_detail}}
    <tr>
        <td align="right">{{no}}</td>
        <td>{{tovar_name}}</td>
        <td>{{tovar_code}}</td>
        <td>{{msr}}</td>

        <td align="right">{{quantity}}</td>
        <td align="right">{{disc}}</td>
        <td align="right">{{price}}  {{#nds}} ({{pricenonds}})  {{/nds}} </td>
        <td align="right">{{amount}}</td>
    </tr>
    {{/_detail}}
    <tr style="font-weight: bolder;">
        <td style="border-top:1px #000 solid;" colspan="2">{{weight}}</td>

        <td style="border-top:1px #000 solid;" colspan="5" align="right">На сумму:</td>
        <td style="border-top:1px #000 solid;" align="right">{{total}}</td>
    </tr>

    {{#totaldisc}}
    <tr style="font-weight: bolder;">
        <td colspan="7" align="right">Скидка:</td>
        <td align="right">{{totaldisc}}</td>
    </tr>
    {{/totaldisc}}
   {{#nds}}
    <tr style="font-weight: bolder;">
        <td colspan="7" align="right">В т.ч. НДС:</td>
        <td align="right">{{nds}}</td>
    </tr>
    {{/nds}}

   {{#payamount}}
    <tr style="font-weight: bolder;">
        <td colspan="7" align="right">Всего:</td>
        <td align="right">{{payamount}}</td>
    </tr>
    {{/payamount}} 
     {{#isprep}}  
    <tr style="font-weight: bolder;">
        <td colspan="7" align="right">Предоплата:</td>
        <td align="right">{{prepaid}}</td>
    </tr>
     {{/isprep}}      
   {{#payed}}  
    <tr style="font-weight: bolder;">
        <td colspan="7" align="right">Оплата:</td>
        <td align="right">{{payed}}</td>
    </tr>
     {{/payed}}  
       {{#payamount}}
   
   {{#totalstr}}
    <tr>
        <td colspan="8">На сумму <b>{{totalstr}}</b></td>
   </tr>
   {{/totalstr}}                    

              {{/payamount}} 
                    <tr>
                        <td colspan="4" > 
                            Продавец ___________
                        </td>
                        <td colspan="4"> 
                            Покупатель ___________
                        </td>

                    </tr>
                    <tr>
                        <td> </td>
                        <td colspan="7">
                            {{#isstamp}}
                            <img style="height:100px;" src="{{stamp}}"/>
                            {{/isstamp}}

                            {{^isstamp}}
                        
                            <br><br>
                            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    &nbsp; М.П.
                            <br><br>
                            {{/isstamp}}
                        </td>


                    </tr>
          
              
                          
                    </table>

