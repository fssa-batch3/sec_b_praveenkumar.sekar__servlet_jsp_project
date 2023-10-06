package in.fssa.homebakery.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import in.fssa.homebakery.model.User;
import in.fssa.homebakery.service.UserService;
/**
 * Servlet implementation class GetUserById
 */
@WebServlet("/GetUserById")
public class GetUserByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String paramId = request.getParameter("id");
		UserService userService = new UserService();
		
		if(paramId == null) {
			throw new RuntimeException("Id cannnot be null");
		}
		
		if("".equals(paramId)) {
			throw new RuntimeException("Id cannnot be empty");
		}
		
		try {
			int id = Integer.parseInt(paramId);
			
			User user = userService.findByUserId(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}