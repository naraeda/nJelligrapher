<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
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