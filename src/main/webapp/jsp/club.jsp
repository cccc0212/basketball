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
</head>
<body style="margin-right: 0px;">
<div>
	<img id = "pic" style="" src="" />
	<div><h1>${club.name}</h1></div>
</div>
<div>
	<h2>球队信息</h2><div style="display:none"><input type="text" name="cid" class="form-control" id="cid" value="${club.cid }"/></div>
	<p style="margin-bottom: 0px;">
		成立时间：${club.birth}<br/>
		成立地点: ${club.area}<br/>
		体育馆名称：${club.gym}<br/>
		球队介绍:<div style="width:80%">${club.intro}</div>
	</p>
</div>
<div class="modal fade" id="myClub" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<form id="itemForm" action="updateClub.action" onsubmit="return ready()" method="post" enctype="multipart/form-data">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title" id="myModalLabel">修改俱乐部信息</h4>
			</div>
			<div class="modal-body">
				<div style="display:none"><input type="text" name="add_id" class="form-control" id="add_id" placeholder="id"></div>
				<div class="form-group">
					<label for="update_name">俱乐部名称</label>
					<input type="text" name="cid" class="form-control" id="cid" value="${club.cid} " style="display:none;"  >
					<input type="text" name="name" class="form-control" id="club_name" placeholder="俱乐部名称" >
				</div>
				<div class="form-group" style="overflow:hidden;">
					<label for="add_matching" style="float:left">俱乐部logo</label>
					<div id="div4bm" style="float:left;">
					    <input type="button" value="选择文件" id="mybutton" class="btn btn-default"  onclick="Id('file').click();" />
					    <input type="file" name="file" accept="image/png,image/jpg,image/jpeg"  id="file" onchange="changeToop();" style="display:none;" />
				    </div>  
				    <div style="float:left;">
				        <img id="myimg" style="width: 88px;height:88px;border-style:none;"/>
				    </div>
				</div>
				<div class="form-group">
					<label for="update_time">俱乐部成立时间</label>
				</div>
				<div class="form-group">
					<input type="text" name="birth" class="form-control" id="club_time" placeholder="俱乐部成立时间" >
				</div>
				<div class="form-group">
					<label for="update_area">俱乐部成立地点</label>
					<input type="text" name="area" class="form-control" id="club_area" placeholder="俱乐部成立地点">
				</div>
				<div class="form-group">
					<label for="update_gym">体育馆名称</label>
					<input type="text" name="gym" class="form-control" id="club_gym" placeholder="体育馆名称" >
				</div>
				<div class="form-group">
					<label for="update_intro">球队介绍</label>
					<textarea name="intro"  style="height:100px;" class="form-control" id="club_intro" placeholder="球队介绍" ></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" id="club" class="submit111 btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>

			</div>
		</div>
	</div>
	</form>
</div>


<h2>球队荣誉</h2>
 <div style="text-align:right;float:right;margin-right: 10%;"><input  class="btn btn-success" type="button" id="btn_add" value="添加荣誉" /></div>
 <div style="text-align:right;margin-right: 5%;"><input  class="btn btn-primary" type="button" style="margin-right:20px;" id="update_club" value="修改俱乐部信息" /></div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				<h4 class="modal-title" id="myModalLabel">新增荣誉</h4>
			</div>
			<div class="modal-body">
				<div style="display:none"><input type="text" name="add_id" class="form-control" id="add_id" placeholder="id"></div>
				<div class="form-group">
					<label for="add_time">时间</label>
					<input type="text" name="add_time" class="form-control" id="add_time" placeholder="时间">
				</div>
				<div class="form-group">
					<label for="add_matching">赛事</label>
					<input type="text" name="add_matching" class="form-control" id="add_matching" placeholder="赛事">
				</div>
				<div class="form-group">
					<label for="add_ranking">排名</label>
					<input type="text" name="add_ranking" class="form-control" id="add_ranking" placeholder="排名 一、二、三。。。">
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" id="add_submit" class="submit111 btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
				<button type="submit" id="update_submit" class="submit111 btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
				<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>

			</div>
		</div>
	</div>
</div>
<center>
	<table class="table table-hover"  id="tab">
		<thead>
			<tr>
				<th width="200" >时间</th>
				<th>赛事</th>
				<th>排名</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${club.list}" var="b" >
			<tr id="${b.id }">
				<td>${b.time}</td>
				<td>${b.matching}</td>
				<td>第${b.ranking}名</td>
				<td><a class="btn btn-primary" style = " text-decoration:none;" href="javascript:update(${b.id})">修改</a>&nbsp;<a class="btn btn-danger" style = "text-decoration:none;" href="javascript:del(${b.id })">删除</a>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</center>
