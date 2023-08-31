<%@page import="in.fssa.homebakery.model.User"%>
<%@page import="in.fssa.homebakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
</head>
<style>
 body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

.container {
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  width: 400px;
  padding: 30px;
  text-align: center;
}

h2 {
  margin-bottom: 20px;
  color: #333;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
  color: #555;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="password"] {
  width: 90%;
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 4px;
  transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="tel"]:focus,
input[type="password"]:focus {
  border-color: #007bff;
}

button {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  padding: 10px 20px;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #0056b3;
}

</style>
</head>
<body>
<div class="container">
  <h2>Update User</h2>
  
  <%User user = (User) request.getAttribute("userDetails"); %>
  
  <form action="update?userid=<%= user.getId() %>" method="POST">
    <label for="firstName">First Name</label>
    <input type="text" id="firstName" name="firstName" value =<%=user.getFirstName()%> required>

    <label for="lastName">Last Name</label>
    <input type="text" id="lastName" name="lastName" value =<%=user.getLastName()%> required>

    <label for="phoneNumber">Phone Number</label>
    <input type="tel" id="phoneNumber" name="phoneNumber" value =<%=user.getPhoneNo()%> required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" value =<%=user.getEmail()%> required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" value =<%=user.getPassword()%> required>
    
    <button type="submit">Update</button>
  </form>
</div>
</body>
</html>