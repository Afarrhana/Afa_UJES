package oracle.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import ujes.dao.AdminDAO;
import ujes.dao.BuyerDAO;
import ujes.model.Admin;

/**
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/LoginAdmin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdmin() {
        super();
        dao = new AdminDAO();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			Admin admin = new Admin();
			//retrieve and set email and password
			admin.setAName(request.getParameter("aName"));
			admin.setPassw(request.getParameter("passw"));

			admin = AdminDAO.login(admin);
			//set user session if user is valids
			if(admin.isValid()){
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionAdmin", admin.getAName());				
				
			//set current session based on email
			request.setAttribute("a", BuyerDAO.getBuyerByEmail(admin.getAName())); 	
			//to retrieve pass info
			RequestDispatcher view = request.getRequestDispatcher("homeA.jsp");
			//login page
			view.forward(request, response);
								
			}
			//redirect to invalidLogin.jsp if user is not valid
			else{
				response.sendRedirect("invalidLoginAdmin.jsp");
			}		
		}

		catch (Throwable ex) {
			System.out.println(ex);
		}
	}

}
