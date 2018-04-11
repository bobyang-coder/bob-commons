<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx = request.contextPath/> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>修改</title>
	<link href="${ctx}/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/static/css/admin.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/theme.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>
	<script src="${ctx}/common/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
<div class="body-box">
    <form action="${ctx}/authrole/update" name="authRoleForm" id="authRoleForm" method="post" onsubmit="return checkInfo();">
    <input type="hidden" name="_method" value="put"/>
			<input type="hidden" id="roleId" name="roleId" value="<#if (authRole.roleId)??>${authRole.roleId}</#if>"/>
	<table width="100%" class="pn-ftable" cellpadding="2" cellspacing="1" border="0">
		<tr>
			    <td width="12%" class="pn-flabel pn-flabel-h">角色名称:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
							<input value="<#if (authRole.roleName)??>${authRole.roleName}</#if>" name="roleName" id="roleName"  maxlength="50" />
			    </td>
			    <td width="12%" class="pn-flabel pn-flabel-h">权限类型:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
							<input value="<#if (authRole.authType)??>${authRole.authType}</#if>" name="authType" id="authType"  maxlength="1" />
			    </td>
				        </tr><tr>
			    <td width="12%" class="pn-flabel pn-flabel-h">备注:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
							<input value="<#if (authRole.roleMemo)??>${authRole.roleMemo}</#if>" name="roleMemo" id="roleMemo"  maxlength="100" />
			    </td>
			    <td width="12%" class="pn-flabel pn-flabel-h">创建人:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
							<input value="<#if (authRole.createUserId)??>${authRole.createUserId}</#if>" name="createUserId" id="createUserId"  maxlength="20" />
			    </td>
				        </tr><tr>
			    <td width="12%" class="pn-flabel pn-flabel-h">创建时间:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
				        <input value="<#if (authRole.createDateTime)??>${authRole.createDateTime?datetime}</#if>" name="createDateTime" id="createDateTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="10" />
			    </td>
			    <td width="12%" class="pn-flabel pn-flabel-h">最后修改人:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
							<input value="<#if (authRole.modifyUserId)??>${authRole.modifyUserId}</#if>" name="modifyUserId" id="modifyUserId"  maxlength="20" />
			    </td>
				        </tr><tr>
			    <td width="12%" class="pn-flabel pn-flabel-h">最后修改时间:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
				        <input value="<#if (authRole.modifyDateTime)??>${authRole.modifyDateTime?datetime}</#if>" name="modifyDateTime" id="modifyDateTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="10" />
			    </td>
			    <td width="12%" class="pn-flabel pn-flabel-h">删除标记（1有效、2无效）:</td>
			    <td colspan="1" width="38%" class="pn-fcontent">
							<input value="<#if (authRole.deleteFlag)??>${authRole.deleteFlag}</#if>" name="deleteFlag" id="deleteFlag"  maxlength="1" />
			    </td>
		</tr>
		<tr><td colspan="4" class="pn-fbutton">
		<input type="button" value="返回列表" onclick='window.location="${ctx}/authrole";' class="return-button"/>
		<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; <input type="reset" value="重置" class="reset" class="reset"/></td>
		</tr></table>
</form>
</div>
</body>
</html>
