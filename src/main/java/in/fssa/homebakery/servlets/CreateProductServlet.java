package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.dto.ProductDetailDTO;
import in.fssa.homebakery.exception.ServiceException;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.model.ProductPrice;
import in.fssa.homebakery.model.ProductPriceEntity.QuantityType;
import in.fssa.homebakery.service.ProductService;
import in.fssa.homebakery.service.UserService;

/**
 * Servlet implementation class CreateProductServlet
 */
@WebServlet("/product/create")
public class CreateProductServlet extends HttpServlet {
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

		// Retrieve form data
		String productName = request.getParameter("name");
		String description = request.getParameter("description");
		int category = Integer.parseInt(request.getParameter("category"));
		boolean isVegetarian = request.getParameter("isVeg") != null; // Checkbox
		String imageUrl = request.getParameter("imageUrl");
		double quantity = Double.parseDouble(request.getParameter("quantity"));
		String typeString = request.getParameter("type");
		QuantityType type = typeMapping.get(typeString);
		double price = Double.parseDouble(request.getParameter("price"));
		
		
		
		ProductService productService = new ProductService();

		ProductDetailDTO productDetailDTO = new ProductDetailDTO();
		productDetailDTO.setName(productName);
		productDetailDTO.setCategoryId(category);
		productDetailDTO.setDescription(description);
		productDetailDTO.setVeg(isVegetarian);
		productDetailDTO.setImageUrl(imageUrl);
		
		List<ProductPrice> priceList = new ArrayList<ProductPrice>();
		
		ProductPrice productPrice = new ProductPrice();
		
		productPrice.setPrice(price);
		productPrice.setQuantity(quantity);
		productPrice.setType(type);
		productPrice.setStartDate(currentTimestamp);
		
		priceList.add(productPrice);
		
		productDetailDTO.setPrices(priceList);
		
		
		try {
			productService.createProduct(productDetailDTO);
			response.sendRedirect(request.getContextPath() + "/products");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

	}
}
