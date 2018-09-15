package cn.ssm.po;

import java.io.Serializable;

public class GoodsCart extends Goods implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6031241443980176998L;

	Integer cartId;
	
	Integer uid;
	
	Integer buyNum;
	
	String priceNum;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(Integer buyNum) {
		this.buyNum = buyNum;
	}

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public String getPriceNum() {
		return priceNum;
	}

	public void setPriceNum(String priceNum) {
		this.priceNum = priceNum;
	}
	
}
