<%@page import="java.util.Set"%>
<%@page import="in.fssa.homebakery.model.User"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get all users</title>
</head>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #DDDDDD;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #DDDDDD;
}

button {
	margin: 10px;
	cursor: pointer;
	outline: 0;
	color: #fff;
	background-color: #0d6efd;
	border-color: #0d6efd;
	display: inline-block;
	font-weight: 400;
	line-height: 1.5;
	text-align: center;
	border: 1px solid transparent;
	padding: 6px 12px;
	font-size: 16px;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

button:hover {
	color: #fff;
	background-color: #0b5ed7;
	border-color: #0a58ca;
}

}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	Set<User> userList = (Set<User>)request.getAttribute("users");
	%>

	<a href="user/new"><button>Add User</button></a>

	<table style="width: 100%">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Phone Number</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>

		<% 
		for (User user : userList) {
		%>
		<tr>
			<td><%=user.getFirstName()%></td>
			<td><%=user.getLastName()%></td>
			<td><%=user.getEmail()%></td>
			<td><%=user.getPhoneNo()%></td>
			<td>
				<a href = "user/edit?userid=<%=user.getId()%>"><button>Update</button></a>
			</td>
			<td>
				<button>Delete</button>
			</td>
		</tr>

		<%
		}
		%>
	</table>

</body>
</html>