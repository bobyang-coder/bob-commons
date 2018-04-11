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
    <form action="${ctx}/admin/authuser/import" name="userForm" id="userForm" method="post" enctype="multipart/form-data" >
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
		<table class="input">
			<tbody>
			<tr>
				    <th>年度：</th>
				    <td>
				    <select name="year" id="year" class="">
						<option value="2013" <#if curYear=="2013">selected</#if>>2013</option>
						<option value="2014" <#if curYear=="2014">selected</#if>>2014</option>
						<option value="2015" <#if curYear=="2015">selected</#if>>2015</option>
						<option value="2016" <#if curYear=="2016">selected</#if>>2016</option>
						<option value="2017" <#if curYear=="2017">selected</#if>>2017</option>
						<option value="2018" <#if curYear=="2018">selected</#if>>2018</option>
						<option value="2019" <#if curYear=="2019">selected</#if>>2019</option>
						<option value="2020" <#if curYear=="2020">selected</#if>>2020</option>
					</select>
				    </td>
			</tr>
			<tr>
				    <th>文件(excel)：</th>
				    <td><input type="file" class="text" name="myfiles"/>
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
