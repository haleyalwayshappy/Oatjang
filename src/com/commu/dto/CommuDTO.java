package com.commu.dto;

public class CommuDTO {
	// Board info
	private int iid; // 게시글 번호
	private int userid; // 작성자 번호
	private String title; // 게시글 제목
	private int price; // 판매상품 가격
	private String images; // 이미지들 이름 -> 주소는 같으므로 이름만 있어도 가능
	private String description; // 판매상품 상세설명
	private int reply; // 댓글수
	private int hit; // 조회수
	private String logtime; // 등록일
	private String nickname;

	// Address info

	public CommuDTO() {
		super();
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	public int getIid() {
		return iid;
	}
	public void setIid(int iid) {
		this.iid = iid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
