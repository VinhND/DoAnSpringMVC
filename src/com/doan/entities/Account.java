package com.doan.entities;

public class Account {
	private String username;
	private String password;
	private int power;
	
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
	public int getPower(){
		return power;
	}
	public void setPower(int power){
		this.power=power;
	}
	public Account(String username, String password,int power) {
		super();
		this.username = username;
		this.password = password;
		this.power= power;
	}
	public Account() {
		super();
	}

}
