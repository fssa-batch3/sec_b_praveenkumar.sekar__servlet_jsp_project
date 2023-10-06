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
@WebServlet("/admin/product/create")
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
		
		
		
		ProductService productService = new ProductService();

		ProductDetailDTO productDetailDTO = new ProductDetailDTO();
		productDetailDTO.setName(productName);
		productDetailDTO.setCategoryId(category);
		productDetailDTO.setDescription(description);
		productDetailDTO.setVeg(isVegetarian);
		productDetailDTO.setImageUrl(imageUrl);
		productDetailDTO.setActive(true);
		
		List<ProductPrice> priceList = new ArrayList<ProductPrice>();
		
		if(category == 2 || category == 3) {
		
		ProductPrice productPrice = new ProductPrice();
		
		double price = Double.parseDouble(request.getParameter("price"));
		
		productPrice.setPrice(price);
		productPrice.setQuantity(1);
		productPrice.setType(typeMapping.get("NOS"));
		productPrice.setStartDate(currentTimestamp);
		
		priceList.add(productPrice);
		
		productDetailDTO.setPrices(priceList);
		
		}
		
		else {
			ProductPrice productPrice1 = new ProductPrice();
			
			double price1 = Double.parseDouble(request.getParameter("price1/2"));
			
			productPrice1.setPrice(price1);
			productPrice1.setQuantity(0.5);
			productPrice1.setType(typeMapping.get("KG"));
			productPrice1.setStartDate(currentTimestamp);
			
			priceList.add(productPrice1);
			
			ProductPrice productPrice2 = new ProductPrice();

			double price2 = Double.parseDouble(request.getParameter("price1"));
			
			productPrice2.setPrice(price2);
			productPrice2.setQuantity(1);
			productPrice2.setType(typeMapping.get("KG"));
			productPrice2.setStartDate(currentTimestamp);
			
			priceList.add(productPrice2);
			
			ProductPrice productPrice3 = new ProductPrice();
			
			double price3 = Double.parseDouble(request.getParameter("price2"));
			
			productPrice3.setPrice(price3);
			productPrice3.setQuantity(2);
			productPrice3.setType(typeMapping.get("KG"));
			productPrice3.setStartDate(currentTimestamp);
			
			priceList.add(productPrice3);
			
			productDetailDTO.setPrices(priceList);
			
		}
		
		
		try {
			productService.createProduct(productDetailDTO);
			response.sendRedirect(request.getContextPath() + "/admin/products");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

	}
}
