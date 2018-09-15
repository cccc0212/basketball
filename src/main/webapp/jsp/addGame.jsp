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
		margin-top:100px;
	}

</style>

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
	function add(){
		if($("#time").val()==null||$("#time").val()==''){
			layer.alert("比赛时间不能为空！");
		}else if($("#cid").val()==$("#oid").val()){
			layer.alert("俱乐部不能相同！");
		}else {
			layer.confirm("确定添加吗？",function(){
				var form = new FormData(document.getElementById("itemForm")); 
				$.ajax({
					type:'post',
					url:'addGame.action',
					data : form,  
			        processData:false,  
			        contentType:false,   
					success:function(data){
						if(data==1){
							layer.alert("添加成功！",function(){
								window.location.reload();
								});
							
						}else{
							layer.alert("添加失败！")
						}
					}
				});
				});

		}
	}
</script>
</head>
<body>
<center>
	<form id="itemForm" action="addGame.action" onsubmit="return ready()" method="post" >
	添赛事信息：
		<table class="table table-hover" style="border:1px solid #dddddd" width="100%" border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td>比赛时间</td>
				<td><input type="text" id="time" name="time" class="form-control" style="display:inline;" >
				</td>
			</tr>
			<tr>
				<td>主场球队ID</td>
				<td>
				<select id="cid" name="cid" class="form-control">
						<c:forEach items="${club }" var ="cl">
							<option value="${cl.cid }">${cl.name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>客场球队ID</td>
				<td><select id="oid" name="oid" class="form-control">
						<c:forEach items="${club }" var ="cl">
							<option value="${cl.cid }">${cl.name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<input  class="btn btn-primary"  type="button" onclick="add()" value="提交" />
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