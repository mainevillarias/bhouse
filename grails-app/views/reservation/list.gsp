
<%@ page import="newsystem.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	
		<div id="list-reservation" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="reservationCode" title="${message(code: 'reservation.reservationCode.label', default: 'Reservation Code')}" />
					
						<g:sortableColumn property="dateReserved" title="${message(code: 'reservation.dateReserved.label', default: 'Date Reserved')}" />
					
						<g:sortableColumn property="deadline" title="${message(code: 'reservation.deadline.label', default: 'Deadline')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'reservation.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "reservationCode")}</g:link></td>
					
						<td><g:formatDate date="${reservationInstance.dateReserved}" format="MMM-dd-yyyy"/></td>
					
						<td><g:formatDate date="${reservationInstance.deadline}" format="MMM-dd-yyyy"/></td>
					
						<td>${fieldValue(bean: reservationInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
