
<%@ page import="newsystem.Payment" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css2', file: 'admin.css')}" type="text/css">
		
		
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title>Payment OR</title>
		<center><h1>Official Receipt</h1><br><br><br>
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
					
					<td>P<g:fieldValue bean="${paymentInstance}" field="balance"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentAmount}">
				<tr>
					<td>Total Amount</td>
					
					<td>P<g:fieldValue bean="${paymentInstance}" field="paymentAmount"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.paymentStatus}">
				<tr>
					<td>Payment Type</td>
					
					<td><g:fieldValue bean="${paymentInstance}" field="paymentStatus"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.amountPaid}">
				<tr>
					<td><g:message code="payment.amountPaid.label" default="Amount Paid" /></td>
					
					<td>P<g:fieldValue bean="${paymentInstance}" field="amountPaid"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${paymentInstance?.monthOfPayment}">
				<tr>
					<td><g:message code="payment.monthOfPayment.label" default="Month Of Payment" /></td>
					
					<td><g:formatDate date="${paymentInstance?.monthOfPayment}" format="MMM-yyyy" /></td>
					
				</tr>
				</g:if>
				
				
				<tr> 
				<td>Balance:</td> 
					<td>P${balance}</td>
				</tr>	
			

			</table>
</center>
<style type="text/css" media="print">

	div {
	display:none;
	}
	.printable {
	display:block;
	}

</style>
		
	</head>
	<body>


		<div class="center">


			</div>
		
		<div>
			<fieldset class="buttons">
			<form>
			
			
			<g:link class="" action="show" controller="Lodger" params="['id':lodgerInstance.id]">Back to ${lodgerInstance.firstName}'s profile</g:link>
			<input type="button"  class="buttons" value="Print OR" onClick="window.print()"/>
				
			</form>
		
			
			</fieldset>
		</div>

		
		
	</body>
</html>
