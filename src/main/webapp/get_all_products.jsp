<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
<style>

* {
    padding: 0;
    margin: 0;
    scroll-behavior: smooth;
}

header {
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
    background-color: white;
}

.product1 {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(12rem, 1fr));
	gap: 10rem;
	row-gap: 2rem;
	width: 80%;
	place-items: center;
	margin: auto;
	margin-top: 5%;
	text-decoration: none;
	margin-bottom: 5%;
}

.product {
	margin-top: 50px;
	background-color: white;
	color: black;
	border-radius: 5px;
	padding: 30px 20px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px,
		rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
	transition: 0.2s;
}

.v_label {
	width: 30px;
	height: 30px;
	position: relative;
	bottom: 28px;
	left: 50px;
}

.img_size {
	height: 250px;
	width: 300px;
}

.product a {
	color: white;
	text-decoration: none;
}

.product:hover {
	background-color: white;
	color: black;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px 5px, rgba(0, 0, 0, 0.3)
		0px 8px 16px 8px;
}

.product p {
	margin-top: 10px;
	font-size: 20px;
}

.prod_button {
	position: relative;
	display: flex;
	margin: auto;
	padding: 7px 15px;
	text-align: center;
	font-size: 15px;
	letter-spacing: 1px;
	text-decoration: none;
	color: #000000;
	background: transparent;
	cursor: pointer;
	transition: ease-out 0.5s;
	border: 2px solid #000000;
	border-radius: 3px;
	box-shadow: inset 0 0 0 0 #000000;
}

.prod_button:hover {
	color: white;
	box-shadow: inset 0 -100px 0 0 #000000;
}

.prod_button:active {
	transform: scale(0.9);
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="product1">
		<%
		Set<ProductDetailDTO> productList = (Set<ProductDetailDTO>) request.getAttribute("products");
		for (ProductDetailDTO product : productList) {
			List<ProductPrice> priceList = product.getPrices();
			ProductPrice price = priceList.get(0);
		%>
		<div class="product">
			<h2><%= product.getName() %></h2>
			<p>Rs. <%=price.getPrice()%> </p>

			<img src="<%= product.getImageUrl() %>" alt="" class="img_size"> <a
				href="product?productid=<%= product.getId()%>">
				<button class="prod_button">Learn more</button>
			</a>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>