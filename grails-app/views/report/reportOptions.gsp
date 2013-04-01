<%@ page import="newsystem.Payment"%>
<!doctype html>
<html>
	<head>
		
		<meta name="layout" content="layout">
		<title>Report Options</title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'admin.css')}" type="text/css">
	</head>
	<body>

		<div class="center" align="center">
		<br>
			<h1>&nbsp; Report Options</h1>
					<center>Choose Report</center>
				<table>
				
				<fieldset class="button-style" >
						<div>
							<g:link action="monthlyReport" controller="Report" class="">
							Monthly Reports
							</g:link>
						</div>
						<br>
						<div>
							<g:link action="lodgersWithBalance" controller="Report" class="">
							Lodgers With Balance
							</g:link>
						</div>
						<br>
						<div>
							<g:link action="monthlyReportRange" controller="Report" class="">
							Monthly Reports (Range)
							</g:link>
						</div>
						<br>
						<div>
							<g:link action="lodgersWithNoMonthPayment" controller="Report" class="">
							Lodgers With No Month Payment
							</g:link>
						</div>
				
			
					
				</fieldset>
				
			
				</table>
				
		</div>
	</body>
</html>
