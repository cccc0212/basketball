<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<style>
	a:hover{
		color:black;
	}
	.page a:hover{
		background-color:blue;
	}
	td{
		vertical-align:middle ! important 
	}

</style>
<script type="text/javascript">
	$(function () {
	  $('[data-toggle="popover"]').popover()
	})
	function ready()  
	{  
	    var mymessage=confirm("确定删除吗？");  
	    if(mymessage==true)  
	    {  
	        return true;
	    }  
	    else if(mymessage==false)  
	    {  
	        return false; 
	    }  
	}  
	function request(obj){
		layer.confirm("确定删除吗？",function(){
			var id=obj;
			$.ajax({
				type:'post',
				url:'deleteGoodsOrder.action',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify({"orderId":id}),
				success:function(data){
						if(data==1){
							layer.alert("删除成功！",function(){
								window.location.reload();

								});
							
						}
					}
				});

			});
	}
	function resetCond(){
		$("#orderId").val("");
		$("#state1").attr("selected","selected");

	}
</script>
</head>
<body>
<center>
	<form action="allGoodsOrder.action" method="post" style="margin-top:50px">
	<select class="form-control" style="width:20%;display:inline;" name="state" >
		<option value='' id="state1">--订单状态--</option>
		<option value='已下单'
		<c:if test="${goodsOrder.state =='已下单'}">
		selected
		</c:if>
		>已下单</option>
		<option value='已付款'
		<c:if test="${goodsOrder.state =='已付款'}">
		selected
		</c:if>
		>已付款</option>
		<option value='已发货'
		<c:if test="${goodsOrder.state =='已发货'}">
		selected
		</c:if>
		>已发货</option>
		<option value='已签收'
		<c:if test="${goodsOrder.state =='已签收'}">
		selected
		</c:if>
		>已签收</option>
		<option value='已取消'
		<c:if test="${goodsOrder.state =='已取消'}">
		selected
		</c:if>
		>已取消</option>
	</select>&nbsp;&nbsp;
	<input type="text" name="orderId" id="orderId" placeholder="订单编号" class="form-control" style="width:20%;display:inline;" value="${goodsOrder.orderId }">&nbsp;&nbsp;
	
	<input type="submit" class="btn btn-primary" value="查询">&nbsp;&nbsp;<input class="btn btn-primary" type="button" onclick="resetCond()" value="清空">
	</form>
	<table class = "table table-hover" id="tab" style="margin-top:50px">
		<thead>
			<tr>
				<th>订单编号</th>
				<th>买方ID</th>
				<th>收货人</th>
				<th>联系方式</th>
				<th>收货地址</th>
				<th>商品详情</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.list}" var="b" >
			<tr >
				<td >${b.orderId }
				<td >${b.buyId}</td>
				<td >${b.name}</td>
				<td >${b.phone}</td>
				<td><a tabindex="0" class="btn btn-info" role="button" data-toggle="popover" data-trigger="focus" title="收货地址" data-content="${b.address}">查看</a></td>
				<td><a class="btn btn-success" style = "text-decoration:none;"href="queryGoodsOrderDetail.action?id=${b.orderId }">查看</a></td>
				<td >${b.state}</td>
				<td><a class="btn btn-primary" style = "text-decoration:none;"href="queryGoodsOrder.action?id=${b.orderId }">修改</a>&nbsp;<a class="btn btn-danger" style = "text-decoration:none;" href="javascript:request(${b.orderId })">删除</a>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div id="pageElem" style= "margin-top:20px;">
		<c:if test="${list.pages>1 }">
			<div  id="withTotal" class="page">
				共
				<div style="display: inline" id="pc_totalCount">${list.total }</div>
				条，第
				<div style="display: inline" id="pc_currentPage">${list.pageNum }</div>
				/
				<div style="display: inline" id="pc_totalPage">${list.pages}</div>
				页
			</div>
			<c:if test="${list.hasPreviousPage }">
				<a tabindex="0" id="pc_first" class="btn btn-default" href="allGoodsOrder.action?currentPage=1&id=${goodsOrder.orderId}">首页</a> 
				<a tabindex="0"id="pc_prev" class="btn btn-default" href="allGoodsOrder.action?currentPage=${list.prePage}&id=${goodsOrder.orderId}">上一页</a>
			</c:if>
			 <c:if test="${list.hasNextPage }">
				<a tabindex="0" id="pc_next" class="btn btn-default" href="allGoodsOrder.action?currentPage=${list.nextPage}&id=${goodsOrder.orderId}">下一页</a>
				<a tabindex="0" id="pc_last" class="btn btn-default" href="allGoodsOrder.action?currentPage=${list.pages}&id=${goodsOrder.orderId}">尾页</a>
			</c:if>
		</c:if>
		<c:if test="${list.pages==1 }">
			<div  id="noTotal" class="page">
				第
				<div style="display: inline" id="pc_onlyCurrPage">1</div>
				页
			</div>
		</c:if>
	</div>
	
</center>
</body>
</html>