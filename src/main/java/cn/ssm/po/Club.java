package cn.ssm.po;

import java.io.Serializable;
import java.util.List;

public class Club implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8675846665673908852L;
	Integer cid;
	String name;
	String logo;
	String intro;
	String area;
	String gym;
	String birth;
	List<Achievement> list;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public List<Achievement> getList() {
		return list;
	}
	public void setList(List<Achievement> list) {
		this.list = list;
	}
	public String getGym() {
		return gym;
	}
	public void setGym(String gym) {
		this.gym = gym;
	}
	
}
