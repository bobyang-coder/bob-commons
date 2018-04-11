<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign ctx = request.contextPath/> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>修改</title>
	<link href="${ctx}/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/common.css" rel="stylesheet" type="text/css"/>
	<script src="${ctx}/common/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<div class="path">
		<a href="${ctx}/admin/authuser">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/authuser/<#if (authUser.userId)??>${authUser.userId}</#if>" name="deptForm" id="deptForm" method="post" onsubmit="return checkInfo();">
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
    	<input type="hidden" id="userId" name="userId" value="<#if (authUser.userId)??>${authUser.userId}</#if>"/>
		<table class="input">
			<tbody>
			<tr>
			    <th>用户名：</th>
			    <td>
					<input type="text" class="text" value="<#if (authUser.userName)??>${authUser.userName}</#if>" name="userName" id="userName"  maxlength="50" />
			    </td>
			</tr>
			<tr>
			    <th>年度：</th>
			    <td>
					<input type="text" class="text" value="<#if (authUser.year)??>${authUser.year}</#if>" name="year" id="year"  maxlength="50" />
			    </td>
			</tr>
			<tr>
				    <th>角色：</th>
				    <td>
				     	<select name="roleId" id="roleId" class="">
						<#list roleList as role >
						<option value="${role.roleId}" <#if (authUser.roleId)==(role.roleId)>selected</#if>>
						<#if (role.roleName)??>${role.roleName}</#if></option>
						</#list>
						</select>
					</td>
			</tr>
			<tr>
				    <th>登录名：</th>
				    <td>
						<input type="text" class="text" value="<#if (authUser.loginName)??>${authUser.loginName}</#if>" name="loginName" id="loginName"  maxlength="50" />
				    </td>
			</tr>
			<tr>
				    <th>登录密码：</th>
				    <td>
						<input type="text" class="text" value="<#if (authUser.loginPwd)??>${authUser.loginPwd}</#if>" name="loginPwd" id="loginPwd"  maxlength="20" />
					</td>
			</tr>
			<tr>		        
				    <th>手机：</th>
				    <td>
						<input type="text" class="text" value="<#if (authUser.mobile)??>${authUser.mobile}</#if>" name="mobile" id="mobile"  maxlength="20" />
				    </td>
			</tr>
			<tr>
				    <th>办公电话：</th>
				    <td>
						<input type="text" class="text" value="<#if (authUser.officeTel)??>${authUser.officeTel}</#if>" name="officeTel" id="officeTel"  maxlength="20" />
					</td>
			</tr>
			<tr>
				    <th>Email：</th>
				    <td>
						<input type="text" class="text" value="<#if (authUser.email)??>${authUser.email}</#if>" name="email" id="email"  maxlength="100" />
					</td>
				</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="4">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/authuser";' class="return-button"/>
					<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; 
					<input type="reset" value="重置" class="reset" class="reset"/>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>
