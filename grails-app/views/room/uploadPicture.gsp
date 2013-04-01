<%@ page import="newsystem.Room" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="layout">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title>Upload Room Picture</title>
		
	</head>
	<body>
		<h1>Upload Room Picture</h1>
	

		<div id="create-room" class="nav">
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${roomInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${roomInstance}" var="error">
				<li><g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
				
				<div class="buttons">
					Picture Upload
						<g:form action="upload_picture" method="post" enctype="multipart/form-data">
							<g:hiddenField name="id" value="${roomInstance?.id}" />
					
							<label for="picture">Picture (2MB)</label>
								<input type="file" name="picture" id="picture" />
								<div style="font-size:0.8em; margin: 1.0em;">
								For best results, your avatar should have a width-to-height ratio of 4:5.
								For example, if your image is 80 pixels wide, it should be 100 pixels high.
								</div>
								<input type="submit" class="buttons" value="Upload" />
						</g:form>
				
				</div>
			
		</div>
		<p class="button-style"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></p>
	</body>
</html>
