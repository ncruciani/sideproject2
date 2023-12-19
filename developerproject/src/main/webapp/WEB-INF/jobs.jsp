<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jobs</title>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	 <div class="position_container">

        <div class="jobs_navbar">

            <h1 id="position_heading" style="text-decoration: underline; "><c:out value="${organization.name}"></c:out></h1>

            <h1 id="devs_on_deck"> DevsOnDeck</h1>

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

        <div class="position_header_job_page">

            <h1 id="available"><c:out value="${position.name}"></c:out></h1>

        </div>

        <div class="bottom_content">

            <div class="available_dev_nav">

                <h1 id="available_devs">Available Devs</h1>

            </div>

            <div class="user_box2">

					<div class="user_first_part2">

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