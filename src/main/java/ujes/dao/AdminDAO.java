package ujes.dao;

import java.util.ArrayList;
import java.util.List;

import ujes.db.ConnectionManager;
import ujes.model.Admin;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AdminDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	int aID, newaID;
	static String aName;
	static String aPassw;
	
	private static final String INSERT_ADMIN_SQL = "INSERT INTO ADMIN(aID, aName, Passw, newaID) VALUES(aID.NEXTVAL, ?, ?, 1)";
	private static final String SELECT_ADMIN_BY_ID = "select aID, aName, Passw from Admin where aID =? and aID!=1";
	private static final String SELECT_ALL_ADMIN = "select * from Admin";
	private static final String DELETE_ADMIN_SQL = "delete from Admin where aID = ?";
	private static final String UPDATE_ADMIN_SQL = "update Admin set aName = ?, passw= ? where aID = ?";
	
	public void addAdmin(Admin bean) {
		aName = bean.getAName();
		aPassw = bean.getPassw();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(INSERT_ADMIN_SQL);
			ps.setString(1, aName);
			ps.setString(2, aPassw);

			ps.executeUpdate();
			System.out.println("Succesfully inserted admin");
			
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
	}//end add
	
	public static List<Admin> getAllAdmin() {
		List <Admin> admin = new ArrayList<Admin>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			String sql = SELECT_ALL_ADMIN;
			
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				Admin c = new Admin();
				c.setAID(rs.getInt("aID"));
				c.setAName(rs.getString("aName"));
				c.setPassw(rs.getString("aPassw"));
				c.setNewaID(rs.getInt("newaID"));
			} con.close();
		}catch (Exception e) { e.printStackTrace(); }
		return admin;
	}//end list
	
	public static Admin getAdminById(int id) {
		Admin c = new Admin();
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(SELECT_ADMIN_BY_ID);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				c.setAID(rs.getInt("aID"));
				c.setAName(rs.getString("aName"));
				c.setPassw(rs.getString("aPassw"));
			}
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
		return c;
	}//end by id
	
	public void updateAdmin(Admin bean) {
		aID = bean.getAID();
		aName = bean.getAName();
		aPassw = bean.getPassw();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(UPDATE_ADMIN_SQL);
			ps.setString(1, aName);
			ps.setString(2, aPassw);
			ps.setInt(3, aID);

			ps.executeUpdate();
			System.out.println("Succesfully updated admin");
			
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
	}//end update
	
	public void deleteAdmin(int id) {
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(DELETE_ADMIN_SQL);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		}catch (Exception e) { e.printStackTrace(); }
	}//end delete
	//method for login
			public static Admin login(Admin bean) throws NoSuchAlgorithmException{
				//get email and password
				aName = bean.getAName();
				aPassw = bean.getPassw();

				//convert the password to MD5
				MessageDigest md = MessageDigest.getInstance("MD5");
				md.update(aPassw.getBytes());

				byte byteData[] = md.digest();

				//convert the byte to hex format
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < byteData.length; i++) {
					sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
				}

				String query = "select * from Admin where aName='" + aName + "'AND passw='" + aPassw + "'";

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
						int aID = rs.getInt("aID");
						String aName = rs.getString("aName");
						bean.setAID(aID);
						bean.setAName(aName);

						System.out.println(aName);
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
		
			
			//add new user (register)
			public void add(Admin bean) throws NoSuchAlgorithmException{
				//get name and password
				aName = bean.getAName();
				aPassw = bean.getPassw();

				MessageDigest md = MessageDigest.getInstance("MD5");
				md.update(aPassw.getBytes());

				byte byteData[] = md.digest();

				//convert the byte to hex format
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < byteData.length; i++) {
					sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
				}
				String aPassw = sb.toString();

				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					ps=con.prepareStatement("insert into Admin(aName,passw)values(?,?)");
					ps.setString(1,aName);
					ps.setString(2,aPassw);
					//4. execute query
					ps.executeUpdate();			
					
					//5. close connection
					con.close();
				}catch(Exception e) {
					e.printStackTrace();		
				}
			}
			
			
			//method to get user
			public  Admin getAdmin(Admin bean)  {   
				//get email
				aName = bean.getAName();
				String searchQuery = "select * from Admin where aName='" + aName + "'";
				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					stmt = con.createStatement();
					//execute statement
					rs = stmt.executeQuery(searchQuery);

					boolean more = rs.next();

					// if user exists set the isValid variable to true
					if (more) {
						String aName = rs.getString("aName");
						bean.setAName(aName);
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
			
			
			//get user by name
			public static Admin getAdminByEmail(String aName) {
				Admin a = new Admin();
				try {
					//call getConnection() method 
					con = ConnectionManager.getConnection();
					//3. create statement  
					ps=con.prepareStatement("select * from admin where aName=?");
					ps.setString(1, aName);
					//4. execute query
					rs = ps.executeQuery();

					if (rs.next()) {	            
						a.setAID(rs.getInt("aID"));
						a.setAName(rs.getString("aName"));				
						a.setPassw(rs.getString("passw"));

					}
					//5. close connection
					con.close();
				}catch(Exception e) {
					e.printStackTrace();		
				}

				return a;
			}
}//end ADMINdao
