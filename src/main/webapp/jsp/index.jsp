<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
        <!-- Bootstrap -->
   
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

        <!-- Bootstrap Admin Theme -->
        <link href="css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

        <!-- Vendors -->
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart_custom.css" rel="stylesheet" media="screen">
        

<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style>


    .panel-group{max-height:770px;overflow: auto;}
    .leftMenu{margin:10px;margin-top:5px;}
    .leftMenu .panel-heading{font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
    .leftMenu .panel-heading span{position:absolute;right:10px;top:12px;}
    .leftMenu .menu-item-left{padding: 2px; background: transparent; border:1px solid transparent;border-radius: 6px;}
    .leftMenu .menu-item-left:hover{background:#C4E3F3;border:1px solid #1E90FF;}


	body{
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}
	.head{
		width:100%;
		height:100px;
		margin-top:0px;
		background-color:#428bca;
	}
	.left{
		float:left;
		border-right:1px solid #eeeeee;
		width:20%;
		height:1000px;
	}
	.right{
		
		width:80%;
		height:1000px;
		float:left;
	}
	.frame{
		width:100%;
		height:100%;
		border:0;
	}
	.li_list{
		list-style-type:none;
	}
	.a_list{
		text-align: center;
		padding:5px;
		display:block;
	    width:100%;
	    height:100%;
		font-size:20px;
		color:#808A87;
		text-decoration:none;
	}
	a{
		text-decoration:none;
	}
	a:visited {
		background-color:#08c;
		text-decoration:none;
	}
	a:hover {
		background-color:#08c;
		color:white;
		text-decoration:none;
	}
	.li-padding{
		padding:0px;
	}
</style>


</head>
<body style="padding-top: 0px;">
<div class="page-header head"><h1 align="center" style="margin-top:0px;padding:20px;color:white">Dream 后台管理系统</h1></div>
<div class="left table-hover" >	
   <div class="panel panel-primary leftMenu">
      <!-- 利用data-target指定要折叠的分组列表 -->
      <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" role="tab" >
          <h4 class="panel-title">
         	    俱乐部管理
              <span class="glyphicon glyphicon-chevron-down"></span>
          </h4>
      </div>
      <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
      <div id="collapseListGroup1" class="panel-collapse collapse " role="tabpanel" aria-labelledby="collapseListGroupHeading1">
          <ul class="list-group" style="margin-bottom: 0px;">
            <li class="list-group-item li-padding">
				<a class="a_list" href="allClub.action" target="myframe">所有俱乐部</a>
            </li>
            <li class="list-group-item li-padding">
              <a class="a_list" href="login.html" target="myframe">添加俱乐部</a>
            </li>
            <li class="list-group-item li-padding">
              <a class="a_list" href="allPlayer.action" target="myframe">所有球员信息</a>
            </li>
            <li class="list-group-item li-padding">
              <a class="a_list" href="addPlayerId.action" target="myframe">添加球员信息</a>
            </li>
          </ul>
      </div>


      <!-- 利用data-target指定要折叠的分组列表 -->
      <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup2" role="tab" >
          <h4 class="panel-title">
         	    赛事管理
              <span class="glyphicon glyphicon-chevron-down"></span>
          </h4>
      </div>
      <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
      <div id="collapseListGroup2" class="panel-collapse collapse " role="tabpanel" aria-labelledby="collapseListGroupHeading2">
          <ul class="list-group" style="margin-bottom: 0px;">
            <li class="list-group-item li-padding">
				<a class="a_list" href="allGame.action" target="myframe">赛事信息</a>
            </li>
            <li class="list-group-item li-padding">
              	<a class="a_list" href="game.action" target="myframe">添加赛事信息</a>
            </li>
          </ul>
      </div>
      
       <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab" >
          <h4 class="panel-title">
         	    用户管理
              <span class="glyphicon glyphicon-chevron-down"></span>
          </h4>
      </div>
      <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
      <div id="collapseListGroup3" class="panel-collapse collapse " role="tabpanel" aria-labelledby="collapseListGroupHeading3">
          <ul class="list-group" style="margin-bottom: 0px;">
            <li class="list-group-item li-padding">
				<a class="a_list" href="allUser.action" target="myframe">所有用户</a>
            </li>
            <li class="list-group-item li-padding">
              	<a class="a_list" href="addUserId.action" target="myframe">添加用户</a>
            </li>
          </ul>
      </div>
      
      <div class="panel-heading" id="collapseListGroupHeading4" data-toggle="collapse" data-target="#collapseListGroup4" role="tab" >
          <h4 class="panel-title">
         	    纪念品管理
              <span class="glyphicon glyphicon-chevron-down"></span>
          </h4>
      </div>
      <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
      <div id="collapseListGroup4" class="panel-collapse collapse " role="tabpanel" aria-labelledby="collapseListGroupHeading4">
          <ul class="list-group" style="margin-bottom: 0px;">
            <li class="list-group-item li-padding">
				<a class="a_list" href="allGoods.action" target="myframe">所有纪念品</a>
            </li>
            <li class="list-group-item li-padding">
				<a class="a_list" href="selectGoodsId.action" target="myframe">添加纪念品</a>
            </li>
            <li class="list-group-item li-padding">
              	<a class="a_list" href="allGoodsOrder.action" target="myframe">所有订单</a>
            </li>
          </ul>
      </div>
      
 	</div>
 	
 	
 	
</div>



<div class="right">
	<iframe name ="myframe" class="frame" src="allClub.action"></iframe>
</div>
</body>

        <!-- Include all compiled plugins (below), or include individual files as needed -->

        <script type="text/javascript" src="js/twitter-bootstrap-hover-dropdown.min.js"></script>
        <script type="text/javascript" src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>


<script type="text/javascript">

	$(document).ready(function(){
		  $("#li-1").hover(function(){
			    $("#li-1-1").show()
			    },function(){
			    $("#li-1-1").hide();
			  });
		  $("#li-2").hover(function(){
			    $("#li-2-1").show()
			    },function(){
			    $("#li-2-1").hide();
			  });
		  $("#li-3").hover(function(){
			    $("#li-3-1").show()
			    },function(){
			    $("#li-3-1").hide();
			  });
		  $("#li-4").hover(function(){
			    $("#li-4-1").show()
			    },function(){
			    $("#li-4-1").hide();
			  });
		  $(".panel-heading").click(function(e){
		        /*切换折叠指示图标*/
		        $(this).find("span").toggleClass("glyphicon-chevron-down");
		        $(this).find("span").toggleClass("glyphicon-chevron-up");
		    });
	});
			
</script>
</html>