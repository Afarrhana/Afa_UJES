package ujes.model;

public class Buyer {

	private int bID;
	private String bName;
	private int phoneNo;
	private String bpassw;
	private String bEmail;
	private boolean valid;
	
	public void setBID(int bID) {this.bID = bID;}
	public int getBID() {return bID;}
	
	public void setBName(String bName) {this.bName = bName;}
	public String getBName() {return bName;}
	
	public void setPhoneNo(int phoneNo) {this.phoneNo = phoneNo;}
	public int getPhoneNo() {return phoneNo;}
	
	public void setBPassw(String bpassw) {this.bpassw = bpassw;}
	public String getBPassw() {return bpassw;}
	
	public void setBEmail(String bEmail) {this.bEmail = bEmail;}
	public String getBEmail() {return bEmail;}
	
	public boolean isValid() {return valid;}
	public void setValid(boolean valid) {this.valid = valid;}
}
