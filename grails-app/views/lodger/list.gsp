
<%@ page import="newsystem.Lodger" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'lodger.label', default: 'Lodger')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>			
			
			<center><font color="green"><big><g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if></font></big></center>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	
		
		<div id="list-lodger" class="content scaffold-list" role="main">


			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'lodger.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'lodger.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="phonenumber" title="${message(code: 'lodger.phonenumber.label', default: 'Phonenumber')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'lodger.status.label', default: 'Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lodgerInstanceList}" status="i" var="lodgerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lodgerInstance.id}">${fieldValue(bean: lodgerInstance, field: "firstName")} ${fieldValue(bean: lodgerInstance, field: "middleName")} ${fieldValue(bean: lodgerInstance, field: "lastName")}</g:link></td>
					
					
						<td>${fieldValue(bean: lodgerInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: lodgerInstance, field: "phonenumber")}</td>
						
						<td>${fieldValue(bean: lodgerInstance, field: "status")}</td>
				
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lodgerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
