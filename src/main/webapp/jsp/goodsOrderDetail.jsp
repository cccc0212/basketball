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
	function request(obj,cbj){
		layer.confirm("确定删除吗？",function(){
		var orderId=obj;
		var id=cbj;
 		
		$.ajax({
			type:'post',
			url:'deleteGoodsOrderDetail.action',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify({"orderId":orderId,"id":id}),
			success:function(data){
					if(data==1){
						layer.alert("删除成功！",function(){
							window.location.reload();
							});
					
					}
				}
			});
		} );
	}
</script>
</head>
<body>
<input type="button" class="btn btn-primary" style="margin-left:10px;" class="btn btn-default" onClick="javascript:history.go(-1);return false;" value="返回">
<center>
	<table class = "table table-hover" id="tab" style="margin-top:50px">
		<thead>
			<tr>
				<th>订单编号</th>
				<th>商品id</th>
				<th>商品名称</th>
				<th>商品详情</th>
				<th>数量</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${orderDetail}" var="b" >
			<tr >
				<td >${b.orderId }</td>
				<td>${b.id }</td>
				<td >${b.name}</td>
				<td><a tabindex="0" class="btn btn-info" role="button" data-toggle="popover" data-trigger="focus" title="商品介绍" data-content="${b.intro}">查看</a></td>
				<td >${b.buyNum}</td>
				<td><a class="btn btn-danger" style = "text-decoration:none;" href="javascript:request(${b.orderId },${b.id })">删除</a>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</center>
</body>
</html>