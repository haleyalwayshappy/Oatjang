package com.board.dto;

public class BoardDTO {
	// Board info
	private int iid; // 게시글 번호
	private int userid; // 작성자 번호
	private String title; // 게시글 제목
	private int price; // 판매상품 가격
	private String images; // 이미지들 이름 -> 주소는 같으므로 이름만 있어도 가능
	private String description; // 판매상품 상세설명
	private int category; // 판매상품 카테고리
	private int success; // 판매상황
	private String bid; // 입찰자 -> 경매용
	private int reply; // 댓글수
	private int hit; // 조회수
	private String logtime; // 등록일
	private String nickname;
	private String roadAddrPart1;
	private String roadAddrPart2;
	private String roadAddrPart3;
	private double lat;
	private double lng;

	// Address info

	public BoardDTO() {
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getSuccess() {
		return success;
	}
	public void setSuccess(int success) {
		this.success = success;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}

	// address
	public String getRoadAddrPart1() {
		return roadAddrPart1;
	}
	public void setRoadAddrPart1(String roadAddrPart1) {
		this.roadAddrPart1 = roadAddrPart1;
	}
	public String getRoadAddrPart2() {
		return roadAddrPart2;
	}
	public void setRoadAddrPart2(String roadAddrPart2) {
		this.roadAddrPart2 = roadAddrPart2;
	}
	public String getRoadAddrPart3() {
		return roadAddrPart3;
	}
	public void setRoadAddrPart3(String roadAddrPart3) {
		this.roadAddrPart3 = roadAddrPart3;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}

}
