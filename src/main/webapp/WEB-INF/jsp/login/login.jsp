<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Login page</title>
		<jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
	</head>

	<body>
	<div id="mainWrapper">
		<div class="jumbotron text-center">
			<h1>Welcome!</h1>
			<h3>Please enter you login and password</h3>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<c:url var="loginUrl" value="/login" />
					<form action="${loginUrl}" method="post" class="container-fluid">
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								<p>Invalid username and password.</p>
							</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">
								<p>You have been logged out successfully.</p>
							</div>
						</c:if>
						<div class="input-group input-sm">
							<label class="input-group-addon" for="username"><i class="glyphicon glyphicon-user"></i></label>
							<input type="text" class="form-control" id="username" name="ssoId" placeholder="Enter Username" required>
						</div>
						<div class="input-group input-sm">
							<label class="input-group-addon" for="password"><i class="glyphicon glyphicon-asterisk"></i></label>
							<input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
						<br>
							<div class="col-sm-6">
								<input type="submit" class="btn btn-block btn-primary btn-default" value="Log in">
							</div>
							<div class="col-sm-6">
								<button type="reset" class="btn btn-block btn-primary btn-default">Clear</button>
							</div>
					</form>
				</div>
				<div class="col-sm-4"></div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/jsp/components/footer.jsp"/>
	</body>
</html>