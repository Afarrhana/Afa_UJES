package ujes.model;

public class OrderProduct {
	private int oID, pID, qty, bID;
	private double totPrice;
	
	public OrderProduct(int oID, int qty, double totPrice, int bID) {
		super();
		this.oID = oID;
		this.qty = qty;
		this.totPrice = totPrice;
		this.bID = bID;
	}
	public OrderProduct(int oID, int pID, int qty, double totPrice, int bID) {
		super();
		this.oID = oID;
		this.pID = pID;
		this.qty = qty;
		this.totPrice = totPrice;
		this.bID = bID;
	}
	public OrderProduct() {}
	
	public int getoID() {
		return oID;
	}
	public void setoID(int oID) {
		this.oID = oID;
	}
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	public double gettotPrice() {
		return totPrice;
	}
	public void settotPrice(double totPrice) {
		this.totPrice = totPrice;
	}
	public int getbID() {
		return bID;
	}
	public void setbID(int bID) {
		this.bID = bID;
	}
}
