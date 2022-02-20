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
@WebServlet("/LoginAServlet")
public class LoginAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /** 
     * @see HttpServlet#HttpServlet()
     */
    public LoginAServlet() {
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
		
		String username = request.getParameter("aName");
		String password = request.getParameter("passw");
		
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html><html><body>");
		out.print("Username:" + username + "<br>");
		out.print("Password:"+ password + "<br>");
		
		out.print("</body></html>");
		
		try {
			 Class.forName("oracle.jdbc.driver.OracleDriver");
            
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","db_gryffindor","system");
            Statement st = conn.createStatement();
            													
            ResultSet sql = st.executeQuery("SELECT * FROM ADMIN WHERE ANAME = '" + username + "' AND PASSW = '" + password + "'");
            if(sql.next()) {
            	response.sendRedirect("homeA.jsp");
            }
            else {
            	response.sendRedirect("invalidLoginAdmin.jsp");
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
