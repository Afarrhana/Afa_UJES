<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="ujes.db.ConnectionManager"%>
<%
	String bID =request.getParameter("bID");
	try
	{
		Connection conn = ConnectionManager.getConnection();
		Statement st = conn.createStatement();
		int i=st.executeUpdate("DELETE FROM buyer WHERE bID="+bID);
    	response.sendRedirect("buyerList.jsp");
	}
	catch(Exception e)
	{
		System.out.print(e);
		e.printStackTrace();
	}
%>
