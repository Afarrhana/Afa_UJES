package oracle.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/LogoutSeller")
public class LogoutSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutSeller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			//get the current session
			HttpSession session = request.getSession(true);
			//set current session to null.
			session.setAttribute("currentSessionSeller", null);
			//destroy session
			session.invalidate();
			//redirect to login page
			response.sendRedirect("loginSeller.jsp");
		}
			catch (Throwable ex) {
				System.out.println(ex);
		}
	}
}
