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
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Neonderthaw|Londrina+Shadow|Londrina+Solid">
</head>
<body>
	<div class="header">
		<h1 class="hodgepod extraPadding">HodgePod</h1>
		<div class="group">
			<a class="headerLink" href="/">return home</a>
			<a class="headerLink" href="/">logout</a>
		</div>
	</div>
	<h2 class="title"><c:out value="${podcast.podcastName }"/></h2>
	<div class="episodeContainer">
		<h3 class="episodeTitle">"<c:out value="${episode.episodeTitle }"/>"</h3>
		<div class="audioControls">
			<audio controls>
				<source src="${episode.episodeURL }" type="audio/mpeg">
			</audio>
		</div>
	</div>
</body>
</html>