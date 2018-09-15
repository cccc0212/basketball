<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/mycss.css" rel="stylesheet" media="screen">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<style type="text/css">
	center{
		margin-top:100px;
	}
</style>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	
	function ready()  
	{  
	    var mymessage=confirm("确定添加吗？");  
	    if(mymessage==true)  
	    {  
	        return true;
	    }  
	    else if(mymessage==false)  
	    {  
	        return false; 
	    }  
	}  
	function request(){
		layer.confirm("确认添加吗？",function(){
			var orderId=$("#orderId").val();
			var state=$("#sel").val();
			var address=$("#address").val();
			$.ajax({
				type:'post',
				url:'updateGoodsOrder.action',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify({"orderId":orderId,"state":state,"address":address}),
				success:function(data){
						if(data==1){
							layer.alert("修改成功！",function(){
								window.location.reload();
								});
						
						}
					}
				});
			});

		


	}
</script>
</head>
<body>
<center>
	<form id="itemForm" action="updateGoodsOrder.action" onsubmit="return ready()" method="post" >
	修改订单信息：
		<table class="table table-hover" width="100%" style="border:1px solid #dddddd"  border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td>订单编号</td>
				<td><input class="form-control" type="text" id="orderId" value="${goodsOrder.orderId}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>买方ID</td>
				<td><input class="form-control" type="text" id="buyId" value="${goodsOrder.buyId}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>收货地址</td>
				<td><input class="form-control" type="text" id="address" value="${goodsOrder.address}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>状态</td>
				<td>
					<select id="sel" class="form-control">
						<option id="A" value ="已下单"
							<c:if test="${goodsOrder.state.equals('已下单')}">
							selected="selected"
							</c:if> 			
						>已下单</option>
						<option id="B" value ="已付款"
							<c:if test="${goodsOrder.state.equals('已付款')}">
							selected="selected"
							</c:if> 
						>已付款</option>
						<option id="C" value="已发货"
							<c:if test="${goodsOrder.state.equals('已发货')}">
							selected="selected"
							</c:if> 
						>已发货</option>
						<option id="D" value="已签收"
							<c:if test="${goodsOrder.state.equals('已签收')}">
							selected="selected"
							</c:if> 
						>已签收</option>
						<option id="E" value="已取消"
							<c:if test="${goodsOrder.state.equals('已取消')}">
							selected="selected"
							</c:if> 
						>已取消</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="button" value="提交" class="btn btn-success" onclick="request()"/><input type="button" class="btn btn-primary" style="margin-left:10px;" class="btn btn-default" onClick="javascript:history.go(-1);return false;" value="返回">
	</form>
</center>
</body>
</html>