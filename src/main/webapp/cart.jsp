<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" href="./assets/css/footer.css">
<link rel="stylesheet" href="./assets/css/cart.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="full" id="blur">
		<h1>CART</h1>
		<div class="main">
			<section>
				<H2>PRODUCTS</H2>
				<!-- product 1 -->
				<div class="product-container">

					<!-- test -->
					<div class="products">
						<div class="img">
							<img src="https://iili.io/HgwiBat.png" alt="Product Image">
						</div>
						<div class="prod_details">
							<h3>Cake</h3>
							<div class="prod_att">
								<small>1/2Kg</small> <small>Price: 500</small>
								<button class="remove">Remove</button>
								<h4>Special Message</h4>
								<p>Happy birthday Deepika</p>
								<button class="edit_msg_btn" onclick="toggle()">Edit</button>
							</div>
						</div>
						<div class="quantity">
							<input class="inp" type="number" min="1"
								value="cart_of_user[i].quantity">
						</div>
						<div class="price">
							<p>Price: 500</p>
						</div>
					</div>

					<!-- Test end -->

				</div>
			</section>
			<aside>
				<div class="summary-whole">
					<h2>SUMMARY</h2>
					<div class="summary">
						<div class="time">
							<h3>DELIVERY DATE & TIME</h3>
							<input type="date" id="del_date"> <select id="del_time">
								<option id="standard" value="0">Select Delivery Time</option>
								<option id="standard" value="1">Delivery Now (within 60
									mins)</option>
								<option id="morning" value="2">10:00 AM - 12:00 PM</option>
								<option id="afternoon" value="3">12:00 PM - 04:00 PM</option>
								<option id="evening" value="4">04:00 PM - 07:00 PM</option>
								<option id="night" value="5">07:00 AM - 11:00 PM</option>
							</select>
						</div>
						<div class="address">
							<h3>ADDRESS</h3>
						</div>
						<div class="total">
							<b>SUB-TOTAL :&nbsp;</b>
							<p id="sub"></p>
						</div>
						<div class="total">
							<b>TAX :&nbsp;</b>
							<p id="tax"></p>
						</div>
						<div class="total">
							<b>TOTAL :&nbsp;</b>
							<p id="total"></p>
						</div>
						<div class="order">
							<button id="order">ORDER</button>
						</div>
					</div>
				</div>
			</aside>
		</div>
	</div>
	<div id="popup">
		<h3>EDIT SPECIAL MESSAGE</h3>
		<textarea rows="3" cols="25" id="cake_msg">

        </textarea>
		<br>
		<button onclick="toggle();new_msg()" id="spl_msg _confirm">Confirm</button>
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
					<li><a href="https://www.instagram.com/"> <img
							src="../../assets/Images/instagram.svg" width="40px"
							alt="Instagram">Instagram
					</a></li>
					<li><a href="https://twitter.com/"> <img
							src="../../assets/Images/twitter.svg" width="40px" alt="Twitter">Twitter
					</a></li>
					<li><a href="https://github.com/"> <img
							src="../../assets/Images/github.svg" width="40px" alt="GitHub">GitHub
					</a></li>
				</ul>
			</div>
		</div>
	</footer>
</body>
</body>
</html>