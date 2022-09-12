<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Ep: <c:out value="${episode.episodeTitle }"></c:out></title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Neonderthaw|Londrina+Shadow">
</head>
<body>
	<div class="header">
		<h1 class="hodgepod extraPadding">HodgePod</h1>
		<div class="group">
			<a class="headerLink" href="/">return home</a>
			<a class="headerLink" href="/logout">logout</a>
		</div>
	</div>
	<h2 class="title-small">Edit Episode: "<c:out value="${episode.episodeTitle }"></c:out>"</h2>
	<div class="myContainer">	
		<form:form class="newForm" action="/podcasts/${podcast.id }/episodes/${ originalEpisode.id }/edit" method="POST" modelAttribute="updatedEpisode">
			<input type="hidden" name="_method" value="put" />
			<div class="formGroup2">
				<form:label path="episodeTitle">Episode Title: </form:label>
				<form:input path="episodeTitle" value="${originalEpisode.episodeTitle }"/>
				<form:errors class="errors" path="episodeTitle"/>
			</div>
			<div class="formGroup2">
				<form:label path="episodeDescription">Episode Description: </form:label>
				<textarea name="episodeDescription">${originalEpisode.episodeDescription}</textarea>
				<form:errors class="errors" path="episodeDescription"/>
			</div>
			<div class="formGroup2">
				<form:input type="hidden" path="podcast" value="${originalEpisode.podcast.id }" />
			</div>
			<input type="submit" class="btn btn-outline-primary submit" value="Edit Episode"/>
		</form:form>
	</div>
</body>
</html>