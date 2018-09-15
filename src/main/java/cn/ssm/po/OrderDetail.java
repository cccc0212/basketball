package cn.ssm.po;

import java.io.Serializable;

public class OrderDetail extends Goods implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9110445354784172853L;

	Integer orderId;
	
	Integer buyNum;
	
	String priceNum;
	
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}

	public String getPriceNum() {
		return priceNum;
	}

	public void setPriceNum(String priceNum) {
		this.priceNum = priceNum;
	}

	
}
