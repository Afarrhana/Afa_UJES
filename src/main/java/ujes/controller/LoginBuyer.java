package oracle.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import ujes.dao.BuyerDAO;
import ujes.model.Buyer;

/**
 * Servlet implementation class LoginLogoutController
 */
@WebServlet("/LoginBuyer")
public class LoginBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BuyerDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginBuyer() {
        super();
        dao = new BuyerDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			Buyer buyer = new Buyer();
			//retrieve and set email and password
			buyer.setBEmail(request.getParameter("bEmail"));
			buyer.setBPassw(request.getParameter("bpassw"));

			buyer = BuyerDAO.login(buyer);
			//set user session if user is valid
			if(buyer.isValid()){
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionBuyer", buyer.getBEmail());				
				
			//set current session based on email
			request.setAttribute("buy", BuyerDAO.getBuyerByEmail(buyer.getBEmail())); 	
			//to retrieve pass info
			RequestDispatcher view = request.getRequestDispatcher("homeB.jsp");
			//login page
			view.forward(request, response);
								
			}
			//redirect to invalidLogin.jsp if user is not valid
			else{
				response.sendRedirect("invalidLoginBuyer.jsp");
			}		
		}

		catch (Throwable ex) {
			System.out.println(ex);
		}
	}

}
