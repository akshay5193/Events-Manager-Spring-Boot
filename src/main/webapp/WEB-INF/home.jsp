<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
	    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
	</head>
	
	<body>
		
		<nav class="navbar navbar-dark bg-dark fixed-top">
		  <a class="navbar-brand" href="#">Welcome, ${user.firstName }</a>
		  <a href="/logout" class="btn btn-outline-danger my-2 my-sm-0 danger">Logout</a>
		</nav>
	<br />	
		
	
	
	<div class="container card bg-light" style="padding-top:50px;">
	<h4>Here are some of the events in your state:</h4>
	<br />
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col" style="width:25%;">Name</th>
		      <th scope="col" style="width:25%;">Date</th>
		      <th scope="col" style="width:15%;">Location</th>
		      <th scope="col" style="width:15%;">Host</th>
		      <th scope="col" style="width:20%;">Action / Status</th>
		    </tr>
		  </thead>
		  
		  <tbody>
		  	<c:forEach items="${instateEvents}" var="event">
		  	<tr>
		      <td style="width:25%;"> <a href="/events/${event.id }"> ${event.name } </a> </td>
		      <td style="width:25%;">${event.date }</td>
		      <td style="width:15%;">${event.location }</td>
		      <td style="width:15%;">${event.host.getFirstName() }</td>
		      <td scope="col" style="width:20%;">
		      		<c:if test="${event.host.id == user.id }">
		      			<a href="/events/${event.id}/edit">Edit</a>
		      			<span> | </span>
		      			<a href="/events/${event.id}/delete">Delete</a>
		      		</c:if>
		      		
		      		
<%-- 		      		<c:if test="${event.host.id != user.id && !event.attendees.contains(user.id) }"> --%>
<%-- 		      			<a href="/events/${event.id}/join">Join</a> --%>
<%-- 		      		</c:if> --%>
<%-- 		      		<c:if test="${attendees.user_id.contains(user.id) }"> --%>
<%-- 		      			<a href="/events/${event.id}/join">Cancel</a> --%>
<%-- 		      		</c:if> --%>
		      		
		      		<c:choose>

						<c:when test="${event.host.id != user.id }">
							<c:set var="attending" value="null" />


							<c:forEach items="${event.attendees}" var="attendee">


								<c:if test="${attendee.id == user.id }">
									<c:set var="attending" value="true" />
								</c:if>
							</c:forEach>


							<c:if test="${attending.contains('null') }">
								<a href="/events/${event.id}/join">Join</a>
							</c:if>


							<c:if test="${attending == true}">
								<span>Joining</span> | <a href="/events/${event.id}/cancel">Cancel</a>
							</c:if>
						</c:when>
					</c:choose>
		      		
			  </td>
		    </tr>
		    </c:forEach>
		    
		  </tbody>
		</table>
	</div>
	<br /><br />
	<div class="container card bg-light">
	<br />
	<h4>Here are some of the events in other states:</h4>
	<br />
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col" style="width:25%;">Name</th>
		      <th scope="col" style="width:25%;">Date</th>
		      <th scope="col" style="width:15%;">Location</th>
		      <th scope="col" style="width:15%;">Host</th>
		      <th style="width:20%;">Action / Status</th>
		    </tr>
		  </thead>
		  
		  <tbody>
		  	<c:forEach items="${outstateEvents}" var="event">
		  	<tr>
		      <td style="width:25%;"> <a href="/events/${event.id }"> ${event.name } </a> </td>
		      <td style="width:25%;">${event.date }</td>
		      <td style="width:15%;">${event.location }</td>
		      <td style="width:15%;">${event.host.getFirstName() }</td>
		      <td scope="col" style="width:20%;">
		      		<c:if test="${event.host.id == user.id }">
		      			<a href="/events/${event.id}/edit">Edit</a>
		      			<span> | </span>
		      			<a href="/events/${event.id}/delete">Delete</a>
		      		</c:if>
<%-- 		      		<c:if test="${event.host.id != user.id && !event.attendees.contains(user)}"> --%>
<%-- 		      			<a href="/events/${event.id}/join">Join</a> --%>
<%-- 		      		</c:if> --%>

					<c:choose>

						<c:when test="${event.host.id != user.id }">
							<c:set var="attending" value="null" />


							<c:forEach items="${event.attendees}" var="attendee">


								<c:if test="${attendee.id == user.id }">
									<c:set var="attending" value="true" />
								</c:if>
							</c:forEach>


							<c:if test="${attending.contains('null') }">
								<a href="/events/${event.id}/join">Join</a>
							</c:if>


							<c:if test="${attending == true}">
								<span>Joining</span> | <a href="/events/${event.id}/cancel">Cancel</a>
							</c:if>
						</c:when>
					</c:choose>

			  </td>
		    </tr>
		    </c:forEach>
		    
		      
		  </tbody>
		</table>
		
		<br /><br />
		</div>	
		<br /><br />
	
		<div class="container card bg-light" style="width:50%;">
		<br />
		<h3 class="display-4" style="text-align: center;">Create New Event</h3>	<br />
		
