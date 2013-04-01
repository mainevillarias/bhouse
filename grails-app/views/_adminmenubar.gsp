<g:if test="${!session.accountId}"> 
    <menuButton>
        <g:link controller="account" action="login">Log 
in</g:link> 
    </menuButton> 
</g:if> 
<g:else> 
<div align="left">
    <menuButton> 
        <p><g:link controller="room" action="list"> 
            &nbsp;Rooms
        </g:link></p>
    </menuButton> 
	 <menuButton>
        <p><g:link controller="Lodger" action="list"> 
            &nbsp;Lodger
        </g:link> </p>
    </menuButton> 
	 <menuButton>
       <p> <g:link controller="Payment" action="list"> 
            &nbsp;Payments
        </g:link> </p>
    </menuButton> 
	 <menuButton>
        <p><g:link controller="Reservation" action="list"> 
            &nbsp;Reservation
        </g:link> </p>
    </menuButton>
	 <menuButton>
        <p><g:link controller="Report" action="index"> 
            &nbsp;Reports
        </g:link> </p>
    </menuButton>
	
    <menuButton> 
        <p><g:link controller="account" action="list">&nbsp;Administrators 
         </g:link> </p>
    </menuButton>
	
</div>
</g:else> 
