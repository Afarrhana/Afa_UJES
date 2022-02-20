package ujes.controller;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;


@WebServlet("/RegisterBServlet")
public class RegisterBServlet extends HttpServlet 
{ 
     private static final long serialVersionUID =1L;
     
     public RegisterBServlet() {
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
    	 String username = request.getParameter("bName");
    	 String email = request.getParameter("bEmail");
    	 String password = request.getParameter("bpassw");
    	 String Cpassword = request.getParameter("Cpassword");
         
    	 
    	 PrintWriter out = response.getWriter();
    	 //print
    	/* out.println("<!DOCTYPE html><html><body>");
    	 out.println("Username: "+ username + "<br>");
    	 out.println("Email: "+ email + "<br>");
    	 out.println("Password: "+ password + "<br>");
    	 out.println("Confirm Password: "+ Cpassword + "<br>");
    	 out.println("</body></html>");*/
    	 
    
 		try {

             Class.forName("oracle.jdbc.driver.OracleDriver");

             Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","db_gryffindor","system");

            Statement st = conn.createStatement();
            
             String sql = "INSERT INTO BUYER (BID,BNAME,PHONENO,BPASSW,BEMAIL)values(BID.NEXTVAL,'"+username+"',null,'"+password+"','"+email+"')";

             st.executeUpdate(sql);
             out.println("Data is Successfully Inserted into Buyer Table");
             
            // response.sendRedirect("loginBuyer.jsp");
            // ResultSet sql = st.executeQuery("INSERT INTO BUYER(BEMAIL,BPASSW,PHONENO,BNAME,BID)VALUES(?,?,?,?,?)");
           
             response.sendRedirect("loginBuyer.jsp");
             
        }
 		catch (ClassNotFoundException e) {

               e.printStackTrace();

         } catch (SQLException e) {

               e.printStackTrace();

          }
    	 
     }
}
