<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add price</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center; /* Center horizontally */
	align-items: center; /* Center vertically */
	min-height: 100vh;
}

header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
	background-color: white;
}

.container {
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-width: 600px; /* Adjust the width as needed */
	border-radius: 5px;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-bottom: 5px;
	color: #555;
}

input[type="number"], select {
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

select {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background: url('down-arrow.png') no-repeat;
	background-position: right center;
	background-size: 20px;
	padding-right: 30px;
}

button[type="submit"] {
	background-color: #000;
	color: #fff;
	border: none;
	border-radius: 4px;
	padding: 10px;
	font-size: 16px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #fff;
	color: #000;
	border: 1px solid black;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	int id = Integer.parseInt(request.getParameter("productid"));
	%>
	<div class="container">
		<h2>Add a New Price</h2>
		<form action="create?productid=<%=id%>" method="post">
			<label for="quantity">Quantity</label> <input type="number"
				name="quantity" min="1" required> <label for="type">Quantity
				Type</label> <select name="type" required>
				<option value="KG">KG</option>
				<option value="NOS">NOS</option>
			</select> <label for="price">Price</label> <input type="number" name="price"
				min="1" required>

			<button type="submit">SUBMIT</button>
		</form>
	</div>
</body>
</html>