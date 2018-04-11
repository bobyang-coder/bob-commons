<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign ctx = request.contextPath/> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理系统后台</title>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/base.css"/>
<link rel="stylesheet" type="text/css" href="${ctx}/common/css/common.css"/>
<script type="text/javascript" src="${ctx}/common/js/jquery.js"></script>
</head>
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

			<form action="${ctx}/admin/login" method="post" name="loginForm" onsubmit="return check();">
				<div class="login_title">
					管理员登录${loginError }
				</div>
				<div class="login_info">
					<label>用户名：</label><input type="text" name="loginName" id="loginName" class="login_input" value="${loginName }"/>
					&nbsp;<span id="nameerr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>密     码：</label><input type="password" name="loginPwd" id="loginPwd" class="login_input" value="${loginPwd }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>验证码：</label><input type="text" name="code" id="code" class="login_code"/>&nbsp;&nbsp;
					<img id="codeImg" alt="点击更换" title="点击更换" src=""/>
					&nbsp;<span id="codeerr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<input type="submit" name="loginBtn" value="登录" class="btn"/>
					<input type="reset" name="cancelBtn" value="取消" class="btn"/>
				</div>
			</form>

</body>
</html>