<script type="text/javascript">
	$(document).ready(function(){
		$("#pic").attr("src", "../CBA/"+"${club.logo }"+"?t=" + Math.random());
	});
	$("#btn_add").click(function () {
		$("#myModalLabel").text("新增荣誉");
		$(".modal-body input").val("");
		$("#update_submit").hide();
		$("#add_submit").hide();
		$("#add_submit").show();
		$('#myModal').modal();
		
	});


	$("#update_club").click(function(){
		$("#club_name").val('${club.name }');
		$("#myimg").attr("src",'../CBA/${club.logo}'+'?t=' + Math.random());
		$("#club_time").val('${club.birth}');
		$("#club_area").val('${club.area}');
		$("#club_gym").val('${club.gym}');
		$("#club_intro").val('${club.intro}');
		$('#myClub').modal();
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
	
	$("#add_submit").click(function () {
		add();
	});
	
	$("#update_submit").click(function () {
		updateSubmit();
	});
	$("#club").click(function(){
		updateClub();
	});
	function updateClub(){
		if($("#club_name").val()==''){
			layer.alert("俱乐部名不能为空！");
		}else if($("#club_time").val()==''){
			layer.alert("俱乐部成立时间不能为空！");
		}else if($("#club_area").val()==''){
			layer.alert("俱乐部成立地点不能为空！");
		}else if($("#club_gym").val()==''){
			layer.alert("体育馆名称不能为空！");
		}else if($("#club_intro").val()==''){
			layer.alert("俱乐部介绍不能为空！");
		}else if($("#club_name").length>16){
			layer.alert("俱乐部名不能大于16个字符！");
		}else if($("#club_time").length>4){
			layer.alert("俱乐部成立时间不能大于4个字符！");
		}else if($("#club_area").length>10){
			layer.alert("俱乐部成立地点不能大于10个字符！");
		}else if($("#club_gym").length>20){
			layer.alert("体育馆名称不能大于20个字符！");
		}else {
			var form = new FormData(document.getElementById("itemForm")); 
			$.ajax({
				type:'post',
				url:'updateClub.action',
				data : form,  
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
		}
		
	}

	function add(){
		if($("#add_time").val()==''){
			layer.alert("日期不能为空！");
		}else if($("#add_matching").val()==''){
			layer.alert("赛事不能为空！");
		}else if($("#add_ranking").val()==''){
			layer.alert("排名不能为空！");
		}else if($("#add_time").length>4){
			layer.alert("日期不能大于4个字符！");
		}else if($("#add_matching").length>50){
			layer.alert("赛事不能大于50个字符！");
		}else if($("#add_ranking").length>2){
			layer.alert("排名不能大于2个字符！");
		}else{
			layer.confirm("确定添加吗？",function(){
				var params ={};
				params.cid=$("#cid").val();
				params.time=$("#add_time").val();
				params.matching=$("#add_matching").val();
				params.ranking=$("#add_ranking").val();
	 			$.ajax({
					type:'post',
					url:'addAch.action',
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
				});
		}

		
	}
	
	function del(obj){
		layer.confirm("确定删除吗？",function(){
			var id=obj;
			var params ={};
			params.id=obj;
			$.ajax({
				type:'post',
				url:'delAch.action',
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
	

	
	function update(obj){
		var tr = "#"+obj;
		var id=obj;
		$("#add_id").val(id);
		$("#add_time").val($(tr).children("td").eq(0).text());
		$("#add_matching").val($(tr).children("td").eq(1).text());
		var str = $(tr).children("td").eq(2).text();
		$("#add_ranking").val(str.substring(1,str.length-1));
		$("#myModalLabel").text("修改荣誉");
		$("#update_submit").hide();
		$("#add_submit").hide();
		$("#update_submit").show();
		$('#myModal').modal();

	}
	
	function readyUpdate()  {
		
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
	
	function updateSubmit(){
		if($("#add_time").val()==''){
			layer.alert("日期不能为空！");
		}else if($("#add_matching").val()==''){
			layer.alert("赛事不能为空！");
		}else if($("#add_ranking").val()==''){
			layer.alert("排名不能为空！");
		}else if($("#add_time").length>4){
			layer.alert("日期不能大于4个字符！");
		}else if($("#add_matching").length>50){
			layer.alert("赛事不能大于50个字符！");
		}else if($("#add_ranking").length>2){
			layer.alert("排名不能大于2个字符！");
		}else{
			layer.confirm("确定修改吗？",function(){
				var params ={};
				params.id=$("#add_id").val();
				params.time=$("#add_time").val();
				params.matching=$("#add_matching").val();
				params.ranking=$("#add_ranking").val();
				$.ajax({
					type:'post',
					url:'updateAch.action',
					dataType:'json',
					data:params,
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
	}
	
</script>

</body>
</html>