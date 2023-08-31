<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add User</title>
</head>
<body>
	<form action = "create" method = "post">
		<label for="firstName">First Name</label>
		<input type = "text" name = "firstName" required/><br><br>
		
		<label for="lastName">Last Name</label>
		<input type = "text" name = "lastName" required/><br><br>
		
		<label for="email">Email</label>
		<input type = "email" name = "email" required/><br><br>
		
		<label for="password">password</label>
		<input type = "password" name = "password" required/><br><br>
		
		<label for="phoneNo">Phone Number</label>
		<input type = "tel" name = "phoneNo" required/><br><br>
		
		<button type = "submit">SUBMIT</button>
		
	</form>
</body>
</html>