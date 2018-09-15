package cn.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ssm.po.Address;
import cn.ssm.po.User;

public interface UserMapper {
	List<User> selectUser(User user);
	
	int selectUserId();
	
	int addUser(@Param("uid") Integer uid, @Param("username") String username, @Param("sex") String sex, @Param("password") String password);
	
	int selectCountUser(@Param("uid") Integer uid);
	
	User selectUserByUid(@Param("uid") Integer uid);

	Integer addNewUser(User user);

	List<Address> getAddressList(@Param("uid")Integer uid);

	Integer updateInfo(User user);

	Integer addAddress(@Param("name")String name, @Param("phone")String phone, @Param("address")String address, @Param("uid")Integer uid);

	Integer updateAddress(Address address);

	Integer deleteAddress(@Param("addressId")Integer addressId);

	void updatePwd(@Param("uid")Integer uid, @Param("password")String newPwd);

	Address getAddress(@Param("addressId")Integer addressId);

	Integer resetPassword(User user);

}
