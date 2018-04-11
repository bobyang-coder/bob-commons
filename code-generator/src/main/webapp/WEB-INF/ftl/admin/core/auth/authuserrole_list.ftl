<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#assign ctx = request.contextPath/> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>列表</title>
	<link href="${ctx}/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/static/css/admin.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/theme.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/jquery.ui.css" rel="stylesheet" type="text/css"/>	
	<script src="${ctx}/common/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/jquery.ext.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/pony.js" type="text/javascript"></script>
	<script src="${ctx}/static/js/admin.js" type="text/javascript"></script>
</head>
<script type="text/javascript"> 
        function hasOneChecked(name){
		    var items = document.getElementsByName(name);
		    if (items.length > 0) {
		        for (var i = 0; i < items.length; i++){
		            if (items[i].checked == true){
		                return true;
		            }
		        }
		    } else {
		        if (items.checked == true) {
		            return true;
		        }
		    }
		    return false;
		}
		function sltAllAuthUserRole(){
			if($("#sltAll").attr("checked")){
				$("input[name='authUserRoleIds']").attr("checked",true);
			}else{
				$("input[name='authUserRoleIds']").attr("checked",false);
			}
		}
		function addAuthUserRole(){
		    $("#authUserRoleForm").attr("action","authuserrole/add");
		    $("#authUserRoleForm").submit();
		}
		function delAuthUserRole(authUserRoleId){
			if(confirm("确定要删除该记录？")){
			    $("#_method").val("delete");
			    $("#authUserRoleForm").attr("action","authuserrole/delete/"+authUserRoleId);
			    $("#authUserRoleForm").submit();
			}
		}
		function delBatchAuthUserRole(checkboxName){
		    if (!hasOneChecked(checkboxName)) {
				alert("请选择你要删除的对象!");
				return;
			}
			if(confirm("确定要删除记录？")){
			    $("#_method").val("delete");
			    $("#authUserRoleForm").submit();
			}
		}
		function search(){
			$("#authUserRoleForm").submit();
		}
</script>
<body>
<div class="body-box">
<form action="${ctx}/authuserrole" method="post" name="authUserRoleForm" id="authUserRoleForm">
<input type="hidden" name="_method" id="_method" value=""/>
<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
<thead class="pn-lthead"><tr>
	<th width="20"><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllAuthUserRole()"/></th>
	<th>ID</th>
			    <th>用户ID</th>
			    <th>角色编码</th>
			    <th>创建人</th>
			    <th>创建时间</th>
			    <th>最后修改人</th>
			    <th>最后修改时间</th>
			    <th>删除标记（1有效、2无效）</th>
	<th>操作选项</th></tr></thead>
<tbody  class="pn-ltbody">
    <#if authUserRoleList?exists>
		    <#list authUserRoleList as authUserRole > 
				<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td>
					<input type="checkbox" id="userIds${authUserRole.userId}" name="userIds" value="${authUserRole.userId}"/>
					<input type="checkbox" id="roleIds${authUserRole.roleId}" name="roleIds" value="${authUserRole.roleId}"/>
				</td>
				<td>${authUserRole_index+1}</td>
						<th><#if (authUserRole.userId)??>${authUserRole.userId}</#if></th>
						<th><#if (authUserRole.roleId)??>${authUserRole.roleId}</#if></th>
						<th><#if (authUserRole.createUserId)??>${authUserRole.createUserId}</#if></th>
				        <th><#if (authUserRole.createDateTime)??>${authUserRole.createDateTime?datetime}</#if></th>
						<th><#if (authUserRole.modifyUserId)??>${authUserRole.modifyUserId}</#if></th>
				        <th><#if (authUserRole.modifyDateTime)??>${authUserRole.modifyDateTime?datetime}</#if></th>
						<th><#if (authUserRole.deleteFlag)??>${authUserRole.deleteFlag}</#if></th>
			    
				<td>
					    <a href="${ctx}/authuserrole/edit/${authUserRole.userId}">修改</a> | <a href="javascript:delAuthUserRole(${authUserRole.userId});">删除</a> 
					    <a href="${ctx}/authuserrole/edit/${authUserRole.roleId}">修改</a> | <a href="javascript:delAuthUserRole(${authUserRole.roleId});">删除</a> 
				</td>
				</tr>
			</#list>
		<#else>
			<tr class="main_info">
				<td colspan="6">没有相关数据</td>
			</tr>
		</#if>
</tbody>
</table>
${page.pageStr}<div style="margin-top:15px;">
    <input class="add" type="submit" value="添加" onclick="addAuthUserRole();"/>
				    <input class="del-button" type="button" value="删除" onclick="delBatchAuthUserRole('userIds');"/>
     
				    <input class="del-button" type="button" value="删除" onclick="delBatchAuthUserRole('roleIds');"/>
     
     
     
     
     
     
</div>
</form>
</div>
</body>
</html>
