<%@ page import="newsystem.Reservation" %>



<!--<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'lodger', 'error')} required">
	<label for="lodger">
		<g:message code="reservation.lodger.label" default="Lodger" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lodger" name="lodger.id" from="${newsystem.Lodger.list()}" optionKey="id" required="" value="${reservationInstance?.lodger?.id}" class="many-to-one"/>
</div>-->

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'lodger', 'error')} required">
	<label for="lodger">
		Name
		<span class="required-indicator"></span>
	</label>
	<g:hiddenField id="lodger" name="lodger.id" optionKey="id" required="" value="${lodgerInstance.id}"/>${lodgerInstance.firstName} ${lodgerInstance.middleName} ${lodgerInstance.lastName} 
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'roomNumber', 'error')} required">
	<label for="roomNumber">
		<g:message code="reservation.roomNumber.label" default="Room Number" />
		<span class="required-indicator"></span>
	</label>
	<g:hiddenField id="roomNumber" name="roomNumber.id" optionKey="id" required=""  value="${roomInstance.id}" />${roomInstance.roomName}
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationCode', 'error')} ">
	<label for="reservationCode">
		<g:message code="reservation.reservationCode.label" default="Reservation Code" />
	</label>
	<g:hiddenField name="reservationCode" value="${reservationCode}"/>${reservationCode}
</div>


<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'status', 'error')} ">
	<label for="status">
	</label>
	<g:hiddenField name="status" value="Unconfirmed"/>
</div>

