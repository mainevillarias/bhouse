
<%@ page import="newsystem.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reservation.label', default: 'Reservation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}" type="text/css">
	
	</head>
	<body>

		<div class="center">
		<div id="list-reservation" class="content scaffold-list" role="main">
			<h1>Reservation</h1>
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
					
						<td><g:link action="showPUBLIC" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "reservationCode")}</g:link></td>
					
						<td><g:formatDate date="${reservationInstance.dateReserved}" format="MMM-dd-yyyy"/></td>
					
						<td><g:formatDate date="${reservationInstance.deadline}" format="MMM-dd-yyyy"/></td>
					
						<td>${fieldValue(bean: reservationInstance, field: "status")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		
		</div>
		</div>
	</body>
</html>
