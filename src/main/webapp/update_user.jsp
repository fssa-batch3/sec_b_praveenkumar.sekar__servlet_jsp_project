<%@page import="in.fssa.homebakery.model.User"%>
<%@page import="in.fssa.homebakery.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<style>
	* {
    padding: 0;
    margin: 0;
}

h1 {
    font-family: 'Catamran', sans-serif;
}

h2 {
    font-family: 'Catamaran', sans-serif;
}

p {
    font-family: 'Telex', sans-serif;
}

label {
    font-family: 'Catamaran', sans-serif;
}

button {
    font-family: 'Telex', sans-serif;
}

body {
    background-color: white;
}

header {
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
    background-color: white;
}

.form-container {
    display: flex;
    /* height: 100vh; */
}

form {
    display: flex;
    flex-direction: column;
    width: 450px;
    border-radius: 5px;
    position: relative;
    margin: 10% auto 5% auto;
    background:  white;
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
    font-size: 16px;
    margin: 10px 0 0 37px;
    border:none;
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

form div:nth-of-type(6) {
    display: flex;
}

form button {
    background-color: white;
    border: 1px solid black;
    border-radius: 5px;
    margin: auto;
    margin-left: 18%;
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
        border:none;
        border-bottom: 2px solid black;
        width: 70%;
        padding: 5px;
    }
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
		<%
		User user = (User) request.getAttribute("userDetails");
		%>	
	<div class="form-container">
		<form action="update?userid=<%=user.getId()%>" method="POST">
            <img src="https://iili.io/J975QMQ.md.jpg" width="100px" alt="logo">
            <h1 style="margin:5%;">EDIT PROFILE</h1>
            <div class="first_name">
                <label for="firstName">First Name:</label>
                <br>
                <input type="text" name="firstName" value="<%=user.getFirstName()%>" id="first_name" pattern="[a-zA-Z0-9]+" required>
                <br>
                <br>
            </div>
            <div class="last_name">
                <label for="lastName">Last Name:</label>
                <br>
                <input type="text" id="last_name" name="lastName" value="<%=user.getLastName()%>" pattern="[a-zA-Z0-9]+" required>
                <br>
                <br>
            </div>
            <div class="phone">
                <label for="phoneNumber">Phone Number:</label>
                <br>
                <input type="tel" id="phoneNumber" name="phoneNumber" value="<%=user.getPhoneNo()%>" pattern="[0-9].{9}" readonly>
                <br>
                <br>
            </div>
            <div class="email">
                <label for="email">Email:</label>
                <br>
                <input type="email" id="email" name="email" value="<%=user.getEmail()%>" readonly>
                <br>
                <br>
            </div>
            <label style="display: none;" for="password" ></label>
            <input name = "password" type="hidden" value="<%=user.getPassword()%>">
            <div class="submit">
                <button type="submit">CONFIRM EDIT</button>
            </div>
        </form>
	</div>
</body>

</html>