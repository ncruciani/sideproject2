<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RegisterOrg</title>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	<div class="whole">

        <!--------------nav bar------------------ -->
        <div class="navbar">
            <h1>Devs On Deck</h1>

        </div>

        <div class="first_page_container">

            <div class="first_heading">

                <h2>Organization Sign Up</h2>

            </div>

            <div class="logins">

                <a href="/login" id="homebutton">Dev Login</a>
    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   					 <a href="/login/organization" id="homebutton">Org Login</a>

            </div>

            <div class="form_container">

                <form:form action="/register/organization" method="post" modelAttribute="newOrganization">

                    <!----------- First Name and Last Name ------------->

                    <div class="input">

                        <form:label path="name">Org Name:</form:label>

                        <form:input path="name" id="org_name" required="true" />

                    </div>

                    <div class="input">

                        <form:label path="firstName">First Name:</form:label>

                        <form:input path="firstName" type="text" id="first_name" required="true"/>

                        <form:label path="lastName">Last Name:</form:label>

                        <form:input path="lastName" type="text" id="last_name" required="true"/><br>

                    </div>

                    <div class="input">

                        <!-- Email -->
                        <form:label path="email">Contact Email:</form:label>

                        <form:input path="email" type="email" id="contact_email" required="true"/><br>

                    </div>

                    <div class="input">

                        <!-- Address, City, and State -->
                        <form:label path="address">Org Address:</form:label>

                        <form:input path="address" id="org_address" required="true"/><br>

                    </div>

                    <div class="input">

                        <form:label path="city">City:</form:label>
                        <form:input path="city" type="text" id="city" required="true"/>


                        <form:label path="state">State:</form:label>
                       	<form:select path="state" id="state" required="true">
                            <option value="" disabled${state == '' ? 'selected' : ''}>Select State</option>
                            <option value="AL" ${state == 'AL' ? 'selected' : ''}>Alabama</option>
                            <option value="AK" ${state == 'AK' ? 'selected' : ''}>Alaska</option>
								<option value="AZ" ${state == 'AZ' ? 'selected' : ''}>Arizona</option>
								<option value="AR" ${state == 'AR' ? 'selected' : ''}>Arkansas</option>
								<option value="CA" ${state == 'CA' ? 'selected' : ''}>California</option>
								<option value="CO" ${state == 'CO' ? 'selected' : ''}>Colorado</option>
								<option value="CT" ${state == 'CT' ? 'selected' : ''}>Connecticut</option>
								<option value="DE" ${state == 'DE' ? 'selected' : ''}>Delaware</option>
								<option value="FL" ${state == 'FL' ? 'selected' : ''}>Florida</option>
								<option value="GA" ${state == 'GA' ? 'selected' : ''}>Georgia</option>
								<option value="HI" ${state == 'HI' ? 'selected' : ''}>Hawaii</option>
								<option value="ID" ${state == 'ID' ? 'selected' : ''}>Idaho</option>
								<option value="IL" ${state == 'IL' ? 'selected' : ''}>Illinois</option>
								<option value="IN" ${state == 'IN' ? 'selected' : ''}>Indiana</option>
								<option value="IA" ${state == 'IA' ? 'selected' : ''}>Iowa</option>
								<option value="KS" ${state == 'KS' ? 'selected' : ''}>Kansas</option>
								<option value="KY" ${state == 'KY' ? 'selected' : ''}>Kentucky</option>
								<option value="LA" ${state == 'LA' ? 'selected' : ''}>Louisiana</option>
								<option value="ME" ${state == 'ME' ? 'selected' : ''}>Maine</option>
								<option value="MD" ${state == 'MD' ? 'selected' : ''}>Maryland</option>
								<option value="MA" ${state == 'MA' ? 'selected' : ''}>Massachusetts</option>
								<option value="MI" ${state == 'MI' ? 'selected' : ''}>Michigan</option>
								<option value="MN" ${state == 'MN' ? 'selected' : ''}>Minnesota</option>
								<option value="MS" ${state == 'MS' ? 'selected' : ''}>Mississippi</option>
								<option value="MO" ${state == 'MO' ? 'selected' : ''}>Missouri</option>
								<option value="MT" ${state == 'MT' ? 'selected' : ''}>Montana</option>
								<option value="NE" ${state == 'NE' ? 'selected' : ''}>Nebraska</option>
								<option value="NV" ${state == 'NV' ? 'selected' : ''}>Nevada</option>
								<option value="NH" ${state == 'NH' ? 'selected' : ''}>New Hampshire</option>
								<option value="NJ" ${state == 'NJ' ? 'selected' : ''}>New Jersey</option>
								<option value="NM" ${state == 'NM' ? 'selected' : ''}>New Mexico</option>
								<option value="NY" ${state == 'NY' ? 'selected' : ''}>New York</option>
								<option value="NC" ${state == 'NC' ? 'selected' : ''}>North Carolina</option>
								<option value="ND" ${state == 'ND' ? 'selected' : ''}>North Dakota</option>
								<option value="OH" ${state == 'OH' ? 'selected' : ''}>Ohio</option>
								<option value="OK" ${state == 'OK' ? 'selected' : ''}>Oklahoma</option>
								<option value="OR" ${state == 'OR' ? 'selected' : ''}>Oregon</option>
								<option value="PA" ${state == 'PA' ? 'selected' : ''}>Pennsylvania</option>
								<option value="RI" ${state == 'RI' ? 'selected' : ''}>Rhode Island</option>
								<option value="SC" ${state == 'SC' ? 'selected' : ''}>South Carolina</option>
								<option value="SD" ${state == 'SD' ? 'selected' : ''}>South Dakota</option>
								<option value="TN" ${state == 'TN' ? 'selected' : ''}>Tennessee</option>
								<option value="TX" ${state == 'TX' ? 'selected' : ''}>Texas</option>
								<option value="UT" ${state == 'UT' ? 'selected' : ''}>Utah</option>
								<option value="VT" ${state == 'VT' ? 'selected' : ''}>Vermont</option>
								<option value="VA" ${state == 'VA' ? 'selected' : ''}>Virginia</option>
								<option value="WA" ${state == 'WA' ? 'selected' : ''}>Washington</option>
								<option value="WV" ${state == 'WV' ? 'selected' : ''}>West Virginia</option>
								<option value="WI" ${state == 'WI' ? 'selected' : ''}>Wisconsin</option>
								<option value="WY" ${state == 'WY' ? 'selected' : ''}>Wyoming</option>

                            <!-- Add more states as needed -->
                        </form:select> <br>

                    </div>

                    <div class="input">

                        <!-- Password and Confirm Password -->
                        <form:label path="password">Password:</form:label>
                        <form:input path="password" type="password" id="password" required="true"/>

                    </div>

                    <div class="input">

                        <form:label path="confirm" type="password">Confirm: </form:label>
                        <form:input path="confirm" type="password" id="confirm_password" required="true"/><br>

                    </div>

                    <!-- Submit Button -->

                    <div class="button_reg" style="margin-top:30px ;">
                        
                    <button class="button-49" role="button" value="register" type="submit">Register</button>

                    </div>
                    
                    </form:form>
                    
            </div>

            <div class="bottomlink">

                <a id="bottomlink" href="/">Need to Sign Up as a Developer?</a>

            </div>

        </div>

    </div>

</body>
</html>