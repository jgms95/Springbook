package kr.co.domain;

import java.io.Serializable;

public class ItemDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int ino;
	private String ititle;
	private String iwriter;
	private String publishDay;
	private String publisher;
	private String cataCode;
	private String sfilename;
	private String content;
	private int price;
	private int readcnt;
	private String writeday;
	private int percent;
	
	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public ItemDTO(int ino, String ititle, String iwriter, String publishDay, String publisher, String cataCode,
			String sfilename, String content, int price, int readcnt, String writeday, int percent) {
		super();
		this.ino = ino;
		this.ititle = ititle;
		this.iwriter = iwriter;
		this.publishDay = publishDay;
		this.publisher = publisher;
		this.cataCode = cataCode;
		this.sfilename = sfilename;
		this.content = content;
		this.price = price;
		this.readcnt = readcnt;
		this.writeday = writeday;
		this.percent = percent;
	}

	public ItemDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIno() {
		return ino;
	}

	public void setIno(int ino) {
		this.ino = ino;
	}

	public String getItitle() {
		return ititle;
	}

	public void setItitle(String ititle) {
		this.ititle = ititle;
	}

	public String getIwriter() {
		return iwriter;
	}

	public void setIwriter(String iwriter) {
		this.iwriter = iwriter;
	}

	public String getPublishDay() {
		return publishDay;
	}

	public void setPublishDay(String publishDay) {
		this.publishDay = publishDay;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCateCode() {
		return cataCode;
	}

	public void setCateCode(String cateCode) {
		this.cataCode = cateCode;
	}

	public String getFilename() {
		return sfilename;
	}

	public void setFilename(String filename) {
		this.sfilename = filename;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}





	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ino;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ItemDTO other = (ItemDTO) obj;
		if (ino != other.ino)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ItemDTO [ino=" + ino + ", ititle=" + ititle + ", iwriter=" + iwriter + ", publishDay=" + publishDay
				+ ", publisher=" + publisher + ", cateCode=" + cataCode + ", filename=" + sfilename + ", content="
				+ content + ", price=" + price + ", readcnt=" + readcnt+"percent"+percent+"]";
	}
}
