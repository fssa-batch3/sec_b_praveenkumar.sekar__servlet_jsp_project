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
import in.fssa.homebakery.model.ProductPrice;
import in.fssa.homebakery.service.ProductPriceService;
import in.fssa.homebakery.service.ProductService;

/**
 * Servlet implementation class OrderNowServlet
 */
@WebServlet("/ordernow")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String productIdStr = request.getParameter("productid");
	     String priceIdStr = request.getParameter("priceid");
	     
	    int productId = Integer.parseInt(productIdStr);
	    int priceId = Integer.parseInt(priceIdStr);
	    
	    ProductService productService = new ProductService();
		ProductDetailDTO product;
		
		ProductPriceService priceService = new ProductPriceService();
		ProductPrice price = new ProductPrice();
		
		
		try {
			product = productService.getByProductId(productId);
			price = priceService.findByPriceId(priceId);
			// Set prices as an attribute to be rendered in a JSP page
			request.setAttribute("product", product);
			request.setAttribute("price", price);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

		// Forward to a JSP page for displaying prices
		RequestDispatcher dispatcher = request.getRequestDispatcher("/order_now.jsp");
		dispatcher.forward(request, response);
	     
	        
	}

}
