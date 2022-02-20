package ujes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ujes.db.ConnectionManager;
import ujes.model.Category;
import ujes.model.Product;

public class ProductDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	int cID, pID, pQty;
	String pName, pDesc, pPics;
	double pPrice;
	
	private static final String INSERT_PRODUCT_SQL = "INSERT INTO Product (pID, pName, pDesc, pPrice, pQty, pPics, cID) VALUES(pID.NEXTVAL, ?, ?, ?, ?, ?, ?)";
	private static final String SELECT_PRODUCT_BY_ID = "select pID, pName, pDesc, pPrice, pQty, pPics, cID from Product where pID =?";
	private static final String SELECT_ALL_PRODUCT = "select * from Product";
	private static final String DELETE_PRODUCT_SQL = "delete from Product where pID = ?";
	private static final String UPDATE_PRODUCT_SQL = "update Product set pName =?, pDesc=?, pPrice=?, pQty=?, pPics=?, cID=? where pID =?";
	
	public void addProduct(Product bean) {
		pName = bean.getpName();
		pDesc = bean.getpDesc();
		pPrice = bean.getpPrice();
		pQty = bean.getpQty();
		pPics = bean.getpPics();
		cID = bean.getcID();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(INSERT_PRODUCT_SQL);
			ps.setString(1, pName);
			ps.setString(2, pDesc);
			ps.setDouble(3, pPrice);
			ps.setInt(4, pQty);
			ps.setString(5, pPics);
			ps.setInt(6, cID);

			ps.executeUpdate();
			System.out.println("Succesfully inserted product");
			
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
	}//end add
	
	public void addBridgeProduct(Product bean) {
		pName = bean.getpName();
		pDesc = bean.getpDesc();
		pPrice = bean.getpPrice();
		pQty = bean.getpQty();
		pPics = bean.getpPics();
		cID = bean.getcID();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(INSERT_PRODUCT_SQL);
			ps.setString(1, pName);
			ps.setString(2, pDesc);
			ps.setDouble(3, pPrice);
			ps.setInt(4, pQty);
			ps.setString(5, pPics);
			ps.setInt(6, cID);

			ps.executeUpdate();
			System.out.println("Succesfully inserted product");
			
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
	}//end add
	
	public static List<Product> getAllProduct() {
		List <Product> product = new ArrayList<Product>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			String sql = SELECT_ALL_PRODUCT;
			
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				Product p = new Product();
				p.setpID(rs.getInt("pID"));
				p.setpName(rs.getString("pName"));
				p.setpDesc(rs.getString("pDesc"));
				p.setpPrice(rs.getDouble("pPrice"));
				p.setpQty(rs.getInt("pQty"));
				p.setpPics(rs.getString("pPics"));
				p.setcID(rs.getInt("cID"));
			} con.close();
		}catch (Exception e) { e.printStackTrace(); }
		return product;
	}//end list
	
	public static Product getProductById(int id) {
		Product p = new Product();
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(SELECT_PRODUCT_BY_ID);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				p.setpID(rs.getInt("pID"));
				p.setpName(rs.getString("pName"));
				p.setpDesc(rs.getString("pDesc"));
				p.setpPrice(rs.getDouble("pPrice"));
				p.setpQty(rs.getInt("pQty"));
				p.setpPics(rs.getString("pPics"));
				p.setcID(rs.getInt("cID"));
			}
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
		return p;
	}//end by id
	
	public void updateProduct(Product bean) {
		pName = bean.getpName();
		pDesc = bean.getpDesc();
		pPrice = bean.getpPrice();
		pQty = bean.getpQty();
		pPics = bean.getpPics();
		cID = bean.getcID();
		pID = bean.getpID();
		
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(UPDATE_PRODUCT_SQL);
			ps.setString(1, pName);
			ps.setString(2, pDesc);
			ps.setDouble(3, pPrice);
			ps.setInt(4, pQty);
			ps.setString(5, pPics);
			ps.setInt(6, cID);
			ps.setInt(7, pID);

			ps.executeUpdate();
			System.out.println("Succesfully updated product");
			
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
	}//end update
	
	public void deleteProduct(int id) {
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(DELETE_PRODUCT_SQL);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		}catch (Exception e) { e.printStackTrace(); }
	}//end delete
}
