<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

/* Container styling */
.container {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	display: flex;
	flex-direction: column;
	align-items: center; /* Center the form horizontally */
	justify-content: center; /* Center the form vertically */
	font-family: Arial, sans-serif;
	width: 300px; /* Adjust the width as needed */
	margin: 0 auto;
	padding: 20px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Header styling */
h2 {
	text-align: center;
	color: #333;
}

/* Form styling */
form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

label {
	margin-top: 10px;
	color: #333;
}

input[type="number"] {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 3px;
	outline: none;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	margin-top: 10px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Update Price</h2>

		<%
		ProductPrice price = (ProductPrice) request.getAttribute("priceDetails");
		int productid = Integer.parseInt(request.getParameter("productid"));
		%>

		<form action="update?priceid=<%=price.getId()%>&productid=<%=productid%>" method="POST">
			<label for="price">Price</label> <input type="number" id="price"
				name="price" value="<%=price.getPrice()%>" required> <label
				for="quantity">Quantity</label> <input type="number" id="quantity"
				name="quantity" value="<%=price.getQuantity()%>" disabled>

			<button type="submit">Update</button>
		</form>
	</div>
</body>
</html>