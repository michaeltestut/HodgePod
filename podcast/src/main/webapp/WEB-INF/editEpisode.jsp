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
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>HodgePod</h1>
		<a href="/">return home</a>
		<a href="/logout">logout</a>
	</div>
	<h2>Edit Episode: <c:out value="${episode.episodeTitle }"></c:out></h2>
	<form:form action="/podcasts/${podcast.id }/episodes/${ originalEpisode.id }/edit" method="POST" modelAttribute="updatedEpisode">
		<input type="hidden" name="_method" value="put" />
		<div class="formGroup">
			<form:label path="episodeTitle">Episode Title: </form:label>
			<form:input path="episodeTitle" value="${originalEpisode.episodeTitle }"/>
			<form:errors path="episodeTitle"/>
		</div>
		<div class="formGroup">
			<form:label path="episodeDescription">Episode Description: </form:label>
			<textarea name="episodeDescription">${originalEpisode.episodeDescription}</textarea>
			<form:errors path="episodeDescription"/>
		</div>
		<div class="formGroup">
			<form:input type="hidden" path="podcast" value="${originalEpisode.podcast.id }" />
		</div>
		<input type="submit" value="Edit Episode"/>
	</form:form>
</body>
</html>