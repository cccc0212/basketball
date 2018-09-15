package cn.ssm.po;

import java.io.Serializable;

public class Achievement implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -340453095162810049L;
	Integer id;
	Integer cid;
	String matching;
	String ranking;
	String time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getMatching() {
		return matching;
	}
	public void setMatching(String matching) {
		this.matching = matching;
	}
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
