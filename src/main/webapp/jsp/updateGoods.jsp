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

</script>
</head>
<body>
<center>
	<form id="itemForm" action="updateGoods.action" onsubmit="return ready()" method="post" enctype="multipart/form-data">
	修改商品信息：
		<table class="table table-hover" width="100%" style="border:1px solid #dddddd"  border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td style="width: 30%">商品编号</td>
				<td><input class="form-control" type="text" id="id" name="id" value="${goods.id}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>分类</td>
				<td>
					<select class="form-control" style="width:30%; float:left" id="topCategory"></select>
					<select class="form-control" style="margin-left:5%; width:30%; float:left" id="secondCategory" name="category"></select>
				</td>
			</tr>
			<tr>
				<td>商品名称</td>
				<td><input class="form-control" type="text" name="name" value="${goods.name}" /></td>
			</tr>
			<tr>
				<td>商品介绍</td>
				<td><textarea id="intro" name="intro"class="form-control">${goods.intro}</textarea></td>
			</tr>
			<tr>
				<td>库存</td>
				<td><input class="form-control" type="text" id="num" name="num" value="${goods.num}" /></td>
			</tr>
			<tr>
				<td>图片</td>
				<td>
					<div id="div4bm" style="float:left;">
					    <!--input[button] 触发 file click事件-->
					    <input type="button" value="选择文件" id="mybutton" class="btn btn-default"  onclick="Id('file').click();" />
					    <!--file 隐藏起来  触发onchange事件-->
					    <input type="file" name="file" accept="image/png,image/jpg,image/jpeg"  id="file" onchange="changeToop();" style="display:none;" />
				    </div>  
				    <!--图片展示区域-->
				    <div style="float:left;">
				        <!--设置默认图片-->
				        <img id="myimg" style="width: 88px;height:88px;border-style:none;" src=""/>
				    </div>
				</td>
			</tr>
			<tr>
				<td>价格</td>
				<td><input class="form-control" type="text" id="price" name="price" value="${goods.price}" /></td>
			</tr>
			<tr>
				<td>是否上架</td>
				<td>
					<select id="sel" name="status" class="form-control">
						<option id="A" value ="是"
							<c:if test="${goods.status.equals('是')}">
							selected="selected"
							</c:if> 			
						>是</option>
						<option id="B" value ="否"
							<c:if test="${goods.status.equals('否')}">
							selected="selected"
							</c:if> 
						>否</option>
					</select>			
				</td>
			</tr>
		</table>
		<input type="button" value="提交" class="btn btn-success" onclick="request()"/><input type="button" class="btn btn-primary" style="margin-left:10px;" class="btn btn-default" onClick="javascript:history.go(-1);return false;" value="返回">
	</form>
</center>
<script type="text/javascript">
	$(document).ready(function(){
		$("#myimg").attr("src", "../CBA/"+"${goods.img }"+"?t=" + Math.random());
	});

	function Id(id){
    	return document.getElementById(id);
    }
    function changeToop(){
        var file = Id("file");
        if(file.value==''){
            //设置默认图片
        Id("myimg").src='images/zanwu.png';
        }else{
            preImg("file","myimg");
        }
    }
    //获取input[file]图片的url Important
    function getFileUrl(fileId) { 
        var url; 
        var file = Id(fileId);
        var agent = navigator.userAgent;
        if (agent.indexOf("MSIE")>=1) {
        url = file.value; 
        } else if(agent.indexOf("Firefox")>0) { 
        url = window.URL.createObjectURL(file.files.item(0)); 
        } else if(agent.indexOf("Chrome")>0) {
        url = window.URL.createObjectURL(file.files.item(0)); 
        } 
        return url; 
    } 
    //读取图片后预览
    function preImg(fileId,imgId) { 
	    var imgPre =Id(imgId);
	    imgPre.src = getFileUrl(fileId); 
    } 
	 
/* 	function request(){
		if(ready()){
			var id=$("#id").val();
			var name=$("#name").val();
			var intro=$("#intro").val();
			var sellId=$("#sellId").val();
			var price=$("#price").val();
			var img=$("#img").val();
			var status=$("#sel").val();
			$.ajax({
				type:'post',
				url:'updateGoods.action',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify({"id":id,"name":name,"intro":intro,"sellId":sellId,"price":price,"status":status,"img":img}),
				success:function(data){
						if(data==1){
							alert("修改成功！");
							window.location.reload();
						}
					}
				});
		}
	} */
	function upload(){
		var form = new FormData(document.getElementById("itemForm")); 
		$.ajax({
			type:'post',
			url:'uploadPicture.action',
			data : form,  
	        processData:false,  
	        contentType:false,   
			success:function(data){
					alert("上传成功！");
				    $('#img').val(data);
				    $('#pic').attr('src', data+"nbsp");
					$('#pic').attr('src', data);
					
				}
			});
		
	}
	var topCategory ;
	$(document).ready(function(){
		$.ajax({
			type:'post',
			url:'allcategory.action',
			dataType:'json',
			success:function(data){
				topCategory = eval(data);  
					showCategory(); 
				}
		});
			
	});
	
	function request(){
		layer.confirm("确定修改吗？",function(){
			var form = new FormData(document.getElementById("itemForm")); 
			$.ajax({
				type:'post',
				url:'updateGoods.action',
				data : form,  
		        processData:false,  
		        contentType:false,   

				success:function(data){
					if(data==1){
						layer.alert("修改成功！",function(){
							window.location.reload();
							});
						
					}else{
						layer.alert("添加失败！卖方ID不存在！")
					}
				}
			});
		});
	}
	function showCategory(){
		var category = "${goods.category}";
		var m=0;
		var n=0;
		
		bbq:
		for(var i = 0; i < topCategory.length; i++){
			for(var j = 0; j< topCategory[i].list.length; j++){
				if(topCategory[i].list[j].id==category){
					m=i;
					n=j;
					break bbq;
				}
			}
		}

		
		for(var i = 0; i < topCategory.length; i++){
			if(i==m)
				var ht = "<option value = '"+topCategory[i].id+"' selected='selected'>"+topCategory[i].name+"</option>";
			else
				var ht = "<option value = '"+topCategory[i].id+"'>"+topCategory[i].name+"</option>";
			$("#topCategory").append(ht);
		}
		for(var j = 0; j < topCategory[m].list.length; j++){
			if(j==n)
				var ht = "<option value = '"+topCategory[m].list[j].id+"' selected='selected'>"+topCategory[m].list[j].name+"</option>";
			else
				var ht = "<option value = '"+topCategory[m].list[j].id+"'>"+topCategory[m].list[j].name+"</option>";
			$("#secondCategory").append(ht);
		}
	}
	$("#topCategory").change(function(){
		$("#secondCategory").empty();
		var i = $("option:selected",this).val();
		for(var j = 0; j < topCategory.length; j++){
			if(topCategory[j].id==i){
				i=j;
				break;
			}
		}
		for(var j = 0; j < topCategory[i].list.length; j++){
			var ht = "<option value = '"+topCategory[i].list[j].id+"'>"+topCategory[i].list[j].name+"</option>";
			$("#secondCategory").append(ht);
		}
	});
</script>
</body>
</html>