package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.homebakery.dto.ProductDetailDTO;
import in.fssa.homebakery.exception.ServiceException;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.model.ProductPrice;
import in.fssa.homebakery.service.ProductPriceService;
import in.fssa.homebakery.service.ProductService;

/**
 * Servlet implementation class GetProductsServlet
 */
@WebServlet("/products")
public class GetProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ProductService prodService = new ProductService();
		Set<ProductDetailDTO> productList = prodService.getAllProducts();
		
//		get prices
		ProductPriceService priceService = new ProductPriceService();
		
		for(ProductDetailDTO product : productList) {
			
			try {
				ProductPrice price = priceService.findPriceByIdAndQuantity(product.getId(), 1.0);
				
				List<ProductPrice> priceList = product.getPrices();
				priceList.clear();
				
				priceList.add(price);
				
			} catch (ServiceException e) {
				e.printStackTrace();
			} catch (ValidationException e) {
				e.printStackTrace();
			}
			
		}
		
		request.setAttribute("products", productList);
//
//		ResponseEntity res = new ResponseEntity();
//		res.setStatusCode(200);
//		res.setData(productList);
//		res.setMessage("product details fetched successfully");
//
//		Gson gson = new Gson();
//		String responseJson = gson.toJson(res);
//
//		System.out.println(responseJson);
//
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().write(responseJson);
//
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		RequestDispatcher dispatcher = request.getRequestDispatcher("get_all_products.jsp");
		dispatcher.forward(request, response);
	}

}
