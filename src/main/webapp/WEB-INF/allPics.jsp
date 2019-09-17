<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Satisfy&display=swap" rel="stylesheet">
	<script src="/js/script.js"></script>
	<link rel="stylesheet" href="/css/style.css"/>
	<link rel="stylesheet" href="/css/style2.css"/>
	<title>Jelligrapher</title>
</head>
<body>
	<div class="header">Welcome To Our Photograph Section!</div>
	<div class="images">
		<c:forEach var="picture" items="${pictures}">
			<div class="image">
				<div class="vote_bar">
					<div id="progress" class="vote_fill_${picture.id}" style="width:${picture.likes}%"></div>
				</div>
				<div class="pic_div">
					<img src="${picture.url}">
				</div>
				<p class="photo_name">Picture</p>
				<div class="wrapper">
						<a href="javascript:void(0);" data-photo-id="${picture.id}" class="like_button neutral">
					    <i class="material-icons not-liked bouncy">favorite_border</i>
					    <i class="material-icons is-liked bouncy">favorite</i>
				    	<span class="like-overlay"></span>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>