package ujes.model;

public class Review {
	private int fID, bID, pID, pRate;
	private String pComment, pImage;
	public Review(int fID, int bID, int pID, int pRate, String pComment, String pImage) {
		super();
		this.fID = fID;
    this.bID = bID;
    this.pID = pID;
    this.pRate = pRate;
    this.pComment = pComment;
    this.pImage = pImage;
	}
	public Review() {}

	public int getfID() {
		return fID;
	}
	public void setfID(int fID) {
		this.fID = fID;
	}
	public int getpID() {
		return pID;
	}
	public void setpID(int pID) {
		this.pID = pID;
	}
  public int gebID() {
		return bID;
	}
	public void setbID(int bID) {
		this.bID = bID;
	}
	public int getpRate() {
		return pRate;
	}
	public void setpRate(int pRate) {
		this.pRate = pRate;
	}
	public String getpComment() {
		return pComment;
	}
	public void setpComment(String pComment) {
		this.pComment = pComment;
	}
	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}
}
