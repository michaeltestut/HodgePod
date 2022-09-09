<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ podcast.podcastName }"></c:out></title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>HodgePod</h1>
		<a href="/">return home</a>
		<a href="/logout">logout</a>
	</div>
	<h1>${ podcast.podcastName }</h1>
	<p>Hosted  by: ${ podcast.podcastHost }</p>
	<p>Genre: ${ podcast.genre }</p>
	<p>Description: ${ podcast.podcastDescription }
	<h2>Episodes:</h2>
	<c:forEach var="episode" items="${ podcast.episodes}" varStatus="status">
		<div class="group">
			
			<h3>Ep. ${status.count } : <a href="/podcasts/${podcast.id }/episodes/${episode.id }">${ episode.episodeTitle }</a></h3>
			<p>${ episode.episodeDescription }</p>
			<c:if test="${ podcast.creator.id == user.id }">
				<a href="/podcasts/${podcast.id}/episodes/${episode.id}/edit">edit</a>
				<div class="spacing">			
					<form action="/podcasts/${podcast.id}/episodes/${episode.id}/delete" method="post">
						<input type="hidden" name="_method" value="delete"> 
						<input type="submit" value="Delete Episode" class="delete">
					</form>
				</div>
			</c:if>
		</div>
	</c:forEach>
	<c:if test="${ podcast.creator.id == user.id }">
		<div class="spacing">
			<button onclick="location.href = '/podcasts/${podcast.id }/episodes/add';">Add New Episode</button>
		</div>
		<div class="spacing">
			<button onclick="location.href = '/podcasts/${podcast.id}/edit';">Edit Podcast</button>
		</div>
		<div class="spacing">			
			<form action="/podcasts/delete/${podcast.id}" method="post">
				<input type="hidden" name="_method" value="delete"> 
				<input type="submit" value="Delete Podcast" class="delete">
			</form>
		</div>
	</c:if>
</body>
</html>