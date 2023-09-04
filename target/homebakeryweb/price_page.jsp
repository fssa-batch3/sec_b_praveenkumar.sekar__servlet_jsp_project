<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Price History</title>
</head>
<style>
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

tr:nth-child(even) {
	background-color: #DDDDDD;
}

button {
	margin: 10px;
	cursor: pointer;
	outline: 0;
	color: #fff;
	background-color: #0d6efd;
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
	color: #fff;
	background-color: #0b5ed7;
	border-color: #0a58ca;
}

}
</style>
<body>

	<table style="width: 100%">
		<tr>
			<th>Id</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Type</th>
			<th>Start-date</th>
			<th>End-date</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>

	<%
	List<ProductPrice> priceList = (List<ProductPrice>) request.getAttribute("prices");
	for (ProductPrice price : priceList) {
	%>
		<tr>
			<td><%= price.getId() %></td>
			<td><%= price.getQuantity() %></td>
			<td><%= price.getPrice() %></td>
			<td><%= price.getType() %></td>
			<td><%= price.getStartDate() %></td>
			<td><%= price.getEndDate() %></td>
			<td>
				<button>Update</button>
			</td>
			<td>
				<button>Delete</button>
			</td>
		</tr>
		
	<%}%>
	</table>
</body>
</html>