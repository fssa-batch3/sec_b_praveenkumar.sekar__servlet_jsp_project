<%@page import="in.fssa.homebakery.model.User"%>
<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="in.fssa.homebakery.model.Product"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@page import="in.fssa.homebakery.dto.OrderDetailDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Detail</title>
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/normalize.css">
<link rel="stylesheet" href="./assets/css/footer.css">
<link rel="stylesheet" href="./assets/css/order_detail.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	OrderDetailDTO order = (OrderDetailDTO) request.getAttribute("order");
	User user = (User)request.getAttribute("user");
	int categoryId = order.getProduct().getCategoryId();
	ProductDetailDTO product = order.getProduct();
	ProductPrice price = order.getProductPrice();
	double total = order.getQuantity() * price.getPrice();
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
            </a><a href="profile/logout">
				<div>
					<h4>LOG OUT</h4>
				</div>
			</a>
		</div>
		<section class="main_content" id="main">
			<div class="head">
				<h2>ORDER DETAILS</h2>
			</div>
			<div class="order_detail">
				<div class="detail_head">
					<h4 id="order_id_h4">ORDER ID: <%=order.getId()%></h4>
					<p id="delivery_stat"><%=order.getStatus()%></p>
				</div>
				<div class="detail_main">
					<div class="delivery_time">
						<h3>ITEMS</h3>
						<h4 id="delivery_date">Delivered On: --</h4>
					</div>
					<div class="details_body" id="details_body">
						<div>
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
							<p>RS <%= total %></p>
						</div>
					</div>
					<div class = "total">
						<div>
							<h4>TOTAL</h4>
							<h4>RS <%= total %></h4>
						</div>
					</div>
					<div class="delivered_to">
						<div class="del_head">
							<h3>DELIVERED TO</h3>
							<h4><%=user.getFirstName()%></h4>
						</div>
						<div>
							<P>
								<%= order.getAddress() %>
							</P>
						</div>
					</div>
					<%if(order.getStatus()!= "CANCELLED"){%>
					<div class="reorder">
						<a href="<%= request.getContextPath()%>/cancelorder?orderid=<%=order.getId()%>"><button style="font-size: 80%;">
							CANCEL ORDER
						</button>
						</a>
					</div>
					<%}%>
				</div>
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