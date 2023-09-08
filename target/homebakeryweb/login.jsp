<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	background-color: white;
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
	padding-top: 10px;
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
	form input {
		appearance: none;
		background: none;
		margin: 10px 0 0 37px;
		border: none;
		border-bottom: 2px solid black;
		width: 70%;
		padding: 5px;
	}
}
</style>
</head>
<body>
	<div class="form-container">
		<form role="form" onsubmit="signIn(event);">
			<img
				src="../../assets/Images/v1033-a-15-a-removebg-preview - Copy.svg"
				width="100px" alt="logo">
			<h1>Sign in</h1>
			<div class="email">
				<label>Email:</label> <br> <input type="email" id="email"
					value="johndoe123@gmail.com"> <br> <br>
			</div>
			<div class="password">
				<label>Password:</label> <br> <input type="password"
					id="password" value="John@123"> <br> <br>
			</div>
			<div>
				<button type="submit">Log In</button>
			</div>
			<a href="#">
				<p>Forgot password?</p>
			</a> <br> <a>
				<p>Don't have an account? Register</p>
			</a>
		</form>
	</div>
</body>
</html>