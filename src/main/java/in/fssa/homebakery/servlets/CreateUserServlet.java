package in.fssa.homebakery.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.homebakery.exception.ServiceException;
import in.fssa.homebakery.exception.ValidationException;
import in.fssa.homebakery.model.User;
import in.fssa.homebakery.service.UserService;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/register/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		User user = new User();
		
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		user.setPhoneNo(Long.parseLong(request.getParameter("phoneNo")));
		
		UserService userService = new UserService();
		
		try {
			userService.createUser(user);
			System.out.println(user);
			HttpSession login = request.getSession();
			login.setAttribute("logged email", user.getEmail());
			login.setAttribute("logged user", user);
			login.setAttribute("logged user id", user.getId());
			
			response.getWriter().println("User logged in successfully");
			response.sendRedirect(request.getContextPath() + "/homepage");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			String message = e.getMessage();
			request.setAttribute("errormsg", message);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
	}

}
