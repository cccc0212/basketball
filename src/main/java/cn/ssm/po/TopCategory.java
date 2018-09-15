package cn.ssm.po;

import java.io.Serializable;
import java.util.List;

public class TopCategory implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8390068814737848066L;

	Integer id;
	
	String name;
	
	
	List<SecondCategory> list;

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<SecondCategory> getList() {
		return list;
	}

	public void setList(List<SecondCategory> list) {
		this.list = list;
	}
	
	
	
}
