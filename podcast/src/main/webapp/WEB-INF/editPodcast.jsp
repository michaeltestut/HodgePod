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
	<h2 class="title-small">Edit: <c:out value="${podcast.podcastName }"/></h2>
	<div class="myContainer">
		<form:form class="newForm" action="/podcasts/${podcast.id}/edit" method="POST" modelAttribute="updatedPodcast">
			<input type="hidden" name="_method" value="put" />
			<div class="formGroup2">
				<form:label path="podcastName">Name: </form:label>
				<form:input path="podcastName" value="${ originalPodcast.podcastName}"/>
				<form:errors class="errors" path="podcastName"/>
			</div>
			<div class="formGroup2">
				<form:label path="podcastHost">Host: </form:label>
				<form:input path="podcastHost" value="${ originalPodcast.podcastHost}"/>
				<form:errors class="errors" path="podcastHost"/>
			</div>
			<div class="formGroup2">
				<form:label path="genre">Genre: </form:label>
				<form:input path="genre" value="${ originalPodcast.genre }"/>
				<form:errors class="errors" path="genre"/>
			</div>
			<div class="formGroup2">
				<form:label path="podcastDescription">Description: </form:label>
				<textarea name="podcastDescription">${originalPodcast.podcastDescription}</textarea>
				<form:errors class="errors" path="podcastDescription"/>
			</div>
			<div class="formGroup2">
				<form:input type="hidden" path="creator" value="${originalPodcast.creator.id}"/>
			</div>
			<input type="submit" class="btn btn-outline-primary submit" value="Update"/>
		</form:form>
	</div>
</body>
</html>