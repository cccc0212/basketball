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
	<form id="itemForm" action="addClub.action" onsubmit="return ready()" method="post" enctype="multipart/form-data">
	添加俱乐部信息：
		<table class="table table-hover" width="100%" style="border:1px solid #dddddd"  border="1" cellspacing="1" cellpadding="0">
			<tr>
				<td style="width:30%">俱乐部编号</td>
				<td><input class="form-control" type="text" name="cid" value="${cid}" readonly="readonly"/></td>
			</tr>

			<tr>
				<td>新俱乐部名</td>
				<td><input class="form-control" type="text" id="name" name="name"  value="${name}"/></td>
			</tr>
			<tr>
				<td>俱乐部logo</td>
				<td>
					    <div id="div4bm" style="float:left;">
						    <!--input[button] 触发 file click事件-->
						    <input type="button" value="选择文件" id="mybutton" class="btn btn-primary"  onclick="Id('file').click();" />
						    <!--file 隐藏起来  触发onchange事件-->
						    <input type="file" name="file" accept="image/png,image/jpg,image/jpeg"  id="file" onchange="changeToop();" style="display:none;" />
					    </div>  
					    <!--图片展示区域-->
					    <div style="float:left;">
					        <!--设置默认图片-->
					        <img id="myimg" style="width: 88px;height:88px;"src="images/zanwu.png"/>
					    </div>
					
				</td>
			</tr>
			<tr>
				<td>新俱乐部介绍</td>
				<td><textarea id="intro" name="intro" class="form-control">${goods.intro}</textarea></td>
			</tr>
			<tr>
				<td>俱乐部地址</td>
				<td><input id="area" class="form-control" type="text" name="area"  value="${area}"/></td>
			</tr>
			<tr>
				<td>体育馆名称</td>
				<td><input id="gym" class="form-control" type="text" name="gym"  value="${gym}"/></td>

			</tr>
			<tr>
				<td>建立时间</td>
				<td><input id="birth" class="form-control" type="text" name="birth"  value="${birth}"/>		
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
	function upload(){
		var form = new FormData(document.getElementById("itemForm")); 
		$.ajax({
			type:'post',
			url:'uploadPicture.action',
			data : form,  
	        processData:false,  
	        contentType:false,   
			success:function(data){
					layer.alert("上传成功！",function(){
					    $('#img').val(data);
						$('#pic').attr('src', data);
						});

				}
			});
		
	}
	function add(){
		if($("#name").val()==''||$("#name").val()==null){
			layer.alert("俱乐部名称不能为空！");
		}else if($("#intro").val()==''||$("#intro").val()==null){
			layer.alert("俱乐部介绍不能为空！");
		}else if($("#area").val()==''||$("#area").val()==null){
			layer.alert("俱乐部地址不能为空！");
		}else if($("#gym").val()==''||$("#gym").val()==null){
			layer.alert("体育馆名称不能为空！");
		}else if($("#birth").val()==''||$("#birth").val()==null){
			layer.alert("俱乐部建立时间不能为空！");
		}else if($("#name").length>16){
			layer.alert("俱乐部名不能大于16个字符！");
		}else if($("#birth").length>4){
			layer.alert("俱乐部成立时间不能大于4个字符！");
		}else if($("#area").length>10){
			layer.alert("俱乐部成立地点不能大于10个字符！");
		}else if($("#gym").length>20){
			layer.alert("体育馆名称不能大于20个字符！");
		}else {
			layer.confirm('确定添加吗？',function(){
				var form = new FormData(document.getElementById("itemForm")); 
				$.ajax({
					type:'post',
					url:'addClub.action',
					data : form,  
			        processData:false,  
			        contentType:false,   
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
</body>
</html>