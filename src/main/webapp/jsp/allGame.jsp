<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<script type="text/javascript">
	
	function request(obj){
		layer.confirm("确定删除吗？",function(){
			var id=obj;
			$.ajax({
				type:'post',
				url:'deleteGame.action',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify({"id":id}),
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
		$("#start").val("");
		$("#end").val("");

	}
</script>
</head>
<body>
<center style="margin-top:100px;">
	<form action="allGame.action" method="post" style="margin-bottom:50px">
	<input type="text" id="start" name="start" placeholder="开始时间" class="form-control" style="width:20%;display:inline;" value="<fmt:formatDate value='${start}' type='date' pattern="yyyy-MM-dd HH:mm:ss"/>">&nbsp;&nbsp;
	<input type="text" id="end" name="end" placeholder="结束时间" class="form-control" style="width:20%;display:inline;" value="<fmt:formatDate value='${end}' type='date' pattern="yyyy-MM-dd HH:mm:ss"/>">&nbsp;&nbsp;
	<input type="submit" class="btn btn-primary" value="查询">&nbsp;&nbsp;<input class="btn btn-primary"  type="button" onclick="resetCond()" value="清空">
	</form>
	<table class="table table-hover">
	<thead>
		<tr>
			<th width=10%>比赛编号</th>
			<th width=20% >比赛时间</th>
			<th width=15%>主场俱乐部</th>
			<th width=15% >客场俱乐部</th>
			<th width=10%>主场得分</th>
			<th width=10%>客场得分</th>
			<th width=20%>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.list}" var="b" >
			<tr>
				<td>${b.id}</td>
				<td><fmt:formatDate value="${b.time}" pattern="yyyy-MM-dd HH:00:00" /></td>
				<td>${b.cname}</td>
				<td>${b.oname}</td>
				<td>${b.cscore}</td>
				<td>${b.oscore}</td>
				<td><a class="btn btn-primary" style = "text-decoration:none;"href="queryGame.action?id=${b.id }">修改</a>&nbsp;<a class="btn btn-danger" style = "text-decoration:none;" href="javascript:request(${b.id })">删除</a>
				
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
				<a tabindex="0" id="pc_first" class="btn btn-default" href="allGame.action?currentPage=1&start=<fmt:formatDate value='${start}' pattern='yyyy-MM-dd HH:MM:SS' />&end=<fmt:formatDate value='${end}' pattern='yyyy-MM-dd HH:MM:SS' />">首页</a> 
				<a tabindex="0"id="pc_prev" class="btn btn-default" href="allGame.action?currentPage=${list.prePage}&start=<fmt:formatDate value='${start}' pattern='yyyy-MM-dd HH:MM:SS' />&end=<fmt:formatDate value='${end}' pattern='yyyy-MM-dd HH:MM:SS' />">上一页</a>
			</c:if>
			 <c:if test="${list.hasNextPage }">
				<a tabindex="0" id="pc_next" class="btn btn-default" href="allGame.action?currentPage=${list.nextPage}&start=<fmt:formatDate value='${start}' pattern='yyyy-MM-dd HH:MM:SS' />&end=<fmt:formatDate value='${end}' pattern='yyyy-MM-dd HH:MM:SS' />">下一页</a>
				<a tabindex="0" id="pc_last" class="btn btn-default" href="allGame.action?currentPage=${list.pages}&start=<fmt:formatDate value='${start}' pattern='yyyy-MM-dd HH:MM:SS' />&end=<fmt:formatDate value='${end}' pattern='yyyy-MM-dd HH:MM:SS' />">尾页</a>
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
<script src="js/laydate/laydate.js"></script>
<script type="text/javascript">
laydate.render({
	  elem: '#start' //指定元素
	  ,type: 'datetime'
	});
laydate.render({
	  elem: '#end' //指定元素
	  ,type: 'datetime'
	});

</script>
</body>
</html>