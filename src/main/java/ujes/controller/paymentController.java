package ujes.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ujes.db.ConnectionManager;


/**
 * Servlet implementation class paymentController
 */
@WebServlet("/paymentController")
public class paymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int odID = Integer.parseInt(request.getParameter("oID"));
		
		Date date = new Date();
		java.sql.Date payDate = new java.sql.Date(date.getTime());
		
		try {
			String searchQuery = "insert into payment(payDate, oID) values ('"+payDate+"','"+odID+"')";
			Connection con = ConnectionManager.getConnection();
			ResultSet rs = null; 
			PreparedStatement ps=null;
			Statement stmt=null;
				
			//3. create statement 
			stmt = con.createStatement();

			//4. execute query
			stmt.executeUpdate(searchQuery);
			System.out.println("Data is Successfully Updated into payment Table");
			
			
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
			
			
		}
			
	response.sendRedirect("payment.jsp");
		
		
	}

}
