<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home | HodgePod</title>
	<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>HodgePod</h1>
		<a href="/logout">logout</a>
	</div>
	<h3>All Podcasts</h3>
	
	<c:forEach var="podcast" items="${ allPodcasts }">
		<div class="podcastGroup">		
			<h3><a href="/podcasts/${podcast.id}"><c:out value="${ podcast.podcastName }"></c:out></a></h3>
			<p><c:out value="${ podcast.genre }"></c:out></p>
		</div>
	</c:forEach>
	<button onclick="location.href = '/podcasts/new';">Create New Podcast</button>
</body>
</html>