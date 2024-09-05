package kr.or.ddit.collection;

public class BoardVO {
	private int boNo;
	private String boTitle;
	private String boContent;
	private String boWriter;
	private int boHit;
	
	public BoardVO() {}
	public BoardVO(int boNo, String boTitle, String boContent, String boWriter) {
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.boWriter = boWriter;
	}
	
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public String getBoWriter() {
		return boWriter;
	}
	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}
	public int getBoHit() {
		return boHit;
	}
	public void setBoHit(int boHit) {
		this.boHit = boHit;
	}
	
	
}
