package in.fssa.homebakery.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/profile/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String attributeName = "loggedUser";
		String attributeEmail = "loggedUserEmail";
		session.removeAttribute(attributeName);
		session.removeAttribute(attributeEmail);
		session.invalidate();

		response.sendRedirect(request.getContextPath() + "/homepage");
	}

}
