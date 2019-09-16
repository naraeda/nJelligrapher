<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/announcements.css">
<title>nJelligrapher</title>
</head>
<body>
	<h1>The Winner is..... </h1>
	<h2 class="title">" <c:out value="${picture.title}"/> "</h2>
	<h2>Posted By: <c:out value="${picture.user.firstName}"/> <c:out value="${picture.user.lastName}"/></h2>
	<h2>Event Name: <a href="events/${picture.event.id}"><c:out value="${picture.event.name}"/></a></h2>
	<h2><a href="events/${picture.event.id}"><img src="${picture.url}"></a></h2>

	
	<p>The winner will receive a copy of the winning picture with a frame. </p>
	<p>Please contact our admins to receive a copy of the picture.</p>
	<p>Come back next week to participate again. We're looking forward to see your awesome photos!</p>
	
	
	
	
	<!-- <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> -->
	<br><br>
	<hr>
	<br>
	<p>*If you have any questions or concerns, feel free to contact us at: </p>

		<h3><button><a href="mailTo:cherry2ney@gmail.com">Contact Narae</a></button><button><a href="mailTo:elliezhao14@gmail.com"> Contact Ellie</a></button><button><a href="mailTo:jeffhendricks00@gmail.com"> Contact Jeff</a></button><button><a href="/events">Back to Dashboard</a></button></h3>


</body>
</html>