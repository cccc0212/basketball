package cn.ssm.po;

import java.io.Serializable;
import java.util.Date;

public class Game implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4372204297793832181L;
	Integer id;
	Integer cid;
	Integer oid;
	Integer cscore;
	Integer oscore;
	String gym;
	Date time;
	String cname;
	String oname;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOscore() {
		return oscore;
	}
	public void setOscore(Integer oscore) {
		this.oscore = oscore;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getCscore() {
		return cscore;
	}
	public void setCscore(Integer cscore) {
		this.cscore = cscore;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getGym() {
		return gym;
	}
	public void setGym(String gym) {
		this.gym = gym;
	}
	
	
	
}
