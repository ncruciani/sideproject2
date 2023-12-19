<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>addskills</title>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	<div class="position_container">

        <div class="position_navbar">

            <h1 id="position_heading">Devs On Deck</h1>

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

        <form:form action="/framework" method="post" modelAttribute="newUser" id="addskills_form">

            <div class="container_skillspage">

                <div class="skills_header2">

                    <h3 id="pick_framework_heading1">Pick your Top 5 Frameworks or Libraries</h3>

                    <div class="added_framework_box">

                        <p><c:out value="${user.skills}"></c:out></p>

                    </div>

                </div>

                <div class="frameworks_box">
                
                	<div class="framework_content">

                   <label> <img src="../images/python_icon.png"
							alt="">
						</label>
						<label>  <img src="../images/c++_icon.png"
							alt="">
						</label>
						<label>  <img src="../images/c++_icon.png"
							alt="">
						</label>
						<label> <img src="../images/java-script-icon.png"
							alt="">
						</label>
						<label>  <img src="../images/mysql-icon.png"
							alt="">
						</label>
						<label> <img src="../images/c-icon.png"
							alt="">
						</label>
						<label>  <img src="../images/django.png"
							alt="">
						</label>
						<label>  <img src="../images/java-icon.png"
							alt="">
						</label>
						<label> <img src="../images/java-icon.png"
							alt="">
						</label>
						<label> <img src="../images/html-icon.png"
							alt="">
						</label>
						<label>
							 <img src="../images/c#-icon.png"
							alt="">
						</label>
						<label> <img src="../images/php.png"
							alt="">
						</label>
						 <label> <img src="../images/python_icon.png"
							alt="">
						</label>
						<label>  <img src="../images/c++_icon.png"
							alt="">
						</label>
						<label>  <img src="../images/c++_icon.png"
							alt="">
						</label>
						<label> <img src="../images/java-script-icon.png"
							alt="">
						</label>
						<label>  <img src="../images/mysql-icon.png"
							alt="">
						</label>
						<label> <img src="../images/c-icon.png"
							alt="">
						</label>
						<label>  <img src="../images/django.png"
							alt="">
						</label>
						<label>  <img src="../images/java-icon.png"
							alt="">
						</label>
						<label> <img src="../images/java-icon.png"
							alt="">
						</label>
						<label> <img src="../images/html-icon.png"
							alt="">
						</label>
						<label>
							 <img src="../images/c#-icon.png"
							alt="">
						</label>
						<label> <img src="../images/php.png"
							alt="">
						</label>

                    </div>
                    
                     <form:input path="frames" name="bio" id="" cols="40" rows="10"
                            placeholder="add framworks here..." required="true"/>
                            
                   </div>

                    <div class="description_frameworks">
                    
                    	<div class="bio">
                    		
                    		<h2><c:out value="${sessionScope.user.bio}"/></h2>
                    	</div>

                        <div class="list_position" style="margin-top: 20px;">

                            <button class="button-63" role="button" type="submit" ><span class="text">Complete Profile</span></button>
        
                        </div>

                    </div>
                    
                </div>
                
                </form:form>

            </div>

		
</body>
</html>