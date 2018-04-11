<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign ctx = request.contextPath/> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>融宝支付</title>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/css/base.css"/>
	<script type="text/javascript" src="${ctx}/common/js/jquery.js"></script>
</head>
<style type="text/css">
	#header {margin:0px;height:45px;position:relative;background:#ededed url(${ctx}/common/img/back/topbg.gif);}
	#header .logo {
		border:0px;
		float:left; 
		margin:2px 10px;
		height:40px;
		width:120px;
		color:#FFF;
	}
	
	#header span {
		position:absolute;
		left:160px;
		top:10px;
		FONT-WEIGHT: bold;
		font-size:20px;
		color:#FFF;
		font-style:italic;
	}
	
		#left,#right {background:#e7f0fb;border:1px solid #cfcfd1}
		#left,#arrow{float:left;}
		#left {width:200px;margin:0px 0px 0px 5px;}
 
		#arrow{width:5px;height:90px;margin:0px;cursor:hand;border:1px solid #cfcfd1}
		.aleft {background:url(${ctx}/common/img/back/arrow-left.gif) no-repeat;}
		.aright {background:url(${ctx}/common/img/back/arrow-right.gif) no-repeat;}
 
		#right{margin:0px 5px 0px 214px;}
 
		#left h1,#right h1{height:30px;background:#e7f0fb;margin:0 5px;}
		#left h1{background:url(${ctx}/common/img/back/people.gif) no-repeat;}
		#right h1{background:url(${ctx}/common/img/back/book.gif) no-repeat;}

		#left span,#right span{display:block;color:#6a7885;font-weight:bold;font-size:14px;padding:8px 0px 0px 35px;}
		#main,#menu {border:1px solid #cfcfd1;background: #ffffff;margin:0px 5px 5px 5px;}
 
 
		#menu h3{font-weight: bold;font-size:12px;color:#ffffff;padding-left:12px;border-bottom:solid 1px #ffffff;background:#ededed url(${ctx}/common/img/back/bg01.jpg);height:25px;line-height:23px;}
		#menu h3 a{text-decoration:none;color:#ffffff;}
		#menu ul li{margin:8px 0px 5px 15px;font-size:12px;}
		#menu li a{color:#000000;text-decoration:none;	}


	#footer {
		clear:both;
		width:100%;
		height:20px;
		text-align:center;
	}
</style>
<script type="text/javascript">
	function openPage(url,title){
		if(title != "退出系统"){
			$("#rightTitle").html(title);	
			$("#mainFrame").attr("src","${ctx}/"+url);
		}
		else{
			location.href = url
		}
	}
		
	function autoHeight(){
		//框架高度
		var mainHeight = $(window).height()-$("#header").outerHeight(true)-$("#footer").outerHeight(true)-$("#left h1").outerHeight(true)-10;
		$("#menu").height(mainHeight);
		$("#arrow").css("marginTop",mainHeight/2);
		$("#main").height(mainHeight);
		//每个菜单层的高度
		$("#menu .menuDiv").height(mainHeight-7-$("#menu .menuTitle").outerHeight(true)*$("#menu .menuTitle").size());
	}
		

	$(function(){
		autoHeight();

		//绑定窗口大小变化事件
		$(window).bind("resize",autoHeight)

		//菜单项默认显示第一个
		$("#menu .menuDiv:gt(0)").hide();


		//左部菜单显示隐藏
		$("#arrow").click(function(){
			var leftDiv,rightDiv,arrow;           
			leftDiv = $("#left");
			rightDiv = $("#right");
			arrow = $("#arrow");
				
			if(leftDiv.css("display") == "none")
			{
				leftDiv.css("display","");
				rightDiv.css("marginLeft","214px");
				arrow.removeClass("aright").addClass("aleft");
			}
			else
			{
				leftDiv.css("display","none");
				rightDiv.css("marginLeft","7px");
				arrow.removeClass("aleft").addClass("aright");
			}

		})
		
		//菜单栏点击事件
		$(".menuTitle").click(function(){
			$(".menuDiv").hide();
			$(this).next().show();
		})
	})
</script>
<body>
	<!--头部开始-->
	<div id="header">
		<img src="${ctx}/common/img/back/logo.gif" class="logo"/>
		<span>融宝支付管理系统V1.0</span>
	</div>
	<!--头部结束-->

	<!--左侧开始-->
	<div id="left">
		<h1><span id="leftTitle">欢迎您：${authUser.userName}</span></h1>
		<div id="menu">
			
			<#list authFuncList as menu>
				<#if menu.isMenu==1 >
					<#if menu.parentId==0>
						<#if (menu_index > 0) >
							</ul>
						</div>
						</#if>
						<h3 class="menuTitle"><a href="#">${menu.funcName}</a></h3>
						<div class="menuDiv">
						<ul>
					<#else>
						<li><a href="####" onclick=openPage('${menu.url}','${menu.funcName}')>${menu.funcName}</a></li>
					</#if>
				</#if>
			</#list>
				</ul>
			</div>
		</div>
	</div>
	<!--左侧结束-->

	<!--箭头开始-->
	<div id="arrow" class="aleft"></div>
	<!--箭头结束-->

	<!--右侧开始-->
	<div id="right">
		<h1><span id="rightTitle"></span></h1>
		<div id="main">
			<iframe src="" name="mainFrame" id="mainFrame" width="100%" height="100%" scrolling="auto" marginheight="0" marginwidth="0" frameborder="0" />
		</div>
	</div>
	<!--右侧结束-->

	<!--底部开始-->
	<div id="footer">Copyright &copy; 2012 - 2015 Umessage Inc. </div>
	<!--底部结束-->
</body>
</html>