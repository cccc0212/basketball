package cn.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ssm.mapper.GoodsMapper;
import cn.ssm.mapper.UserMapper;
import cn.ssm.po.Address;
import cn.ssm.po.GoodsCart;
import cn.ssm.po.GoodsOrder;
import cn.ssm.po.User;
import cn.ssm.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Autowired
	private UserMapper userMapper; 
	
	//查找出所有用户信息
	@Override
	public PageInfo<User> selectUser(User user, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(currentPage, pageSize, true);
		List<User> list = userMapper.selectUser(user);
		PageInfo<User> pageInfo = new PageInfo<User>(list);
		return pageInfo;
	}

	
	//生产新的Id
	@Override
	public Integer selectUserId() {
		int id = userMapper.selectUserId();
		return id+1;
	}


	@Override
	public int addUser(Integer uid, String username, String sex, String password) throws Exception{
		int i = userMapper.addUser(uid, username, sex, password);
		return i;
	}


	@Override
	public User selectUserByUid(Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUid(uid);
	}


	@Override
	public Integer addNewUser(String username, String password) {
		// TODO 自动生成的方法存根
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		userMapper.addNewUser(user);
		return user.getUid();
	}

	@Override
	public User getAddressList(Integer uid) {
		User user = userMapper.selectUserByUid(uid);
		user.setList(userMapper.getAddressList(uid));
		return user;
	}

	@Override
	public Integer updateInfo(User user) {
		return userMapper.updateInfo(user);
	}

	@Override
	public Integer addAddress(Address address, Integer uid) {
		// TODO Auto-generated method stub
		return userMapper.addAddress(address.getName(),address.getPhone(),address.getAddress(),uid);
	}

	@Override
	public Integer updateAddress(Address address) {
		// TODO Auto-generated method stub
		return userMapper.updateAddress(address);
	}

	@Override
	public Integer deleteAddress(Integer addressId) {
		// TODO Auto-generated method stub
		return userMapper.deleteAddress(addressId);
	}

	@Override
	public void updatePwd(Integer uid, String newPwd) {
		// TODO 自动生成的方法存根
		userMapper.updatePwd(uid, newPwd);
	}

/*
	@Override
	public Integer addOrder(Integer uid, Integer addressId, Integer[] cartId, String total) {
		Address address = userMapper.getAddress(addressId);
		goodsMapper.addOrder(uid,address.getName(),address.getPhone(),address.getAddress(),total);
		Integer orderId = goodsMapper.getNewOrderId();
		for(int i = 0; i < cartId.length; i++){
			GoodsCart goodsCart = goodsMapper.getGoodsCart(cartId[i]);
						goodsMapper.addOrderDetail();
		}
		return 1;
	}*/


	@Override
	public Integer addOrder(Integer uid, Integer addressId, String[] cartId,  String[] id, String[] buyNum, String[] priceNum,
			String total) {
		for(int i = 0; i < id.length; i++){
			if(Integer.parseInt(buyNum[i])>goodsMapper.getGooodsNum(id[i])||goodsMapper.getGooodsNum(id[i])==0)
				return 0;
		}
		
		Address address = userMapper.getAddress(addressId);
		GoodsOrder order = new GoodsOrder();
		order.setAddress(address.getAddress());
		order.setBuyId(uid);
		order.setName(address.getName());
		order.setPhone(address.getPhone());
		order.setTotalPrice(total);
		goodsMapper.addOrder(order);
		Integer orderId = order.getOrderId();
		for(int i = 0; i < id.length; i++){
			goodsMapper.updateGoodsNumber(id[i],buyNum[i]);
			goodsMapper.addOrderDetail(orderId, id[i], buyNum[i], priceNum[i]);
		}
		for(int i = 0; i < cartId.length; i++){
			goodsMapper.delCart(Integer.valueOf(cartId[i]));
		}
		return orderId;
	}


	@Override
	public Integer resetPassword(User user) {
		// TODO 自动生成的方法存根
		return userMapper.resetPassword(user);
	}

}
