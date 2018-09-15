package cn.ssm.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ssm.po.Goods;
import cn.ssm.po.GoodsCart;
import cn.ssm.po.GoodsOrder;
import cn.ssm.po.OrderDetail;
import cn.ssm.po.SecondCategory;
import cn.ssm.po.TopCategory;


public interface GoodsMapper {
	List<GoodsOrder> selectAllGoodsOrder(GoodsOrder goodsOrder);
	
	List<Goods> selectAllGoods(Goods goods);

	Goods selectGoodsById(@Param(value="id")Integer id);
	
	int updateGoods(Goods goods);
	
	int deleteGoods(@Param(value="id")Integer id);
	
	GoodsOrder selectGoodsOrderById(@Param(value="id")Integer id);
	
	List<OrderDetail> selectGoodsOrderDetailById(@Param(value="id")Integer id);
	
	int updateGoodsOrder(GoodsOrder goodsOrder);
	
	int deleteGoodsOrder(GoodsOrder goodsOrder);
	
	void deleteGoodsOrderDetail(GoodsOrder goodsOrder);
	
	int deleteGoodsOrderDetailById(OrderDetail orderDetail);
	
	Integer selectGoodsId();
	
	int addGoods(Goods goods);

	List<TopCategory> selectTopCategory();

	List<SecondCategory> selectSecondCategory(@Param(value="topId")Integer id);

	TopCategory selectTopCategoryById(@Param(value="id")Integer id);

	Integer addCategory(@Param(value="name")String name);
	
	Integer deleteCategory(@Param(value="id")Integer id);

	void deleteSecondCategory(@Param(value="id")Integer id);

	Integer deleteSecondCategoryById(Integer id);

	Integer addSecondCategory(@Param(value="name")String name, @Param(value="topId")Integer topId);

	Integer addCart(@Param(value="uid")Integer uid, @Param(value="goodsId")Integer goodsId, @Param(value="buyNum")Integer buyNum);

	List<GoodsCart> getCart(@Param(value="uid")Integer uid);

	Integer delCart(@Param(value="cartId")Integer cartId);
	
	void addOrder(@Param("uid")Integer uid, @Param("addressId")Integer addressId);
	
	Integer getNewOrderId();

	void addOrder(GoodsOrder goodsOrder);

	void addOrderDetail(@Param(value="orderId")Integer orderId, @Param(value="goodsId")String goodsId, @Param(value="num")String string2, @Param(value="priceNum")String string3);

	List<GoodsOrder> selectGoodsOrderByUid(@Param(value="uid")Integer uid,@Param(value="state") String state);

	Integer updateGoodsCart(@Param(value="cartId")Integer cartId, @Param(value="num")Integer num);

	Integer updateCancelOrders(@Param(value="orderId")Integer orderId, @Param(value="state")String state);
	
	Integer updateConfirmOrders(@Param(value="orderId")Integer orderId, @Param(value="state")String state);

	GoodsOrder getOrderPay(@Param(value="orderId")Integer orderId);

	Integer updatePayOrder(@Param(value="orderId")Integer orderId, @Param(value="state")String state);

	GoodsOrder selectOrders(Integer orderId);

	void updateGoodsNumber(@Param(value="id")String id, @Param(value="number")String buyNum);

	void updateGoodsCategory(@Param(value="category")Integer id);

	void updateGoodsCategoryByTop(@Param(value="topId")Integer id);
	
	Integer getGooodsNum(@Param(value="goodsId")String id);

	Integer updateGoodsStatus(Goods goods);

}
