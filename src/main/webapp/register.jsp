<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

<style>

header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
	background-color: white;
}

.form-container {
	display: flex;
	/* height: 100vh; */
	font-family: aerial, sans-serif;
}

form {
	display: flex;
	flex-direction: column;
	width: 450px;
	border-radius: 5px;
	position: relative;
	margin: 10% auto 5% auto;
	background: white;
	padding: 5px 5px 20px 5px;
	box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
}

form img {
	margin: auto;
}

form h1 {
	text-align: center;
	font-weight: 100;
}

form label {
	font-size: 18px;
	font-weight: normal;
	margin-left: 37px;
}

form input {
	appearance: none;
	background: none;
	margin: 10px 0 0 37px;
	border: none;
	border-bottom: 1px solid black;
	width: 365px;
	padding: 5px;
}

form input:focus {
	outline: none;
}

form input:focus:invalid {
	border: 1px red solid;
}

form div:nth-of-type(7) {
	display: flex;
}

form button {
	background-color: white;
	border: 1px solid black;
	border-radius: 5px;
	margin: auto;
	margin-bottom: 10px;
	padding: 7px 90px;
	transition: 0.2s;
}

form button:hover {
	background-color: black;
	color: white;
}

form a {
	margin: auto;
	text-align: center;
	padding-top: 5px;
	text-decoration: none;
	color: black;
}

.alert {
	position: relative;
	top: 10;
	left: 0;
	width: auto;
	height: auto;
	padding: 10px;
	margin: 10px;
	margin-right: 50px;
	line-height: 1.8;
	border-radius: 5px;
	cursor: hand;
	cursor: pointer;
	font-family: sans-serif;
	font-weight: 400;
}

.alertCheckbox {
	display: none;
}

:checked+.alert {
	display: none;
}

.alertText {
	display: table;
	margin: 0 auto;
	text-align: center;
	font-size: 16px;
}

.alertClose {
	float: right;
	padding-top: 5px;
	font-size: 10px;
}

.clear {
	clear: both;
}

.error {
	background-color: #FEE;
	border: 1px solid #EDD;
	color: #A66;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	String error = (String) request.getAttribute("errormsg");
	%>
	<div class="form-container">
		<form action="register/create" method="post">
			<img src="https://iili.io/J975QMQ.md.jpg" width="100px" alt="logo">
			<h1>Register</h1>
			<%
			if (error != null && !error.isEmpty()) {
			%>
			<label> <input type="checkbox" class="alertCheckbox"
				autocomplete="off" />
				<div class="alert error">
					<span class="alertClose">X</span> <span class="alertText"><%=error%><br
						class="clear" /> </span>
				</div>
			</label>
			<%
			}
			%>
			<div class="first_name">
				<label for="firstName">First Name:</label> <br> <input
					type="text" id="first_name" pattern="[a-zA-Z]+"
					title="Use only aplabets. Exclude spaces and special characters"
					value="John" name="firstName" required> <br> <br>
			</div>
			<div class="last_name">
				<label for="lastName">Last Name:</label> <br> <input
					type="text" id="last_name" pattern="[a-zA-Z]+"
					title="Use only aplabets. Exclude spaces and special characters"
					value="Doe" name="lastName" required> <br> <br>
			</div>
			<div class="phone">
				<label for="phoneNo">Phone Number:</label> <br> <input
					type="tel" id="phone" pattern="[0-9].{9}"
					title="Use only numbers. Exclude spaces and special characters. You must enter 10 characters"
					value="9345209293" name="phoneNo" min="6000000000" required>
				<br> <br>
			</div>
			<div class="email">
				<label for="email">Email:</label> <br> <input type="email"
					id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
					value="johndoe123@gmail.com" name="email" required> <br>
				<br>
			</div>
			<div class="password">
				<label for="password">Password:</label> <br> <input
					type="password" id="password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Password must contain(Uppercase, Lowercase, Special character, Number) and min 8 characters."
					value="John@123" name="password" required> <br> <br>
			</div>
			<div class="confirm_password">
        		<label for="confirm_password">Confirm Password:</label> <br>
        		<input type="password" id="confirm_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must match the one above." name="confirmPassword" required>
        		<br> <br>
    		</div>
			<div class="submit">
				<button type="submit">Register</button>
			</div>
			<br> <a href="<%=request.getContextPath()%>/login">
				<p>Already have an account? Sign in</p>
			</a>
		</form>
	</div>
</body>
</html>