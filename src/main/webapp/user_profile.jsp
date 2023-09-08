<%@page import="in.fssa.homebakery.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

header {
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
    background-color: white;
}

.profile_container {
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	width: 400px;
	border-radius: 5px;
	text-align: center;
}

h2 {
	font-size: 24px;
	margin-bottom: 20px;
}

.profile_details {
	text-align: left;
}

h4 {
	font-weight: bold;
	font-size: 18px;
}

p {
	font-size: 16px;
	margin: 5px 0;
}

.button_container {
	margin-top: 20px;
}

.button_container button {
	background-color: black;
	color: #fff;
	border: none;
	border-radius: 4px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	margin-right: 10px;
}

.button_container button:last-child {
	background-color: #fff;
	color: black;
	border: 1px solid black;
}

.button_container button:hover {
	background-color: white;
	color: black;
	border: 1px solid black;
}

.button_container button:last-child:hover {
	background-color: black;
	color: white;
	border: 1px solid black;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	User loggedUser = (User) request.getSession().getAttribute("logged user");
	%>
	<div class="profile_container">
		<h2>PROFILE DETAILS</h2>
		<div class="profile_details">
			<div>
				<h4>FIRST NAME</h4>
				<p><%=loggedUser.getFirstName() %></p>
			</div>
			<div>
				<h4>LAST NAME</h4>
				<p><%=loggedUser.getLastName() %></p>
			</div>
			<div>
				<h4>EMAIL</h4>
				<p><%=loggedUser.getEmail()%></p>
			</div>
			<div>
				<h4>PHONE</h4>
				<p><%=loggedUser.getPhoneNo()%></p>
			</div>
		</div>
		<div class="button_container">
			<a href = "profile/edit?userid=<%=loggedUser.getId()%>"><button>Edit</button></a>
			<a href = "profile/logout"><button>Log Out</button></a>
		</div>
	</div>
</body>
</html>