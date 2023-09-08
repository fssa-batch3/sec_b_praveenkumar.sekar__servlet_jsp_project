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
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/admin/product/edit")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService productService = new ProductService();
		
		String productId = request.getParameter("productid");
		int productid = Integer.parseInt(productId);
		try {
			ProductDetailDTO product = productService.getByProductId(productid);
			request.setAttribute("productDetails", product);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_product.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
		
	}

}
