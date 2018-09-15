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
			var params ={};
			params.pid=obj;
			$.ajax({
				type:'post',
				url:'deletePlayer.action',
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
	function resetCond(){
		$("#pid").val("");
		$("#name").val("");
		$("#all_cid").attr("selected","selected");
	}
</script>
</head>
<body>
<center>
	<form action="allPlayer.action" method="post" style="margin-top:50px">
	<input type="text" id="pid" name="pid" placeholder="球员编号"  class="form-control" style="width:15%;display:inline;float: left;margin-left: 10%;" value="${player.pid }">&nbsp;&nbsp;
	<input type="text" id="name" name="name" placeholder="球员姓名" class="form-control" style="width:15%;display:inline;float: left;margin-left: 5%;" value="${player.name }">&nbsp;&nbsp;
	<select class="form-control" style="width:15%;float:left;margin-left:5%" id="cid" name="cid">
					<option id="all_cid" value="">--俱乐部--</option>
					<c:forEach items="${clubList}" var="b" >
						<option
							<c:if test="${b.cid == player.cid}">
								selected="selected"
							</c:if>
						value="${b.cid}">${b.name}</option>
					</c:forEach>
				</select>
	<input type="submit" class="btn btn-primary" style="float:left;margin-left:5%;" value="查询">&nbsp;&nbsp;<input class="btn btn-primary"  style="float:left;margin-left:2%;" type="button" onclick="resetCond()" value="清空">
	</form>
	<table class = "table table-hover" id="tab" style="margin-top:50px">
		<thead>
			<tr>
				<th width="80" >球员编号</th>
				<th>俱乐部名字</th>
				<th>球衣号码</th>
				<th>球员姓名</th>
				<th>位置</th>
				<th>身高</th>
				<th>体重</th>
				<th>年龄</th>
				<th>出生日期</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.list}" var="b" >
			<tr >
				<td>${b.pid}</td>
				<td>${b.cname}</td>
				<td>${b.number}</td>
				<td>${b.name}</td>
				<td>${b.location}</td>
				<td>${b.height}cm</td>
				<td>${b.weight}kg</td>
				<td>${b.age}</td>
				<td><fmt:formatDate value="${b.birthday}" pattern="yyyy/MM/dd" /></td>
				<td><a class="btn btn-primary" style = " text-decoration:none;"href="queryPlayer.action?pid=${b.pid }">修改</a>&nbsp;<a class="btn btn-danger" style = "text-decoration:none;" href="javascript:request(${b.pid })">删除</a>
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
				<a tabindex="0" id="pc_first" class="btn btn-default" href="allPlayer.action?currentPage=1&pid=${player.pid}&name=${player.name}&cid=${player.cid}">首页</a> 
				<a tabindex="0"id="pc_prev" class="btn btn-default" href="allPlayer.action?currentPage=${list.prePage}&player=${player}&pid=${player.pid}&name=${player.name}&cid=${player.cid}">上一页</a>
			</c:if>
			 <c:if test="${list.hasNextPage }">
				<a tabindex="0" id="pc_next" class="btn btn-default" href="allPlayer.action?currentPage=${list.nextPage}&pid=${player.pid}&name=${player.name}&cid=${player.cid}">下一页</a>
				<a tabindex="0" id="pc_last" class="btn btn-default" href="allPlayer.action?currentPage=${list.pages}&pid=${player.pid}&name=${player.name}&cid=${player.cid}">尾页</a>
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