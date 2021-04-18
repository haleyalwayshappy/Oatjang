package com.login.dto;

public class AddressDTO {

	private int addrId;
	private String roadFullAddr;
	private String roadAddrPart1;
	private String roadAddrPart2;
	private String addrDetail;
	private double lat;
	private double lng;

	public AddressDTO() {
		super();
	}

	public AddressDTO(int addrId, String roadFullAddr, String roadAddrPart1,
			String roadAddrPart2, String addrDetail, double lat, double lng) {
		super();
		this.addrId = addrId;
		this.roadFullAddr = roadFullAddr;
		this.roadAddrPart1 = roadAddrPart1;
		this.roadAddrPart2 = roadAddrPart2;
		this.addrDetail = addrDetail;
		this.lat = lat;
		this.lng = lng;
	}

	public int getAddrId() {
		return addrId;
	}
	public void setAddrId(int addrId) {
		this.addrId = addrId;
	}
	public String getRoadFullAddr() {
		return roadFullAddr;
	}

	public void setRoadFullAddr(String roadFullAddr) {
		this.roadFullAddr = roadFullAddr;
	}
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
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
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

	@Override
	public String toString() {
		return "AddressDTO [addrId=" + addrId + ", roadFullAddr=" + roadFullAddr
				+ ", roadAddrPart1=" + roadAddrPart1 + ", roadAddrPart2="
				+ roadAddrPart2 + ", addrDetail=" + addrDetail + ", lat=" + lat
				+ ", lng=" + lng + "]";
	}

}
