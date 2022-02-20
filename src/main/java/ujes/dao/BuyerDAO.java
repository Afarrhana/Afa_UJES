package ujes.dao;

import java.security.*;
import java.sql.*;
import java.util.*;

import ujes.db.ConnectionManager;
import ujes.model.Buyer;

public class BuyerDAO {
	
	static Connection con = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String bName, bpassw, bEmail;
	static int bID,phoneNo;

	
	//method for login
		public static Buyer login(Buyer bean) throws NoSuchAlgorithmException{
			//get email and password
			bEmail = bean.getBEmail();
			bpassw = bean.getBPassw();

			//convert the password to MD5
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(bpassw.getBytes());

			byte byteData[] = md.digest();

			//convert the byte to hex format
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			String query = "select * from buyer where bEmail='" + bEmail + "'AND bpassw='" + sb.toString() + "'";

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
					String bEmail = rs.getString("bEmail");
					bean.setBEmail(bEmail);

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
	
	
		//add new buyer (register)
		public void add(Buyer bean) throws NoSuchAlgorithmException{
			//get email,name and password
			bID = bean.getBID();
			bName = bean.getBName();
			phoneNo = bean.getPhoneNo();
			bpassw = bean.getBPassw();
			bEmail = bean.getBEmail();

			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(bpassw.getBytes());

			byte byteData[] = md.digest();

			//convert the byte to hex format
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			String bpassw = sb.toString();

			try {
				//call getConnection() method 
				con = ConnectionManager.getConnection();
				//3. create statement  
				String query = "INSERT INTO BUYER(BNAME,PHONENO,BPASSW,BEMAIL)values(?,?,?,?)";
				ps=con.prepareStatement(query);
				ps.setString(1,bName);
				ps.setInt(2,phoneNo);
				ps.setString(3,bpassw);
				ps.setString(4,bEmail);
				//4. execute query
				ps.executeUpdate();			
				
				//5. close connection
				con.close();
			}catch(Exception e) {
				e.printStackTrace();		
			}

		}

			//method to get buyer
			public static Buyer getBuyer(Buyer bean)  {   
				//get email
				bEmail = bean.getBEmail();
				String searchQuery = "select * from buyer where bEmail='" + bEmail + "'";
				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					stmt = con.createStatement();
					//execute statement
					rs = stmt.executeQuery(searchQuery);

					boolean more = rs.next();

					// if buyer exists set the isValid variable to true
					if (more) {
						String bEmail = rs.getString("bEmail");
						bean.setBEmail(bEmail);
						bean.setValid(true);
					}
					// if buyer does not exist set the isValid variable to false
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

			//get buyer by email
			public static Buyer getBuyerByEmail(String bEmail) {
				Buyer buy = new Buyer();
				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					ps=con.prepareStatement("select * from buyer where bEmail=?");
					ps.setString(1, bEmail);
					//4. execute query
					rs = ps.executeQuery();

					if (rs.next()) {	            
						buy.setBID(rs.getInt("bID"));
						buy.setBEmail(rs.getString("bEmail"));				
						buy.setBPassw(rs.getString("bpassw"));

					}
					//5. close connection
					con.close();
				}catch(Exception e) {
					e.printStackTrace();		
				}

				return buy;
			}

			//get buyer by id
			public static Buyer getBuyerById(int bID) {
				Buyer buy = new Buyer();
				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					ps=con.prepareStatement("select * from buyer where bID=?");
					ps.setInt(1, bID);
					//4. execute query
					rs = ps.executeQuery();

					if (rs.next()) {
						buy.setBID(rs.getInt("bID"));
						buy.setBEmail(rs.getString("bEmail"));				
						buy.setBPassw(rs.getString("bpassw"));

					}
					//5. close connection
					con.close();
				}catch(Exception e) {
					e.printStackTrace();		
				}

				return buy;
			}
			

			public static List<Buyer> getBuyerId() {
				List<Buyer> buyer = new ArrayList<Buyer>();
				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					stmt = con.createStatement();
					//4. execute query
					rs = stmt.executeQuery("select bID, bEmail from buyer");

					while (rs.next()) {
						Buyer buy = new Buyer();
						buy.setBID(rs.getInt("bID"));
						buy.setBEmail(rs.getString("bEmail"));
						buyer.add(buy);
					}
					//5. close connection
					con.close();
				}catch(Exception e) {
					e.printStackTrace();		
				}

				return buyer;
			}
			
			
			//select all buyer
			public static List<Buyer> getAllBuyers(){
				List<Buyer> buyer = new ArrayList<Buyer>();
				
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
						buyer.add(b);
					}
					
					//close connection
					con.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				return buyer;
			}
}
