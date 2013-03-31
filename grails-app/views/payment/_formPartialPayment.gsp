<%@ page import="newsystem.Payment" %>

<table>

<tr>
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'lodger', 'error')} required">
	<td><label for="lodger">
		<g:message code="payment.lodger.label" default="Lodger" />
		<span class="required-indicator"></span>
	</label></td>
	<!--<g:select id="lodger" name="lodger.id" from="${newsystem.Lodger.list()}" optionKey="id" required="" value="${paymentInstance?.lodger?.id}" class="many-to-one"/>-->
	<td><g:hiddenField name="lodger.id" value="${lodgerInstance.id}"/>${lodgerInstance.firstName} ${lodgerInstance.middleName} ${lodgerInstance.lastName}</td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'orNumber', 'error')} ">
	<td><label for="orNumber">
		<g:message code="payment.orNumber.label" default="Or Number" />
		
	</label></td>
	<td><g:hiddenField name="orNumber" value="${orNumber}"/>${orNumber}</td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'balance', 'error')} required">
	<td><label for="balance">
		Previous Balance
		<span class="required-indicator"></span>
	</label></td>
	<!--<g:field name="balance" value="${fieldValue(bean: paymentInstance, field: 'balance')}" required=""/>-->
	<td><g:hiddenField name="balance" value="${lodgerInstance.previousBalance}"/>${lodgerInstance.previousBalance}</td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentAmount', 'error')} required">
	<td><label for="paymentAmount">
		Total Payment
		<span class="required-indicator"></span>
	</label></td>
	<td><g:hiddenField name="paymentAmount" value="${totalBill}"/>${totalBill}</td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentStatus', 'error')} ">
	<td><label for="paymentStatus">
		Payment Type
	</label></td>
	
	<td><g:hiddenField name="paymentStatus" value="${paymentStatus}"/>${paymentStatus}</td>
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amountPaid', 'error')} required">
	<td><label for="amountPaid">
		<g:message code="payment.amountPaid.label" default="Amount Paid" />
		<span class="required-indicator">*</span>
	</label></td>
	<td><g:field name="amountPaid" value="${fieldValue(bean: paymentInstance, field: 'amountPaid')}" required=""/></td>
	<!--<g:hiddenField name="amountPaid" value="${totalBill}" />${totalBill}-->
</div>
</tr>

<tr>
<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'monthOfPayment', 'error')} required">
	<td><label for="monthOfPayment">
		<g:message code="payment.monthOfPayment.label" default="Month Of Payment" />
	</label></td>
	<td><g:datePicker name="monthOfPayment" precision="month"  value="${paymentInstance?.monthOfPayment}"  /></td>
</div>
</tr>
</table>
