package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.exception.ServiceException;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.model.ProductPrice;
import in.fssa.homebakery.model.ProductPriceEntity.QuantityType;
import in.fssa.homebakery.service.ProductPriceService;

/**
 * Servlet implementation class CreatePriceServlet
 */
@WebServlet("/admin/product/price/create")
public class CreatePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Mapping for QuantityType values
	private static final Map<String, QuantityType> typeMapping = new HashMap<>();

	static {
		typeMapping.put("KG", QuantityType.KG);
		typeMapping.put("NOS", QuantityType.NOS);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		
		int id = Integer.parseInt(request.getParameter("productid"));
		
		double quantity = Double.parseDouble(request.getParameter("quantity"));
		String typeString = request.getParameter("type");
		QuantityType type = typeMapping.get(typeString);
		double price = Double.parseDouble(request.getParameter("price"));

		ProductPrice productPrice = new ProductPrice();

		productPrice.setPrice(price);
		productPrice.setQuantity(quantity);
		productPrice.setType(type);
		productPrice.setStartDate(currentTimestamp);
		
		try {
			ProductPriceService productPriceService = new ProductPriceService();
			productPriceService.createProductPrice(id,productPrice);
			response.sendRedirect(request.getContextPath() + "/admin/product?productid=" + id);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}
	}

}
