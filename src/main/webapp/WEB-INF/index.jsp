<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<title>Book Club</title>


</head>
<body>
	<div class="container mt-5">
		<h1 style="color:rebeccapurple;">Book Club</h1>
		<h5 class="text-muted mt-3">A place for friends to share thoughts on books.</h5>
		<div class="row mt-5">
			<div class="col-lg-6 col-md-6 col-sm-12">
				<div class="card">
					<h5 class="card-header">Register a New User</h5>
					<div class="card-body">
						<form:form action="/register" method="POST"
							modelAttribute="newUser">
							<div class="mb-3">
								<form:label class="form-label" path="name">Name:</form:label>
								<form:input class="form-control" path="name" />
								<form:errors class="form-text text-danger" path="name" />
							</div>
							<div class="mb-3">
								<form:label class="form-label" path="email">Email:</form:label>
								<form:input class="form-control" path="email" />
								<form:errors class="form-text text-danger" path="email" />
							</div>
							<div class="mb-3">
								<form:label class="form-label" path="password">Password:</form:label>
								<form:password class="form-control" path="password" />
								<form:errors class="form-text text-danger" path="password" />
							</div>
							<div class="mb-3">
								<form:label class="form-label" path="confirm">Confirm Password:</form:label>
								<form:password class="form-control" path="confirm" />
								<form:errors class="form-text text-danger" path="confirm" />
							</div>
							<div class="d-flex justify-content-end">
								<input type="submit" value="Register" class="btn btn-primary">
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12">
				<div class="card">
					<h5 class="card-header">User Login</h5>
					<div class="card-body">
						<form:form action="/login" method="POST" modelAttribute="newLogin">
							<div class="mb-3">
								<form:label class="form-label" path="email">Email:</form:label>
								<form:input class="form-control" path="email" />
								<form:errors class="form-text text-danger" path="email" />
							</div>
							<div class="mb-3">
								<form:label class="form-label" path="password">Password:</form:label>
								<form:password class="form-control" path="password" />
								<form:errors class="form-text text-danger" path="password" />
							</div>
							<div class="d-flex justify-content-end">
								<input type="submit" value="Login" class="btn btn-success">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- change to match your file/naming structure -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/app.js"></script>
	<!-- change to match your file/naming structure -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>