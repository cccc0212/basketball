package cn.ssm.po;

import java.io.Serializable;

public class Manager implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3331963273389582684L;
	String no;
	String password;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
