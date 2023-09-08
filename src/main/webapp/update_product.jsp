<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
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

.container {
	max-width: 600px;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h2 {
	font-size: 24px;
	color: #333;
	margin-top: 0;
}

label {
	display: block;
	margin-top: 10px;
	font-weight: bold;
}

input[type="text"], input[type="url"], textarea, select {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

input[type=checkbox] {
          accent-color: black;
        }

select {
	height: 36px;
}

label[for="vegetarian"] {
	display: inline-block;
	margin-right: 10px;
	font-weight: normal;
}

button[type="submit"] {
	background-color: #000;
	color: #fff;
	border: none;
	padding: 10px 20px;
	margin-top: 20px;
	cursor: pointer;
	font-size: 18px;
}

button[type="submit"]:hover {
	background-color: #fff;
	color: #000;
	border: 1px solid black;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h2>Update Product</h2>

		<%
		ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("productDetails");
		%>

		<form action="update?productid=<%=product.getId()%>" method="POST">
			<label for="productName">Product Name</label> <input type="text"
				id="productName" name="productName" value="<%=product.getName()%>"
				required> <label for="description">Description</label>
			<textarea id="description" name="description" rows="4" required><%=product.getDescription()%></textarea>

			<label for="category">Category</label> <select id="category"
				name="category" required>
				<option value=1
					<%if (product.getCategoryId() == 1)
	out.print("selected");%>>Cake</option>
				<option value=2
					<%if (product.getCategoryId() == 2)
	out.print("selected");%>>Bread</option>
				<option value=3
					<%if (product.getCategoryId() == 3)
	out.print("selected");%>>Breakfast
					pastry</option>
			</select> <label for="imageUrl">Image URL</label> <input type="url"
				id="imageUrl" name="imageUrl" value="<%=product.getImageUrl()%>"
				required> <label for="vegetarian">Vegetarian Option</label>
			<input type="checkbox" id="vegetarian" name="vegetarian"
				<%if (product.isVeg())
	out.print("checked");%>>

			<div>
				<button type="submit">Update</button>
			</div>
		</form>
	</div>

</body>
</html>