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
<title>Add New Podcast</title>
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
	<h2 class="title-small">Add a New Podcast</h2>
	<div class="myContainer">
		<form:form class="newForm" action="/podcasts/new" method="POST" modelAttribute="newPodcast">
			<div class="formGroup2">
				<form:label path="podcastName">Name: </form:label>
				<form:input path="podcastName"/>
				<form:errors class="errors" path="podcastName"/>
			</div>
			<div class="formGroup2">
				<form:label path="podcastHost">Host: </form:label>
				<form:input path="podcastHost"/>
				<form:errors class="errors" path="podcastHost"/>
			</div>
			<div class="formGroup2">
				<form:label path="genre">Genre: </form:label>
				<form:input path="genre"/>
				<form:errors class="errors" path="genre"/>
			</div>
			<div class="formGroup2">
				<form:label path="podcastDescription">Description: </form:label>
				<form:textarea path="podcastDescription"/>
				<form:errors class="errors" path="podcastDescription"/>
			</div>
			<div class="formGroup2">
				<form:input type="hidden" path="creator" value="${user.id}"/>
			</div>
			<input type="submit" class="btn btn-outline-primary submit" value="Add Podcast"/>
		</form:form>
	</div>
</body>
</html>