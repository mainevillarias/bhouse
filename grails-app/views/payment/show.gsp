
<%@ page import="newsystem.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	
		
		<div align="" class="nav">
		<small><small><small><small>
			<p class="button-style"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
				</small></small></small></small>
		</div>
		<div id="show-payment" class="content scaffold-show" role="main">
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			
				<g:if test="${paymentInstance?.lodger}">
				<tr>
					<td><g:message code="payment.lodger.label" default="Lodger" /></td>
					
					<td><g:link controller="lodger" action="show" id="${paymentInstance?.lodger?.id}">${paymentInstance?.lodger?.encodeAsHTML()}</g:link></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentDate}">
				<tr>
					<td><g:message code="payment.paymentDate.label" default="Payment Date" /></td>
					
					<td><g:formatDate date="${paymentInstance?.paymentDate}" format="MMM-dd-yyyy"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.orNumber}">
				<tr>
					<td><g:message code="payment.orNumber.label" default="Or Number" /></td>
					
					<td><g:fieldValue bean="${paymentInstance}" field="orNumber"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.balance}">
				<tr>
					<td>Previous Balance</td>
					
					<td><g:fieldValue bean="${paymentInstance}" field="balance"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentAmount}">
				<tr>
					<td>Total Payment</td>
					
					<td><g:fieldValue bean="${paymentInstance}" field="paymentAmount"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentStatus}">
				<tr>
					<td><g:message code="payment.paymentStatus.label" default="Payment Status" /></td>
					
					<td><g:fieldValue bean="${paymentInstance}" field="paymentStatus"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.amountPaid}">
				<tr>
					<td><g:message code="payment.amountPaid.label" default="Amount Paid" /></td>
					
					<td><g:fieldValue bean="${paymentInstance}" field="amountPaid"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.monthOfPayment}">
				<tr>
					<td><g:message code="payment.monthOfPayment.label" default="Month Of Payment" /></td>
					
					<td><g:formatDate date="${paymentInstance?.monthOfPayment}" format="MMM-yyyy"/></td>
					
				</tr>
				</g:if>
			
			</table>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${paymentInstance?.id}" />
					<g:link class="" action="edit" id="${paymentInstance?.id}">Edit Payment</g:link>
				</fieldset>
			</g:form>
		</div>
		
		
			
	</body>
</html>
