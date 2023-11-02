<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

header {
	box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08)
		0px 0px 0px 1px;
	background-color: white;
}

.container {
	width: 400px;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	margin-top: 5%;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	color: #333;
}

label {
	font-weight: bold;
	display: block;
	margin-bottom: 5px;
	color: #333;
}

input[type="text"], input[type="number"], textarea, select, input[type="url"],
	input[type="checkbox"] {
	width: 95%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 16px;
}

select {
	height: 40px;
	width: 100%;
}

input[type="checkbox"] {
	width: auto;
	accent-color: black;
}

button[type="submit"] {
	background-color: #000;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

button[type="submit"]:hover {
	background-color: #fff;
	color: #000;
	border: 1px solid black;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h2>Add a New Product</h2>
		<form action="create" method="post">
    <label for="name">Product Name</label>
    <input type="text" name="name" required>
    
    <label for="description">Description</label>
    <textarea name="description" required></textarea>
    
    <label for="category">Category</label>
    <select name="category" id="categorySelect" required>
        <option value="1">Cake</option>
        <option value="2">Bread</option>
        <option value="3">Breakfast Pastry</option>
    </select>
    
    <label for="isVeg">Is Vegetarian?</label>
    <input type="checkbox" name="isVeg">
    
    <label for="imageUrl">Image URL</label>
    <input id="imgUrl" type="url" name="imageUrl" required>
    
    <div id="priceField1" style="display:none;">
    	<label for="price">Price</label>
    	<input type="number" name="price" min="1" max="5000" value = "1" required>
    </div>
    <div id="priceField2">
    	<label for="price1/2">1/2Kg Price</label>
    	<input type="number" name="price1/2" min="1" max="5000" value = "1" required>
    	
        <label for="price1">1Kg Price</label>
        <input type="number" name="price1" min="1" max="5000" value = "1" required>
        
        <label for="price2">2Kg Price</label>
        <input type="number" name="price2" min="1" max="5000" value = "1" required>
    </div>
    
    <button type="submit">SUBMIT</button>
</form>
	</div>
	
	<script>
    const categorySelect = document.getElementById('categorySelect');
    const priceField1 = document.getElementById('priceField1');
    const priceField2 = document.getElementById('priceField2');

    // Add an event listener to the category select to show/hide price fields
    categorySelect.addEventListener('change', () => {
        if (categorySelect.value === '2' || categorySelect.value === '3') {
            // Hide price fields for Bread and Breakfast Pastry
            priceField2.style.display = 'none';
            priceField1.style.display = 'block';
        } else {
            // Show price fields for Cake
        	priceField1.style.display = 'none';
            priceField2.style.display = 'block';
        }
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var textArea = document.querySelector('textarea');
        var imageURL = document.getElementById('imgUrl');
        
        imageURL.addEventListener('input', function() {
            this.value = this.value.replace(/  +/g, ' ');
        });

        textArea.addEventListener('input', function() {
            this.value = this.value.replace(/  +/g, ' ');
        });
    });
</script>
</body>
</html>