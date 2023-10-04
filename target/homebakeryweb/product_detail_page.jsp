@@ -1,3 +1,6 @@
<%@page import="in.fssa.homebakery.model.User"%>
<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
@ -7,6 +10,10 @@
<meta charset="ISO-8859-1">
<title>Home Bakery</title>
<style>
* {
	font-family: aerial, sans-serif;
}

header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
@ -54,7 +61,7 @@ textarea {
/* --------side-------- */
.side {
	width: 40%;
	margin-top: 60px;
	margin-top: 10%;
	/* margin-left: auto; */
	/* margin-right: auto; */
}
@ -169,20 +176,20 @@ textarea {
	background-color: white;
}

.spec-buttons button:nth-of-type(1) {
.spec-buttons button:first-child {
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border: 2px black solid;
	border-right: 1px white solid;
}

.spec-buttons button:nth-of-type(2) {
.spec-buttons button {
	border: 2px black solid;
	border-right: 1px white solid;
	border-left: none;
}

.spec-buttons button:nth-of-type(3) {
.spec-buttons button:last-child {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 2px black solid;
@ -194,39 +201,136 @@ textarea {
	<jsp:include page="header.jsp"></jsp:include>
	<%
	ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("product");
	int categoryId = product.getCategoryId();
	User loggedUser = (User) request.getSession().getAttribute("logged user");
	%>
	<div class="whole">
		<section class="main">
			<div class="main_img">
				<img src="<%= product.getImageUrl() %>>" alt="">
				<img src="<%=product.getImageUrl()%>" alt="">
			</div>
		</section>
		<section class="side">
			<div class="side_para">
				<h1><%= product.getName() %></h1>
				<p><%= product.getDescription() %></p>
				<h1><%=product.getName()%></h1>
				<p><%=product.getDescription()%></p>
				<div class="price1">
					<p></p>
					<p>
						<%
						if (categoryId == 1) {
							// Find and display the default price for categoryId 1
							List<ProductPrice> prices = product.getPrices();
							if (prices != null && !prices.isEmpty()) {
								for (ProductPrice price : prices) {
							if (price.getEndDate() == null && price.getQuantity() == 1) {
						%>
						Price: Rs.
						<%=price.getPrice()%>
						<%
									}
								}
							}
						} else {
						List<ProductPrice> prices = product.getPrices();
						if (prices != null && !prices.isEmpty()) {
						for (ProductPrice price : prices) {
						if (price.getEndDate() == null && price.getQuantity() == 1) {
						%>
						Price: Rs.
						<%=price.getPrice()%>
						<%
									}
								}
							}
						}
						%>
					</p>
				</div>
				<%
				if (categoryId == 1) {
				%>
				<div class="spec">
					<h2>WEIGHT</h2>
					<div class="spec-buttons">
						<button class="weights" onclick="half_kg()" id="0">1/2Kg</button>
						<button class="weights" onclick="one_kg()" id="1">1Kg</button>
						<button class="weights" onclick="two_kg()" id="2">2Kg</button>
						<%
						List<ProductPrice> prices = product.getPrices();
						if (prices != null && !prices.isEmpty()) {
							for (int i = 0; i < prices.size(); i++) {
								ProductPrice price = prices.get(i);
								if (price.getEndDate() == null) {
						%>
						<button class="weights" id="<%=price.getId()%>"
							onclick="displayPrice('<%=price.getPrice()%>',<%=price.getId()%>)"><%=price.getQuantity()%>
							KG
						</button>
						<%
								}
							}
						}
						%>
					</div>
				</div>
				<div class="tarea">
					<textarea placeholder="Enter special message here" id="tarea"
						rows="4" cols="30"></textarea>
			</div>
			<div class="buttons">
			<%if (loggedUser != null) {%>
				<div class="add" data-id="">
					<a href="ordernow?productid=<%= product.getId()%>&priceid=" id="addToCartButton"><button>Add to cart</button></a>
				</div>
				<div class="add" data-id="">
					<a href="ordernow?productid=<%= product.getId()%>&priceid=" id="orderNowButton"><button>Order Now</button></a>
				</div>
			<%} else{%>
				<div class="add" data-id="">
					<a href="<%=request.getContextPath()%>/login"><button>Add to cart</button></a>
				</div>
				<div class="add" data-id="">
					<a href="<%=request.getContextPath()%>/login"><button>Order Now</button></a>
				</div>
			<%} %>
			</div>
			<%
			} else {
			List<ProductPrice> prices = product.getPrices();
			if (prices != null && !prices.isEmpty()) {
				for (int i = 0; i < prices.size(); i++) {
					ProductPrice price = prices.get(i);
					if (price.getEndDate() == null) {
			%>
			<div class="buttons">
				<div class="add" data-id="">
					<button id="add">Add to cart</button>
					<a href="ordernow?productid=<%=product.getId()%>&priceid=<%= price.getId()%>" id="orderNowButton"><button>Add to cart</button></a>
				</div>
				<div class="add" data-id="">
					<a href="ordernow?productid=<%=product.getId()%>&priceid=<%= price.getId()%>" id="orderNowButton"><button>Order Now</button></a>
				</div>
			</div>
			<%
						}
					}
				}
			}
			%>
		</section>
	</div>
	<script>
    function displayPrice(price, buttonId) {
        // Update the href of the "Add to cart" button based on the selected price
        var addToCartButton = document.getElementById('addToCartButton');
        var orderNowButton = document.getElementById("orderNowButton");
        addToCartButton.href = 'ordernow?productid=' + <%= product.getId()%> + '&priceid=' + buttonId;
        orderNowButton.href = 'ordernow?productid=' + <%= product.getId()%> + '&priceid=' + buttonId;
     	

        // Display the selected price
        document.querySelector('.price1 p').textContent = "Price: Rs. " + price;

        // Highlight the selected spec button (you can add CSS styles for this)
        var specButtons = document.querySelectorAll('.weights');
        specButtons.forEach(function(button) {
            button.classList.remove('selected');
        });
        document.getElementById(buttonId).classList.add('selected');
    }
</script>
</body>
</html>