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
<title>Login / Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Neonderthaw">
</head>
<body>
	<div class="fheader center">
		<h1 class="hodgepod">HodgePod</h1>
		<h6> A Place for Podcasters</h6>
	</div>
	<div class="pageDiv">
		<h2>Login:</h2>
		<form:form action="/login" method="POST" modelAttribute="newLogin">
			<div class="formGroup">
				<form:label path="email">Email: </form:label>
				<form:input path="email" />
				<form:errors path="email"  class="errors" />
			</div>
			<div class="formGroup">
				<form:label path="password">Password: </form:label>
				<form:input path="password" type="password" />
				<form:errors path="password" class= "errors"/>
			</div>
			<input type="submit" value="Submit"/>
		</form:form>
	</div>

	<div class="pageDiv">
		<h2>Register:</h2>
		<form:form action="/register" method="POST" modelAttribute="newUser">
			<div class="formGroup">
				<form:label path="email">Email: </form:label>
				<form:input path="email" />
				<form:errors path="email" class="errors" />
			</div>
			<div class="formGroup">
				<form:label path="userName">UserName: </form:label>
				<form:input path="userName" />
				<form:errors path="userName" class= "errors"/>
			</div>
			<div class="formGroup">
				<form:label path="password">Password: </form:label>
				<form:input path="password" type="password" />
				<form:errors path="password" class="errors" />
			</div>
			<div class="formGroup">
				<form:label path="confirmPassword">Confirm Password: </form:label>
				<form:input path="confirmPassword" type="password"/>
				<form:errors path="confirmPassword" class= "errors"/>
			</div>
			<input type="submit" value="Submit"/>
		</form:form>
	</div>
</body>
</html>