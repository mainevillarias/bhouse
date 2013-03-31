
<%@ page import="newsystem.Payment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		
	<div class="nav" role="navigation">
			<ul>
				<g:link class="" action="show" controller="Lodger" params="['id':lodgerInstance.id]">Back to ${lodgerInstance.firstName}'s profile</g:link>
			
				</ul>
		</div>
		<div id="list-payment" class="content scaffold-list" role="main">
			<h1>${lodgerInstance.lastName}, ${lodgerInstance.firstName} ${lodgerInstance.middleName} payment list</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="orNumber" title="${message(code: 'payment.orNumber.label', default: 'Or Number')}" />
					
						<g:sortableColumn property="paymentDate" title="${message(code: 'payment.paymentDate.label', default: 'Payment Date')}" />
						
						<g:sortableColumn property="paymentAmount" title="${message(code: 'payment.paymentAmount.label', default: 'Payment Amount')}" />
					
						<g:sortableColumn property="paymentStatus" title="${message(code: 'payment.paymentStatus.label', default: 'Payment Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${paymentInstanceList}" status="i" var="paymentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${paymentInstance.id}">${fieldValue(bean: paymentInstance, field: "orNumber")}</g:link></td>
					
						<td><g:formatDate date="${paymentInstance.paymentDate}" format="MMM-dd-yyyy"/></td>
					
						<td>${fieldValue(bean: paymentInstance, field: "paymentAmount")}</td>
					
						<td>${fieldValue(bean: paymentInstance, field: "paymentStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<!--
			<div class="pagination">
				<g:paginate total="${paymentInstanceTotal}" controller="payment" action="showLodgersPayment" params="[id:lodgerInstance.id]"/>
			</div>
			-->
		</div>
	</body>
</html>
