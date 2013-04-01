
<%@ page import="newsystem.Room" %>
<!DOCTYPE html>
<html>

	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>		
	
		<div id="list-room" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="roomName" title="${message(code: 'room.roomName.label', default: 'Room Name')}" />
					
						<g:sortableColumn property="lodgerType" title="${message(code: 'room.lodgerType.label', default: 'Lodger Type')}" />
					
						<g:sortableColumn property="roomRate" title="${message(code: 'room.roomRate.label', default: 'Room Rate')}" />
					
						<g:sortableColumn property="vacancyStatus" title="${message(code: 'room.vacancyStatus.label', default: 'Vacancy Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${roomInstanceList}" status="i" var="roomInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${roomInstance.id}">${fieldValue(bean: roomInstance, field: "roomName")}</g:link></td>
					
						
						<td>${fieldValue(bean: roomInstance, field: "lodgerType")}</td>
					
						<td>${fieldValue(bean: roomInstance, field: "roomRate")}</td>
					
						<td>${fieldValue(bean: roomInstance, field: "vacancyStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			
				<fieldset class="buttons">
				<div align="left">
				<g:link action="viewAvailableRooms">View Available Rooms</g:link>
				<g:link class="" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				
				</div>
				</fieldset>
			
			
			<div class="pagination">
				<g:paginate total="${roomInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
