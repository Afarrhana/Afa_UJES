<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="ujes.db.ConnectionManager"%>
<%
	String odID =request.getParameter("odID");
	try
	{
		Connection conn = ConnectionManager.getConnection();
		Statement st = conn.createStatement();
		int i=st.executeUpdate("DELETE FROM OrderProduct WHERE odID="+odID);
    	response.sendRedirect("homeBCopy.jsp");
	}
	catch(Exception e)
	{
		System.out.print(e);
		e.printStackTrace();
	}
%>
