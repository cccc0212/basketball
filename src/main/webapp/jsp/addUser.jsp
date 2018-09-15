<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		margin-top:200px;
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
		
		var uid=$("#uid").val();
		var username=$("#username").val();
		var sex=$('input[name="sex"]:checked').val();
		var password=$("#password").val();
		if(username==null||username==''){
			layer.alert("用户名不能为空！");
		}else if(password==null||password==''){
			layer.alert("密码不能为空！");
		}else{
			layer.confirm("确定添加吗？",function(){
				$.ajax({
					type:'post',
					url:'addUser.action',
					contentType:'application/json;charset=utf-8',
					data:JSON.stringify({"uid":uid,"username":username,"sex":sex,"password":password}),
					success:function(data){
							if(data==1){
								layer.alert("添加成功！",function(){
									window.location.reload();
									});
								
							}
						}
					});
				});

		}


	}
</script>
</head>
<body>
<center style="margin-top:100px;">
	<form id="itemForm" action="addUser.action" onsubmit="return ready()" method="post" >
	添加用户信息：
		<table class="table table-hover" width="100%" style="border:1px solid #dddddd"  border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td>新用户ID</td>
				<td><input type="text" class="form-control" id="uid" value="${Id}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>员工姓名</td>
				<td><input type="text" class="form-control" id="username" /></td>
			</tr>
			<tr>
				<td>员工性别</td>
				<td>
					&nbsp;&nbsp;<input type="radio" name="sex" value="男" checked>男&nbsp;&nbsp;<input type="radio" name="sex" value="女">女
				</td>
			</tr>
			
			<tr>
				<td>员工密码</td>
				<td>
					<input type="password" class="form-control" id="password" />
				</td>
			</tr>
			<tr>
			
				<td colspan="2" align="center"><input type="button" class="btn btn-success" value="提交" onclick="request()"/></td>
				
			</tr>
		</table>
	</form>
</center>
</body>
</html>