<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Bakery</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	scroll-behavior: smooth;
}

p {
	font-family: Arial, sans-serif;
}

.bg-img {
	background-image: url(https://iili.io/J9uZHg4.md.jpg);
	filter: grayscale(15%);
	background-size: cover;
}

.main-content {
	display: flex;
	width: 100%;
	height: 100vh;
}

.heading {
	font-size: 70px;
	font-weight: 500;
	text-align: center;
	color: white;
}

.para {
	font-style: italic;
	font-size: 23px;
	text-align: center;
	margin-top: 4%;
	font-weight: 400;
	color: white;
}

.content {
	margin: auto;
	border: none;
	border-radius: 5px;
	padding: 0 20px 20px 20px;
	background-color: rgba(0, 0, 0, 0.148);
}

.content button {
	position: relative;
	display: flex;
	margin: auto;
	margin-top: 20px;
	padding: 14px 30px;
	text-align: center;
	font-size: 15px;
	letter-spacing: 1px;
	text-decoration: none;
	color: #000000;
	background: rgb(255, 255, 255);
	cursor: pointer;
	transition: ease-out 0.5s;
	border: 2px solid #000000;
	border-radius: 3px;
	box-shadow: inset 0 0 0 0 #000000;
}

.content button:hover {
	color: white;
	box-shadow: inset 0 -100px 0 0 #000000;
}

.content button:active {
	transform: scale(0.9);
}

.content a {
	text-decoration: none;
	font-style: bold;
	font-weight: 600;
}
</style>
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
</body>
</html>