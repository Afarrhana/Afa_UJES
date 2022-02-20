package ujes.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginBServlet
 */
@WebServlet("/LoginBServlet")
public class LoginBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /** 
     * @see HttpServlet#HttpServlet()
     */
    public LoginBServlet() {
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
		
		String email = request.getParameter("bEmail");
		String password = request.getParameter("bPassw");
		
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html><html><body>");
		out.print("Email:" + email + "<br>");
		out.print("Password:"+ password + "<br>");
		
		out.print("</body></html>");
		
		try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","db_gryffindor","system");
            Statement st = conn.createStatement();
           
            ResultSet sql = st.executeQuery("SELECT * FROM BUYER WHERE BEMAIL = '" + email + "' AND BPASSW = '" + password + "'");
            if(sql.next()) {
            	response.sendRedirect("homeB.jsp");
            }
            else {
            	response.sendRedirect("invalidLoginBuyer.jsp");
            }
            
        }
		
		catch (ClassNotFoundException e) {
			e.printStackTrace();
        } 
		
		catch (SQLException e) {
            e.printStackTrace();
        }
	}

}
