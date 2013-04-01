<%@ page import="newsystem.Payment"%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="layout">
		<title>Monthly Report</title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'admin.css')}" type="text/css">
	</head>
	<body>

		<div class="center" align="center">
		<br>
			<h1>&nbsp;Lodgers With No Month Payment</h1>
					Select Month:
				<div align="center">
				<fieldset class="buttons">
					
					<g:form action="getLodgersWithNoMonthPayment" controller="Report" >
						<div>
							<label for="monthOfPayment">
								<g:submitButton name="view" class="buttons" value="View" />
							</label>
							<% def dateNow = new Date()%>
								<g:datePicker name="monthOfPayment" precision="month"  value="${dateNow}"  />
						</div>
					</g:form>
					
						
					
				</fieldset>
				
				</div>
				
				
				<div align="left">
				<g:if test="${totalOfPayments}">
					<table>
						<tr>
							<td><center><h1>Total</h1></center></td>
							<td><center><h1>Download Reports<h1></center></td>
						</tr>
						<tr>
							<td><center>P${totalOfPayments}</center></td>
							<td>
								<center>
									<g:jasperReport jasper="monthly_report" controller="report" action="generateJasperMonthlyReport" format="PDF" name="PDF" params="[result:result]">
									</g:jasperReport>
								</center>
							</td>
						</tr>
						
					</table>
				
				</g:if>
				</div>
				
				<div>

				<div id="list-payment" class="content scaffold-list" role="main">
					<h1></h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
				
				<table>
				<thead>
					<tr>
					
						<th>Lodger Name</th>
					
						
		
					</tr>
				</thead>
				<tbody>
				<g:if test="${result}">
				<g:each in="${result}" status="i" var="r">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${r.lodger_id}" controller="Lodger">${r.last_name}, ${r.first_name} ${r.middle_name}</g:link></td>
						
						
				
					</tr>
				</g:each>
				
				
				</g:if>
				</tbody>
			</table>
			
		
			
				</div>
				
				
			
		</div>
		</div>
	</body>
</html>
