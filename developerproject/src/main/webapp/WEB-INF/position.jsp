<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Position</title>
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
        
        <div class="position_content">

            <div class="bar">

                <h2>Add A Position</h2>

            </div>

            <div class="form_position_container">

                <form:form id="position_form" action="/new/position" modelAttribute="positions" method="post">

                    <div class="labels_and_inputs">

                        <div class="position_labels">

                            <h3><form:label path="name" id="position_name">Name:</form:label></h3>

                            <h3><form:label path="description" id="position_description">Description:</form:label></h3>

                        </div>

                        <div class="position_fields">

                            <h4><form:input type="text" path="name" id="name_field"/></h4>

                            <form:input path="description" id="description_text" cols="30" rows="10"/>

                        </div>

                    </div>

                    <div class="skills_box">

                        <div class="skills_heading">

                            <h3><form:label path="skill" id="skills_heading2">Skills:</form:label></h3>

                        </div>

                        <div class="skills_content">
                            
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
            
                        </div>
                        
                        <div class="skills_text">
                			<form:input path="skill" type="text" name="skills" placeholder="Enter your skills here" required="true"/>
            			</div>
            			
            				<div class="add_position_button">

                				<button class="button-65" role="button" value="submit"><span class="text">List a New Position</span></button>
                
            				</div>
                        
                        </form:form>

                    </div>
                    
                    

            </div>

            

        </div>

</body>
</html>