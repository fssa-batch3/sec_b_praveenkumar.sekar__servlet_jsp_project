<%@page import="java.util.ArrayList"%>
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
<title>Home Bakery</title>
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="stylesheet" href="./assets/css/footer.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="bg-img">
		<div class="main">
			<div class="main-content">
				<div class="content">
					<p class="heading">BAKED FRESH EVERYDAY</p>
					<p class="para">
						since 2014, we have strived to provide fresh and high quality
						baked goods for the Southern Chennai area. <br> So please
						enjoy. This is our heritage
					</p>
					<a href="<%=request.getContextPath()%>/products">
						<button>Order Now</button>
					</a>
				</div>
			</div>
		</div>
	</div>


	<!-- 2nd fold -->
	<div class="fold-2">
		<div class="heading-2">
			<h2>Like sweets?</h2>
			<p>Good! We got lots of them and more</p>
		</div>
		<div class="products">
			<%
			Set<ProductDetailDTO> productSet = (Set<ProductDetailDTO>) request.getAttribute("products");
			List<ProductDetailDTO> productList = new ArrayList<>(productSet);

			for (int i = 0; i < 3; i++) {
				List<ProductPrice> priceList = productList.get(i).getPrices();
				ProductPrice price = priceList.get(0);
			%>
			<div class="product">
				<h2><%=productList.get(i).getName()%></h2>
				<p>
					Rs.
					<%=price.getPrice()%>
				</p>

				<img src="<%=productList.get(i).getImageUrl()%>" alt=""
					class="img_size"> <a
					href="product?productid=<%=productList.get(i).getId()%>">
					<button class="prod_button">Learn more</button>
				</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div class="about" id="about">
		<div class="about-para">
			<h2>WHO WE ARE AND WHAT MAKES US DIFFERENT?</h2>
			<p>Home Bakery is one of only a handful few enduring Craft
				Bakeries in Chennai. We have assembled our notoriety on
				consolidating great quality conventional heating with a great
				incentive for cash. We offer our clients a full scope of bread,
				forte bread, morning merchandise, cakes, and baked goods. Our bread
				is heated day by day at our pastry shop in Madipakkam and is
				conveyed to our twelve shops. We utilize profoundly gifted specialty
				dough punchers to guarantee each portion of bread is flawless
				without fail.</p>
		</div>
	</div>
	<div class="meet" id="history">
		<img
			src="./assets/Images/female-baker-holding-baked-fresh-macaroons-pastries-tray (1).jpg"
			width="50%" alt="female baker holding tray">
		<div class="meet-para">
			<h2>OUR HISTORY</h2>
			<p>We always dreamt of walking into a bakery where the aroma of
				freshly baked bread is wafting through the air. The smell and warmth
				of a freshly baked loaf of bread is a visceral experience. Unable to
				find the bakery of our dreams close to us we opened our own.
				Established in 2014, our goal is to make preservative-free, freshly
				baked bread available to everyone. We cater to both the health
				conscious and the indulgent gourmand. Following the philosophy of
				artisanal baking, our bread is carefully handcrafted using
				traditional methods - be it a simple loaf of bread or a carefully
				constructed croissant.</p>
		</div>
	</div>
	<footer>
		<div class="foot">
			<h2>HOME BAKERY</h2>
			<div class="list">
				<ul>
					<li>
						<h2>ABOUT</h2>
					</li>
					<li><a href="./index.html">Homepage</a></li>
					<li><a href="../../../../index.html#about">About Us</a></li>
					<li><a href="../../../../index.html#history">Our History</a></li>
					<li><a href="./pages/products/product_list.html">Products</a>
					</li>
				</ul>
				<ul>
					<li>
						<h2>PRODUCTS</h2>
					</li>
					<li><a href="./pages/products/product_list.html">Breads</a></li>
					<li><a href="./pages/products/product_list.html">Cakes</a></li>
					<li><a href="./pages/products/product_list.html">Breakfast
							Pastries</a></li>
				</ul>
				<ul>
					<li>
						<h2>FOLLOW US</h2>
					</li>
					<li><a href="https://www.instagram.com/"> <img
							src="./assets/Images/instagram.svg" width="40px" alt="Instagram">Instagram
					</a></li>
					<li><a href="https://twitter.com/"> <img
							src="./assets/Images/twitter.svg" width="40px" alt="Twitter">Twitter
					</a></li>

					<li><a href="https://github.com/"> <img
							src="./assets/Images/github.svg" width="40px" alt="Github">GitHub
					</a></li>
				</ul>
			</div>
		</div>

	</footer>

</body>

</html>