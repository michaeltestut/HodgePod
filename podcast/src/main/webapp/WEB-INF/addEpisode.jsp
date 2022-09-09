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
<title>Add New Episode</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>HodgePod</h1>
		<a href="/">return home</a>
		<a href="/logout">logout</a>
	</div>
		<h2>Add New Episode to: <c:out value="${podcast.podcastName }"></c:out></h2>
	<form:form action="/podcasts/${podcast.id }/episodes/add" method="POST" modelAttribute="newEpisode" enctype = "multipart/form-data">
		<div class="formGroup">
			<form:label path="episodeTitle">Episode Title: </form:label>
			<form:input path="episodeTitle"/>
			<form:errors path="episodeTitle"/>
		</div>
		<div class="formGroup">
			<form:label path="episodeDescription">Episode Description: </form:label>
			<form:textarea path="episodeDescription"/>
			<form:errors path="episodeDescription"/>
		</div>
		<div class="formGroup">
			<form:input type="hidden" path="episodeURL" value="${newEpisode.episodeURL } " />
		</div>
		<div class="formGroup">
			<label>Upload (.mp3): </label>
			<input type="file" name="file" accept="audio/mpeg"/>
		</div>
		<div class="formGroup">
			<form:input type="hidden" path="podcast" value="${podcast.id }" />
		</div>
	
		<input type="submit" value="Add Episode"/>
	</form:form>
	
	
</body>
</html>