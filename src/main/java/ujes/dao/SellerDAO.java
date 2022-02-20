package ujes.dao;

import java.security.*;
import java.sql.*;
import java.util.*;

import ujes.db.ConnectionManager;
import ujes.model.Seller;

public class SellerDAO {
	
	static Connection con = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String sName, spassw, sEmail,shopName;
	static int sID,accNo,aID;
	
	//method for login
	public static Seller login(Seller bean) throws NoSuchAlgorithmException{
		//get email and password
		sEmail = bean.getSEmail();
		spassw = bean.getSPassw();

		//convert the password to MD5
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(spassw.getBytes());

		byte byteData[] = md.digest();

		//convert the byte to hex format
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		String query = "select * from seller where sEmail='" + sEmail + "'AND spassw='" + spassw + "'";

		try {
			//call getConnection() method //3. create statement  //4. execute query
			con = ConnectionManager.getConnection();
			//3. create statement
			stmt = con.createStatement();
			//4. execute query
			rs = stmt.executeQuery(query);
			boolean more = rs.next();

			// if user exists set the isValid variable to true
			if (more) {
				String sEmail = rs.getString("sEmail");
				bean.setSEmail(sEmail);

				bean.setValid(true);
			}
			// if user does not exist set the isValid variable to false
			else if (!more) {
				bean.setValid(false);
			}

			//5. close connection
			con.close();
		}catch(Exception e) {
			e.printStackTrace();		
		}

		return bean;
	}
	
	
	//add new seller (register)
	public void add(Seller bean) throws NoSuchAlgorithmException{
		//get email,name and password
		sName = bean.getSName();
		spassw = bean.getSPassw();
		shopName = bean.getShopName();
		sEmail = bean.getSEmail();
		accNo = bean.getAccNo();
		aID = bean.getAID();
		
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(spassw.getBytes());

		byte byteData[] = md.digest();

		//convert the byte to hex format
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}
		String spassw = sb.toString();

		try {
			//call getConnection() method 
			con = ConnectionManager.getConnection();
			//3. create statement  
			ps=con.prepareStatement("insert into seller(sID,sName, spassw, shopName, sEmail, accNo, aID)values(?,?,?,-,?,null,1)");
			ps.setInt(1,sID);
			ps.setString(2,sName);
			ps.setString(3,spassw);
			ps.setString(4,shopName);
			ps.setString(5,sEmail);
			ps.setInt(6,accNo);
			ps.setInt(7,aID);
			//4. execute query
			ps.executeUpdate();			
			
			//5. close connection
			con.close();
		}catch(Exception e) {
			e.printStackTrace();		
		}

	}

	//method to get seller
	public static Seller getSeller(Seller bean)  {   
		//get email
		sEmail = bean.getSEmail();
		String searchQuery = "select * from seller where sEmail='" + sEmail + "'";
		try {
			//call getConnection() method 
			con = ConnectionManager.getConnection();
			//3. create statement  
			stmt = con.createStatement();
			//execute statement
			rs = stmt.executeQuery(searchQuery);

			boolean more = rs.next();

			// if passenger exists set the isValid variable to true
			if (more) {
				String sEmail = rs.getString("sEmail");
				bean.setSEmail(sEmail);
				bean.setValid(true);
			}
			// if passenger does not exist set the isValid variable to false
			else if (!more) {
				bean.setValid(false);
			}
			//5. close connection
			con.close();	
		}catch(Exception e) {
			e.printStackTrace();		
		}
		return bean;
	}

	//get seller by email
	public static Seller getSellerByEmail(String sEmail) {
		Seller sell = new Seller();
		try {
			//call getConnection() method 
			con = ConnectionManager.getConnection();
			//3. create statement  
			ps=con.prepareStatement("select * from seller where sEmail=?");
			ps.setString(1, sEmail);
			//4. execute query
			rs = ps.executeQuery();

			if (rs.next()) {	            
				sell.setSID(rs.getInt("sID"));
				sell.setSEmail(rs.getString("sEmail"));				
				sell.setSPassw(rs.getString("spassw"));

			}
			//5. close connection
			con.close();
		}catch(Exception e) {
			e.printStackTrace();		
		}

		return sell;
	}

	//get passenger by id
	public static Seller getSellerById(int sID) {
		Seller sell = new Seller();
		try {
			//call getConnection() method 
			con = ConnectionManager.getConnection();
			//3. create statement  
			ps=con.prepareStatement("select * from seller where sID=?");
			ps.setInt(1, sID);
			//4. execute query
			rs = ps.executeQuery();

			if (rs.next()) {
				sell.setSID(rs.getInt("sID"));
				sell.setSEmail(rs.getString("sEmail"));				
				sell.setSPassw(rs.getString("spassw"));

			}
			//5. close connection
			con.close();
		}catch(Exception e) {
			e.printStackTrace();		
		}

		return sell;
	}
	

	public static List<Seller> getSellerId() {
		List<Seller> seller = new ArrayList<Seller>();
		try {
			//call getConnection() method 
			con = ConnectionManager.getConnection();
			//3. create statement  
			stmt = con.createStatement();
			//4. execute query
			rs = stmt.executeQuery("select sID, sEmail from buyer");

			while (rs.next()) {
				Seller sell = new Seller();
				sell.setSID(rs.getInt("sID"));
				sell.setSEmail(rs.getString("sEmail"));
				seller.add(sell);
			}
			//5. close connection
			con.close();
		}catch(Exception e) {
			e.printStackTrace();		
		}

		return seller;
	}
			
			
			
}
