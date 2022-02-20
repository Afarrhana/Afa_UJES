package ujes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ujes.db.ConnectionManager;
import ujes.model.Category;

public class CategoryDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	int cID;
	String cName, cPics;
	
	private static final String INSERT_CATEGORY_SQL = "INSERT INTO Category(cID, cName, cPics) VALUES(cID.NEXTVAL, ?, ?)";
	private static final String SELECT_CATEGORY_BY_ID = "select cID, cName, cPics from Category where cID =?";
	private static final String SELECT_ALL_CATEGORY = "select * from Category";
	private static final String DELETE_CATEGORY_SQL = "delete from Category where cID = ?";
	private static final String UPDATE_CATEGORY_SQL = "update Category set cName = ?,cPics= ? where cID = ?";
	
	public void addCategory(Category bean) {
		cName = bean.getcName();
		cPics = bean.getcPics();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(INSERT_CATEGORY_SQL);
			ps.setString(1, cName);
			ps.setString(2, cPics);

			ps.executeUpdate();
			System.out.println("Succesfully inserted category");
			
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
	}//end add
	
	public static List<Category> getAllCategory() {
		List <Category> category = new ArrayList<Category>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			String sql = SELECT_ALL_CATEGORY;
			
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				Category c = new Category();
				c.setcID(rs.getInt("cID"));
				c.setcName(rs.getString("cName"));
				c.setcPics(rs.getString("cPics"));
			} con.close();
		}catch (Exception e) { e.printStackTrace(); }
		return category;
	}//end list
	
	public static Category getCategoryById(int id) {
		Category c = new Category();
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(SELECT_CATEGORY_BY_ID);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				c.setcID(rs.getInt("cID"));
				c.setcName(rs.getString("cName"));
				c.setcPics(rs.getString("cPics"));
			}
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
		return c;
	}//end by id
	
	public void updateCategory(Category bean) {
		cID = bean.getcID();
		cName = bean.getcName();
		cPics = bean.getcPics();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(UPDATE_CATEGORY_SQL);
			ps.setString(1, cName);
			ps.setString(2, cPics);
			ps.setInt(3, cID);

			ps.executeUpdate();
			System.out.println("Succesfully updated category");
			
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
	}//end update
	
	public void deleteCategory(int id) {
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(DELETE_CATEGORY_SQL);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		}catch (Exception e) { e.printStackTrace(); }
	}//end delete
}//end categorydao
