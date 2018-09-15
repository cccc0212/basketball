package cn.ssm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.ssm.mapper.GoodsMapper;
import cn.ssm.mapper.UserMapper;
import cn.ssm.po.Goods;
import cn.ssm.po.GoodsCart;
import cn.ssm.po.GoodsOrder;
import cn.ssm.po.OrderDetail;
import cn.ssm.po.TopCategory;
import cn.ssm.service.GoodsService;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public PageInfo<Goods> selectAllGoods(Goods goods, int currentPage, int pageSize) {
		// TODO 自动生成的方法存根
		
		PageHelper.startPage(currentPage, pageSize, true);
		List<Goods> list = goodsMapper.selectAllGoods(goods);
		PageInfo<Goods> pageInfo = new PageInfo<Goods>(list);
		return pageInfo;
	}

	@Override
	public PageInfo<GoodsOrder> selectAllGoodsOrder(GoodsOrder goodsOrder, int currentPage, int pageSize) {
		// TODO 自动生成的方法存根
		PageHelper.startPage(currentPage, pageSize, true);
		List<GoodsOrder> list = goodsMapper.selectAllGoodsOrder(goodsOrder);
		PageInfo<GoodsOrder> pageInfo = new PageInfo<GoodsOrder>(list);
		return pageInfo;
	}

	@Override
	public Goods selectGoodsById(int id) {
		Goods goods = goodsMapper.selectGoodsById(id);
		return goods;
	}

	@Override
	public int updateGoods(Goods goods) {
		int i = goodsMapper.updateGoods(goods);
		return i;
	}

	@Override
	public int deleteGoods(int id) {
		// TODO Auto-generated method stub
		return goodsMapper.deleteGoods(id);
		
	}
	
	@Override
	public GoodsOrder selectGoodsOrderById(int id) {
		GoodsOrder goods = goodsMapper.selectGoodsOrderById(id);
		return goods;
	}
	
	public List<OrderDetail> selectGoodsOrderDetailById(int id){
		return goodsMapper.selectGoodsOrderDetailById(id);
	}

	@Override
	public int updateGoodsOrder(GoodsOrder goods) {
		int i = goodsMapper.updateGoodsOrder(goods);
		return i;
	}

	@Override
	public int deleteGoodsOrder(GoodsOrder goodsOrder) {
		// TODO Auto-generated method stub
		goodsMapper.deleteGoodsOrderDetail(goodsOrder);
		return goodsMapper.deleteGoodsOrder(goodsOrder);
		
	}
	
	public int deleteGoodsOrderDetail(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		
		return goodsMapper.deleteGoodsOrderDetailById(orderDetail);
		
	}

	@Override
	public Integer selectGoodsId() {
		// TODO Auto-generated method stub
		
		return goodsMapper.selectGoodsId()+1;
	}

	@Override
	public Integer insertGoods(Goods goods) {
		// TODO Auto-generated method stub

		Date date = new Date();
		goods.setCreatetime(date);
		goods.setStatus("否");
		return goodsMapper.addGoods(goods);
	
	}

	@Override
	public List<TopCategory> selectAllCategory() {
		
		List<TopCategory> top = goodsMapper.selectTopCategory();
		
		for(int i = 0; i < top.size(); i++){
			top.get(i).setList(goodsMapper.selectSecondCategory(top.get(i).getId()));
		}
		
		return top;
	}

	@Override
	public List<TopCategory> selectAllTopCategory() {
		List<TopCategory> top = goodsMapper.selectTopCategory();
		return top;
	}

	@Override
	public TopCategory selectCategoryById(Integer id) {
		// TODO 自动生成的方法存根
		TopCategory top = goodsMapper.selectTopCategoryById(id);
		top.setList(goodsMapper.selectSecondCategory(id));
		return top;
	}

	@Override
	public Integer addCategory(String name) {
		return goodsMapper.addCategory(name);
	}

	@Override
	public Integer deleteCategory(Integer id) {
		goodsMapper.updateGoodsCategoryByTop(id);
		goodsMapper.deleteSecondCategory(id);
		return goodsMapper.deleteCategory(id);
	}

	@Override
	public Integer deleteSecondCategory(Integer id) {
		// TODO 自动生成的方法存根
		goodsMapper.updateGoodsCategory(id);
		return goodsMapper.deleteSecondCategoryById(id);
	}

	@Override
	public Integer addSecondCategory(String name, Integer topId) {
		return goodsMapper.addSecondCategory(name, topId);
	}

	@Override
	public Integer addCart(Integer uid, Integer goodsId, Integer buyNum) {
		
		return goodsMapper.addCart(uid, goodsId, buyNum);
	}

	@Override
	public List<GoodsCart> getCart(Integer uid) {
		// TODO 自动生成的方法存根
		return goodsMapper.getCart(uid);
	}

	@Override
	public Integer delCart(Integer cartId) {
		// TODO 自动生成的方法存根
		return goodsMapper.delCart(cartId);
	}

	@Override
	public Integer delCartList(List<GoodsCart> list) {
		// TODO 自动生成的方法存根
		for(int i = 0; i < list.size(); i++){
			goodsMapper.delCart(list.get(i).getCartId());
		}
		
		return 1;
	}

	@Override
	public PageInfo<GoodsOrder> getAllOrder(Integer uid,String state, int currentPage,int pageSize) {
		
		PageHelper.startPage(currentPage, pageSize, true);
		List<GoodsOrder> goodsOrder = goodsMapper.selectGoodsOrderByUid(uid,state);
		for(int i = 0; i < goodsOrder.size(); i++){
			goodsOrder.get(i).setList(goodsMapper.selectGoodsOrderDetailById(goodsOrder.get(i).getOrderId()));
		}
		PageInfo<GoodsOrder> pageInfo = new PageInfo<GoodsOrder>(goodsOrder);
		return pageInfo;
	}

	@Override
	public Integer updateGoodsCart(Integer cartId, Integer num) {
		// TODO 自动生成的方法存根
		return goodsMapper.updateGoodsCart(cartId,num);
	}

	@Override
	public Integer confirmOrders(Integer orderId) {
		// TODO 自动生成的方法存根
		String state ="已签收";
		return goodsMapper.updateConfirmOrders(orderId, state);
	}

	@Override
	public Integer cancelOrders(Integer orderId) {
		// TODO 自动生成的方法存根
		String state ="已取消";
		return goodsMapper.updateCancelOrders(orderId, state);
	}

	@Override
	public String getOrderPay(Integer orderId) {
		// TODO 自动生成的方法存根
		return goodsMapper.getOrderPay(orderId).getTotalPrice();
	}

	@Override
	public Integer payOrder(Integer orderId) {
		// TODO 自动生成的方法存根
		String state = "已付款";
		return goodsMapper.updatePayOrder(orderId,state);
	}

	@Override
	public GoodsOrder getOrderDetail(Integer orderId) {
		// TODO 自动生成的方法存根
		GoodsOrder goodsOrder = goodsMapper.selectOrders(orderId);
		goodsOrder.setList(goodsMapper.selectGoodsOrderDetailById(orderId));
		return goodsOrder;
	}

	@Override
	public Integer updateGoodsStatus(Goods goods) {
		// TODO 自动生成的方法存根
		return goodsMapper.updateGoodsStatus(goods);
	}


}
