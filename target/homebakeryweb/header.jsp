<%@page import="in.fssa.homebakery.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
header {
	width: 100%;
	top: 0;
	color: black;
	z-index: 10;
	position: absolute;
}

h1 {
	font-family: 'Catamran', sans-serif;
}

h2 {
	font-family: 'Catamaran', sans-serif;
}

p {
	font-family: 'Telex', sans-serif;
}

a {
	font-family: 'Telex', sans-serif;
	font-size: 20px;
}

.container {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
	align-items: center;
	align-content: center;
}

.container div:nth-of-type(2) {
	flex: 1;
}

nav {
	font-size: 25px;
	width: 100%;
}

nav ul {
	display: flex;
	list-style: none;
	margin-left: auto;
	justify-content: flex-end;
}

nav ul li {
	margin: 0px 30px;
	border-radius: 20px;
	border: none;
	align-items: center;
}

nav ul li a {
	position: relative;
	text-decoration: none;
	color: black;
	font-weight: normal;
}

nav ul li a:after {
	content: "";
	position: absolute;
	background-color: black;
	height: 2px;
	width: 0;
	left: 0px;
	bottom: -3px;
	transition: 0.3s;
}

nav ul li a:hover:after {
	width: 100%;
}

@media only screen and (max-width:700px) {
	.logo {
		width: 70px;
	}
	nav ul li {
		margin: 0;
		margin-left: 10px;
	}
	nav {
		font-size: 15px;
	}
	nav ul li a img {
		width: 20px;
	}
}

.item {
	color: rgb(255, 255, 255);
	background-color: black;
	border-radius: 50%;
	padding: 2px;
	width: 16px;
	position: absolute;
	font-size: 18px;
	text-align: center;
	left: 10px;
	bottom: 20px;
}
</style>
</head>
<body>
	<header>
		<%
		String loggedUserEmail = (String) request.getSession().getAttribute("email");
		%>
		<%
		User loggedUser = (User) request.getSession().getAttribute("logged user");
		%>
		<%
		System.out.println(loggedUser);
		%>

		<%
		if (loggedUser == null) {
		%>
		<div class="container">
			<img
				src="https://iili.io/J975QMQ.md.jpg"
				width="100px" alt="logo">
			<nav>
				<ul>
					<li><a href="<%=request.getContextPath()%>/homepage">HOME</a></li>
					<li><a href="<%=request.getContextPath()%>/products">PRODUCTS</a></li>
					<li><a
						href="${main_source}/pages/Log%20in%20and%20Sign%20up/Log%20in.html">LOG
							IN</a></li>
					<li><a
						href="${main_source}/pages/Log%20in%20and%20Sign%20up/Log%20in.html"><img
							src="../../assets/Images/icon-cart.svg" alt="cart"></a></li>
				</ul>
			</nav>
		</div>
		<%
		} else if (loggedUser != null) {
		%>
		<%
		if ("admin123@gmail.com".equals(loggedUserEmail)) {
		%>
		<div class="container">
			<img
				src="https://iili.io/J975QMQ.md.jpg"
				width="100px" alt="logo">
			<nav>
				<ul>
					<li><a href="${main_source}/index.html">HOME</a></li>
					<li><a href="${main_source}/pages/products/product_list.html">PRODUCTS</a></li>
					<li><a href="${main_source}/pages/Cart/cart.html"><span
							class="item"></span><img src="../../assets/Images/icon-cart.svg"
							alt="cart"></a></li>
					<li><a href="${main_source}/pages/Profile/profile.html"><img
							src="../../assets/Images/profile.svg" width="26px" alt="profile"></a></li>
				</ul>
			</nav>
		</div>
		<%
		} else {
		%>
		<div class="container">
			<img
				src="https://iili.io/J975QMQ.md.jpg"
				width="100px" alt="logo">
			<nav>
				<ul>
					<li><a href="${main_source}/index.html">HOME</a></li>
					<li><a href="${main_source}/pages/products/product_list.html">PRODUCTS</a></li>
					<li><a href="${main_source}/pages/Cart/cart.html"><span
							class="item"></span><img src="../../assets/Images/icon-cart.svg"
							alt="cart"></a></li>
					<li><a href="${main_source}/pages/Profile/profile.html"><img
							src="../../assets/Images/profile.svg" width="26px" alt="profile"></a></li>
				</ul>
			</nav>
		</div>
		<%
		}
		%>
		<%
		}
		%>
	</header>
</body>
</html>