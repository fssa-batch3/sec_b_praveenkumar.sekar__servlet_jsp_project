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

header {
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
    background-color: white;
}
/* Style the table */
table {
	width: 100%;
	border-collapse: collapse;
	font-family: Arial, sans-serif;
	margin-top: 7%;
}

/* Style table headers */
th {
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
	background-color: #000;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
}

button:hover {
	background-color: #fff;
	color: #000;
	border: 1px solid black;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
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
			<td><a href="price/delete?priceid=<%=price.getId()%>&productid=<%=productid %>""><button>Delete</button></a>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>