package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.dto.ProductDetailDTO;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.service.ProductService;

/**
 * Servlet implementation class GetProductsServlet
 */
@WebServlet("/products")
public class GetProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pageStr = request.getParameter("p");

		int pageNo = Integer.parseInt(pageStr);

		ProductService prodService = new ProductService();
		Set<ProductDetailDTO> productSet;
		List<ProductDetailDTO> productList = null;
		try {

			int total = 5;
			int totalPages = 0;

			productSet = prodService.getSetOfProducts((pageNo - 1) * total);

			productList = new ArrayList<>(productSet);
			Collections.sort(productList);
			totalPages = prodService.getCountOfActiveProducts();

			request.setAttribute("category", "all");
			request.setAttribute("products", productList);
			request.setAttribute("count", totalPages);
		} catch (ValidationException e) {
			e.printStackTrace();
		}
		

		RequestDispatcher dispatcher = request.getRequestDispatcher("get_all_products.jsp");
		dispatcher.forward(request, response);
	}

}
