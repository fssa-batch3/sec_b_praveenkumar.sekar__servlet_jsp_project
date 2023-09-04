<!DOCTYPE html>
<%@page import="in.fssa.homebakery.model.ProductPrice"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.homebakery.dto.ProductDetailDTO"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .product_details {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            margin: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product_details img {
            max-width: 100%;
            height: auto;
        }

        .details {
            flex-grow: 1;
        }

        h2 {
            font-size: 24px;
            color: #333;
            margin: 0;
        }

        h3 {
            font-size: 18px;
            color: #555;
            margin: 10px 0;
        }

        p {
            font-size: 16px;
            color: #777;
            line-height: 1.4;
        }

        .prices {
            flex-grow: 1;
        }
        
        .prices h2 {
        	margin: 10px;
        }

        .prices table {
            width: 100%;
            border-collapse: collapse;
        }

        .prices th,
        .prices td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .prices th {
            background-color: #f0f0f0;
        }

        .prices button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .prices button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<%
ProductDetailDTO product = (ProductDetailDTO) request.getAttribute("product");
%>

<div class="product_details">
    <div class="details">
        <img src="<%=product.getImageUrl()%>">
        <h2><%=product.getName()%></h2>
        <h3>Description</h3>
        <p><%=product.getDescription()%></p>
    </div>

    <div class="prices">
    	<h2>Price History</h2>
        <table>
            <tr>
                <th>Id</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Type</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Delete</th>
            </tr>

            <%
            List<ProductPrice> priceList = product.getPrices();
            for (ProductPrice price : priceList) {
            %>
            <tr>
                <td><%=price.getId()%></td>
                <td><%=price.getQuantity()%></td>
                <td><%=price.getPrice()%></td>
                <td><%=price.getType()%></td>
                <td><%=price.getStartDate()%></td>
                <td><%=price.getEndDate()%></td>
                <td>
                    <button>Delete</button>
                </td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
    
</div>
<div class = "buttons">
    <a href = "product/edit?productid=<%= product.getId()%>"><button>Update Product Details</button></a>
    <a><button>Update Price Details</button></a>
</div>
</body>
</html>
