<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="layout" content="main" />
		<title>Log in</title>
	</head>

	<body>
		<div class="body">
		<div align="center">
			<h2>This page is restricted for system administrator only.</h2>
		</div>
			<h3>Please log in</h3>
				<g:if test="${flash.message}">
					<div class="message">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${race}">
					<div class="errors">
					<g:renderErrors bean="${account}" as="list" />
					</div>
				</g:hasErrors>
				<g:form controller="account" method="post" >
					<div class="dialog" align="center">
						<table>
							<tr class='prop'>
								<td valign='top' class='name'>
								<center>	<label for='accountId'>Account ID:</label></center>
								</td>
								<td valign='top' class='value '>
									<input type="text" maxlength='8'
										name='accountId'
										value='${account?.accountId}'>
									</input>
								</td>
							</tr>
							<tr class='prop'>
								<td valign='top' class='name'>
								<center>	<label for='password'>Password:</label></center>
								</td>
								<td valign='top' class='value '>
									<input type="password" maxlength='8'
									name='password'
									value='${account?.password}'>
									</input>
								
								</td>
							</tr>
						</table>
					</div>
					<div class="buttons" align="center">
						<span class="button">
							<g:actionSubmit value="Log in" />
							
						</span>
					</div>
			</g:form>
</div>
</body>
</html>