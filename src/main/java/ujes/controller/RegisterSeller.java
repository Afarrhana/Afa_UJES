package oracle.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ujes.dao.SellerDAO;
import ujes.model.Seller;
import ujes.db.ConnectionManager;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterSeller")
public class RegisterSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SellerDAO dao;   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSeller() {
        super();
        dao = new SellerDAO();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Seller seller = new Seller();
		//retrieve input and set
		seller.setSName(request.getParameter("sName"));
		seller.setSPassw(request.getParameter("spassw"));
		seller.setSEmail(request.getParameter("sEmail"));
	
		seller = SellerDAO.getSeller(seller);
		
		//check if user exists
		if(!seller.isValid()){
        	try {
        		//if user not exist, add/register the user
				dao.add(seller);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	//redirect to login page
        	response.sendRedirect("loginSeller.jsp");
        }      
	}
}
