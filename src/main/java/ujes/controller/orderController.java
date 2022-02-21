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
 * Servlet implementation class orderController
 */
@WebServlet("/orderController")
public class orderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int pID = Integer.parseInt(request.getParameter("pID"));
		int bID = Integer.parseInt(request.getParameter("bID"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		float pPrice = Float.parseFloat(request.getParameter("pPrice"));
		
		Date date = new Date();
		java.sql.Date currDate = new java.sql.Date(date.getTime());
		
		float totalPrice=0;
		
		totalPrice=pPrice*qty;
		
		try {
			String searchQuery = "insert into OrderProduct(odDate, pID, bID, qty, totprice) values ('"+currDate+"','"+pID+"', '"+bID+"' ,'"+qty+"', '"+totalPrice+"')";
			Connection con = ConnectionManager.getConnection();
			 ResultSet rs = null; 
			PreparedStatement ps=null;
			Statement stmt=null;
				
			//3. create statement 
			stmt = con.createStatement();

			//4. execute query
			stmt.executeUpdate(searchQuery);
			System.out.println("Data is Successfully Updated into Customer Order Table");
			
			
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
			
			
		}
			
	response.sendRedirect("checkout.jsp");
		
		
	}

}
