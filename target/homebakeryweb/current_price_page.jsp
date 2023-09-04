<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
/* Style the table */
table {
	width: 100%;
	border-collapse: collapse;
	font-family: Arial, sans-serif;
}

/* Style table headers */
th {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: left;
}

/* Style even table rows */
tr:nth-child(even) {
	background-color: #f2f2f2;
}

/* Style odd table rows */
tr:nth-child(odd) {
	background-color: #fff;
}

/* Style table cells */
td {
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
<body>

	<table>
		<tr>
			<th>Id</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Type</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>

		<%
		List<ProductPrice> priceList = (List<ProductPrice>) request.getAttribute("prices");
		int productid = (int)request.getAttribute("productid");
		for (ProductPrice price : priceList) {
		%>
		<tr>
			<td><%=price.getId()%></td>
			<td><%=price.getQuantity()%></td>
			<td><%=price.getPrice()%></td>
			<td><%=price.getType()%></td>
			<td><%=price.getStartDate()%></td>
			<td><%=price.getEndDate()%></td>
			<td><a href="price/edit?priceid=<%=price.getId()%>&productid=<%=productid %>"><button>Update</button></a>
			</td>
			<td><a href="product/prices/edit?priceid=<%=price.getId()%>"><button>Delete</button></a>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>