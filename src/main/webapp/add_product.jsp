<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
	background-color: white;
}

.container {
	width: 400px;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	margin-top: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	color: #333;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
	color: #333;
}

input[type="text"], input[type="number"], textarea, select, input[type="url"],
	input[type="checkbox"] {
	width: 95%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
}

select {
	height: 40px;
	width: 100%;
}

input[type="checkbox"] {
	width: auto;
}

button[type="submit"] {
	background-color: #007BFF;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h2>Add a New Product</h2>
		<form action="create" method="post">
			<label for="name">Product Name</label> <input type="text" name="name"
				required> <label for="description">Description</label>
			<textarea name="description" required></textarea>

			<label for="category">Category</label> <select name="category"
				required>
				<option value="1">Cake</option>
				<option value="2">Bread</option>
				<option value="3">Breakfast Pastry</option>
			</select> <label for="isVeg">Is Vegetarian?</label> <input type="checkbox"
				name="isVeg"> <label for="imageUrl">Image URL</label> <input
				type="url" name="imageUrl" required> <label for="quantity">Quantity</label>
			<input type="number" name="quantity" min="1" required> <label
				for="type">Quantity Type</label> <select name="type" required>
				<option value="KG">KG</option>
				<option value="NOS">NOS</option>
			</select> <label for="price">Price</label> <input type="number" name="price"
				min="1" required>
			<button type="submit">SUBMIT</button>
		</form>
	</div>
</body>
</html>