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
<!-- <style type="text/css">
	body {
		overflow-x: hidden;
		font-family: 'Microsoft Yahei',sans-serif;
		font-size:12px;
		color:#666;
	}
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
	.butt{
		text-decoration:none;
		cursor:pointer;
		font-size: 12px;
		padding: 4px 10px !important;
		border-style: solid;
		border-width: 1px;
		border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
		display: inline-block;
		line-height: 16px;
		background: #f5f5f5;
		color: #333333;
		text-shadow: 0 1px 0 #ffffff;
	}
	.page{
		display: inline;
		
	}
</style> -->
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>

</head>
<body>
<a tabindex="0" class="btn btn-primary" style="margin-top:10px;" class="btn btn-default" href="allClub.action">返回</a>
<center>
	<h2>${list.list[0].cname}</h2>
	<table class="table table-hover" id="tab">
		<thead>
		<tr>
			<th width="80" >球员编号</th>
			<th>俱乐部名字</th>
			<th>球衣号码</th>
			<th>球员姓名</th>
			<th>位置</th>
			<th>身高(cm)</th>
			<th>体重(kg)</th>
			<th>年龄</th>
			<th>出生日期</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list.list}" var="b" >
			<tr>
				<td>${b.pid}</td>
				<td>${b.cname}</td>
				<td>${b.number}</td>
				<td>${b.name}</td>
				<td>${b.location}</td>
				<td>${b.height}cm</td>
				<td>${b.weight}kg</td>
				<td>${b.age}</td>
				<td><fmt:formatDate value="${b.birthday}" pattern="yyyy/MM/dd" /></td>
				
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
				<a tabindex="0" id="pc_first" class="btn btn-default" href="playerPage.action?cid=${list.list[0].cid}&currentPage=${list.firstPage}">首页</a> 
				<a tabindex="0"id="pc_prev" class="btn btn-default" href="playerPage.action?cid=${list.list[0].cid }&currentPage=${list.prePage}">上一页</a>
			</c:if>
			 <c:if test="${list.hasNextPage }">
				<a tabindex="0" id="pc_next" class="btn btn-default" href="playerPage.action?cid=${list.list[0].cid }&currentPage=${list.nextPage}">下一页</a>
				<a tabindex="0" id="pc_last" class="btn btn-default" href="playerPage.action?cid=${list.list[0].cid }&currentPage=${list.lastPage}">尾页</a>
			</c:if>
		</c:if>
		<c:if test="${list.pages==1 }">
			<div  id="noTotal" class="page">
				第
				<div style="display: inline" id="pc_onlyCurrPage">{list.pages}</div>
				页
			</div>
		</c:if>
	</div>
	
</center>
</body>
</html>