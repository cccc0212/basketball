package cn.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ssm.mapper.ManagerMapper;
import cn.ssm.po.Club;
import cn.ssm.po.User;

@Service("managerService")
public class ManagerServiceImpl implements cn.ssm.service.ManagerService {

	@Autowired
	private ManagerMapper managerMapper;
	
	public int selectByNoAndPassword(String no, String password) {
		// TODO 自动生成的方法存根
		
		return managerMapper.selectByNoAndPassword(no, password);
	}
	public List<Club> selectClub(){
		return managerMapper.selectClub();
	}
	@Override
	public int selectByUsernameAndPassword(User user) {
		// TODO Auto-generated method stub
		return managerMapper.selectByUsernameAndPassword(user);
	}

}
