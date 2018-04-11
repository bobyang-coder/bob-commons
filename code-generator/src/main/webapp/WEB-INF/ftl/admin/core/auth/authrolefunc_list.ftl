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
		function sltAllAuthRoleFunc(){
			if($("#sltAll").attr("checked")){
				$("input[name='authRoleFuncIds']").attr("checked",true);
			}else{
				$("input[name='authRoleFuncIds']").attr("checked",false);
			}
		}
		function addAuthRoleFunc(){
		    $("#authRoleFuncForm").attr("action","authrolefunc/add");
		    $("#authRoleFuncForm").submit();
		}
		function delAuthRoleFunc(authRoleFuncId){
			if(confirm("确定要删除该记录？")){
			    $("#_method").val("delete");
			    $("#authRoleFuncForm").attr("action","authrolefunc/delete/"+authRoleFuncId);
			    $("#authRoleFuncForm").submit();
			}
		}
		function delBatchAuthRoleFunc(checkboxName){
		    if (!hasOneChecked(checkboxName)) {
				alert("请选择你要删除的对象!");
				return;
			}
			if(confirm("确定要删除记录？")){
			    $("#_method").val("delete");
			    $("#authRoleFuncForm").submit();
			}
		}
		function search(){
			$("#authRoleFuncForm").submit();
		}
</script>
<body>
<div class="body-box">
<form action="${ctx}/authrolefunc" method="post" name="authRoleFuncForm" id="authRoleFuncForm">
<input type="hidden" name="_method" id="_method" value=""/>
<table class="pn-ltable" style="" width="100%" cellspacing="1" cellpadding="0" border="0">
<thead class="pn-lthead"><tr>
	<th width="20"><input type="checkbox" name="sltAll" id="sltAll" onclick="sltAllAuthRoleFunc()"/></th>
	<th>ID</th>
			    <th>角色ID</th>
			    <th>功能ID</th>
			    <th>创建人</th>
			    <th>创建时间</th>
			    <th>最后修改人</th>
			    <th>最后修改时间</th>
			    <th>删除标记（1有效、2无效）</th>
	<th>操作选项</th></tr></thead>
<tbody  class="pn-ltbody">
    <#if authRoleFuncList?exists>
		    <#list authRoleFuncList as authRoleFunc > 
				<tr onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td>
					<input type="checkbox" id="roleIds${authRoleFunc.roleId}" name="roleIds" value="${authRoleFunc.roleId}"/>
					<input type="checkbox" id="funcIds${authRoleFunc.funcId}" name="funcIds" value="${authRoleFunc.funcId}"/>
				</td>
				<td>${authRoleFunc_index+1}</td>
						<th><#if (authRoleFunc.roleId)??>${authRoleFunc.roleId}</#if></th>
						<th><#if (authRoleFunc.funcId)??>${authRoleFunc.funcId}</#if></th>
						<th><#if (authRoleFunc.createUserId)??>${authRoleFunc.createUserId}</#if></th>
				        <th><#if (authRoleFunc.createDateTime)??>${authRoleFunc.createDateTime?datetime}</#if></th>
						<th><#if (authRoleFunc.modifyUserId)??>${authRoleFunc.modifyUserId}</#if></th>
				        <th><#if (authRoleFunc.modifyDateTime)??>${authRoleFunc.modifyDateTime?datetime}</#if></th>
						<th><#if (authRoleFunc.deleteFlag)??>${authRoleFunc.deleteFlag}</#if></th>
			    
				<td>
					    <a href="${ctx}/authrolefunc/edit/${authRoleFunc.roleId}">修改</a> | <a href="javascript:delAuthRoleFunc(${authRoleFunc.roleId});">删除</a> 
					    <a href="${ctx}/authrolefunc/edit/${authRoleFunc.funcId}">修改</a> | <a href="javascript:delAuthRoleFunc(${authRoleFunc.funcId});">删除</a> 
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
    <input class="add" type="submit" value="添加" onclick="addAuthRoleFunc();"/>
				    <input class="del-button" type="button" value="删除" onclick="delBatchAuthRoleFunc('roleIds');"/>
     
				    <input class="del-button" type="button" value="删除" onclick="delBatchAuthRoleFunc('funcIds');"/>
     
     
     
     
     
     
</div>
</form>
</div>
</body>
</html>
