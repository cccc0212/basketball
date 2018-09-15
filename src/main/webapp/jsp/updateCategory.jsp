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
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap.css" rel="stylesheet" media="screen">

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<style>
	table{
		table-layout: fixed;
	}
	a:hover{
		color:black;
	}
	td{
		
		vertical-align:middle ! important 
		
	}
	.td_hide{
		width:150px;
		text-overflow: ellipsis; /* for IE */  
	    -moz-text-overflow: ellipsis; /* for Firefox,mozilla */  
	    overflow: hidden;  
	    white-space: nowrap;  
	    text-align: left   
	}
</style>
<script type="text/javascript">
function request(obj){
	layer.confirm("确认删除吗？",function(){
		var id=obj;
		var params ={};
		params.id=obj;

		$.ajax({
			type:'post',
			url:'deleteSecondCategory.action',
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
function showAdd(){
	$('#myModal').modal();
}
function add(){
	params = {};
	params.name = $("#add_name").val();
	params.topId=${top.id};
		$.ajax({
			type:'post',
			url:'addSecondCategory.action',
			dataType:'json',
			data:params,
			success:function(data){
					if(data==1){
						layer.alert("添加成功！",function(){
							window.location.reload();
							});
						
					}
				}
			}); 
}
</script>

</head>
<body>
<center>
	<h1>二级分类</h1>
	一级分类名：<span>${top.name}</span>
	<input type="button" class="btn btn-primary" style="margin-right:10px; float:left" class="btn btn-default" onClick="javascript:history.go(-1);return false;" value="返回"><button class="btn  btn-primary" style="float:left" onclick="showAdd()">添加二级分类</button>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	 <div class="modal-dialog" role="document">
	 <div class="modal-content">
	 <div class="modal-header">
	  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	  <h4 class="modal-title" id="myModalLabel">添加二级分类<</h4>
	 </div>
	 <div class="modal-body">
	  <div style="display:none"><input type="text" name="add_id" class="form-control" id="add_id" placeholder="id"></div>
	  <div class="form-group">
	 
	  <label for="add_time">二级分类名称</label>
	  <input type="text" name="add_time" class="form-control" id="add_name" placeholder="二级分类名称">
	  </div>
	 <div class="modal-footer">

	  <button type="submit" id="add_submit" onclick="add()" class="submit111 btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
			  <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	 </div>
	 </div>
	 </div>
	 </div>
	 </div>
	<table class = "table table-hover" id="tab" style="margin-top:50px">
		<thead>
			<tr>
				<th style="width:20%" >编号</th>
				<th style="width:20%" >类型</th>
				<th style="width:20%" >操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${top.list}" var="b" >
			<tr >
				<td>${b.id}</td>
				<td class="td_hide">${b.name}</td>
				<td>
					<c:if test="${b.id != 1024}">
						<a class="btn btn-danger" style = "text-decoration:none;" href="javascript:request(${b.id})">删除</a>
					</c:if>	
				</td>
					
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</center>
</body>
</html>