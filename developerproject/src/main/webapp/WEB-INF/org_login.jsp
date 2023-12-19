<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OrgLogin</title>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	<div class="whole">

        <div class="navbar">

            <h1><a href="/">Devs On Deck</a></h1>

        </div>

        <div class="headings2">

            <h3>Welcome Back!</h3>

            <h4>Lets Find You Some Candidates</h4>

        </div>

        <div class="logins">
        
    		<a href="/login" id="homebutton" class="button">Dev Login</a>
    
   	 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    		<a href="/login/organization" id="homebutton" class="button">Org Login</a>
    
		</div>

         <form:form id="loginform"  action="/home" method="get" modelAttribute="newLoginOrganization">

            <div class="labels2">

                <h3><label for="email" id="email3">Email:</label></h3>

                <h3><label for="password">Password:</label></h3>

            </div>

            <div class="fields">

                <p><input type="email" size="50" id="email_input"></p>

                <p><input type="password" id="password_input" size="50"></p>

            </div>

        

        <div class="button_reg">
                        
            <button class="button-49" role="button" value="Login" type="submit" style="margin-top:30px">org Login</button>

        </div>
        </form:form>

        

        
        
        

    </div>

</body>
</html>