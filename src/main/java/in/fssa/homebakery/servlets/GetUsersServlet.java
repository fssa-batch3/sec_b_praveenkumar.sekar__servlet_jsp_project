package in.fssa.homebakery.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import in.fssa.homebakery.models.ResponseEntity;
import in.fssa.homebakery.model.User;
import in.fssa.homebakery.service.UserService;
/**
 * Servlet implementation class UserCreateServelet
 */
@WebServlet("/users")
public class GetUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		PrintWriter out = response.getWriter();
//		UserService userService = new UserService();
//		try {
//			Set<User> userList = userService.getAll();
//			out.println(userList);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		UserService userService = new UserService();
		Set<User> userList = userService.getAllUsers();
		
		request.setAttribute("users", userList);
		
		ResponseEntity res = new ResponseEntity();
		res.setStatusCode(200);
		res.setData(userList);
		
		res.setMessage("user details fetched successfully");
		
		Gson gson = new Gson();
		String responseJson = gson.toJson(res);
		
		System.out.println(responseJson);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(responseJson);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher rd = request.getRequestDispatcher("get_all_users.jsp");
		rd.forward(request, response);
	}
}