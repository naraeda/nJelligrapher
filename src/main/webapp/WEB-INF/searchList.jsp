<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nJelligrapher</title>
</head>
<body>
	
	<c:forEach var="picture" items="${pictures}">
		<h1> <c:out value="${picture.title}"/>  </h1>
		<img src="${picture.url}">
	</c:forEach>
</body>
</html>