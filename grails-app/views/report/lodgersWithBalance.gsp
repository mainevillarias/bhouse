
<!doctype html>
<html>
	<head>
		<meta name="layout" content="layout">
		<title>Lodger Report</title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'admin.css')}" type="text/css">
	</head>
	<body>
		<div class="center" align="center">
		<br>
			<h1>&nbsp;Lodgers With Balance</h1>
					
				<div align="center">
				<fieldset class="buttons">
					
					<g:form action="generateLodgerWithBalanceReport" controller="Report" >
						<div>
							<label for="monthOfPayment">
								<g:submitButton name="view" class="buttons" value="View" />
							</label>
							</div>
					</g:form>
					
						
					
				</fieldset>
				
				</div>
				
				
				<div align="left">
				<g:if test="${totalOfPayments}">
					<table>
						<tr>
							<td><center>Total</center></td>
							<td><center>Download Reports</center></td>
						</tr>
						<tr>
							<td><center>P${totalOfPayments}</center></td>
							<td>
								<center>
									<g:jasperReport jasper="monthly_report" controller="report" action="generateJasperMonthlyReport" format="HTML" name="Reports" params="[result:result]">
									</g:jasperReport>
								</center>
							</td>
						</tr>
						
					</table>
				
				</g:if>
				</div>
				
				
				<div id="list-payment" class="content scaffold-list" role="main">
					<h1></h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
				
				<table>
				<thead>
					<tr>
					
						<th>Lodger Name</th>
					
						<th>Room Name</th>
						
						<th>Room Rate</th>
						
						<th>Balance</th>
						
						
					</tr>
				</thead>
				<tbody>
				<g:if test="${result}">
				<g:each in="${result}" status="i" var="r">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${r.lodger_id}" controller="Lodger">${r.last_name}, ${r.first_name} ${r.middle_name}</g:link></td>
						
						<td>${r.room_name}</td>
						
						<td>${r.room_rate}</td>
						
						<td>${r.lodger_balance}</td>
				
					</tr>
				</g:each>
				
				
				</g:if>
				</tbody>
			</table>
			
		
			
				</div>
				
				
			
		</div>
	</body>
</html>