<!-- 		a -->
			
			
			<div class="lg-8">
			<form:form method="POST" action="/newEvent" modelAttribute="event">
			<div class="container" style="width:50%;">
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
				 </div>
		        <form:input path="name" name="" class="form-control" placeholder="Event Name" type="text" />
		    </div> <!-- form-group// -->
		    <p style="color: red;"><form:errors path="name"/></p>
		    
		    
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
				</div>
				<form:input path="location" name="" class="form-control" placeholder=" Event Location" type="text" />
				
				<form:select path="state" class="custom-select" style="max-width: 90px;">
				    <option selected="">State</option>
				    <option value="AK">Alaska</option>
					<option value="AL">Alabama</option>
					<option value="AR">Arkansas</option>
					<option value="AZ">Arizona</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DC">District of Columbia</option>
					<option value="DE">Delaware</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="IA">Iowa</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="MA">Massachusetts</option>
					<option value="MD">Maryland</option>
					<option value="ME">Maine</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MO">Missouri</option>
					<option value="MS">Mississippi</option>
					<option value="MT">Montana</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="NE">Nebraska</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NV">Nevada</option>
					<option value="NY">New York</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="PR">Puerto Rico</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VA">Virginia</option>
					<option value="VT">Vermont</option>
					<option value="WA">Washington</option>
					<option value="WI">Wisconsin</option>
					<option value="WV">West Virginia</option>
					<option value="WY">Wyoming</option>
				</form:select>				
		    </div> <!-- form-group// -->
		    <p style="color: red;"><form:errors path="location"/></p>
		    
		    <p>
		        <form:label path="date">Event Date: </form:label>
		        <form:errors path="date"/>
		        <form:input type="date" path="date"/>
		    </p> 
		    
		    </div>	<!--  end of container -->
		    </form:form>
		    </div>
		    
		   
<!-- b -->
		
		
		
		
		 <form:form action="/newEvent" method="post" modelAttribute="event"> 
		 	<div class="container" >
			 	<div class="row">
			 		<div class="col-lg-5" style="padding-left: 15%;">
			 			<h4>1</h4>
			 			<p>
			 				<form:label path="name">Name</form:label>
			 			
			 		</div>
			 			<h4>2</h4>
			 			<p>
				 			<form:errors path="name"/>
			        		<form:input path="name"/>
			        	</p>
			 		<div class="col-lg-7">
			 		
			 		</div>
			 	</div>
		 	</div>
		 
		    <p>
		        <form:label path="name">Name</form:label>
		        <form:errors path="name"/>
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:label path="location">Location</form:label>
		        <form:errors path="location"/>
		        <form:textarea path="location"/>
		    </p>
		    <p>
		       <form:select path="state" class="custom-select" style="max-width: 90px;">
				    <option selected="">State</option>
				    <option value="AK">Alaska</option>
					<option value="AL">Alabama</option>
					<option value="AR">Arkansas</option>
					<option value="AZ">Arizona</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DC">District of Columbia</option>
					<option value="DE">Delaware</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="IA">Iowa</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="MA">Massachusetts</option>
					<option value="MD">Maryland</option>
					<option value="ME">Maine</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MO">Missouri</option>
					<option value="MS">Mississippi</option>
					<option value="MT">Montana</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="NE">Nebraska</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NV">Nevada</option>
					<option value="NY">New York</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="PR">Puerto Rico</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VA">Virginia</option>
					<option value="VT">Vermont</option>
					<option value="WA">Washington</option>
					<option value="WI">Wisconsin</option>
					<option value="WV">West Virginia</option>
					<option value="WY">Wyoming</option>
				</form:select>
				
		    </p>
		    <p>
		        <form:label path="date">Event Date: </form:label>
		        <form:errors path="date"/>
		        <form:input type="date" path="date"/>
		    </p>    
		    <input type="submit" value="Submit"/>
		</form:form> 
		<br /><br />
		</div>
		
	
		<br /><br /><br />
	</body>
</html>