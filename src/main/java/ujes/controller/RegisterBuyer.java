package ujes.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import ujes.db.ConnectionManager;
import ujes.dao.BuyerDAO;
import ujes.model.Buyer;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterBuyer")
public class RegisterBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BuyerDAO dao;   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterBuyer() {
        super();
        dao = new BuyerDAO();
        // TODO Auto-generated constructor stub
    }
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Buyer buyer = new Buyer();
		//retrieve input and set
		buyer.setBName(request.getParameter("bName"));
		buyer.setPhoneNo(Integer.parseInt(request.getParameter("phoneNo")));
		buyer.setBPassw(request.getParameter("bpassw"));
		buyer.setBEmail(request.getParameter("bEmail"));
		
		buyer = BuyerDAO.getBuyer(buyer);
		
		//check if user exists
		if(!buyer.isValid()){
        	try {
        		//if user not exist, add/register the user
				dao.add(buyer);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	//redirect to login page
        	response.sendRedirect("loginBuyer.jsp");
        }      
	}
}
