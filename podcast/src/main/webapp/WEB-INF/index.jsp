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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login / Register</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Neonderthaw|Londrina+Solid">
</head>
<body>
	<div class="fheader center">
		<h1 class="hodgepodHome">HodgePod</h1>
		<h5 class="londrinaSolid"> A Place for Podcasters</h5>
	</div>
	<div class="container text-center">
		<div class="row">
			<div class="col formContainer">
				<h2 class="shadow londrinaSolid">Login:</h2>
				<form:form action="/login" method="POST" modelAttribute="newLogin">
					<div class="formGroup2">
						<form:label path="email">Email: </form:label>
						<form:input path="email" />
						<form:errors path="email"  class="errors" />
					</div>
					<div class="formGroup2">
						<form:label path="password">Password: </form:label>
						<form:input path="password" type="password" />
						<form:errors path="password" class= "errors"/>
					</div>
					<input type="submit" value="Submit" class="submit"/>
				</form:form>
			</div>
		
			<div class="col formContainer">
				<h2 class="shadow londrinaSolid">Register:</h2>
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div class="formGroup2">
						<form:label path="email">Email: </form:label>
						<form:input path="email" />
						<form:errors path="email" class="errors" />
					</div>
					<div class="formGroup2">
						<form:label path="userName">UserName: </form:label>
						<form:input path="userName" />
						<form:errors path="userName" class= "errors"/>
					</div>
					<div class="formGroup2">
						<form:label path="password">Password: </form:label>
						<form:input path="password" type="password" />
						<form:errors path="password" class="errors" />
					</div>
					<div class="formGroup2">
						<form:label path="confirmPassword">Confirm Password: </form:label>
						<form:input path="confirmPassword" type="password"/>
						<form:errors path="confirmPassword" class= "errors"/>
					</div>
					<input type="submit" value="Submit" class="submit"/>
				</form:form>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>