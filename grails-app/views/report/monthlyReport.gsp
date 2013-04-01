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
			<h1>&nbsp;Monthly Reports</h1>
					
				<div align="center">
				<fieldset class="buttons">
					
					<g:form action="generateMonthlyReport" controller="Report" >
						<div>
							<label for="monthOfPayment">
								<g:submitButton name="view" class="buttons" value="View" />
							</label>
								<g:datePicker name="monthOfPayment" precision="month"  value=""  />
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
									<g:jasperReport jasper="monthly_report" controller="report" action="generateJasperMonthlyReport" format="PDF" name="PDF" >
										<g:datePicker name="monthOfPayment2" precision="month"  value="${monthOfPayment}"  />

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
					
						<th>Date of Payment</th>
						
						<th>Payment Type</th>
						
						<th>OR Number</th>
						
						<th>Amount</th>
					
		
					</tr>
				</thead>
				<tbody>
				<g:if test="${result}">
				<g:each in="${result}" status="i" var="r">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${r.last_name}, ${r.first_name} ${r.middle_name}</td>
						
						<td><g:formatDate date="${r.payment_date}" format="MMM-dd-yyyy" /></td>
						
						<td>${r.payment_status}</td>
						
						<td>${r.or_number}</td>
						
						<td>${r.amount_paid}</td>
						
						
					</tr>
				</g:each>
					
					
				</g:if>
				</tbody>
			
			</table>
			
			
			
				</div>
			
		</div>
	</body>
</html>
