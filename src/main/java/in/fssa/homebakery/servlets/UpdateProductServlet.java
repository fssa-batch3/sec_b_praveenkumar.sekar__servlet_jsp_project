package in.fssa.homebakery.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.exception.ServiceException;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.model.Product;
import in.fssa.homebakery.model.User;
import in.fssa.homebakery.service.ProductService;
import in.fssa.homebakery.service.UserService;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/product/update")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productIdParam = request.getParameter("productid");
		int productId = Integer.parseInt(productIdParam);
		
		Product product = new Product();

		product.setId(productId);
	    product.setProductName(request.getParameter("productName"));
	    product.setDescription(request.getParameter("description"));
	    product.setCategoryId(Integer.parseInt(request.getParameter("category")));
	    product.setImageUrl(request.getParameter("imageUrl"));
//	    product.setVegetarian(Boolean.parseBoolean(request.getParameter("vegetarian")));
	    product.setActive(true);

	    ProductService productService = new ProductService();

	    try {
	        productService.updateProduct(productId, product); // Update the product
	        response.sendRedirect(request.getContextPath() + "/product?productid=" + product.getId()); // Redirect to the product list page
	    } catch (ServiceException | ValidationException e) {
	        e.printStackTrace();
	    }
	}

}
