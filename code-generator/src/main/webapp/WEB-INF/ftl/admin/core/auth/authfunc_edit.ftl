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
		<a href="/admin/common/index.jhtml">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/authfunc<#if (authFunc.funcId)??>/${authFunc.funcId}</#if>" name="authFuncForm" id="authFuncForm" method="post" onsubmit="return checkInfo();">
    <input type="hidden" name="_method" value="put"/>
	<input type="hidden" id="funcId" name="funcId" value="<#if (authFunc.funcId)??>${authFunc.funcId}</#if>"/>
	<table class="input">
		<tbody>
		<tr>
			<th>功能编号：</th>
			<td><input type="text" value="<#if (authFunc.funcCode)??>${authFunc.funcCode}</#if>" name="funcCode" id="funcCode" class="text"  maxlength="50" /></td>
			<th><span class="requiredField">*</span>功能名称：</th>
			<td><input type="text" value="<#if (authFunc.funcName)??>${authFunc.funcName}</#if>" name="funcName" id="funcName" class="text" maxlength="50" /></td>
		</tr>
		<tr>
			<th>操作链接：</th>
			<td><input type="text" value="<#if (authFunc.url)??>${authFunc.url}</#if>" name="url" id="url" class="text" maxlength="255" /></td>
			<th>权限类型：</th>
			<td><input type="text" value="<#if (authFunc.authType)??>${authFunc.authType}</#if>" name="authType" id="authType" class="text" maxlength="1" /></td>
		</tr>
		<tr>
			<th>是否菜单项：</th>
			<td><input type="text" value="<#if (authFunc.isMenu)??>${authFunc.isMenu}</#if>" name="isMenu" id="isMenu" class="text" maxlength="1" /></td>
			<th>父ID：</th>
			<td><input type="text" value="<#if (authFunc.parentId)??>${authFunc.parentId}</#if>" name="parentId" id="parentId" class="text" maxlength="10" /></td>
		</tr>
		<tr>
			<th>显示层级编号：</th>
			<td><input type="text" value="<#if (authFunc.viewLevelNo)??>${authFunc.viewLevelNo}</#if>" name="viewLevelNo" id="viewLevelNo" class="text" maxlength="20" /></td>
			<th>创建人：</th>
			<td><input type="text" value="<#if (authFunc.createUserId)??>${authFunc.createUserId}</#if>" name="createUserId" id="createUserId" class="text" maxlength="20" /></td>
		</tr>
		<tr>
			<th>创建时间：</th>
			<td><input type="text" value="<#if (authFunc.createDateTime)??>${authFunc.createDateTime?datetime}</#if>" name="createDateTime" id="createDateTime" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="10" /></td>
			<th>最后修改人：</th>
			<td><input type="text" value="<#if (authFunc.modifyUserId)??>${authFunc.modifyUserId}</#if>" name="modifyUserId" id="modifyUserId" class="text" maxlength="20" /></td>
		</tr>
		<tr>
			<th>最后修改时间：</th>
			<td><input type="text" value="<#if (authFunc.modifyDateTime)??>${authFunc.modifyDateTime?datetime}</#if>" name="modifyDateTime" id="modifyDateTime" class="text Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="10" /></td>
			<th>删除标记：</th>
			<td><input type="text" value="<#if (authFunc.deleteFlag)??>${authFunc.deleteFlag}</#if>" name="deleteFlag" id="deleteFlag" class="text" maxlength="1" /></td>
		</tr>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="4">
				<input type="button" value="返回列表" onclick='window.location="${ctx}/authfunc";' class="return-button"/>
				<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; 
				<input type="reset" value="重置" class="reset" class="reset"/>
			</td>
		</tr>
		</tfoot>
	</table>
	</form>

</body>
</html>
