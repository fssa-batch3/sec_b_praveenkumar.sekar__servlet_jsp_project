package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.exception.ServiceException;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.model.ProductPrice;
import in.fssa.homebakery.service.ProductPriceService;
import in.fssa.homebakery.validator.PriceValidator;

/**
 * Servlet implementation class getProductPricesServlet
 */
@WebServlet("/admin/product/prices")
public class getProductPricesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productid");
		int productid = Integer.parseInt(productId);

		// Retrieve prices for the product based on productId
		ProductPriceService productPriceService = new ProductPriceService();
		List<ProductPrice> prices;
		try {
			prices = productPriceService.findCurrentPrice(productid);

			// Set prices as an attribute to be rendered in a JSP page
			request.setAttribute("prices", prices);
			request.setAttribute("productid", productid);
			System.out.println(prices);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

		// Forward to a JSP page for displaying prices
		RequestDispatcher dispatcher = request.getRequestDispatcher("/current_price_page.jsp");
		dispatcher.forward(request, response);
	}

}
