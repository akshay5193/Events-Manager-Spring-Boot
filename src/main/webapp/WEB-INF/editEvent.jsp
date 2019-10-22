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
		
		<div class="container card bg-light" style="width:50%;">
		<br />
			<h3 class="display-4" style="text-align: center;">Update Event</h3>	<br />
			
			 <form:form action="/updateEvent/${event.id}" method="post" modelAttribute="event">
			 
			 	<div class="container">
				 	<div class="row">
				 		<div class="col-lg-5">
				 			<h4>1</h4>
				 		</div>
				 			<h4>2</h4>
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
		
	</body>
</html>