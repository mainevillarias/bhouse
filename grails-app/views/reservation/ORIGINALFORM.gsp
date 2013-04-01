<%@ page import="newsystem.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'lodger', 'error')} required">
	<label for="lodger">
		<g:message code="reservation.lodger.label" default="Lodger" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lodger" name="lodger.id" from="${newsystem.Lodger.list()}" optionKey="id" required="" value="${reservationInstance?.lodger?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'roomNumber', 'error')} required">
	<label for="roomNumber">
		<g:message code="reservation.roomNumber.label" default="Room Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="roomNumber" name="roomNumber.id" from="${newsystem.Room.list()}" optionKey="id" required="" value="${reservationInstance?.roomNumber?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationCode', 'error')} ">
	<label for="reservationCode">
		<g:message code="reservation.reservationCode.label" default="Reservation Code" />
		
	</label>
	<g:textField name="reservationCode" value="${reservationInstance?.reservationCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'dateReserved', 'error')} required">
	<label for="dateReserved">
		<g:message code="reservation.dateReserved.label" default="Date Reserved" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateReserved" precision="day"  value="${reservationInstance?.dateReserved}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'deadline', 'error')} required">
	<label for="deadline">
		<g:message code="reservation.deadline.label" default="Deadline" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="deadline" precision="day"  value="${reservationInstance?.deadline}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="reservation.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${reservationInstance.constraints.status.inList}" value="${reservationInstance?.status}" valueMessagePrefix="reservation.status" noSelection="['': '']"/>
</div>

