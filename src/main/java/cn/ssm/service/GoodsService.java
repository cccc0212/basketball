package cn.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.ssm.po.Goods;
import cn.ssm.po.GoodsCart;
import cn.ssm.po.GoodsOrder;
import cn.ssm.po.OrderDetail;
import cn.ssm.po.TopCategory;


public interface GoodsService {
	public PageInfo<GoodsOrder> selectAllGoodsOrder(GoodsOrder goodsOrder, int currentPage, int pageSize);

	PageInfo<Goods> selectAllGoods(Goods goods, int currentPage, int pageSize);

	Goods selectGoodsById(int id);
	
	int updateGoods(Goods goods);
	
	int deleteGoods(int id);
	
	GoodsOrder selectGoodsOrderById(int id);
	
	List<OrderDetail> selectGoodsOrderDetailById(int id);
	
	int updateGoodsOrder(GoodsOrder goods);
	
	int deleteGoodsOrder(GoodsOrder goodsOrder);
	
	int deleteGoodsOrderDetail(OrderDetail orderDetail);
	
	Integer selectGoodsId();
	
	Integer insertGoods(Goods goods);

	public List<TopCategory> selectAllCategory();

	public List<TopCategory> selectAllTopCategory();

	public TopCategory selectCategoryById(Integer id);

	public Integer addCategory(String name);
	
	public Integer deleteCategory(Integer id);

	public Integer deleteSecondCategory(Integer id);

	public Integer addSecondCategory(String name, Integer topId);

	public Integer addCart(Integer uid, Integer goodsId, Integer buyNum);

	public List<GoodsCart> getCart(Integer uid);

	public Integer delCart(Integer cartId);

	public Integer delCartList(List<GoodsCart> list);

	public PageInfo<GoodsOrder> getAllOrder(Integer uid, String state,int currentPage, int pageSize);

	public Integer updateGoodsCart(Integer cartId, Integer num);

	public Integer confirmOrders(Integer orderId);

	public Integer cancelOrders(Integer orderId);

	public String getOrderPay(Integer orderId);

	public Integer payOrder(Integer orderId);

	public GoodsOrder getOrderDetail(Integer orderId);

	public Integer updateGoodsStatus(Goods goods);
}
