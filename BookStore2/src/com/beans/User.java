package com.beans;

import java.util.List;

public class User {
	private int Uid;
	private String account;
	private String username;
	private String password;
	private String email;
	private String phone;
	private String gender;
	private String address;
	private String identity;
	private int   status;
	private List<Order> ordersList;
	

	public User(int uid, String account, String username, String password,
			String email, String phone, String gender, String address,
			String identity, int status, List<Order> ordersList) {
		super();
		Uid = uid;
		this.account = account;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.address = address;
		this.identity = identity;
		this.status = status;
		this.ordersList = ordersList;
	}
	
	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	/**
	 * @return the ordersList
	 */
	public List<Order> getOrdersList() {
		return ordersList;
	}
	/**
	 * @param ordersList the ordersList to set
	 */
	public void setOrdersList(List<Order> ordersList) {
		this.ordersList = ordersList;
	}
	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}



	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "User [Uid=" + Uid + ", account=" + account + ", username="
				+ username + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", gender=" + gender + ", address="
				+ address + ", status=" + status + ", ordersList=" + ordersList
				+ "]";
	}
	public int getUid() {
		return Uid;
	}
	public void setUid(int uid) {
		Uid = uid;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
