<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@page import="in.fssa.homebakery.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.dto.OrderDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./assets/css/order_list.css">
<link rel="stylesheet" href="./assets/css/profile.css">
<link rel="stylesheet" href="./assets/css/footer.css">
<title>Bakery</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	List<OrderDetailDTO> orderList = (List<OrderDetailDTO>) request.getAttribute("orders");
	%>
	<div class="full">
		<div class="sidebar">
			<a href="../Profile/profile.html">
				<div id="account_details">
					<h4>ACCOUNT DETAILS</h4>
				</div>
			</a> <a href="../Profile/address_book.html">
				<div id="address_book">
					<h4>ADDRESS BOOK</h4>
				</div>
			<a href="orderlist">
                <div>
                    <h4>MY ORDERS</h4>
                </div>
            </a> <a href="profile/logout">
				<div>
					<h4>LOG OUT</h4>
				</div>
			</a>
		</div>
		<section class="main_content" id="main">
			<div class="head">
				<h2>MY ORDERS</h2>
			</div>
			<div class="orders">
				<%
				for (OrderDetailDTO order : orderList) {
				%>
				<%
				ProductDetailDTO product = order.getProduct();
				%>
				<%
				ProductPrice price = order.getProductPrice();
				%>
				<%
				double total = order.getQuantity() * price.getPrice();
				%>
				<div class="user_order">
					<div class="order_head">
						<div>
							<h4 style="width: 30rem;">
								ORDER PLACED : <span id="ordered_date_time"><%=order.getOrderedTime()%></span>
							</h4>
						</div>
						<div class="order_btn">
							<a href="<%= request.getContextPath()%>/order?orderid=<%=order.getId()%>"
								id="order_details_link">
								<button>View Details</button>
							</a>
						</div>
					</div>
					<div class="order_body">
						<h3>ITEMS</h3>
						<div class="order_main">
							<div class="items" id="items">
								<%
								if (product.getCategoryId() == 1) {
								%>
								<P><%=order.getQuantity()%>x
									<%=product.getName()%>
									<%=price.getQuantity()%>
									KG
								</P>
								<%
								} else {
								%>
								<P><%=order.getQuantity()%>x
									<%=product.getName()%></P>
								<%
								}
								%>
							</div>
							<div class="total">
								<h3>TOTAL</h3>
								<h3 id="total_amount"><%=total%></h3>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</section>
	</div>
	<footer>
		<div class="foot">
			<h2>HOME BAKERY</h2>
			<div class="list">
				<ul>
					<li>
						<h2>ABOUT</h2>
					</li>
					<li><a href="../../index.html">Homepage</a></li>
					<li><a href="../../../../index.html#about">About Us</a></li>
					<li><a href="../../../../index.html#history">Our History</a></li>
					<li><a href="../products/product_list.html">Products</a></li>
				</ul>
				<ul>
					<li>
						<h2>PRODUCTS</h2>
					</li>
					<li><a href="../products/product_list.html">Breads</a></li>
					<li><a href="../products/product_list.html">Cakes</a></li>
					<li><a href="../products/product_list.html">Breakfast
							Pastries</a></li>
				</ul>
				<ul>
					<li>
						<h2>FOLLOW US</h2>
					</li>
					<a href="https://www.instagram.com/">
						<li><img src="../../assets/Images/instagram.svg" width="40px"
							alt="instagram">Instagram</li>
					</a>
					<a href="https://twitter.com/">
						<li><img src="../../assets/Images/twitter.svg" width="40px"
							alt="twitter">Twitter</li>
					</a>
					<a href="https://github.com/">
						<li><img src="../../assets/Images/github.svg" width="40px"
							alt="GitHub">GitHub</li>
					</a>
				</ul>
			</div>
		</div>
	</footer>
</body>
</html>