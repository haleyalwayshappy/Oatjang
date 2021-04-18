package com.login.dto;

//기본생성자, 인자4개받는 생성자, setter & getter
public class LoginDTO {
	/*
	 * @param userId: user id sequence number
	 *
	 * @param id : user's id
	 *
	 * @param pw : user's password
	 *
	 * @param name : user's name
	 *
	 * @param nickname : user's nickname (privacy issue)
	 *
	 * @param age : user's age
	 *
	 * @param phone : user's phone number
	 *
	 * @param addr : user's address.
	 */
	private int userId;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private int age;
	private String phone;
	private int addrId;

	// - Constructor
	public LoginDTO() {
		super();
	}

	public LoginDTO(int userId, String id, String pw, String name,
			String nickname, int age, String phone, int addrId) {
		super();
		this.userId = userId;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.age = age;
		this.phone = phone;
		this.addrId = addrId;
	}

	// - Setter & Getter
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAddrId() {
		return addrId;
	}

	public void setAddrId(int addrId) {
		this.addrId = addrId;
	}

	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", id=" + id + ", pw=" + pw
				+ ", name=" + name + ", nickname=" + nickname + ", age=" + age
				+ ", phone=" + phone + ", addrId=" + addrId + "]";
	}

}
