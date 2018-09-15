package cn.ssm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.portable.InputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;

import cn.ssm.annotation.NeedLogin;
import cn.ssm.po.Goods;
import cn.ssm.po.GoodsCart;
import cn.ssm.po.GoodsOrder;
import cn.ssm.po.OrderDetail;
import cn.ssm.po.TopCategory;
import cn.ssm.po.User;
import cn.ssm.service.GoodsService;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("/allGoods")
	@NeedLogin
	public String allGoods(Model model, Goods goods,@RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="6") int pageSize){
		
		PageInfo<Goods> list = goodsService.selectAllGoods(goods,currentPage,pageSize);
		model.addAttribute("list", list);
		model.addAttribute("goods",goods);
		return "allGoods";
	}
	
	@RequestMapping("/allGoodsOrder")
	@NeedLogin
	public String allGoodsOrder(Model model, GoodsOrder goodsOrder,@RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="6") int pageSize){
		
		PageInfo<GoodsOrder> list = goodsService.selectAllGoodsOrder(goodsOrder,currentPage,pageSize);
		model.addAttribute("list", list);
		model.addAttribute("goodsOrder",goodsOrder);
		return "allGoodsOrder";
	}
	
	@RequestMapping("/queryGoods")
	@NeedLogin
	public String queryGoods(Model model, int id){
		Goods goods = goodsService.selectGoodsById(id);
		model.addAttribute("goods",goods);
		return "updateGoods";
	}
	
	@RequestMapping("/updateGoods")
	@NeedLogin
	public @ResponseBody Integer updateGoods(Goods goods,@RequestParam("file") CommonsMultipartFile file,  @RequestParam("id") Integer id,
            HttpServletRequest request){
	       // 获得原始文件名  
        String fileName = file.getOriginalFilename();  
        if(fileName!=null&&fileName!=""){
	        System.out.println("原始文件名:" + fileName);  
	  
	        // 新文件名  
	        String newFileName = id + fileName.substring(fileName.lastIndexOf("."));  
 
	        // 上传位置  
	        String path =  "D:/developer/CBA/images/goods/"; // 设定文件保存的目录  
	        System.out.println("上传图片到:" + path);  
	        File f = new File(path);  
	        if (!f.exists())  
	            f.mkdirs();  
	        if (!file.isEmpty()) {  
	            try {  
	                FileOutputStream fos = new FileOutputStream(path + newFileName);  
	                java.io.InputStream in = file.getInputStream();  
	                int b = 0;  
	                while ((b = in.read()) != -1) {  
	                    fos.write(b);  
	                }  
	                fos.close();  
	                in.close();  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        } 
	        path ="images/goods/"+ newFileName;
	        goods.setImg(path);
        }
		int i= goodsService.updateGoods(goods);
		System.out.println(i);
		return i;
	}
	
	@RequestMapping("/deleteGoods")
	@NeedLogin
	public @ResponseBody String deleteGoods(int id){
		return goodsService.deleteGoods(id)+"";
	}
	
	@RequestMapping("/queryGoodsOrder")
	@NeedLogin
	public String queryGoodsOrder(Model model, int id){
		GoodsOrder goodsOrder = goodsService.selectGoodsOrderById(id);
		model.addAttribute("goodsOrder",goodsOrder);
		return "updateGoodsOrder";
	}
	
	@RequestMapping("/queryGoodsOrderDetail")
	@NeedLogin
	public String queryGoodsOrderDetail(Model model, int id){
		List<OrderDetail> orderDetail = goodsService.selectGoodsOrderDetailById(id);
		model.addAttribute("orderDetail",orderDetail);
		return "goodsOrderDetail";
	}
	
	@RequestMapping("/updateGoodsOrder")
	@NeedLogin
	public @ResponseBody String updateGoodsOrder(@RequestBody GoodsOrder goodsOrder){
		int i = goodsService.updateGoodsOrder(goodsOrder);
		return i+"";
	}
	
	@RequestMapping("/deleteGoodsOrder")
	@NeedLogin
	public @ResponseBody String deleteGoodsOrder(@RequestBody GoodsOrder goodsOrder){
		
		return goodsService.deleteGoodsOrder(goodsOrder)+"";
	}
	
	@RequestMapping("/deleteGoodsOrderDetail")
	@NeedLogin
	public @ResponseBody String deleteGoodsOrderDetail(@RequestBody OrderDetail orderDetail){
		
		return goodsService.deleteGoodsOrderDetail(orderDetail)+"";
	}
	
	@RequestMapping("/selectGoodsId")
	@NeedLogin
	public String selectGoodsId(Model model){
		int id = goodsService.selectGoodsId();
		model.addAttribute("id", id);
		return "addGoods";
	}
	
/*	@RequestMapping("/addGoods")
	public @ResponseBody Integer addGoods(Goods goods){
		int i= goodsService.insertGoods(goods);
		System.out.println(i);
		return i;
	}*/
	
	@RequestMapping("/addGoods")
	@NeedLogin
	public @ResponseBody Integer addGoods(Goods goods,@RequestParam("file") CommonsMultipartFile file,  @RequestParam("id") Integer id,
            HttpServletRequest request){
	       // 获得原始文件名  
        String fileName = file.getOriginalFilename();  
        System.out.println("原始文件名:" + fileName);  
  
        // 新文件名  
        String newFileName = id + fileName.substring(fileName.lastIndexOf("."));  
  
        // 上传位置  
        String path =  "D:/developer/CBA/images/goods/"; // 设定文件保存的目录  
        System.out.println("上传图片到:" + path);  
        File f = new File(path);  
        if (!f.exists())  
            f.mkdirs();  
        if (!file.isEmpty()) {  
            try {  
                FileOutputStream fos = new FileOutputStream(path + newFileName);  
                java.io.InputStream in = file.getInputStream();  
                int b = 0;  
                while ((b = in.read()) != -1) {  
                    fos.write(b);  
                }  
                fos.close();  
                in.close();  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        } 
        path ="images/goods/"+ newFileName;
        goods.setImg(path);
		int i= goodsService.insertGoods(goods);
		return i;
	}
	
	@RequestMapping("q_allGoods")
	public @ResponseBody PageInfo<Goods> q_allGoods(Goods goods,@RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="16") int pageSize){
		goods.setStatus("是");
		PageInfo<Goods> list = goodsService.selectAllGoods(goods,currentPage,pageSize);

		return list;
		
	}
	@RequestMapping("q_Goods")
	public @ResponseBody Goods q_Goods(Integer id){
		Goods goods = goodsService.selectGoodsById(id);
		return goods;
	}
	@RequestMapping("allcategory")
	public @ResponseBody List<TopCategory> allcategory(){
		
		return goodsService.selectAllCategory();
	}
	@RequestMapping("topCategory")
	@NeedLogin
	public  String topCategory(Model model){
		 model.addAttribute("top", goodsService.selectAllTopCategory());
		 return "topCategory";
	}
	@RequestMapping("queryCategory")
	@NeedLogin
	public String queryCategory(Integer id,Model model){
		model.addAttribute("top", goodsService.selectCategoryById(id));
		return "updateCategory";
	}
	@RequestMapping("addCategory")
	@NeedLogin
	public @ResponseBody Integer addCategory(String name){
		
		return goodsService.addCategory(name);
	}
	@RequestMapping("deleteCategory")
	@NeedLogin
	public @ResponseBody Integer deleteCategory(Integer id){
		return goodsService.deleteCategory(id);
	}
	@RequestMapping("deleteSecondCategory")
	@NeedLogin
	public @ResponseBody Integer deleteSecondCategory(Integer id){
		return goodsService.deleteSecondCategory(id);
	}
	@RequestMapping("addSecondCategory")
	@NeedLogin
	public @ResponseBody Integer addSecondCategory(String name, Integer topId){
		return goodsService.addSecondCategory(name, topId);
	}
	@RequestMapping("addCart")

	public @ResponseBody Integer addCart(HttpSession session, Integer goodsId, Integer buyNum){
		User user=(User)session.getAttribute("user");
		Integer uid = user.getUid();
		return goodsService.addCart(uid, goodsId, buyNum);
	}
	@RequestMapping("q_Cart")

	public @ResponseBody List<GoodsCart> q_Cart(HttpSession session){
		User user=(User)session.getAttribute("user");
		if(user==null)
			return null;
		else{
			Integer uid = user.getUid();
			return goodsService.getCart(uid);
		}
	}
	@RequestMapping("delCart")

	public @ResponseBody Integer delCart(Integer cartId){
		return goodsService.delCart(cartId);
	}
	@RequestMapping("delCartList")
	public @ResponseBody Integer delCartList(@RequestBody List<GoodsCart> list){
		

		return goodsService.delCartList(list);
	}
	@RequestMapping("getAllOrder")
	public @ResponseBody PageInfo<GoodsOrder> getAllOrder(HttpSession session,@RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="4") int pageSize,@RequestParam(value="state",required=false)String state){
		User user=(User)session.getAttribute("user");
		if(user==null)
			return null;
		else{
			Integer uid = user.getUid();
			return goodsService.getAllOrder(uid,state,currentPage,pageSize);
		}
	}
	@RequestMapping("updateGoodsCart")
	public @ResponseBody Integer updateGoodsCart(Integer cartId, Integer num){
		return goodsService.updateGoodsCart(cartId,num);
	}
	@RequestMapping("confirmOrders")
	public @ResponseBody Integer confirmOrders(Integer orderId){
		return goodsService.confirmOrders(orderId);
	}
	@RequestMapping("cancelOrders")
	public @ResponseBody Integer cancelOrders(Integer orderId){
		return goodsService.cancelOrders(orderId);
	}
	@RequestMapping("getOrderPay")
	public @ResponseBody String getOrderPay(Integer orderId){
		return goodsService.getOrderPay(orderId);
	}
	@RequestMapping("payOrder")
	public @ResponseBody Integer payOrder(Integer orderId){
		return goodsService.payOrder(orderId);
	}
	@RequestMapping("getOrderDetail")
	public @ResponseBody GoodsOrder getOrderDetail(Integer orderId){
		return goodsService.getOrderDetail(orderId);
	}
	@RequestMapping("updateGoodsStatus")
	public @ResponseBody Integer updateGoodsStatus(Goods goods){
		return goodsService.updateGoodsStatus(goods);
	}
}
