<table class="ctable" border="0" cellspacing="0" cellpadding="2">
    <tr>
        <td colspan="4" align="center">
            <b> Доходный ордер № {{document_number}} от {{date}}</b> <br>
        </td>
    </tr>


    <tr>
        <td colspan="4">
            <b>На счет:</b> {{to}}
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <b>Сумма:</b> {{amount}}
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <b>Тип дохода:</b> {{type}}
        </td>
    </tr>

    {{#customer}}
    <tr>
        <td colspan="4">
            <b>Контрагент:</b> {{customer}}
        </td>
    </tr>
    {{/customer}}
    {{#contract}}
    <tr>
        <td colspan="4">
            <b>Договор:</b> {{contract}}
        </td>
    </tr>
    {{/contract}}
    {{#emp}}
    <tr>
        <td colspan="4">
            <b>Сотрудник:</b> {{emp}}
        </td>
    </tr>
    {{/emp}}
    <tr>
        <td colspan="4">
            {{{notes}}}
        </td>
    </tr>


</table>


