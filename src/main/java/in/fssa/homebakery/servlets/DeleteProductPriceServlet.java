package in.fssa.homebakery.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.service.ProductPriceService;

/**
 * Servlet implementation class DeleteProductPriceServlet
 */
@WebServlet("/admin/product/price/delete")
public class DeleteProductPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paramId = request.getParameter("priceid");
		String paramProdId = request.getParameter("productid");
	
		ProductPriceService productPriceService = new ProductPriceService();
		
		if(paramId == null) {
			throw new RuntimeException("Id cannnot be null");
		}
		
		if("".equals(paramId)) {
			throw new RuntimeException("Id cannnot be empty");
		}
		
		if(paramProdId == null) {
			throw new RuntimeException("Id cannnot be null");
		}
		
		if("".equals(paramProdId)) {
			throw new RuntimeException("Id cannnot be empty");
		}
		
		try {
			int id = Integer.parseInt(paramId);
			int prodId = Integer.parseInt(paramProdId);
			
			productPriceService.deleteProductPrice(id);
			
			response.sendRedirect(request.getContextPath() + "/admin/product?productid=" + prodId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
