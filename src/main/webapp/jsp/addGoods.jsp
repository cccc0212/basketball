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

</head>
<body>
<center>
	<form id="itemForm" action="addGoods.action" onsubmit="return ready()" method="post" enctype="multipart/form-data">
	添加纪念品信息：
		<table class="table table-hover" width="100%" style="border:1px solid #dddddd"  border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td style="width:30%">新纪念品编号</td>
				<td><input class="form-control" type="text" name="id" value="${id}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>分类</td>
				<td>
					<select class="form-control" style="width:30%; float:left" id="topCategory"></select>
					<select class="form-control" style="margin-left:5%; width:30%; float:left" id="secondCategory" name="category"></select>
				</td>
			</tr>
			<tr>
				<td>新纪念品名</td>
				<td><input class="form-control" type="text" id="name" name="name"  value="${name}"/></td>
			</tr>
			<tr>
				<td>新纪念品介绍</td>
				<td><textarea name="intro" id="intro" class="form-control">${goods.intro}</textarea></td>
			</tr>
			<tr>
				<td>库存</td>
				<td><input class="form-control" id="num" type="text" name="num"  value="${num}"/></td>
			</tr>
			<tr>
				<td>图片上传</td>
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
					        <img id="myimg" style="width: 88px;height:88px;"src="images/zanwu.png"/>
					    </div>
					
					
<%-- 					<img id = "pic" style="width:88px;height:88px" src="" />
					<input style="display:none" id="img" name="img" type="text" value="${img }">
					<input style="display:inline;" class="btn btn-default" type="file" id = "file" name="file" />&nbsp;&nbsp;
					<input style="display:inline;" class="btn btn-default" type="button" onclick="upload()" value="上 传" /> --%>
				</td>
			</tr>
			<tr>
				<td>价格</td>
				<td><input class="form-control" id="price" type="text" name="price"  value="${price}"/>		
				</td>
			</tr>
		</table>
		<input class="btn btn-success" type="button" onclick="add()" value="提交" />
	</form>
</center>
<script type="text/javascript">
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
		if($("#name").val()==''||$("#name").val()==null){
			layer.alert("纪念品名不能为空！");
		}else if($("#intro").val()==''||$("#intro").val()==null){
			layer.alert("纪念品介绍不能为空！");
		}else if($("#num").val()==''||$("#num").val()==null){
			layer.alert("库存不能为空！");
		}else if($("#price").val()==''||$("#price").val()==null){
			layeralert("价格不能为空！");
		}else {
			layer.confirm("确定添加吗？",function(){
				var form = new FormData(document.getElementById("itemForm")); 
				$.ajax({
					type:'post',
					url:'addGoods.action',
					data : form,  
			        processData:false,  
			        contentType:false,   
					success:function(data){
						if(data==1){
							layer.alert("添加成功！",function(){
								window.location.reload();
								});
							
						}else{
							layer.alert("添加失败！卖方ID不存在！")
						}
					}
				});

			});

		}
	}
	function showCategory(){
		for(var i = 0; i < topCategory.length; i++){
			var ht = "<option value = '"+topCategory[i].id+"'>"+topCategory[i].name+"</option>";
			$("#topCategory").append(ht);
		}
		for(var j = 0; j < topCategory[0].list.length; j++){
			var ht = "<option value = '"+topCategory[0].list[j].id+"'>"+topCategory[0].list[j].name+"</option>";
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