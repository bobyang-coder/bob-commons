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
		<a href="${ctx}/admin/dept">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/dept/<#if (dept.deptId)??>${dept.deptId}</#if>" name="deptForm" id="deptForm" method="post" onsubmit="return checkInfo();">
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
    	<input type="hidden" class="text" value="<#if (dept.parentId)??>${dept.parentId}<#else>0</#if>" name="parentId" id="parentId"  maxlength="10" />
    	
		<table class="input">
			<tbody>
			<tr>
				    <th>部门编码：</th>
				    <td>
						<input type="text" class="text" value="<#if (dept.deptId)??>${dept.deptId}</#if>" name="deptId" id="deptId"  maxlength="10" />
				    </td>
			</tr>
			<tr>
				    <th>部门名称：</th>
				    <td>
						<input type="text" class="text" value="<#if (dept.deptName)??>${dept.deptName}</#if>" name="deptName" id="deptName"  maxlength="100" />
				    </td>
			</tr>
			<tr>
				    <th>联系人：</th>
				    <td>
						<input type="text" class="text" value="<#if (dept.linkMan)??>${dept.linkMan}</#if>" name="linkMan" id="linkMan"  maxlength="10" />
				    </td>
			</tr>
			<tr>		        
				    <th>联系电话：</th>
				    <td>
						<input type="text" class="text" value="<#if (dept.telephone)??>${dept.telephone}</#if>" name="telephone" id="telephone"  maxlength="20" />
				    </td>
			</tr>
			<tr>
			    <th>显示次序：</th>
			    <td>
					<input type="text" class="text" value="<#if (dept.viewLevelNo)??>${dept.viewLevelNo}</#if>" name="viewLevelNo" id="viewLevelNo"  maxlength="10" />
			    </td>
			</tr>
			<tr>
				    <th>备注：</th>
				    <td>
						<input type="text" class="text" value="<#if (dept.memo)??>${dept.memo}</#if>" name="memo" id="memo"  maxlength="200" />
				    </td>
				</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="4">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/dept";' class="return-button"/>
					<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; 
					<input type="reset" value="重置" class="reset" class="reset"/>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>

</body>
</html>
