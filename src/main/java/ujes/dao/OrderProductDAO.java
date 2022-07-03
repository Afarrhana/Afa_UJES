package ujes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ujes.db.ConnectionManager;
import ujes.model.OrderProduct;

public class OrderProductDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	int oID, pID, qty, bID;
	double totPrice;
	
	private static final String SELECT_ALL_ORDERPRODUCT = "select * from orderproduct";
	private static final String DELETE_ORDERPRODUCT_SQL = "delete from orderproduct where oID = ?";
	
	
	public static List<OrderProduct> getAllOrderProduct() {
		List <OrderProduct> orderproduct = new ArrayList<OrderProduct>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			String sql = SELECT_ALL_ORDERPRODUCT;
			
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				OrderProduct o = new OrderProduct();
				o.setoID(rs.getInt("oID"));
				o.setQty(rs.getInt("int qty"));
				o.settotPrice(rs.getDouble("totPrice"));
				o.setpID(rs.getInt("pID"));
				o.setbID(rs.getInt("bID"));
			} con.close();
		}catch (Exception e) { e.printStackTrace(); }
		return orderproduct;
	}//end list
	
	//delete order
	public void deleteOrder(int id) {
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(DELETE_ORDERPRODUCT_SQL);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		}catch (Exception e) { e.printStackTrace(); }
	}//end delete
}//end categorydao
