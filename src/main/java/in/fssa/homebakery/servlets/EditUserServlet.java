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
import in.fssa.homebakery.model.User;
import in.fssa.homebakery.service.UserService;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/profile/edit")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		
		String userId = request.getParameter("userid");
		int userid = Integer.parseInt(userId);
		try {
			User user = userService.findByUserId(userid);
			request.setAttribute("userDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_user.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
		
	}

}
