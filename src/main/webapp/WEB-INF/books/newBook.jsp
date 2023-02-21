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
	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 text-light">
		<div class="container">
			<span class="navbar-brand mb-0 h1"><a class="nav-link"
				href="/books">Book Club</a></span>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbarNav" class="collapse navbar-collapse me-auto">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="/books/new">Add
							a Book to your shelf</a></li>
				</ul>
				<div class="d-flex align-items-center gap-3 ms-auto">
					<p class="nav-text mb-0">Welcome, ${name}!</p>
					<a href="/logout" class="btn btn-sm btn-outline-light">Logout</a>
				</div>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="card">
					<h5 class="card-header">Add a Book</h5>
					<div class="card-body">
						<form:form action="/books" method="POST" modelAttribute="book">
							<form:hidden path="user" value="${userId}" />
							<div class="mb-3">
								<form:label class="form-label" path="title">Title:</form:label>
								<form:input class="form-control" path="title" />
								<form:errors class="form-text text-danger" path="title" />
							</div>
							<div class="mb-3">
								<form:label class="form-label" path="author">Author:</form:label>
								<form:input class="form-control" path="author" />
								<form:errors class="form-text text-danger" path="author" />
							</div>
							<div class="mb-3">
								<form:label class="form-label" path="thoughts">My Thoughts:</form:label>
								<form:textarea class="form-control" rows="3" style="resize:none;" path="thoughts" />
								<form:errors class="form-text text-danger" path="thoughts" />
							</div>
							<div class="d-flex justify-content-end">
								<input type="submit" value="Add Book"
									class="btn btn-outline-dark">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/app.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>