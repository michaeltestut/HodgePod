<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ podcast.podcastName }"></c:out> | HodgePod</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Neonderthaw|Londrina+Solid|Londrina+Shadow">
</head>
<body>
	<div class="header">
		<h1 class="hodgepod extraPadding">HodgePod</h1>
		<div class="group">
			<a class="headerLink" href="/">return home</a>
			<a class="headerLink" href="/logout">logout</a>
		</div>
	</div>
	<h1 class="title">${ podcast.podcastName }</h1>
	<h5 class="center spacing">${ podcast.podcastDescription }</h5>
	<div class="podcastInfo">
		<p>Hosted  by: ${ podcast.podcastHost }</p>
		<p>Genre: ${ podcast.genre }</p>
	</div>
	<h1 class="londrinaSolid bluePink center">Episodes</h1>
	<c:if test="${podcast.episodes.size() == 0 }">
		<h3 class="center londrinaSolid">Nothing Here Yet</h3>
		<c:if test="${ podcast.creator.id == user.id }">
			<h4 class="center londrinaSolid">Please Add an Episode</h4>
		</c:if>
		<c:if test="${ podcast.creator.id != user.id }">
			<h4 class="center londrinaSolid">Please Check Back Soon!</h4>
		</c:if>
	</c:if>
	<table class="table table-hover myTable">
		<c:forEach var="episode" items="${ podcast.episodes}" varStatus="status">
			<tr>
				<td>
					<div>
						<h3 class="londrinaSolid">Ep. ${status.count } : <a href="/podcasts/${podcast.id }/episodes/${episode.id }">${ episode.episodeTitle }</a></h3>
					</div>
					<div>
						<p>${ episode.episodeDescription }</p>
					</div>
				</td>
				<c:if test="${ podcast.creator.id == user.id }">
					<td class="linkGroup">
						<a class="edit" href="/podcasts/${podcast.id}/episodes/${episode.id}/edit">edit</a>
						<div class="spacing">			
							<form action="/podcasts/${podcast.id}/episodes/${episode.id}/delete" method="post">
								<input type="hidden" name="_method" value="delete"> 
								<input type="submit" value="Delete Episode" class="delete">
							</form>
						</div>
					</td>
				</c:if>		

			</tr>
		</c:forEach>
	</table>
	<c:if test="${ podcast.creator.id == user.id }">
		<div class="spacing center">
			<button class="btn btn-outline-primary button" onclick="location.href = '/podcasts/${podcast.id }/episodes/add';">Add New Episode</button>
			<button class="btn btn-outline-primary button" onclick="location.href = '/podcasts/${podcast.id}/edit';">Edit Podcast</button>
		</div>
		<h2 class="or">--OR--</h2>
		<div class="spacing">			
			<form class="center" action="/podcasts/delete/${podcast.id}" method="post">
				<input type="hidden" name="_method" value="delete"> 
				<input type="submit" value="Delete Podcast" class="btn btn-outline-danger deleteOutline">
			</form>
		</div>
	</c:if>
</body>
</html>