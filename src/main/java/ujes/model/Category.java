package ujes.model;

public class Category {
	private int cID;
	private String cName, cPics;
	
	public Category() {
		super();
	}
	public Category(int cID, String cName, String cPics) {
		this.cID = cID;
		this.cName = cName;
		this.cPics = cPics;
	}
	public Category(String cName, String cPics) {
		this.cName = cName;
		this.cPics = cPics;
	}
	public int getcID() {
		return cID;
	}
	public void setcID(int cID) {
		this.cID = cID;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcPics() {
		return cPics;
	}
	public void setcPics(String cPics) {
		this.cPics = cPics;
	}
}
