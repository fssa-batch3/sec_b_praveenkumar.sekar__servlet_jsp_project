package in.fssa.homebakery.servlets;

import java.io.IOException;
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
 * Servlet implementation class UpdatePriceServlet
 */
@WebServlet("/admin/product/price/update")
public class UpdatePriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Mapping for QuantityType values
	private static final Map<String, QuantityType> typeMapping = new HashMap<>();

	static {
		typeMapping.put("KG", QuantityType.KG);
		typeMapping.put("NOS", QuantityType.NOS);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String priceIdParam = request.getParameter("priceid");
		String productIdParam = request.getParameter("productid");
		String priceParam = request.getParameter("price");
		String typeString = request.getParameter("type");
		QuantityType type = typeMapping.get(typeString);

		try {
			int priceId = Integer.parseInt(priceIdParam);
			int productId = Integer.parseInt(productIdParam);

			ProductPriceService productPriceService = new ProductPriceService();
			ProductPrice newPrice = productPriceService.findByPriceId(priceId);

			// Update the price and quantity
			newPrice.setPrice(Double.parseDouble(priceParam));
			newPrice.setType(type);
			productPriceService.updateProductPrice(productId, newPrice, newPrice.getQuantity());

			// Redirect to the product details page
			response.sendRedirect(request.getContextPath() + "/admin/product?productid=" + productId);
		} catch (NumberFormatException e) {
			
			e.printStackTrace();

		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

	}

}