package ujes.model;

public class Admin {

	private int aID;
	private String aName;
	private String passw;
	private int newaID;
	private boolean valid;
	
	public void setAID(int aID) {this.aID = aID;}
	public int getAID() {return aID;}
	
	public void setAName(String aName) {this.aName = aName;}
	public String getAName() {return aName;}
	
	public void setPassw(String passw) {this.passw = passw;}
	public String getPassw() {return passw;}
	
	public void setNewaID(int newaID) {this.newaID = newaID;}
	public int getNewaID() {return newaID;}
	
	public boolean isValid() {return valid;}
	public void setValid(boolean valid) {this.valid = valid;}
}
