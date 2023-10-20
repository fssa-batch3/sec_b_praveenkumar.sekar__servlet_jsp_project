<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
body {
	background-color: white;
	font-family: aerial, sans-serif;
}

header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
	background-color: white;
}

.form-container {
	display: flex;
	margin-bottom: 5%;
	height: 100vh;
}

form {
	display: flex;
	flex-direction: column;
	width: 450px;
	border-radius: 5px;
	margin: auto;
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

form div:nth-of-type(3) {
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

/* responsive */
@media only screen and (max-width:700px) {
	.form-container {
		width: 100%;
		padding-top: 40%;
		padding-bottom: 20%;
	}
	.form-container form {
		width: 70%;
	}
	.form-container form img {
		width: 50px;
	}
	.form-container form h1 {
		font-size: 20px;
	}
	form label {
		font-size: 16px;
		font-weight: 700;
		margin-left: 37px;
	}
	input[type="text"], input[type="password"] {
		appearance: none;
		background: none;
		margin: 10px 0 0 37px;
		border: none;
		border-bottom: 2px solid black;
		width: 70%;
		padding: 5px;
	}
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
		<form action="login" method="post">
			<img src="https://iili.io/J975QMQ.md.jpg" width="100px" alt="logo">
			<h1>Sign in</h1>
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
			<div class="email">
				<label for="email">Email:</label> <br> <input type="email"
					id="email" name="email"
					pattern="[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}"
					value="jane@example.com" required> <br> <br>
			</div>
			<div class="password">
				<label for="password">Password:</label> <br> <input
					type="password" id="password" name="password" value="Qwerty@123"
					required> <br> <br>
			</div>
			<div>
				<button type="submit">Log In</button>
			</div>
			<a href="#">
				<p>Forgot password?</p>
			</a> <a href="<%=request.getContextPath()%>/register">
				<p>Don't have an account? Register</p>
			</a>
		</form>
	</div>
</body>
</html>