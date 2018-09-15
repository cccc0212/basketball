package cn.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.ssm.annotation.NeedLogin;
import cn.ssm.po.Address;
import cn.ssm.po.GoodsCart;
import cn.ssm.po.Player;
import cn.ssm.po.User;
import cn.ssm.service.ManagerService;
import cn.ssm.service.UserService;

@Controller
public class UserController {
	
	
	@Autowired
	private ManagerService managerService;
	
	 @Autowired
	 private UserService userService;
	 
	 @RequestMapping("/allUser")
	 @NeedLogin
	 public String allUser(Model model, User user,@RequestParam(value="currentPage" ,defaultValue="1") int currentPage ,@RequestParam(value="pageSize" ,defaultValue="6") int pageSize){
		 PageInfo<User> list = userService.selectUser(user,currentPage,pageSize);
		 model.addAttribute("list", list);
		 model.addAttribute("user", user);
		 return "allUser";
	 }
	 
	 @RequestMapping("addUserId")
	 @NeedLogin
	 public String addUserId(Model model){
		 Integer Id = userService.selectUserId();
		 model.addAttribute("Id", Id);
		 return "addUser";
	 }
	 
	 
	 @RequestMapping("addUser")
	 @NeedLogin
	 public @ResponseBody String addUser(@RequestBody User user)throws Exception {
		 int i=0;
		 user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		 try{
			 i = userService.addUser(user.getUid(), user.getUsername(), user.getSex(), user.getPassword());
		 }catch(Exception e){
			 i=0;
		 }
		 return i+"";
	 }
	 
	 @RequestMapping("userReg")
	 public @ResponseBody Integer userReg(String username,String password){
		 
		 return userService.addNewUser(username,DigestUtils.md5DigestAsHex(password.getBytes()));
	 }
	 @RequestMapping("getAddressList")
	 public String getAddressList(Model model, Integer uid){
		 model.addAttribute("user", userService.getAddressList(uid));
		 return "addressList";
	 }
	 @RequestMapping("updateInfo")
	 public @ResponseBody Integer updateInfo(HttpSession session,User user){
		 if(userService.updateInfo(user)==1)
			 session.setAttribute("user", user);
		 return 1;
	 }
	 @RequestMapping("getAddress")
	 public @ResponseBody User getAddress(HttpSession session){
		 User user = (User)session.getAttribute("user");
		 return userService.getAddressList(user.getUid());
	 }
	 @RequestMapping("addAddress")
	 public @ResponseBody Integer addAddress(HttpSession session, Address address){
		 User user = (User)session.getAttribute("user");
		 return userService.addAddress(address,user.getUid());
	 }
	 @RequestMapping("updateAddress")
	 public @ResponseBody Integer updateAddress(Address address){
		 return userService.updateAddress(address);
	 }
	 @RequestMapping("deleteAddress")
	 public @ResponseBody Integer deleteAddress(@Param(value="addressId")Integer addressId){
		 return userService.deleteAddress(addressId);
	 }
	 @RequestMapping("updatePwd")
	 public @ResponseBody Integer updatePwd(HttpSession session, String oldPwd, String newPwd){
		 User user = (User)session.getAttribute("user");
		 user.setPassword(DigestUtils.md5DigestAsHex(oldPwd.getBytes()));
		 int i = managerService.selectByUsernameAndPassword(user);
		 if(i==0){
			 return 2;
		 }else{
			 userService.updatePwd(user.getUid(),DigestUtils.md5DigestAsHex(newPwd.getBytes()));
			 return 1;
		 }
	 }
	 @RequestMapping("addOrder")
	 public @ResponseBody Integer addOrder(HttpSession session, @Param(value="addressId")Integer addressId, @RequestParam(value="cartId[]")String[] cartId,@RequestParam(value="id[]")String[] id,@RequestParam(value="buyNum[]")String[] buyNum,@RequestParam(value="priceNum[]")String[] priceNum, @Param(value="total")String total){
		 User user = (User)session.getAttribute("user");
		 return userService.addOrder(user.getUid(), addressId,cartId, id,buyNum,priceNum, total);
	 }
	 
	 /*
	  * 退出登陆
	  */
	 @RequestMapping("quit")
	 public @ResponseBody Integer quit(HttpSession session){
		 session.invalidate();
		 return 1;
	 }
	 
	 @RequestMapping("resetPassword")
	 public @ResponseBody Integer resetPassword(User user){
		 user.setPassword(DigestUtils.md5DigestAsHex("123".getBytes()));
		 return userService.resetPassword(user);
	 }
}
