<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${episode.episodeTitle }"/> | <c:out value="${podcast.podcastName}"/></title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>HodgePod</h1>
		<div class="group">
			<a href="/">return home</a>
			<a href="/">logout</a>
		</div>
	</div>
	<h2><c:out value="${podcast.podcastName }"/></h2>
	<h3><c:out value="${episode.episodeTitle }"/></h3>
	
	<audio controls>
		<source src="${episode.episodeURL }" type="audio/mpeg">
	</audio>
</body>
</html>