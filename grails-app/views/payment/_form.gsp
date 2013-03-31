<%@ page import="newsystem.Payment" %>



<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'lodger', 'error')} required">
	<label for="lodger">
		<g:message code="payment.lodger.label" default="Lodger" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lodger" name="lodger.id" from="${newsystem.Lodger.list()}" optionKey="id" required="" value="${paymentInstance?.lodger?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentDate', 'error')} required">
	<label for="paymentDate">
		<g:message code="payment.paymentDate.label" default="Payment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="paymentDate" precision="day"  value="${paymentInstance?.paymentDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'orNumber', 'error')} ">
	<label for="orNumber">
		<g:message code="payment.orNumber.label" default="Or Number" />
		
	</label>
	<g:hiddenField name="orNumber" value="${orNumber}"/>${orNumber}
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'balance', 'error')} required">
	<label for="balance">
		<g:message code="payment.balance.label" default="Balance" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="balance" value="${fieldValue(bean: paymentInstance, field: 'balance')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentAmount', 'error')} required">
	<label for="paymentAmount">
		<g:message code="payment.paymentAmount.label" default="Payment Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="paymentAmount" value="${fieldValue(bean: paymentInstance, field: 'paymentAmount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentStatus', 'error')} ">
	<label for="paymentStatus">
		<g:message code="payment.paymentStatus.label" default="Payment Status" />
		
	</label>
	<g:select name="paymentStatus" from="${paymentInstance.constraints.paymentStatus.inList}" value="${paymentInstance?.paymentStatus}" valueMessagePrefix="payment.paymentStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'amountPaid', 'error')} required">
	<label for="amountPaid">
		<g:message code="payment.amountPaid.label" default="Amount Paid" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amountPaid" value="${fieldValue(bean: paymentInstance, field: 'amountPaid')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: paymentInstance, field: 'monthOfPayment', 'error')} required">
	<label for="monthOfPayment">
		<g:message code="payment.monthOfPayment.label" default="Month Of Payment" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="monthOfPayment" precision="day"  value="${paymentInstance?.monthOfPayment}"  />
</div>

