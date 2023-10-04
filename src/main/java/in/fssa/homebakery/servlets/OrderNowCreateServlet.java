package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.ServiceException;
import com.google.protobuf.Timestamp;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

import in.fssa.homebakery.dto.OrderDetailDTO;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.service.OrderService;

/**
 * Servlet implementation class OrderNowCreateServlet
 */
@WebServlet("/submitorder")
public class OrderNowCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deliveryDate = request.getParameter("delivery_date");
		String deliveryTime = request.getParameter("delivery_time");
		String address = request.getParameter("address");
		int productId = Integer.parseInt(request.getParameter("product_id"));
		int priceId = Integer.parseInt(request.getParameter("price_id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		String loggedUserEmail = (String) request.getSession().getAttribute("logged email");
		
		
		String deliveryDateTime = deliveryDate + " " + deliveryTime;

		// Parse deliveryDate into a java.sql.Date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedDate = null;
        try {
            parsedDate = dateFormat.parse(deliveryDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

        // Parse deliveryTime into a java.sql.Time
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        java.util.Date parsedTime = null;
        try {
            parsedTime = timeFormat.parse(deliveryTime);
        } catch (ParseException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }

        java.sql.Time sqlTime = new java.sql.Time(parsedTime.getTime());
        
        OrderDetailDTO order = new OrderDetailDTO();
        order.setDeliveryDate(sqlDate);
        order.setDeliveryTime(sqlTime);
        order.setAddress(address);
        order.setQuantity(quantity);
        order.setStatus(OrderDetailDTO.OrderStatus.NOT_DELIVERED);
        
        OrderService orderService = new OrderService();
        
        try {
			orderService.createOrder(order, productId, priceId, loggedUserEmail);
			response.sendRedirect(request.getContextPath()+"/homepage");
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}
        
		
	}

}
