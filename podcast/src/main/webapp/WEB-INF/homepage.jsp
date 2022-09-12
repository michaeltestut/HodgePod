<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home | HodgePod</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Neonderthaw|Londrina+Solid|Londrina+Shadow">
</head>
<body>
	<div class="header">
		<h1 class="hodgepod extraPadding">HodgePod</h1>
		<a class="headerLink" href="/logout">logout</a>
	</div>
	<h3 class="title-small">All Podcasts</h3>
	<table class="table table-hover myTable">
		<c:forEach var="podcast" items="${ allPodcasts }">
			<tr>
				<td><h3><a href="/podcasts/${podcast.id}"><c:out value="${ podcast.podcastName }"></c:out></a></h3></td>
				<td><p><c:out value="${ podcast.genre }"></c:out></p></td>
				<td><p>Hosted By:<c:out value="${podcast.podcastHost }"></c:out></p></td>
			</tr>
	</c:forEach>
	</table>
	<h2 class="or">-- OR --</h2>
	<div class="container text-center">
		<div class="row">
			<div class="col">
				<button class="btn btn-outline-primary button" onclick="location.href = '/podcasts/new';">Create New Podcast</button>
			</div>
		</div>
	</div>
</body>
</html>