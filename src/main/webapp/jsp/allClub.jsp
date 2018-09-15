<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<style type="text/css">
	a {
		color:#666;
		text-decoration:none;
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
	td{
		vertical-align:middle ! important 
	}
</style>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>

</head>
<body>
<center>
	<table class="table table-hover" id="tab">
		<thead>
			<tr>
				<th width="200" >俱乐部编号</th>
				<th>俱乐部名字</th>
				<th>俱乐部详细信息</th>
				<th>球员信息</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="b" >
			<tr>
				<td>${b.cid}</td>
				<td>${b.name}</td>
				<td><a id="clubdetail" class="btn btn-primary" href="club.action?cid=${b.cid }">查看详情</a></td>
				<td><a id="detail" class="btn btn-primary" href="playerPage.action?cid=${b.cid }">查看详情</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</center>
</body>
</html>