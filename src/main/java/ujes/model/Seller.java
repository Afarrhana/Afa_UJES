package ujes.model;

public class Seller {

	private int sID;
	private String sName;
	private String spassw;
	private String shopName;
	private String sEmail;
	private long accNo;
	private int aID;
	private boolean valid;
	
	public void setSID(int sID) {this.sID = sID;}
	public int getSID() {return sID;}
	
	public void setSName(String sName) {this.sName = sName;}
	public String getSName() {return sName;}
	
	public void setSPassw(String spassw) {this.spassw = spassw;}
	public String getSPassw() {return spassw;}
	
	public void setShopName(String shopName) {this.shopName = shopName;}
	public String getShopName() {return shopName;}
	
	public void setSEmail(String sEmail) {this.sEmail = sEmail;}
	public String getSEmail() {return sEmail;}
	
	public void setAccNo(long accNo) {this.accNo = accNo;}
	public long getAccNo() {return accNo;}
	
	public void setAID(int aID) {this.aID = aID;}
	public int getAID() {return aID;}
	
	public boolean isValid() {return valid;}
	public void setValid(boolean valid) {this.valid = valid;}
}
