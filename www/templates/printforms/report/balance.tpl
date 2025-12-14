<table  class="ctable"  >
 
    <tr style="font-size:larger; font-weight: bolder;">
        <td align="center" colspan="2">
            Управленческий  баланс
        </td>
    </tr>
  
    <tr>

        <td align="center" colspan="2">
            На {{datefrom}}  <br>
        </td>
    </tr>
 
 
   <tr>

        <td colspan="2">            <b>Активы</b>         </td>
    </tr>
    {{#amat}}
    <tr>
        <td > Материалы и комплектующие        </td>
        <td align="right"> {{amat}}  </td>
    </tr>
    {{/amat}}
   
    {{#aprod}}    
    <tr>
        <td > Полуфабрикаты и готовая продукция        </td>
        <td align="right">  {{aprod}}      </td>
    </tr>
    {{/aprod}} 
    {{#ambp}}      
    <tr>
        <td >   МБП        </td>
        <td align="right">     {{ambp}}               </td>
    </tr>
    {{/ambp}}   

    {{#aitem}}                 
    <tr>
        <td >Товары        </td>
        <td align="right">    {{aitem}}      </td>
    </tr>
    {{/aitem}}                 
    {{#aother}}                 
    <tr>
        <td >  Прочие ТМЦ    </td>
        <td align="right">     {{aother}}     </td>
    </tr>
    {{/aother}}                     
    {{#anal}}                 
    <tr>
        <td >  Наличные        </td>
        <td align="right">   {{anal}}                        </td>
    </tr>
    {{/anal}}                     
    {{#abnal}}                 
    <tr>
        <td >  Безнал        </td>
        <td align="right">  {{abnal}}   </td>
    </tr>
    {{/abnal}}                     
    {{#debet}}
    <tr>  
        <td >Долг  контрагентов       </td>
        <td align="right">     {{debet}}              </td>
    </tr>
    {{/debet}} 
    {{#aemp}}                 
    <tr>
        <td >  Сотрудники (выданные  авансы и пр.)        </td>
        <td align="right">        {{aemp}}             </td>
    </tr>
    {{/aemp}}                 
   {{#aeq}}                 
    <tr>
        <td >  Балансовая стоимость ОС        </td>
        <td align="right">        {{aeq}}             </td>
    </tr>
    {{/aeq}}                 
    
    {{#aprodrest}}                 
    <tr>
        <td >  Незавершенное производство       </td>
        <td align="right">        {{aprodrest}}             </td>
    </tr>
    {{/aprodrest}}                 
    
    
     <tr style="font-weight: bolder;">
        <td align="right">Всего:</td>
        <td align="right">{{atotal}}</td>
    </tr>   
    
   <tr>
        <td colspan="2">     <b>Пассивы</b>        </td>    </tr>

    {{#credit}}
    <tr>  
        <td >  Долг  контрагентам       </td>
        <td align="right">     {{credit}}              </td>
    </tr>
    {{/credit}} 
 
    {{#pemp}}                 
    <tr>
        <td >  Сотрудники (зарплата к выдаче  и  пр.)        </td>
        <td align="right">    {{pemp}}               </td>
    </tr>
     {{/pemp}}

     <tr style="font-weight: bolder;">
        <td align="right">Всего:</td>
        <td align="right">{{ptotal}}</td>
    </tr>   
     <tr >
        <td ></td>
        <td ></td>
    </tr>   
     <tr style=";font-weight: bolder;">
        <td align="right">Баланс:</td>
        <td align="right">{{bal}}</td>
    </tr>   
    
</table>


