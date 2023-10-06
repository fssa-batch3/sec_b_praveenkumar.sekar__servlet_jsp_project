package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.ServiceException;

import in.fssa.homebakery.dto.OrderDetailDTO;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.service.OrderService;

/**
 * Servlet implementation class ViewOrderListServlet
 */
@WebServlet("/orderlist")
public class ViewOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{

		int loggedUserId = (int) request.getSession().getAttribute("logged user id");

		OrderService orderService = new OrderService();

		try {
			List<OrderDetailDTO> orderList = orderService.getOrdersByUserId(loggedUserId);

			request.setAttribute("orders", orderList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/order_list.jsp");
			dispatcher.forward(request, response);

		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
		}

	}
}
