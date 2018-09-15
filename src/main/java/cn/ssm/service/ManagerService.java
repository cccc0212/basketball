package cn.ssm.service;

import java.util.List;

import cn.ssm.po.Club;
import cn.ssm.po.User;

public interface ManagerService {
	public int selectByNoAndPassword(String no,String password);
	public List<Club> selectClub();
	public int selectByUsernameAndPassword(User user);
}
