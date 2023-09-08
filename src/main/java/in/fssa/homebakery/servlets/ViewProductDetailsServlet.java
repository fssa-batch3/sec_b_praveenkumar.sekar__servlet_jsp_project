package in.fssa.homebakery.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.dto.ProductDetailDTO;
import in.fssa.homebakery.exception.ServiceException;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.service.ProductService;

/**
 * Servlet implementation class ViewProductDetailsServlet
 */
@WebServlet("/product")
public class ViewProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productId = request.getParameter("productid");
		int productid = Integer.parseInt(productId);

		// Retrieve prices for the product based on productId
		ProductService productService = new ProductService();
		ProductDetailDTO product;
		
		try {
			product = productService.getByProductId(productid);

			// Set prices as an attribute to be rendered in a JSP page
			request.setAttribute("product", product);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

		// Forward to a JSP page for displaying prices
		RequestDispatcher dispatcher = request.getRequestDispatcher("/product_detail_page.jsp");
		dispatcher.forward(request, response);
}

}
