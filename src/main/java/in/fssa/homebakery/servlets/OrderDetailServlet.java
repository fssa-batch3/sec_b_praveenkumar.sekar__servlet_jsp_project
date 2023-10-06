package in.fssa.homebakery.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.ServiceException;

import in.fssa.homebakery.dto.OrderDetailDTO;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.model.User;
import in.fssa.homebakery.service.OrderService;
import in.fssa.homebakery.service.UserService;

/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/order")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("orderid"));

		OrderService orderService = new OrderService();

		OrderDetailDTO order;

		int loggedUserId = (int) request.getSession().getAttribute("logged user id");

		UserService userService = new UserService();

		try {
			order = orderService.getOrderByOrderId(orderId);

			request.setAttribute("order", order);

			User user = userService.findByUserId(loggedUserId);

			request.setAttribute("user", user);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

		// Forward to a JSP page for displaying prices
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/order_detail.jsp");
		dispatcher.forward(request, response);
	}

}
