<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>dashboard</title>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	<div class="position_container">

		<div class="position_navbar">

			<h1 id="position_heading" style="text-decoration: underline; "><c:out value="${organization.name}"></c:out></h1>

			<h1>DevsOnDeck</h1>

			<a id="logout" href="#">Logout</a>

			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script>
				$('#logout').click(function(e) {
					e.preventDefault();
					$.post("/logout", function() {
						window.location.href = "/";
					});
				});
			</script>

		</div>

		<div class="container_dashboard">

			<div class="dashboard_content">

				<div class="list_position">

					<a href="/new/position"><button class="button-64" role="button">
							<span class="text">List a New Position</span>
						</button></a>

				</div>

				<div class="positions_box">

					<div class="positions_tofill">

						<h2 id="positions_to_fill">Positions To Fill</h2>

					</div>

					<c:if test="${not empty positions}">
						<c:forEach var="position" items="${positions}">
							<h4>
								<a href="/jobs/${position.id}"> <c:out
										value="${position.name}" />
								</a>
							</h4>
						</c:forEach>
					</c:if>
				</div>

			</div>

			<div class="available_devs_box">

				<div class="available_devs_heading">

					<h1 id="a_devs">Available Devs</h1>

				</div>

				<div class="user_box">

					<div class="user_first_part">

						<c:forEach var="user" items="${allUsers}">
							<div class="users">
								<div class="user_first_part">
									<p>
										<c:out value="${user.firstName}"></c:out>
									</p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<p>
										<c:out value="${user.skills}"></c:out>
									</p>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
								<p>
									<c:out value="${user.bio}"></c:out>
								</p>
							</div>
						</c:forEach>

					</div>



				</div>

			</div>
</body>
</html>