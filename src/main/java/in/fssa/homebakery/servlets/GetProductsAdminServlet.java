package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Set;

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
 * Servlet implementation class GetProductsServlet
 */
@WebServlet("/admin/products")
public class GetProductsAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService prodService = new ProductService();
		Set<ProductDetailDTO> productList = prodService.getAllProducts();
		
//		get prices
		ProductPriceService priceService = new ProductPriceService();
		
		request.setAttribute("products", productList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/get_all_products_admin.jsp");
		dispatcher.forward(request, response);
	}

}
