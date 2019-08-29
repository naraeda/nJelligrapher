<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="/favicon.ico"/>
<title>Jelligrapher</title>
</head>
<body>
<h1>Details about "<c:out value="${event.name}"/>!"</h1>

	<h3>Date: <fmt:formatDate value="${event.date}" pattern="MMMM dd, yyyy"/></h3>
	<h3>Location: <c:out value="${event.city}"/>, <c:out value="${event.state}"/></h3>
	<h3>Description: <c:out value="${event.description}"/></h3>


	<form action="/search" method="post" placeholder="tag">
		<input type="search" name="tag">
		<input type="submit" value="Search Tags">
	</form>
	

	<%-- <p><form:errors path="photo.*"/></p> --%>
	<form:form method="POST" action="/test"  modelAttribute="picture" enctype="multipart/form-data">
        <p>
            <label for="imgUrl">Image</label>
            <input type="file" name="imgUrl"/>
        </p>
        <p>
            <form:label path="title">Title:</form:label>
            <form:input type="text" path="title"/>
        </p>
       	<p>
            <form:label path="city">City:</form:label>
            <form:input type="text" path="city"/>
        </p>
        <p>
            <form:label path="state">State:</form:label>
            <form:input type="text" path="state"/>
        </p>
    <form:hidden path="user" value="${user.id}"></form:hidden>
    <form:hidden path="event" value="${event.id}"></form:hidden>
    <button>Submit</button>
    </form:form> 
	
	<!--  -->
	
	<form action="/events/${event.id}" method="post">
		<input type="hidden" name="_method" value="put">
		<button>Edit</button>
	</form>
	<form action="/events/${event.id}" method="post">
		<input type="hidden" name="_method" value="delete">
		<button>Delete</button>
	</form>
	
</body>
</html>