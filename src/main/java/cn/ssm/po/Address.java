/**
 * 
 */
package cn.ssm.po;

import java.io.Serializable;

/**
 * @author caijiawei
 *
 * @date 2018年5月7日
 */
public class Address implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6172747368566734777L;

	Integer addressId;
	
	String name;
	
	String address;
	
	String phone;

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
