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
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<style>
	table{
		table-layout: fixed;
	}
	a:hover{
		color:black;
	}
	td{
		
		vertical-align:middle ! important 
		
	}
	.td_hide{
		width:150px;
		text-overflow: ellipsis; /* for IE */  
	    -moz-text-overflow: ellipsis; /* for Firefox,mozilla */  
	    overflow: hidden;  
	    white-space: nowrap;  
	    text-align: left   
	}
</style>


</head>
<body>
<center>
	<form action="allGoods.action" method="post" style="margin-top:50px">
	<select class="form-control" style="width:15%; float:left" id="topCategory"></select>
	<select class="form-control" style="margin-left:1%; width:15%; float:left" id="secondCategory" name="category"></select>
	<select class="form-control" style="margin-left:1%; width:15%; float:left" id="status" name="status">
		<option value='' id="status1">--商品状态--</option>
		<option value='是'
		<c:if test="${goods.status =='是'}">
		selected
		</c:if>
		>已上架</option>
		<option value='否'
		<c:if test="${goods.status =='否'}">
		selected
		</c:if>
		>未上架</option>
	</select>
	<input type="text" id="goods_id" name="id" placeholder="商品编号" class="form-control" style="width:15%;display:inline;float:left;margin-left:2%;" value="${goods.id }">&nbsp;&nbsp;
	<input type="text" id="goods_name" name="name" placeholder="商品名" class="form-control" style="width:15%;display:inline;float:left;margin-left:1%;" value="${goods.name }">&nbsp;&nbsp;
	<input type="submit" class="btn btn-primary" style="float:left;margin-left:5%;" value="查询">&nbsp;&nbsp;<input class="btn btn-primary" type="button" style="float:left;margin-left:1%;" onclick="resetForm()" value="清空">
	</form>
	<table class = "table table-hover" id="tab" style="margin-top:50px">
		<thead>
			<tr>
				<th style="width:15%" >商品编号</th>
				<th style="width:15%" >商品名</th>
				<th style="width:10%" >商品介绍</th>
				<th style="width:10%" >价格</th>
				<th style="width:10%" >库存</th>
				<th style="width:10%" >是否上架</th>
				<th style="width:20%" >操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.list}" var="b" >
			<tr >
				<td>${b.id}</td>
				<td class="td_hide">${b.name}</td>
				<td><a tabindex="0" class="btn btn-info" role="button" data-toggle="popover" data-trigger="focus" title="商品介绍" data-content="${b.intro}">查看</a></td>
				<td>${b.price}</td>
				<td>${b.num}</td>
				<td>${b.status}</td>
				<td><c:if test="${b.status=='是'}">
						<a class="btn btn-warning" style = "text-decoration:none;" href="javascript:undercarriage(${b.id })">下架</a>
					</c:if>
					<c:if test="${b.status=='否'}">
						<a class="btn btn-success" style = "text-decoration:none;" href="javascript:grounding(${b.id })">上架</a>
					</c:if>
					&nbsp;<a class="btn btn-primary" style = "text-decoration:none;"href="queryGoods.action?id=${b.id }">修改</a>&nbsp;<a class="btn btn-danger" style = "text-decoration:none;" href="javascript:request(${b.id })">删除</a>
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
				<a tabindex="0" id="pc_first" class="btn btn-default" href="allGoods.action?currentPage=1&id=${goods.id}&name=${goods.name}&category=${goods.category}&status=${goods.status}">首页</a> 
				<a tabindex="0"id="pc_prev" class="btn btn-default" href="allGoods.action?currentPage=${list.prePage}&id=${goods.id}&name=${goods.name}&category=${goods.category}&status=${goods.status}">上一页</a>
			</c:if>
			 <c:if test="${list.hasNextPage }">
				<a tabindex="0" id="pc_next" class="btn btn-default" href="allGoods.action?currentPage=${list.nextPage}&id=${goods.id}&name=${goods.name}&category=${goods.category}&status=${goods.status}">下一页</a>
				<a tabindex="0" id="pc_last" class="btn btn-default" href="allGoods.action?currentPage=${list.pages}&id=${goods.id}&name=${goods.name}&category=${goods.category}&status=${goods.status}">尾页</a>
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
		layer.confirm('确定删除吗？',function(){
			var id=obj;
			var params ={};
			params.id=obj;
			$.ajax({
					type:'post',
					url:'deleteGoods.action',
					dataType:'json',
					data:params,
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
	var topCategory ;
	$(document).ready(function(){
		$.ajax({
			type:'post',
			url:'allcategory.action',
			dataType:'json',
			success:function(data){
				topCategory = eval(data);  
					showCategory(); 
				}
		});
		$("#topCategory").change(function(){
			$("#secondCategory").empty();

			var i = $("option:selected",this).val();
			if(i!=""){
				for(var j = 0; j < topCategory.length; j++){
					if(topCategory[j].id==i){
						i=j;
						break;
					}
				}
				for(var j = 0; j < topCategory[i].list.length; j++){
					var ht = "<option value = '"+topCategory[i].list[j].id+"'>"+topCategory[i].list[j].name+"</option>";
					$("#secondCategory").append(ht);
				}
			}
		});
	});
	function showCategory(){
		var category = "${goods.category}";
		var m=-1;
		var n=-1;
		bbq:
		for(var i = 0; i < topCategory.length; i++){
			for(var j = 0; j< topCategory[i].list.length; j++){
				if(topCategory[i].list[j].id==category){
					m=i;
					n=j;
					break bbq;
				}
			}
		}
		$("#topCategory").append("<option id='all_category' value=''>--全部分类--</option>");

		for(var i = 0; i < topCategory.length; i++){
			if(i==m)
				var ht = "<option value = '"+topCategory[i].id+"' selected='selected'>"+topCategory[i].name+"</option>";
			else
				var ht = "<option value = '"+topCategory[i].id+"'>"+topCategory[i].name+"</option>";
			$("#topCategory").append(ht);
		}
		if(m>-1){
			for(var j = 0; j < topCategory[m].list.length; j++){
				if(j==n)
					var ht = "<option value = '"+topCategory[m].list[j].id+"' selected='selected'>"+topCategory[m].list[j].name+"</option>";
				else
					var ht = "<option value = '"+topCategory[m].list[j].id+"'>"+topCategory[m].list[j].name+"</option>";
				$("#secondCategory").append(ht);
			}
		}
	}
	function resetForm(){
		$("#goods_id").val("");
		$("#goods_name").val("");
		$("#all_category").attr("selected","selected");
		$("#status1").attr("selected","selected");
		$("#secondCategory").empty();
	}
	function undercarriage(obj){
		layer.confirm('确定下架该商品？',function(){
			var id=obj;
			var params ={};
			params.id=obj;
			params.status="否";
			$.ajax({
				type:'post',
				url:'updateGoodsStatus.action',
				dataType:'json',
				data:params,
				success:function(data){
						if(data==1){
							layer.alert("下架成功！",function(){
								window.location.reload();
								});

						}
					}
				});

		});

		

	}
	function grounding(obj){
		layer.confirm('确定上架该商品？',function(){
			var id=obj;
			var params ={};
			params.id=obj;
			params.status="是";
			$.ajax({
				type:'post',
				url:'updateGoodsStatus.action',
				dataType:'json',
				data:params,
				success:function(data){
						if(data==1){
							layer.alert("上架成功！",function(){
								window.location.reload();
								});

						}
					}
				});
		});
	

	}
</script>
</body>
</html>