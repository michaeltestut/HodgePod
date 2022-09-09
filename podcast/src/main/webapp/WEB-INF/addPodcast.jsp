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
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>HodgePod</h1>
		<a href="/">return home</a>
		<a href="/logout">logout</a>
	</div>
	<h2>Add a New Podcast</h2>
	<form:form action="/podcasts/new" method="POST" modelAttribute="newPodcast">
		<div class="formGroup">
			<form:label path="podcastName">Name: </form:label>
			<form:input path="podcastName"/>
			<form:errors path="podcastName"/>
		</div>
		<div class="formGroup">
			<form:label path="podcastHost">Host: </form:label>
			<form:input path="podcastHost"/>
			<form:errors path="podcastHost"/>
		</div>
		<div class="formGroup">
			<form:label path="genre">Genre: </form:label>
			<form:input path="genre"/>
			<form:errors path="genre"/>
		</div>
		<div class="formGroup">
			<form:label path="podcastDescription">Description: </form:label>
			<form:textarea path="podcastDescription"/>
			<form:errors path="podcastDescription"/>
		</div>
		<div class="formGroup">
			<form:input type="hidden" path="creator" value="${user.id}"/>
		</div>
		<input type="submit" value="Add Podcast"/>
	</form:form>
</body>
</html>