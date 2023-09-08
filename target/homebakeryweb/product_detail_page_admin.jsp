<!DOCTYPE html>
<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.product_details {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 20px;
	margin: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.product_details img {
	max-width: 100%;
	height: auto;
}

.details {
	flex-direction: column;
	align-items: center;
	text-align: center;
	flex-grow: 1;
	padding: 20px 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin: 20px;
}

.details img {
	width: 300px;
	height: 300px;
	margin-bottom: 20px;
}

.details p {
	margin: 5px 0;
	font-size: 16px;
	font-weight: 600;
}

.prices {
	flex-grow: 1;
}

.prices h2 {
	margin: 10px;
}

.prices .table_head {
	display: flex;
	justify-content: space-between;
}

.prices .table_head button{
	margin-bottom: 10px;
	margin-right: 20px;
}

.prices table {
	width: 100%;
	border-collapse: collapse;
}

.prices th, .prices td {
	border: 1px solid #ccc;
	padding: 10px;
	text-align: center;
}

.prices th {
	background-color: #f0f0f0;
}

.prices button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

.prices button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<%
	ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("product");
	%>

	<div class="product_details">
		<div class="details">
			<img src="<%=product.getImageUrl()%>" width="300px" height="300px">

			<div>
				<p>
					PRODUCT NAME:
					<%=product.getName()%></p>
			</div>
			<div>
				<p>
					DESCRIPTION:
					<%=product.getDescription()%></p>
			</div>
			<%
			if (product.getCategoryId() == 1) {
			%>
			<div>
				<p>CATEGORY: Cake</p>
			</div>
			<%
			}
			%>
			<%
			if (product.getCategoryId() == 2) {
			%>
			<div>
				<p>CATEGORY: Bread</p>
			</div>
			<%
			}
			%>
			<%
			if (product.getCategoryId() == 3) {
			%>
			<div>
				<p>CATEGORY: Breakfast Pastry</p>
			</div>
			<%
			}
			%>
			<%
			if (product.isVeg() == true) {
			%>
			<div>
				<p>Veg: Yes</p>
			</div>
			<%
			}
			%>
			<%
			if (product.isVeg() == false) {
			%>
			<div>
				<p>Veg: No</p>
			</div>
			<%
			}
			%>
		</div>

		<div class="prices">
			<div class="table_head"> 
				<h2>Price History</h2>
				<button>Add Price</button>
			</div>
			<table>
				<tr>
					<th>Id</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Type</th>
					<th>Start Date</th>
					<th>End Date</th>
				</tr>

				<%
				List<ProductPrice> priceList = product.getPrices();
				for (ProductPrice price : priceList) {
				%>
				<tr>
					<td><%=price.getId()%></td>
					<td><%=price.getQuantity()%></td>
					<td><%=price.getPrice()%></td>
					<td><%=price.getType()%></td>
					<td><%=price.getStartDate()%></td>
					<td><%=price.getEndDate()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>

	</div>
	<div class="buttons">
		<a href="<%=request.getContextPath()%>/admin/product/edit?productid=<%=product.getId()%>"><button>Update
				Product Details</button></a> <a
			href="<%=request.getContextPath()%>/admin/product/prices?productid=<%=product.getId()%>"><button>Update
				Price Details</button></a>
	</div>
</body>
</html>
