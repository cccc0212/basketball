package cn.ssm.service;


import com.github.pagehelper.PageInfo;

import cn.ssm.po.Address;
import cn.ssm.po.User;

public interface UserService {
	public PageInfo<User> selectUser(User user, int currentPage, int pageSize);
	
	public Integer selectUserId();
	
	public int addUser(Integer uid, String username, String sex, String password) throws Exception;
	
	public User selectUserByUid(Integer uid);

	public Integer addNewUser(String username, String password);

	public User getAddressList(Integer uid);

	public Integer updateInfo(User user);

	public Integer addAddress(Address address, Integer uid);

	public Integer updateAddress(Address address);

	public Integer deleteAddress(Integer addressId);

	public void updatePwd(Integer uid, String newPwd);


	public Integer addOrder(Integer uid, Integer addressId, String[] cartId,String[] id, String[] buyNum, String[] priceNum,
			String total);

	public Integer resetPassword(User user);
}
