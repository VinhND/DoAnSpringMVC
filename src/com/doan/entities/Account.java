package com.doan.entities;

public class Account {
	private String username;
	private String password;
	private String power;
	
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
	public String getPower(){
		return power;
	}
	public void setPower(String power){
		this.power=power;
	}
	public Account(String username, String password,String power) {
		super();
		this.username = username;
		this.password = password;
		this.power= power;
	}
	public Account() {
		super();
	}

}
