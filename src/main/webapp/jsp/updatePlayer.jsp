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
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	
	function ready()  
	{  
	    var mymessage=confirm("确定添加吗？");  
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
			var pid=$("#pid").val();
			var name=$("#name").val();
			var cid=$("#cid").val();
			var number=$("#number").val();
			var location=$("#sel").val();
			var weight=$("#weight").val();
			var height=$("#height").val();
			var birthday=$("#birthday").val();
			$.ajax({
				type:'post',
				url:'updatePlayer.action',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify({"pid":pid,"name":name,"cid":cid,"number":number,"location":location,"weight":weight,"height":height,"birthday":birthday}),
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
	<form id="itemForm" action="addPlayer.action" onsubmit="return ready()" method="post" >
	修改球员信息：
		<table class="table table-hover" width="100%" style="border:1px solid #dddddd"  border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td>球员编号</td>
				<td><input class="form-control" type="text" id="pid" value="${player.pid}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>球员姓名</td>
				<td><input class="form-control" type="text" id="name" value="${player.name}" /></td>
			</tr>
			<tr>
				<td>俱乐部名称</td>
				<td><select id="cid" class="form-control">
						<c:forEach items="${club }" var ="cl" >
							<option value="${cl.cid }"
								<c:if test="${cl.cid==player.cid }">
									selected="selected"
								</c:if>
							>${cl.name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>球衣号码</td>
				<td><input class="form-control" type="text" id="number" value="${player.number}" /></td>
			</tr>
			
			<tr>
				<td>位置</td>
				<td>
					<select id="sel" class="form-control">
						<option id="A" value ="前锋"
							<c:if test="${player.location.equals('前锋')}">
							selected="selected"
							</c:if> 			
						>前锋</option>
						<option id="B" value ="中锋"
							<c:if test="${player.location.equals('中锋')}">
							selected="selected"
							</c:if> 
						>中锋</option>
						<option id="C" value="后卫"
							<c:if test="${player.location.equals('后卫')}">
							selected="selected"
							</c:if> 
						>后卫</option>
					</select>
				
				</td>
			</tr>
			<tr>
				<td>身高/cm</td>
				<td><input class="form-control" type="text" id="height" value="${player.height}" /></td>
			</tr>
			<tr>
				<td>体重/kg</td>
				<td><input class="form-control" type="text" id="weight" value="${player.weight}" /></td>
			</tr>
			<tr>
				<td>出生日期</td>
				<td><input class="form-control" type="text" id="birthday" value="<fmt:formatDate value='${player.birthday }' type='date' pattern='yyyy-MM-dd'/>" /></td>
			</tr>
		</table>
		<input type="button" value="提交" class="btn btn-success" onclick="request()"/><input type="button" class="btn btn-primary" style="margin-left:10px;" class="btn btn-default" onClick="javascript:history.go(-1);return false;" value="返回">
	</form>
		<script src="js/laydate/laydate.js"></script>
<script>
laydate.render({
	  elem: '#birthday' //指定元素
	});
</script>
</center>
</body>
</html>