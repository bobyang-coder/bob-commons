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
		<a href="${ctx}/admin/parameter">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/parameter<#if (parameter.parameterId)??>/${parameter.parameterId}</#if>" name="parameterForm" id="parameterForm" method="post" onsubmit="return checkInfo();">
    	<input type="hidden" name="_method" value="${_method}"/>
		<table class="input">
			<tbody>
				<tr>
				    <th>参数ID：</th>
				    <td>	
						<input type="text" class="text" value="<#if (parameter.parameterId)??>${parameter.parameterId}</#if>" name="parameterId" id="parameterId" maxlength="10" />
				    </td>
				    <th>父ID：</th>
				    <td>	
						<input type="text" class="text" value="<#if (parameter.parentId)??>${parameter.parentId}</#if>" name="parentId" id="parentId" maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th>参数名称：</th>
				    <td>
						<input type="text" class="text" value="<#if (parameter.parameterName)??>${parameter.parameterName}</#if>" name="parameterName" id="parameterName"  maxlength="100" />
				    </td>
				    <th>参数值：</th>
				    <td>
						<input type="text" class="text" value="<#if (parameter.parameterValue)??>${parameter.parameterValue}</#if>" name="parameterValue" id="parameterValue"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>备注：</th>
				    <td colspan="3">
						<input type="text" class="text" value="<#if (parameter.remark)??>${parameter.remark}</#if>" name="remark" id="remark"  maxlength="200" />
				    </td>
				</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="4">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/parameter";' class="return-button"/>
					<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; 
					<input type="reset" value="重置" class="reset" class="reset"/>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>

</body>
</html>
