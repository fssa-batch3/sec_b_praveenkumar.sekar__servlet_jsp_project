<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<style>
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	    <div class="form-container">
        <form action = "register/create" method = "post">
            <img src="https://iili.io/J975QMQ.md.jpg" width="100px" alt="logo">
            <h1>Register</h1>
            <div class="first_name">
                <label for="firstName">First Name:</label>
                <br>
                <input type="text" id="first_name" pattern="[a-zA-Z]+"
                    title="Use only aplabets. Exclude spaces and special characters" value="John" name = "firstName" required>
                <br>
                <br>
            </div>
            <div class="last_name">
                <label for="lastName">Last Name:</label>
                <br>
                <input type="text" id="last_name" pattern="[a-zA-Z]+"
                    title="Use only aplabets. Exclude spaces and special characters" value="Doe" name = "lastName" required>
                <br>
                <br>
            </div>
            <div class="phone">
                <label for="phoneNo">Phone Number:</label>
                <br>
                <input type="tel" id="phone" pattern="[0-9].{9}"
                    title="Use only numbers. Exclude spaces and special characters. You must enter 10 characters"
                    value="9345209293"  name = "phoneNo" min="6000000000" required>
                <br>
                <br>
            </div>
            <div class="email">
                <label for="email">Email:</label>
                <br>
                <input type="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
                    value="johndoe123@gmail.com" name = "email" required>
                <br>
                <br>
            </div>
            <div class="password">
                <label for = "password">Password:</label>
                <br>
                <input type="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                    title="Password must contain(Uppercase, Lowercase, Special character, Number) and min 8 characters."
                    value="John@123" name = "password" required>
                <br>
                <br>
            </div>
            <div class="submit">
                <button type="submit">Register</button>
            </div>
            <br>
            <a href="<%=request.getContextPath()%>/login">
                <p>Already have an account? Sign in</p>
            </a>
        </form>
    </div>
</body>
</html>