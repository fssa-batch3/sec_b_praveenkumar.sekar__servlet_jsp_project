<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Now</title>
<link rel="stylesheet" href="./assests/css/footer.css">
<link rel="stylesheet" href="./assests/css/cart.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("product");
	ProductPrice price = (ProductPrice) request.getAttribute("price");
	int categoryId = product.getCategoryId();
	%>
	<div class="full" id="blur">
		<h1>ORDER NOW</h1>
		<div class="main">
			<section>
				<H2>PRODUCTS</H2>
				<!-- product 1 -->
				<div class="product-container">
					<div class="products">
						<div class="img">
							<img src="<%=product.getImageUrl()%>" alt="Product Image">
						</div>
						<div class="prod_details">
							<h3><%= product.getName() %></h3>
							<div class="prod_att">
							<%if (categoryId == 1){ %>
								<small><%= price.getQuantity()%> Kg</small> 
								<%}else{ %>
								<small><%= price.getQuantity()%></small> 
								<%} %>
								<small>Price: <%=price.getPrice()%></small>
								<button class="remove">Remove</button>
								<h4>Special Message</h4>
								<p>Happy birthday Deepika</p>
								<button class="edit_msg_btn" onclick="toggle()">Edit</button>
							</div>
						</div>
						<div class="quantity">
							<input class="inp" type="number" min="1" value="1">
						</div>
						<div class="price">
							<p>Price:</p>
						</div>
					</div>

					<!-- Test end -->

				</div>
			</section>
			<aside>
				<div class="summary-whole">
					<h2>SUMMARY</h2>
					<form method="post" action="submitorder" onsubmit="return confirmOrder()">
						<div class="summary">
							<div class="time">
								<label for="del_date">DELIVERY DATE:</label>  <input type="date" id="del_date" name="delivery_date" required> <br>
								<br> <label for="del_time">DELIVERY TIME:</label> <select
									id="del_time" name="delivery_time" required>
									<option id="standard" value="1">Delivery Now (within 60 mins)</option>
									<option id="morning" value="10:00:00">10:00 AM - 12:00 PM</option>
									<option id="afternoon" value="12:00:00">12:00 PM - 04:00 PM</option>
									<option id="evening" value="16:00:00">04:00 PM - 07:00 PM</option>
									<option id="night" value="19:00:00">07:00 PM - 11:00 PM</option>
								</select>
							</div>
							<div class="address">
								<label for="address">Address:</label>
								<textarea id="address" name="address" required></textarea>
							</div>
							<input type="hidden" name="product_id" value ="<%= product.getId()%>">
							<input type="hidden" name="price_id" value ="<%= price.getId()%>">
							<input type="hidden" class="hidequant" name="quantity" value ="">
							<div class="order">
								<button type="submit">ORDER</button>
							</div>
						</div>
					</form>
				</div>
			</aside>
		</div>
	</div>
	<div id="popup">
		<h3>EDIT SPECIAL MESSAGE</h3>
		<textarea rows="3" cols="25" id="cake_msg">

        </textarea>
		<br>
		<button id="spl_msg _confirm">Confirm</button>
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
	<script>
    // Function to update the price when the quantity changes
    function updatePrice() {
        // Get the input element
        var quantityInput = document.querySelector('.inp');
        // Get the <small> element that displays the price
        var priceSmall = document.querySelector('.price p');

        // Get the product price (you may need to set this value from your server)
        var productPrice = <%= price.getPrice() %>;

        // Calculate the new price based on the quantity input
        var quantity = quantityInput.valueAsNumber || 0; 
        var newPrice = productPrice * quantity;
        
        var hidQuantity = document.querySelector('.hidequant');
        
        hidQuantity.value = quantity;

        // Update the price in the <small> element
        priceSmall.textContent = 'Price: ' + newPrice;
    }

    // Attach an event listener to the quantity input to update the price on change
    var quantityInput = document.querySelector('.inp');
    quantityInput.addEventListener('input', updatePrice);

    // Initialize the price when the page loads
    updatePrice();
</script>
<script>
function setMinDate() {
	let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    let yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;
    
    let del_date = document.getElementById("del_date");
    del_date.setAttribute("min", today);
}
window.onload = setMinDate;
</script>

<script>
function confirmOrder() {
    return confirm("Are you sure you want to place this order?");
}
</script>
</body>
</body>
</html>