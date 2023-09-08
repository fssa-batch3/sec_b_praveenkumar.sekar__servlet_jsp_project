package in.fssa.homebakery.servlets;

import java.io.IOException;

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

/**
 * Servlet implementation class EditPriceServlet
 */
@WebServlet("/admin/product/price/edit")
public class EditPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductPriceService productPriceService = new ProductPriceService();
		
		String priceId = request.getParameter("priceid");
		int priceid = Integer.parseInt(priceId);
		
		String productId = request.getParameter("productid");
		int productid = Integer.parseInt(productId);
		try {
			ProductPrice price = productPriceService.findByPriceId(priceid);
			request.setAttribute("priceDetails", price);
			request.setAttribute("productid", productId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_price.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
		
	}

}
