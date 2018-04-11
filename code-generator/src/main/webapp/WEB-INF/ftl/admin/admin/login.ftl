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
body,html{ height:100%}
body{font-size:12px;font-family:Arial;background:#fff;background:url(${ctx}/common/img/back/login_bg.jpg) repeat-x #fff;}
.loginWrap{background:url(${ctx}/common/img/back/login_mainbg.jpg) center top no-repeat;}
.login{width:960px;margin:0 auto;}
.logo{border:0px;margin:55px 0 0 80px;height:40px;width:37px;color:#FFF;}
.systemName{font-size:30px;font-family:"微软雅黑";color:#008ad9;padding:45px 315px;}
.systemName span{color:#fcad2a;}
.systemForm {height:300px;margin:0 0 218px 240px;padding:55px 0 0 57px;}
.systemForm li{width:425px;vertical-align:middle;}
.systemForm .wordL{display:block;color:#767a7b;padding:12px 0 7px 0;*padding:12px 0 5px 0;}
.systemForm .textInp,.systemForm .textInp2{display:block;height:24px;line-height:24px;background:#fff;border:1px solid #d3d4d6;color:#000000;padding-left:4px;}
.systemForm .textInp{width:354px;}
.systemForm .textInp2{width:284px;}
.cordFlight{margin:3px 0 0 10px;display:inline;}
.loginBtn{width:81px;height:32px;background:url(${ctx}/common/img/back/login_btn.jpg);border:none;margin:14px 63px 0 0;display:inline;cursor:pointer;}

</style>
<script type="text/javascript">
		var errInfo = "${errInfo}";
		$(document).ready(function(){
			changeCode();
			$("#codeImg").bind("click",changeCode);
			if(errInfo!=""){
				if(errInfo.indexOf("验证码")>-1){
					$("#codeerr").show();
					$("#codeerr").html(errInfo);
					$("#code").focus();
				}else{
					$("#nameerr").show();
					$("#nameerr").html(errInfo);
				}
			}
			$("#loginname").focus();
		});
	
		function genTimestamp(){
			var time = new Date();
			return time.getTime();
		}
	
		function changeCode(){
			$("#codeImg").attr("src","code?t="+genTimestamp());
		}
		
		function resetErr(){
			$("#nameerr").hide();
			$("#nameerr").html("");
			$("#pwderr").hide();
			$("#pwderr").html("");
			$("#codeerr").hide();
			$("#codeerr").html("");
		}
		
		function check(){
			resetErr();
			if($("#loginname").val()==""){
				$("#nameerr").show();
				$("#nameerr").html("用户名不得为空！");
				$("#loginname").focus();
				return false;
			}
			if($("#password").val()==""){
				$("#pwderr").show();
				$("#pwderr").html("密码不得为空！");
				$("#password").focus();
				return false;
			}
			if($("#code").val()==""){
				$("#codeerr").show();
				$("#codeerr").html("验证码不得为空！");
				$("#code").focus();
				return false;
			}
			return true;
		}
	</script>
<body>
	<div class="loginWrap">
	<div class="login">
		<img src="${ctx}/common/img/html5/logo.png" class="logo"/>
    	<h1 class="systemName"><span>融宝支付管理系统V1.0</span></h1>
    	
		<form action="${ctx}/admin" method="post" name="loginForm" onsubmit="return check();">
			<ul class="systemForm">
            	<li>
                	<label class="wordL">用户名</label>
                    <input type="text" name="loginName" id="loginName" class="textInp" value="${loginName }"/>
                </li>
                <li>
                	<label class="wordL">密码</label>
                	<input type="password" name="loginPwd" id="loginPwd" class="textInp" value="${loginPwd }"/>
                </li>
                <li><span>${loginError }<span></li>
                <li><input type="submit" name="loginBtn" value="" class="loginBtn fr"/></li>
            </ul>
		</form>
	</div>
	</div>
</body>
</html>