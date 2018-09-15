package cn.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ssm.po.Club;
import cn.ssm.po.User;

public interface ManagerMapper {
	int selectByNoAndPassword(@Param("no")String no,@Param("password")String password);
	
	List<Club> selectClub();
	
	int selectByUsernameAndPassword(User user);
	
}
