package oracle.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import ujes.dao.CategoryDAO;
import ujes.dao.SellerDAO;
import ujes.model.Seller;

/**
 * Servlet implementation class LoginLogoutController
 */
@WebServlet("/LoginSeller")
public class LoginSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SellerDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginSeller() {
        super();
        dao = new SellerDAO();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			Seller seller = new Seller();
			//retrieve and set email and password
			seller.setSEmail(request.getParameter("sEmail"));
			seller.setSPassw(request.getParameter("spassw"));

			seller = SellerDAO.login(seller);
			//set user session if user is valid
			if(seller.isValid()){
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionSeller", seller.getSEmail());				
				
			//set current session based on email
			request.setAttribute("seller", SellerDAO.getSellerByEmail(seller.getSEmail())); 	
			//to retrieve pass info
			RequestDispatcher view = request.getRequestDispatcher("homeS.jsp");
			//login page
			view.forward(request, response);
								
			}
			//redirect to invalidLogin.jsp if user is not valid
			else{
				response.sendRedirect("invalidLoginSeller.jsp");
			}		
		}

		catch (Throwable ex) {
			System.out.println(ex);
		}
	}

}
