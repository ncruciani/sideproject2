<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddLanguages</title>
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
    <div class="container_languages">
        <div class="skills_header2">
            <h3 id="pick_framework_heading2">Pick your Top 5 Languages</h3>
            <div class="added_lang_box">
                
            </div>
        </div>
        <form:form action="/language" method="post" id="add_language_form" modelAttribute="newUser">
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
                <div class="description_languages">
                    <h2>Short Bio</h2>
                    <form:textarea path="bio" name="bio" id="textbox" cols="40" rows="10" placeholder="Tell us more about yourself....." required="true"/>
                </div>
            </div>
            <div class="skills_text">
                <form:input path="skills" type="text" name="skills" placeholder="Enter your skills here" required="true"/>
            </div>
            <div class="bottom_buttons">
				<button class="button-62" role="button" type="submit" ><span class="text">Complete Profile</span></button>
			</div>
        </form:form>
    </div>
</div>

   

</body>
</html>