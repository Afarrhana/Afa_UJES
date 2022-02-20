package ujes.dao;

import java.sql.*;
import java.util.*;
import java.util.ArrayList;
import java.util.List;

import ujes.db.ConnectionManager;
import ujes.model.Buyer;

public class BuyerAdminDAO {
	
	static Connection con = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String bName, bpassw, bEmail;
	static int bID,phoneNo;

	//select all buyer
	public static List<Buyer> getAllBuyers(){
		List<Buyer> buy = new ArrayList<Buyer>();
		
		try {
			//call getConnection method
			con = ConnectionManager.getConnection();
			
			//create statement
			stmt = con.createStatement();
			String sql = "SELECT * FROM buyer ORDER BY bID";
			
			//execute query
			rs = stmt.executeQuery(sql);
			
			
			//process result
			while(rs.next()) {
				Buyer b = new Buyer();
				b.setBID(rs.getInt("bID"));
				b.setBName(rs.getString("bName"));
				b.setPhoneNo(rs.getInt("phoneNo"));
				b.setBPassw(rs.getString("bpassw"));
				b.setBEmail(rs.getString("bEmail"));
				buy.add(b);
			}
			
			//close connection
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return buy;
	}
	
	
	//get buyer by id
			public static Buyer getTicketById(int id) {
				Buyer b = new Buyer();
				try {
					//call getConnection method
					con = ConnectionManager.getConnection();
					
					//create statement
					ps = con.prepareStatement("SELECT * FROM buyer WHERE bID=?");
					ps.setInt(1, id);
					
					//execute query
					rs = ps.executeQuery();
					if(rs.next()) {
						b.setBID(rs.getInt("bID"));
						b.setBName(rs.getString("bName"));
						b.setPhoneNo(rs.getInt("phoneNo"));
						b.setBPassw(rs.getString("bpassw"));
						b.setBEmail(rs.getString("bEmail"));
					}
					
					//close connection
					con.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return b;
			}
			
			
			//delete buyer
			public void deleteBuyer(int id) {
				try {
					//call getConnection method
					con = ConnectionManager.getConnection();
					
					//create statement
					ps = con.prepareStatement("DELETE FROM buyer WHERE bID=?");
					ps.setInt(1, id);
					
					//execute query
					ps.executeUpdate();
					
					//close connection
					con.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
}
