<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
	String sID =request.getParameter("sID");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","db_gryffindor","system");
		Statement st = conn.createStatement();
		int i = st.executeUpdate("DELETE FROM seller WHERE sID="+sID);
    	response.sendRedirect("sellerList.jsp");    	
	}
	catch(Exception e)
	{
		System.out.print(e);
		e.printStackTrace();
	}
%>