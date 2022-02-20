package ujes.controller;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;


@WebServlet("/RegisterSServlet")
public class RegisterSServlet extends HttpServlet 
{ 
     private static final long serialVersionUID =1L;
     
     public RegisterSServlet() {
    	 super();
     }
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		// TODO Auto-generated method stub
         response.getWriter().append("Served at: ").append(request.getContextPath());
 		
 	}
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
     {
    	 doGet(request, response);
    	 
    	 //retrieve
    	 String username = request.getParameter("sName");
    	 String email = request.getParameter("sEmail");
    	 String password = request.getParameter("spassw");
    	 String Cpassword = request.getParameter("Cpassword");
         
    	 response.setContentType("text/html");  
    	 
    	 PrintWriter out = response.getWriter();
    	 //print
    	 /*out.println("<!DOCTYPE html><html><body>");
    	 out.println("Username: "+ username + "<br>");
    	 out.println("Email: "+ email + "<br>");
    	 out.println("Password: "+ password + "<br>");
    	 out.println("Confirm Password: "+ Cpassword + "<br>");
    	 out.println("</body></html>");*/
    
 		try {

             Class.forName("oracle.jdbc.driver.OracleDriver");

             Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","db_gryffindor","system");

             Statement st = conn.createStatement();
            
             String sql = "INSERT INTO SELLER (SID, SNAME, SPASSW, SHOPNAME, SEMAIL, ACCNO, AID) values(SID.NEXTVAL,'"+username+"','"+password+"','-','"+email+"',null,1)";

             st.executeUpdate(sql);
             out.println("Data is Successfully Inserted into Seller Table");
             response.sendRedirect("loginSeller.jsp");

        }
 		catch (ClassNotFoundException e) {

               e.printStackTrace();

         } catch (SQLException e) {

               e.printStackTrace();

          }
    	 
     }
}
