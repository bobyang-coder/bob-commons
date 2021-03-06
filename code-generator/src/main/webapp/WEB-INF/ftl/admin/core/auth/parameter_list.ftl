<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign ctx = request.contextPath/> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="pragma" content="no-cache" />
	<meta HTTP-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="expires" content="0" />
	<title>列表</title>
	<link href="${ctx}/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/common.css" rel="stylesheet" type="text/css"/>
	<script src="${ctx}/common/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/common.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/list.js" type="text/javascript"></script>
</head>
<body>
	<form action="${ctx}/admin/parameter" method="get" name="listForm" id="listForm">
		<div class="bar">
			<a href="${ctx}/admin/parameter/new" class="iconButton fl">
				<span class="iconSpan addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled fl" >
					<span class="iconSpan deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton fl">
					<span class="iconSpan refreshIcon">&nbsp;</span>刷新
				</a>
				<a href="javascript:;" id="reloadButton" class="iconButton fl">
					<span class="iconSpan refreshIcon">&nbsp;</span>加载
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						每页显示<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu w100">
						<ul id="pageSizeOption">
							<li><a href="javascript:;" <#if page.pageSize=5>class="current"</#if> val="5">5</a></li>
							<li><a href="javascript:;" <#if page.pageSize=10>class="current"</#if> val="10">10</a></li>
							<li><a href="javascript:;" <#if page.pageSize=20>class="current"</#if> val="20">20</a></li>
							<li><a href="javascript:;" <#if page.pageSize=50>class="current"</#if> val="50">50</a></li>
							<li><a href="javascript:;" <#if page.pageSize=100>class="current"</#if> val="100">100</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="keyWord" name="keyWord" value="${parameterQuery.keyWord}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="w400 popupMenu">
					<table class="input">
						<tbody>
						<tr>
							<th>功能编号：</th>
							<td><input type=text name="funcCode" class="text" value="" ></td>
						</tr>
						</tbody>
						<tfoot>
						<tr>
							<td colspan="2">
								<a href="javascript:;" id="searchButton" class="iconButton"><span class="iconSpan searchIcon">&nbsp;</span>搜索</a>
								<a href="javascript:;" id="closeButton" class="iconButton"><span class="iconSpan refreshIcon">&nbsp;</span>取消</a>
							</td>
						</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		
		<div class="body-box">
			<input type="hidden" name="_method" id="_method" value=""/>
			<table id="listTable" class="list">
				<thead>
					<tr>
						<th class="check"><input type="checkbox" name="selectAll" id="selectAll" /></th>
						<th>ID</th>
						<th>参数ID</th>
						<th>参数名称</th>
						<th>参数值</th>
						<th>父ID</th>
						<th>备注</th>
						<th>创建人</th>
						<th>创建时间</th>
						<th>最后修改人</th>
						<th>最后修改时间</th>
						<th>删除标记（1有效、2无效）</th>
						<th>操作选项</th>
					</tr>
				</thead>
				
				<tbody>
    			<#if parameterList?exists>
		    	<#list parameterList as parameter > 
				<tr>
					<td>
					<input type="checkbox" id="parameterIds${parameter.parameterId}" name="ids" value="${parameter.parameterId}"/>
				</td>
				<td>${parameter_index+1}</td>
						<td><#if (parameter.parameterId)??>${parameter.parameterId}</#if></td>
						<td><#if (parameter.parameterName)??>${parameter.parameterName}</#if></td>
						<td><#if (parameter.parameterValue)??>${parameter.parameterValue}</#if></td>
						<td><#if (parameter.parentId)??>${parameter.parentId}</#if></td>
						<td><#if (parameter.remark)??>${parameter.remark}</#if></td>
						<td><#if (parameter.createUserId)??>${parameter.createUserId}</#if></td>
				        <td><#if (parameter.createDateTime)??>${parameter.createDateTime?datetime}</#if></td>
						<td><#if (parameter.modifyUserId)??>${parameter.modifyUserId}</#if></td>
				        <td><#if (parameter.modifyDateTime)??>${parameter.modifyDateTime?datetime}</#if></td>
						<td><#if (parameter.deleteFlag)??>${parameter.deleteFlag}</#if></td>
			    
				<td>
					    <a href="${ctx}/admin/parameter/${parameter.parameterId}">修改</a> | <a href="javascript:$.deleteRow(${parameter.parameterId});">删除</a> 
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
			<#include "admin/include/pagination.ftl" >
		</div>
	</form>
</body>
</html>
