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
	 <form method="POST" action="/events/${event.id}">
        <p>
            <label>Picture:</label>
            <input type="file"/>
        </p>
       	<p>
            <label>Tags:</label>
            <input type="text"/>
        </p>
        <p>
            <label>Location:</label>
            
        </p>
     <input type="submit" value="Register!"/>
    </form>
	
	
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