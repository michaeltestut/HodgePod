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
<title>Edit: <c:out value="${podcast.podcastName }"/></title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>HodgePod</h1>
		<a href="/">return home</a>
		<a href="/logout">logout</a>
	</div>
	<h2>Edit: <c:out value="${podcast.podcastName }"/></h2>
	<form:form action="/podcasts/${podcast.id}/edit" method="POST" modelAttribute="updatedPodcast">
		<input type="hidden" name="_method" value="put" />
		<div class="formGroup">
			<form:errors path="podcastName"/>
			<form:errors path="podcastHost"/>
			<form:errors path="genre"/>
			<form:errors path="podcastDescription"/>
		</div>
		<div class="formGroup">
			<form:label path="podcastName">Name: </form:label>
			<form:input path="podcastName" value="${ originalPodcast.podcastName}"/>
		</div>
		<div class="formGroup">
			<form:label path="podcastHost">Host: </form:label>
			<form:input path="podcastHost" value="${ originalPodcast.podcastHost}"/>
		</div>
		<div class="formGroup">
			<form:label path="genre">Genre: </form:label>
			<form:input path="genre" value="${ originalPodcast.genre }"/>
		</div>
		<div class="formGroup">
			<form:label path="podcastDescription">Description: </form:label>
			<textarea name="podcastDescription">${originalPodcast.podcastDescription}</textarea>
		</div>
		<div class="formGroup">
			<form:input type="hidden" path="creator" value="${originalPodcast.creator.id}"/>
		</div>
		<input type="submit" value="Update Podcast"/>
	</form:form>
	
</body>
</html>