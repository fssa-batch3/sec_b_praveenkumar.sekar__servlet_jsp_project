package in.fssa.homebakery.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.ServiceException;

import in.fssa.homebakery.dto.OrderDetailDTO.OrderStatus;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.service.OrderService;

/**
 * Servlet implementation class CancelOrderServlet
 */
@WebServlet("/cancelorder")
public class CancelOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderId = Integer.parseInt(request.getParameter("orderid"));
		
		OrderService orderService = new OrderService();
		
		OrderStatus status = OrderStatus.CANCELLED;
		
		try {
			orderService.changeStatusOfOrder(orderId, status);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/order_detail.jsp");
		dispatcher.forward(request, response);
	}

}
