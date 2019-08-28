<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/css/style.css"/>
	<title>All Images</title>
</head>
<body>
	<div class="images">
		<c:forEach var="image" items="${images}">
			<div class="vote_status">
				<c:choose>
					<c:when test="${image.votes le 50}">
						<p id="low_vote"></p>
					</c:when>
					<c:otherwise>
						<p id="high_vote"></p>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="post">
				<p><c:out value="${image}"/></p>
			</div>
		</c:forEach>
	</div>
</body>
</html>