package model;

public class WishList {
//	private int wid,custid,pid;
	private int wid,pid,custid,sid,pprice;
	private String image,pname,pcategory,pdescription;

	public int getWid() {
		return wid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdesc) {
		this.pdescription = pdesc;
	}

	public void setWid(int wid) {
		this.wid = wid;
	}

	public int getCustid() {
		return custid;
	}

	public void setCustid(int custid) {
		this.custid = custid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "WishList [wid=" + wid + ", pid=" + pid + ", custid=" + custid + ", sid=" + sid + ", pprice=" + pprice
				+ ", image=" + image + ", pname=" + pname + ", pcategory=" + pcategory + ", pdescription=" + pdescription + "]";
	}
	
}
