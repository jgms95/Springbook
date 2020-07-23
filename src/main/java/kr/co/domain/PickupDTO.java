package kr.co.domain;

import java.io.Serializable;

public class PickupDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pno;
	private int ino;
	private String id;
	private int pcs;
	private int price;
	private String ititle;
	private String filename;
	
	public PickupDTO(int pno, int ino, String id, int pcs, int price, String ititle, String filename) {
		super();
		this.pno = pno;
		this.ino = ino;
		this.id = id;
		this.pcs = pcs;
		this.price = price;
		this.ititle = ititle;
		this.filename = filename;
	}

	public String getItitle() {
		return ititle;
	}

	public void setItitle(String ititle) {
		this.ititle = ititle;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public PickupDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPcs() {
		return pcs;
	}

	public void setPcs(int pcs) {
		this.pcs = pcs;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
