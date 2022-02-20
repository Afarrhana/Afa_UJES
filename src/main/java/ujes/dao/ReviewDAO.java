package ujes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import ujes.db.ConnectionManager;
import ujes.model.Buyer;
import ujes.model.Product;
import ujes.model.Review;

public class ReviewDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	int fID, pID, bID, pRate;
	String pComment, pImage;
	
	private static final String INSERT_REVIEW_SQL = "INSERT INTO prodFeedback (fID, pID, bID, pRate, pComment, pImage) VALUES(pID.NEXTVAL, ?, ?, ?, ?, ?)";
	private static final String SELECT_REVIEW_BY_ID = "select fID, pID, bID, pRate, pComment, pImage from prodFeedback where fID =?";
	private static final String SELECT_ALL_PRODUCT = "select * from prodFeedback";
	private static final String DELETE_PRODUCT_SQL = "delete from prodFeedback where fID = ?";
	private static final String UPDATE_PRODUCT_SQL = "update prodFeedback set pRate =?, pComment=?, pImage=?, pID=?, bID=?";
	
	
	public static List<Review> getAllReview() {
		List <Review> review = new ArrayList<Review>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			String sql = SELECT_ALL_REVIEW;
			
			rs= stmt.executeQuery(sql);
			while(rs.next()) {
				Review r = new Review();
				r.setfID(rs.getInt("fID"));
				r.setpComment(rs.getString("pComment"));
				r.setpImage(rs.getString("pImage"));
				r.setpID(rs.getInt("pID"));
				r.setbID(rs.getInt("bID"));
				r.setpRate(rs.getInt("pRate"));
			} con.close();
		}catch (Exception e) { e.printStackTrace(); }
		return review;
	}//end list
	
	public static Review getReviewById(int id) {
		Review r = new Review();
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(SELECT_REVIEW_BY_ID);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				r.setfID(rs.getInt("fID"));
				r.setpComment(rs.getString("pComment"));
				r.setpImage(rs.getString("pImage"));
				r.setpID(rs.getInt("pID"));
				r.setbID(rs.getInt("bID"));
				r.setpRate(rs.getInt("pRate"));
			}
			con.close();
		}catch(Exception e) { e.printStackTrace(); }
		return r;
	}//end by id
	
	public void deleteReview(int id) {
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement(DELETE_REVIEW_SQL);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		}catch (Exception e) { e.printStackTrace(); }
	}//end delete
}