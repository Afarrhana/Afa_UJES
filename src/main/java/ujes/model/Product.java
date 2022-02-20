package ujes.model;

public class Product {
	private int cID, pID, pQty;
	private String pName, pDesc, pPics;
	private double pPrice;
	
	public Product(int cID, int pQty, String pName, String pDesc, String pPics, double pPrice) {
		super();
		this.cID = cID;
		this.pQty = pQty;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPics = pPics;
		this.pPrice = pPrice;
	}
	public Product(int cID, int pID, int pQty, String pName, String pDesc, String pPics, double pPrice) {
		super();
		this.cID = cID;
		this.pID = pID;
		this.pQty = pQty;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pPics = pPics;
		this.pPrice = pPrice;
	}
	public Product() {}
	
	public int getcID() {
		return cID;
	}
	public void setcID(int cID) {
		this.cID = cID;
	}
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public int getpQty() {
		return pQty;
	}
	public void setpQty(int pQty) {
		this.pQty = pQty;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public String getpPics() {
		return pPics;
	}
	public void setpPics(String pPics) {
		this.pPics = pPics;
	}
	public double getpPrice() {
		return pPrice;
	}
	public void setpPrice(double pPrice) {
		this.pPrice = pPrice;
	}
}
