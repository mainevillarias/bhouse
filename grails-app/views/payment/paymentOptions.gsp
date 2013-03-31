<%@ page import="newsystem.Payment"%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="layout">
		<title>Payment Options</title>
	</head>
	<body>


		<div align="center">
			<h1>&nbsp; Payment Options</h1>
					<center>Choose type of Payment</center><br>
				<table>
				
				<div class="buttons" role="navigation">
					
						<div>
							<g:link action="createFullPayment" controller="Payment" class="buttons" params="['lodgerId': lodgerInstance.id]">
							Full Payment
							</g:link>
						</div>
						<br>
						<div>
							<g:link action="createPartialPayment" controller="Payment" class="buttons" params="['lodgerId': lodgerInstance.id]">
								Partial Payment
							</g:link>
						</div>
						
			
					
				</div>
				
			
				</table>
				
		</div>
	</body>
</html>
