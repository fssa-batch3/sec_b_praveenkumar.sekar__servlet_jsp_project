<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Bakery</title>
<style>
* {
	font-family: aerial, sans-serif;
}

header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
	background-color: white;
}

/*---------- main---------- */
.whole {
	width: 1200px;
	display: flex;
	/* grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr)); */
	gap: 10rem;
	margin: auto;
	margin-top: 10%;
	padding-bottom: 5%;
	border-bottom: 1px black solid;
}

.main {
	margin: 130px 70px 70px 70px;
	width: 50%;
}

.main img {
	border-radius: 5px;
	border: 2px black solid;
	background-color: white;
	width: 500px;
	height: 500px;
}

.thumbnail img {
	padding: 10px;
	border-radius: 20px;
	margin-top: 20px;
}

textarea {
	resize: none;
	border-radius: 5px;
	width: 269px;
	padding: 4px;
}

/* --------side-------- */
.side {
	width: 40%;
	margin-top: 60px;
	/* margin-left: auto; */
	/* margin-right: auto; */
}

.side_para h1 {
	color: black;
	font-size: 40px;
	margin-top: 10px;
}

.side_para .para {
	line-height: 25px;
	width: 450px;
	font-size: 20px;
	text-align: justify;
	text-justify: inter-word;
	color: black;
	margin-top: 10px;
}

.price1 {
	color: black;
	margin-top: 20px;
}

.price1 p {
	font-size: 30px;
	font-weight: bold;
}

.price1 p span {
	position: relative;
	bottom: 5px;
	font-size: 16px;
	margin-left: 10px;
	padding: 3px 10px;
	margin-bottom: 10px;
	color: white;
	background-color: black;
	border-radius: 5px;
}

.price2 {
	margin-top: 10px;
	color: black;
}

.buttons {
	margin-top: 20px;
	display: flex;
	color: black;
}

.amount button {
	font-weight: bold;
	letter-spacing: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	padding-right: 10px;
	margin-right: 20px;
	border: 2px solid black;
	border-radius: 5px;
	background-color: white;
}

.add button {
	font-weight: bold;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 50px;
	padding-right: 50px;
	margin-right: 20px;
	border: 2px solid black;
	border-radius: 5px;
	background-color: black;
	color: white;
	transition: 0.2s;
}

.add button:hover {
	color: black;
	background-color: white;
}

.spec {
	margin: 20px 0;
}

.spec-buttons {
	display: inline-flex;
	margin: 20px 0;
}

.spec-buttons button {
	padding: 20px 30px;
	outline: none;
	border: none;
	background-color: black;
	color: white;
	transition: 0.3s;
	border-right: 1px white solid;
}

.spec-buttons button:hover {
	color: black;
	background-color: white;
}

.spec-buttons button:focus {
	color: black;
	background-color: white;
}

.spec-buttons button:first-child {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border: 2px black solid;
	border-right: 1px white solid;
}

.spec-buttons button {
	border: 2px black solid;
	border-right: 1px white solid;
	border-left: none;
}

.spec-buttons button:last-child {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 2px black solid;
	border-left: none;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
        ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("product");
        int categoryId = product.getCategoryId();
    %>
	<div class="whole">
		<section class="main">
			<div class="main_img">
				<img src="<%=product.getImageUrl()%>" alt="">
			</div>
		</section>
		<section class="side">
			<div class="side_para">
				<h1><%=product.getName()%></h1>
				<p><%=product.getDescription()%></p>
				<div class="price1">
					<p></p>
				</div>

				<%
        if (categoryId == 1) {
    %>
				<div class="spec">
					<h2>WEIGHT</h2>
					<div class="spec-buttons">
						<%
                            List<ProductPrice> prices = product.getPrices();
                            if (prices != null && !prices.isEmpty()) {
                                for (int i = 0; i < prices.size(); i++) {
                                    ProductPrice price = prices.get(i);
                                    if (price.getEndDate() == null) {
                                        String buttonId = "priceButton" + i;
                        %>
						<button class="weights" id="<%=buttonId%>"
							onclick="displayPrice('<%=price.getPrice()%>')"><%=price.getQuantity()%>
							KG
						</button>
						<%
                                    }
                                }
                            }
                        %>
					</div>
				</div>
				<%}else{ %>
					<div class="price1">
					<%
                            List<ProductPrice> prices = product.getPrices();
                            if (prices != null && !prices.isEmpty()) {
                                for (int i = 0; i < prices.size(); i++) {
                                    ProductPrice price = prices.get(i);
                                    if (price.getEndDate() == null && price.getQuantity() == 1) {%>
                 						<p> Rs. <%=price.getPrice() %></p>
                                   <% }
                                }
                            }
                        %>
				</div>
					
				<%} %>
				<div class="tarea">
					<textarea placeholder="Enter special message here" id="tarea"
						rows="4" cols="30"></textarea>
				</div>
			</div>
			<div class="buttons">
				<div class="add" data-id="">
					<button id="add">Add to cart</button>
				</div>
			</div>
		</section>
	</div>
	<script>
		function displayPrice(price) {
			document.querySelector('.price1 p').textContent = "Price: Rs. "
					+ price;
		}
	</script>
</body>
</html>