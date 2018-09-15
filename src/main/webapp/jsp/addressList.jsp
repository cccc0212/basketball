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
	<span>${user.username} 的收货地址</span>
	<table class="table table-hover" style="margin-top:20px">
	<thead>
		<tr>
			<th width=10%>收货人</th>
			<th width=10%>联系电话</th>
			<th width=80%>详细地址</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${user.list}" var="b" >
			<tr>
				<td>${b.name}</td>
				<td>${b.phone}</td>
				<td>${b.address}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</center>
<script  type="text/javascript">

</script>
</body>
</html>