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
import in.fssa.homebakery.model.ProductPrice;
import in.fssa.homebakery.service.ProductService;

/**
 * Servlet implementation class GetBreadProductsServlet
 */
@WebServlet("/breads")
public class GetBreadProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		String pageStr = request.getParameter("p");
		
		int pageNo = Integer.parseInt(pageStr);
		
		
		ProductService prodService = new ProductService();
		List<ProductDetailDTO> productList = null;
		try {
			
			int total = 5;
			
		    productList = prodService.getSetByCategoryId(2,(pageNo-1) * total);
			
			int totalPages = prodService.getCountOfActiveProductsByCategoryId(2);
			
			request.setAttribute("category", "bread");
			request.setAttribute("products", productList);
			request.setAttribute("count", totalPages);
		} catch (ValidationException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("get_all_products.jsp");
		dispatcher.forward(request, response);
	}
}
