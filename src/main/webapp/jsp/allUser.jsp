<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link href="css/font-awesome.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<style type="text/css">
	table.gridtable {
	    font-family: verdana,arial,sans-serif;
	    font-size:11px;
	    color:#333333;
	    border-width: 1px;
	    border-color: #666666;
	    border-collapse: collapse;
	}
	table.gridtable th {
	    border-width: 1px;
	    padding: 8px;
	    border-style: solid;
	    border-color: #666666;
	    background-color: #dedede;
	}
	table.gridtable td {
	    border-width: 1px;
	    padding: 8px;
	    border-style: solid;
	    border-color: #666666;
	    background-color: #ffffff;
	}
</style>
</head>
<body>
<center>
	<form action="allUser.action" method="post" style="margin-top:50px">
	用户ID:<input type="text" name="uid" id="uid" class="form-control" style="width:10%;display:inline;" value="${user.uid }">&nbsp;&nbsp;
	用户名:<input type="text" name="username" id="username" class="form-control" style="width:10%;display:inline;" value="${user.username }">&nbsp;&nbsp;
	<input type="submit" class="btn btn-primary" value="查询">&nbsp;&nbsp;<input class="btn btn-primary"  type="button" onclick="resetCond()" value="清空">
	</form>
	<table class="table table-hover" style="margin-top:20px">
	<thead>
		<tr>
			<th width=20%>用户ID</th>
			<th width=20%>用户名</th>
			<th width=20%>性别</th>
			<th width=20%>地址管理</th>
			<th width=20%>密码管理</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.list}" var="b" >
			<tr>
				<td>${b.uid}</td>
				<td>${b.username}</td>
				<td>${b.sex}</td>
				<td><a href="getAddressList.action?uid=${b.uid}" class="btn btn-default"><i class="fa fa-wrench" style="    color: #666bf7;" aria-hidden="true"></i></a></td>
				<td><a class="btn btn-danger" href="javascript:void(0)" onclick="resetPassword('${b.uid}')">重置</a></td>
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
				<a tabindex="0" id="pc_first" class="btn btn-default" href="allUser.action?currentPage=1&uid=${user.uid}&username=${user.username}">首页</a> 
				<a tabindex="0"id="pc_prev" class="btn btn-default" href="allUser.action?currentPage=${list.prePage}&uid=${user.uid}&username=${user.username}">上一页</a>
			</c:if>
			 <c:if test="${list.hasNextPage }">
				<a tabindex="0" id="pc_next" class="btn btn-default" href="allUser.action?currentPage=${list.nextPage}&uid=${user.uid}&username=${user.username}">下一页</a>
				<a tabindex="0" id="pc_last" class="btn btn-default" href="allUser.action?currentPage=${list.pages}&uid=${user.uid}&username=${user.username}">尾页</a>
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
<script  type="text/javascript">
function resetPassword(obj){
	var params={};
	params.uid=obj;
	 	$.ajax({
		type:'post',
		url:'resetPassword.action',
		dataType:'json',
		data:params,
		success:function(data){
				if(data==1){
					layer.alert("密码重置成功！",function(){
						window.location.reload();
					});
					}
					
			}
 	 
	}); 
}
function resetCond(){
	$("#uid").val("");
	$("#username").val("");

}
</script>
</body>
</html>