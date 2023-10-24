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
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
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
	text-decoration: none;
	margin-bottom: 5%;
}

.buttons {
	padding: 20px 0 40px;
	margin-top: 8%;
	font-family: 'Catamran', sans-serif;
	display: flex;
	justify-content: center;
}

.button {
	transition: all .2s ease-in-out;
	-webkit-appearance: none;
	border-radius: 100px;
	appearance: none;
	background: none;
	font-weight: 700;
	font-size: 22px;
	cursor: pointer;
	padding: 20px;
	outline: none;
	opacity: 0.4;
	border: none;
	color: #000;
}

.button:hover, .button.active {
	opacity: 1;
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

.pagination {
	padding: 30px 0;
	display: flex;
	justify-content: center;
}

.pagination ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.pagination a {
	display: inline-block;
	padding: 10px 18px;
	color: #222;
}

.p2 .is-active li {
	font-weight: bold;
	border-bottom: 3px solid #000;
}
</style>
<link rel="stylesheet" href="./assets/css/footer.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="buttons">
		<%
		String cate = (String) request.getAttribute("category");
		if (cate.equals("all")) {
		%>
		<a href="<%=request.getContextPath()%>/products?p=1"><button
				class="button all active">All</button></a>
		<%
		} else {
		%>
		<a href="<%=request.getContextPath()%>/products?p=1"><button
				class="button all">All</button></a>
		<%
		}
		%>

		<%
		if (cate.equals("bread")) {
		%>
		<a href="<%=request.getContextPath()%>/breads?p=1"><button
				class="button white active">Breads</button></a>
		<%
		} else {
		%>
		<a href="<%=request.getContextPath()%>/breads?p=1"><button
				class="button white">Breads</button></a>
		<%
		}
		%>

		<%
		if (cate.equals("breakfast")) {
		%>
		<a href="<%=request.getContextPath()%>/breakfastpastries?p=1"><button
				class="button grey active">Breakfast-Pastries</button></a>
		<%
		} else {
		%>
		<a href="<%=request.getContextPath()%>/breakfastpastries?p=1"><button
				class="button grey">Breakfast-Pastries</button></a>
		<%
		}
		%>
		<%
		if (cate.equals("cake")) {
		%>
		<a href="<%=request.getContextPath()%>/cakes?p=1"><button
				class="button blue active">Cakes</button></a>
		<%
		} else {
		%>
		<a href="<%=request.getContextPath()%>/cakes?p=1"><button
				class="button blue">Cakes</button></a>
		<%
		}
		%>
	</div>
	<div class="product1">
		<%
		List<ProductDetailDTO> productList = (List<ProductDetailDTO>) request.getAttribute("products");
		for (ProductDetailDTO product : productList) {
			List<ProductPrice> priceList = product.getPrices();
			ProductPrice price = priceList.get(0);
		%>
		<div class="product">
			<h2><%=product.getName()%></h2>
			<p>
				Rs.
				<%=price.getPrice()%>
			</p>

			<img src="<%=product.getImageUrl()%>" alt="" class="img_size">
			<a href="product?productid=<%=product.getId()%>">
				<button class="prod_button">Learn more</button>
			</a>
		</div>
		<%
		}
		%>
	</div>
	<div class="pagination p2">
		<ul>
			<%
			int count = (int) request.getAttribute("count");
			int itemsPerPage = 5;
			int noOfPages;

			if (count == 0) {
				noOfPages = 0; // Or handle this case as per your application logic
			} else {
				noOfPages = count / itemsPerPage;
				if (count % itemsPerPage != 0) {
					noOfPages += 1;
				}
			}

			String pageStr = request.getParameter("p");
			int pageNo = Integer.parseInt(pageStr);

			for (int i = 1; i <= noOfPages; i++) {
			%>
			<%
			if (pageNo == i) {
			%>
			<a class="is-active"
				href="<%=request.getContextPath()%>/products?p=<%=i%>"><li><%=i%></li></a>
			<%
			} else {
			%>
			<a href="<%=request.getContextPath()%>/products?p=<%=i%>"><li><%=i%></li></a>
			<%
			}
			}
			%>
		</ul>
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

	<script>
		// Get all elements with the class name 'button'
		var buttons = document.querySelectorAll('.button');

		// Iterate through each button element
		buttons.forEach(function(button) {
			// Add a click event listener to each button
			button.addEventListener('click', function() {
				// Remove the 'active' class from all buttons
				buttons.forEach(function(btn) {
					btn.classList.remove('active');
				});

				// Add the 'active' class to the currently clicked button
				this.classList.add('active');
			});
		});
	</script>
</body>
</html>