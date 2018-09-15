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
<style type="text/css">
	center{
		margin-top:100px;
	}
</style>
<script type="text/javascript">
	
	function ready()  
	{  
	    var mymessage=confirm("确定修改吗？");  
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
		layer.confirm("确定修改吗？",function(){
			var form = new FormData(document.getElementById("itemForm")); 
			$.ajax({
				type:'post',
				url:'updateGame.action',
				data:form,
		        processData:false,  
		        contentType:false, 
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
	<form id="itemForm" action="updateGoods.action" onsubmit="return ready()" method="post" >
	修改赛事信息：
		<table class="table table-hover" width="100%" style="border:1px solid #dddddd"  border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td>比赛编号</td>
				<td><input class="form-control" type="text" id="id" name="id" value="${game.id}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>比赛时间</td>
				<td><input type="text" id="time"  class="form-control" name="time" value="<fmt:formatDate value='${game.time}' type='date' pattern="yyyy-MM-dd HH:mm:ss"/>"></td>
			</tr>
			<tr>
				<td>主场俱乐部</td>
				<td><input class="form-control" type="text" id="cname" name="cname" value="${game.cname}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>客场俱乐部</td>
				<td><input class="form-control" type="text" id="oname" name="oname" value="${game.oname}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>主场得分</td>
				<td><input class="form-control" type="text" id="cscore" name="cscore" value="${game.cscore}" /></td>
			</tr>
			<tr>
				<td>客场得分</td>
				<td><input class="form-control" type="text" id="oscore" name="oscore" value="${game.oscore}"/></td>
			</tr>
		</table>
		<input type="button" value="提交" class="btn btn-success" onclick="request()"/><input type="button" class="btn btn-primary" style="margin-left:10px;" class="btn btn-default" onClick="javascript:history.go(-1);return false;" value="返回">
	</form>
</center>
<script src="js/laydate/laydate.js"></script>
<script>
laydate.render({
	  elem: '#time' //指定元素
	  ,type: 'datetime'
	});
</script>
</body>
</html>