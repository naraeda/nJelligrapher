<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="/css/style.css"/> -->
<link rel="stylesheet" href="/css/login-reg.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/js/script.js"></script>
<title>Welcome to nJelligrapher!</title>
</head>
<body>
	<div class="container">
		 <div class="message signup">
    		<div class="btn-wrapper">
		      <button class="button" id="signup">SignUp</button>
		      <button class="button" id="login"> Already Registered?</button>
		 	</div>
  		</div>
			    
    <div class="form form--signup">
    <div class="form--heading">Sign Up</div>
    <p><form:errors path="user.*"/></p>

    <form:form method="POST" action="/" modelAttribute="user" autocomplete="off">
        <p>
            <form:label path="firstName">First Name:</form:label>
            <form:input type="text" path="firstName"/>
        </p>
       	<p>
            <form:label path="lastName">Last Name:</form:label>
            <form:input type="text" path="lastName"/>
        </p>
        <p>
            <form:label path="email">Email:</form:label>
            <form:input type="text" path="email"/>
        </p>
        <p>
            <form:label path="city">Location:</form:label>
            <form:input type="text" path="city"/>
            <form:select path="state" type="state">
           		<form:option value="AL">AL</form:option>
				<form:option value="AK">AK</form:option>
				<form:option value="AR">AR</form:option>	
				<form:option value="AZ">AZ</form:option>
				<form:option value="CA">CA</form:option>
				<form:option value="CO">CO</form:option>
				<form:option value="CT">CT</form:option>
				<form:option value="DC">DC</form:option>
				<form:option value="DE">DE</form:option>
				<form:option value="FL">FL</form:option>
				<form:option value="GA">GA</form:option>
				<form:option value="HI">HI</form:option>
				<form:option value="IA">IA</form:option>	
				<form:option value="ID">ID</form:option>
				<form:option value="IL">IL</form:option>
				<form:option value="IN">IN</form:option>
				<form:option value="KS">KS</form:option>
				<form:option value="KY">KY</form:option>
				<form:option value="LA">LA</form:option>
				<form:option value="MA">MA</form:option>
				<form:option value="MD">MD</form:option>
				<form:option value="ME">ME</form:option>
				<form:option value="MI">MI</form:option>
				<form:option value="MN">MN</form:option>
				<form:option value="MO">MO</form:option>	
				<form:option value="MS">MS</form:option>
				<form:option value="MT">MT</form:option>
				<form:option value="NC">NC</form:option>	
				<form:option value="NE">NE</form:option>
				<form:option value="NH">NH</form:option>
				<form:option value="NJ">NJ</form:option>
				<form:option value="NM">NM</form:option>			
				<form:option value="NV">NV</form:option>
				<form:option value="NY">NY</form:option>
				<form:option value="ND">ND</form:option>
				<form:option value="OH">OH</form:option>
				<form:option value="OK">OK</form:option>
				<form:option value="OR">OR</form:option>
				<form:option value="PA">PA</form:option>
				<form:option value="RI">RI</form:option>
				<form:option value="SC">SC</form:option>
				<form:option value="SD">SD</form:option>
				<form:option value="TN">TN</form:option>
				<form:option value="TX">TX</form:option>
				<form:option value="UT">UT</form:option>
				<form:option value="VT">VT</form:option>
				<form:option value="VA">VA</form:option>
				<form:option value="WA">WA</form:option>
				<form:option value="WI">WI</form:option>	
				<form:option value="WV">WV</form:option>
				<form:option value="WY">WY</form:option>
            </form:select>
        </p>
        <p>
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
        <button class="button signOne" type="submit">Sign Up!</button>
    </form:form>
    </div>
    <div class="form form--login">
   	<div class="form--heading">Welcome Back!</div>
    <p><c:out value="${invalid}"/></p>
    <p><c:out value="${invalid2}"/></p>
    <p><c:out value="${error2}"/></p>
    <form method="post" action="/login" autocomplete="off">
        <p>
            <label for="email">Email</label>
            <input type="email"  name="email"/>
        </p>
        <p>
            <label for="password">Password</label>
            <input type="password" name="password"/>
        </p>
        <button class="button" type="submit">Login!</button>
    </form>   
    </div> 
    </div>
</body>
</html>