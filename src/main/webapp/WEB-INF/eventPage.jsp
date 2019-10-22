<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	</head>
	
	<body>
	
		<nav class="navbar navbar-dark bg-dark fixed-top">
		  <a class="navbar-brand" href="/home">Welcome, ${user.firstName }</a>
		  <a href="/logout" class="btn btn-outline-danger my-2 my-sm-0 danger">Logout</a>
		</nav>
		<br /><br /><br />
		<div class="container" >
			<h1 class="display-4">${selectedEvent.name}</h1>
			
			<div class="row">
				<div class="col-lg-6">
					<div class="container" style="padding: 30px;">
						
						<h4 style="text-decoration: underline;">Event Details:</h4>	<br />
						
						<h5>Host: ${selectedEvent.host.getFirstName() } ${selectedEvent.host.getLastName() }</h5>
						<h5>Date: ${selectedEvent.date }</h5>	
						<h5>Location: ${selectedEvent.location }</h5>	<br />	
						<h5>People Attending This Event: ${selectedEvent.attendees.size() }</h5>	<br />

						<table class="table">
						  <thead class="thead-light">
						    <tr>
						      <th scope="col">Name</th>
						      <th scope="col">Location</th>
						    </tr>
						  </thead>
						  <tbody>
						  
							<c:forEach items="${selectedEvent.attendees}" var="attendee">					  
						    <tr>
						      <td>${attendee.firstName } ${attendee.lastName }</td>
						      <td>${attendee.location }, ${attendee.state }</td>
						    </tr>
							</c:forEach>

						  </tbody>
						</table>
						
					</div>
				</div>
	
				<div class="col-lg-6" >
					<div class="container" style="padding: 30px;">
					
					<h4>Comments on this event:</h4>	<br />
					
					<div data-spy="scroll" data-offset="0" class="scrollspy-example card bg-light card-body mx-auto" style="height:300px; overflow:scroll;">
					  
					  <c:forEach items="${selectedEvent.messages}" var="msg">
					  	<h5>${ msg.user.firstName } ${msg.user.lastName}</h5>
					  	<p>${msg.message }</p>
					  </c:forEach>
					</div>
					
					<div class="container" style="padding-top:50px;">
						<h5>Add Comment:</h5>
						
						<form:form action="/newMessage" method="post" modelAttribute="msg">

							<form:textarea type="text" path="message" class="form-control" id="exampleFormControlTextarea1" rows="3"/> 	<br />
							
							<input type="submit" value="Submit" class="btn btn-success"/>
							
						</form:form>
					</div>
					</div>
				</div>
				
				
			</div>
		</div>
		
	</body>
</html>