package in.fssa.homebakery.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.model.User;
import in.fssa.homebakery.service.ProductService;
import in.fssa.homebakery.service.UserService;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/admin/product/delete")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paramId = request.getParameter("productid");
		ProductService productService = new ProductService();
		
		if(paramId == null) {
			throw new RuntimeException("Id cannnot be null");
		}
		
		if("".equals(paramId)) {
			throw new RuntimeException("Id cannnot be empty");
		}
		
		try {
			int id = Integer.parseInt(paramId);
			
			productService.deleteProduct(id);
			response.sendRedirect(request.getContextPath() + "/admin/products");
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
