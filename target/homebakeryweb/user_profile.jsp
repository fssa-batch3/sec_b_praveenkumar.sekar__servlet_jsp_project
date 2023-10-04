<%@page import="in.fssa.homebakery.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./assets/css/profile.css">
<link rel="stylesheet" href="./assets/css/footer.css">
<meta charset="ISO-8859-1">
<title>Profile Page</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
		User user = (User)request.getAttribute("user");
	%>
    <div class="full">
        <div class="sidebar">
            <a href="../Profile/profile.html">
                <div id="account_details">
                    <h4>ACCOUNT DETAILS</h4>
                </div>
            </a>
            <a href="../Profile/address_book.html">
                <div id="address_book">
                    <h4>ADDRESS BOOK</h4>
                </div>
            </a>
            <a href="../orders/order_list.html">
                <div>
                    <h4>MY ORDERS</h4>
                </div>
            </a>
            <a href = "profile/logout">
            <div>
                <h4>LOG OUT</h4>
            </div>
            </a>
        </div>
        <section class="main_content" id="main">
            <div class="head">
                <h2>ACCOUNT DETAILS</h2>
                <a href = "profile/edit?userid=<%=user.getId()%>">
                    <button>EDIT</button>
                </a>
            </div>
            <div class="profile_details">
                <div>
                    <h4>FIRST NAME</h4>
                    <p id="first_name"><%= user.getFirstName() %></p>
                </div>
                <div>
                    <h4>LAST NAME</h4>
                    <p id="last_name"><%=user.getLastName() %></p>
                </div>
                <div>
                    <h4>EMAIL</h4>
                    <p id="email"><%=user.getEmail()%></p>
                </div>
                <div>
                    <h4>PHONE</h4>
                    <p id="phone"><%=user.getPhoneNo()%></p>
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
                    <li>
                        <a href="../../index.html">Homepage</a>
                    </li>
                    <li>
                        <a href="../../../../index.html#about">About Us</a>
                    </li>
                    <li>
                        <a href="../../../../index.html#history">Our History</a>
                    </li>
                    <li>
                        <a href="../products/product_list.html">Products</a>
                    </li>
                </ul>
                <ul>
                    <li>
                        <h2>PRODUCTS</h2>
                    </li>
                    <li>
                        <a href="../products/product_list.html">Breads</a>
                    </li>
                    <li>
                        <a href="../products/product_list.html">Cakes</a>
                    </li>
                    <li>
                        <a href="../products/product_list.html">Breakfast Pastries</a>
                    </li>
                </ul>
                <ul>
                    <li>
                        <h2>FOLLOW US</h2>
                    </li>
                    <a href="https://www.instagram.com/">
                        <li>
                            <img src="../../assets/Images/instagram.svg" width="40px" alt="instagram">Instagram
                        </li>
                    </a>
                    <a href="https://twitter.com/">
                        <li>
                            <img src="../../assets/Images/twitter.svg" width="40px" alt="twitter">Twitter
                        </li>
                    </a>
                    <a href="https://github.com/">
                        <li>
                            <img src="../../assets/Images/github.svg" width="40px" alt="GitHub">GitHub
                        </li>
                    </a>
                </ul>
            </div>
        </div>
    </footer>
</body>
</html>