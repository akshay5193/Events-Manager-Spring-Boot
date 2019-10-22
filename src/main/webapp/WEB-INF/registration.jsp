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
		
		<div class="container">

        <h1 class="display-4" style="text-align: center;">Events Project</h1>
<!-- 	    style="max-width: 400px; display: inline-block; vertical-align: top; width:49%;" -->
	    <div class="card bg-light" style="display: inline-block; vertical-align: top; width:49%;">
	 
		<article class="card-body mx-auto" style="max-width: 400px;">
			<h4 class="card-title mt-3 text-center">Create Account</h4>
			<p class="text-center">Get started with your free account</p>
			
			<form:form method="POST" action="/registration" modelAttribute="user">
			
			<div class="form-group input-group">
				<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
				 </div>
		        <form:input path="firstName" name="" class="form-control" placeholder="First name" type="text" />
		    </div> <!-- form-group// -->
		    <p style="color: red;"><form:errors path="firstName"/></p>
		    
		    <div class="form-group input-group">
				<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
				 </div>
		        <form:input path="lastName" name="" class="form-control" placeholder="Last name" type="text" />
		    </div> <!-- form-group// -->
		    <p style="color: red;"><form:errors path="lastName"/></p>
		    
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <form:input path="email" name="" class="form-control" placeholder="Email address" type="email" />
		    </div> <!-- form-group// -->
		    <p style="color: red;"><form:errors path="email"/></p>
		    
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
				</div>
				<form:input path="location" name="" class="form-control" placeholder="Location" type="text" />
				
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
		    
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <form:input path="password" class="form-control" placeholder="Create password" type="password" />
		    </div> <!-- form-group// -->
		    <p style="color: red;"><form:errors path="password"/></p>
		    
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <form:input path="passwordConfirmation" class="form-control" placeholder="Confirm password" type="password" />
		    </div> <!-- form-group// -->
		       
<%-- 		    <p><form:errors path="confirmPassword"/></p>                                    --%>

		    <div class="form-group">
		        <input type="submit" value="Create Account" class="btn btn-primary btn-block" />
		    </div> <!-- form-group// -->
		          
		    <p class="text-center">Have an account? <a href="">Log In</a> </p>
		                                                                     
		</form:form >
		
		
		
		</article>
		
		
		</div> <!-- card.// -->
		
		
		<div class="card bg-light" style="display: inline-block; vertical-align: top; width:49%;">
		<article class="card-body mx-auto" style="max-width: 400px;">
			<h4 class="card-title mt-3 text-center">Login</h4>
			<p class="text-center">Login with your free account</p>
			
			<form method="post" action="/login">
				<div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <input name="email" class="form-control" placeholder="Email address" type="email">
		    </div> <!-- form-group// -->
		    
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <input name="password" class="form-control" placeholder="Password" type="password">
		    </div> <!-- form-group// -->
		                                 
		    <div class="form-group">
		        <input type="submit" value="Login" class="btn btn-primary btn-block" />
		    </div> <!-- form-group// -->   
		    <p style="color: red;"><c:out value="${error}" /></p>   
			</form>
			
<%-- 			<form method="post" action="/login"> --%>
			
		    
<%-- 		</form> --%>
		</article>
		</div>
		
		
		</div> 
	    
<%-- 	    <p><form:errors path="user.*"/></p> --%>
	    
<%-- 	    <form:form method="POST" action="/registration" modelAttribute="user"> --%>
<!-- 	        <p> -->
<%-- 	            <form:label path="email">Email:</form:label> --%>
<%-- 	            <form:input type="email" path="email"/> --%>
<!-- 	        </p> -->
<!-- 	        <p> -->
<%-- 	            <form:label path="password">Password:</form:label> --%>
<%-- 	            <form:password path="password"/> --%>
<!-- 	        </p> -->
<!-- 	        <p> -->
<%-- 	            <form:label path="passwordConfirmation">Password Confirmation:</form:label> --%>
<%-- 	            <form:password path="passwordConfirmation"/> --%>
<!-- 	        </p> -->
<!-- 	        <input type="submit" value="Register!"/> -->
<%-- 	    </form:form> --%>

      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
	</body>
</html>