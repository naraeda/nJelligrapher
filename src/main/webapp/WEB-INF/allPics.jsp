<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/js/script.js"></script>
	<link rel="stylesheet" href="/css/style.css"/>
	<title>Jelligrapher</title>
</head>
<body>
	<div class="images">
	<div class="image">
				<div class="vote_bar">
					<div class="vote_fill"></div>
				</div>
				<div class="post">
					<p><c:out value="${picture}"/></p>
				</div>
				<a data-photo-id="${image.id}" href="#" class="like_button neutral">Like</a>
				</div>
		<c:forEach var="picture" items="${pictures}">
			<div class="image">
				<div class="vote_bar">
					<div class="vote_fill"></div>
				</div>
				<div class="post">
					<p><c:out value="${picture}"/></p>
				</div>
				<a data-photo-id="${image.id}" href="#" class="like_button neutral">Like</a>
			</div>
		</c:forEach>
	</div>
	<div>This page is loading correctly</div>
</body>
</html>