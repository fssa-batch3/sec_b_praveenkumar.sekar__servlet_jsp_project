<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Product List</title>
<style>

*{
	padding: 0;
	margin: 0;
}
header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
	background-color: white;
}

.add-btn {
	margin-top: 8%;
}

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

button {
	margin: 10px;
	cursor: pointer;
	outline: 0;
	color: #fff;
	background-color: #000;
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
	color: #000;
	background-color: #fff;
	border-color: #000;
}
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class = "add-btn">
		<a href="product/new"><button>Add Product</button></a>
	</div>

	<table style="width: 100%">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Description</th>
			<th>Is Veg</th>
			<th>Type</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>View Details</th>
			<th>Delete</th>
		</tr>

		<%
		Set<ProductDetailDTO> productList = (Set<ProductDetailDTO>) request.getAttribute("products");
		for (ProductDetailDTO product : productList) {
			List<ProductPrice> priceList = product.getPrices();
			ProductPrice price = priceList.get(0);
		%>
		<tr>
			<td><%=product.getId()%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getDescription()%></td>
			<td><%=product.isVeg()%></td>
			<td><%=price.getType()%></td>
			<td><%=price.getQuantity()%></td>
			<td><%=price.getPrice()%></td>
			<td><a
				href="<%=request.getContextPath()%>/admin/product?productid=<%=product.getId()%>"><button>View
						Details</button></a></td>
			<td><a
				href="<%=request.getContextPath()%>/admin/product/delete?productid=<%=product.getId()%>"><button>Delete</button></a>
			</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>