package com.ryan.dto;

public class MemberDTO {

	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private int last;
	private int point;
	private int level;
	private int charge;
	private int pointlimit;
	private int repoint;
	private int admin;
	// ALT + SHIFT +S
	// Generate Getter and Setter
	// 자동으로 만들어짐

	
	
    // 외부에서 보내온 id값을 받는다
	public void setId(String id) {
		this.id = id;
	}
	// 받아온 id값을 외부로 보낸다
	// ex) 출력방법: 변수.getId();
	public String getId() {
		return id;
	}

	
	
	// 외부에서 보내온 pw값을 받는다
	public void setPw(String pw) {
		this.pw = pw;
	}
	// 받아온 pw값을 외부로 보낸다
	// ex) 출력방법: 변수.getPw();
	public String getPw() {
		return pw;
	}

	
	
	// 외부에서 보내온 name값을 받는다
	public void setName(String name) {
		this.name = name;
	}
	// 받아온 name값을 외부로 보낸다
	// ex) 출력방법: 변수.getName();
	public String getName() {
		return name;
	}
	
	
	
	// 외부에서 보내온 email값을 받는다
	public void setEmail(String email) {
		this.email = email;
	}
	// 받아온 email값을 외부로 보낸다
	// ex) 출력방법: 변수.getEmail();
	public String getEmail() {
		return email;
	}
	
	
	
	// 외부에서 보내온 phone값을 받는다
	public void setPhone(String phone) {
		this.phone = phone;
	}
	// 받아온 phone값을 외부로 보낸다
	// ex) 출력방법: 변수.getPhone();
	public String getPhone() {
		return phone;
	}
	
	
	
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	
	
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
	
	
	public int getPointlimit() {
		return pointlimit;
	}
	public void setPointlimit(int pointlimit) {
		this.pointlimit = pointlimit;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public int getRepoint() {
		return repoint;
	}
	public void setRepoint(int repoint) {
		this.repoint = repoint;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}

}
