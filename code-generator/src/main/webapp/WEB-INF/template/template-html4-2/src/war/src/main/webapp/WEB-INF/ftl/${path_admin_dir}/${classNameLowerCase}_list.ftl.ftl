<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#noparse><#assign ctx = request.contextPath/> </#noparse>
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first> 
<#assign classNameLowerCase = className?lower_case>
<#assign isFK = 0>
<#list table.columns as column>
<#if (column.remarks)?index_of("#LFK") &gt; 0 >
<#assign isFK = 1>
</#if>
</#list>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>列表</title>
	<link href="<@jspEl 'ctx'/>/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="<@jspEl 'ctx'/>/common/css/common.css" rel="stylesheet" type="text/css"/>
	<script src="<@jspEl 'ctx'/>/common/js/jquery.js" type="text/javascript"></script>
	<script src="<@jspEl 'ctx'/>/common/js/common.js" type="text/javascript"></script>
	<script src="<@jspEl 'ctx'/>/common/js/list.js" type="text/javascript"></script>
</head>
<body>
	<form action="<@jspEl 'ctx'/>/admin/${classNameLowerCase}" method="get" name="listForm" id="listForm">
		<#if isFK == 1>
		<#noparse><#if (</#noparse>${classNameFirstLower}<#noparse>Query.foreignKey)??>
		<input type="hidden" name="foreignKey" id="foreignKey" value="${</#noparse>${classNameFirstLower}<#noparse>Query.foreignKey}"/>
		</#if></#noparse>
		</#if>
		<div class="bar">
			<a href="<@jspEl 'ctx'/>/admin/${classNameLowerCase}/new<#if isFK == 1><#noparse><#if (</#noparse>${classNameFirstLower}<#noparse>Query.foreignKey)??>?foreignKey=${</#noparse>${classNameFirstLower}<#noparse>Query.foreignKey}</#if></#noparse></#if>" class="iconButton fl">
				<span class="iconSpan addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled fl" >
					<span class="iconSpan deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton fl">
					<span class="iconSpan refreshIcon">&nbsp;</span>刷新
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						每页显示<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu w100">
						<ul id="pageSizeOption">
							<li><a href="javascript:;" <#noparse><#if page.pageSize=5>class="current"</#if></#noparse> val="5">5</a></li>
							<li><a href="javascript:;" <#noparse><#if page.pageSize=10>class="current"</#if></#noparse> val="10">10</a></li>
							<li><a href="javascript:;" <#noparse><#if page.pageSize=20>class="current"</#if></#noparse> val="20">20</a></li>
							<li><a href="javascript:;" <#noparse><#if page.pageSize=50>class="current"</#if></#noparse> val="50">50</a></li>
							<li><a href="javascript:;" <#noparse><#if page.pageSize=100>class="current"</#if></#noparse> val="100">100</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="keyWord" name="keyWord" value="<#noparse>${</#noparse>${classNameFirstLower}Query.keyWord<#noparse>}</#noparse>" maxlength="200" />
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
						<th>序号</th>
						<#list table.columns as column>
						<#if (column.remarks)?index_of("#OS") &gt; 0 >
						<th><#if (column.remarks)?index_of("#") &gt; 0 >${(column.remarks)?substring(0,(column.remarks)?index_of("#"))}<#else>${column.remarks}</#if></th>
						</#if>
						</#list>
						<th>操作选项</th>
					</tr>
				</thead>
				
				<tbody>
    			<#noparse><#if </#noparse>${classNameFirstLower}List<#noparse>?exists></#noparse>
		    	<#noparse><#list</#noparse> ${classNameFirstLower}<#noparse>List as</#noparse> ${classNameFirstLower} <#noparse>> </#noparse>
				<tr>
				<td>
				<#list table.columns as column>
				<#if column.pk>
					<input type="checkbox" id="${column.columnNameLower}s<@jspEl classNameFirstLower+"."+column.columnNameFirstLower/>" name="ids" value="<@jspEl classNameFirstLower+"."+column.columnNameFirstLower/>"/>
				</#if>
				</#list>
				</td>
				<td><@jspEl classNameFirstLower+"_index+1"/></td>
		<#list table.columns as column>
			<#if (column.remarks)?index_of("#OS") &gt; 0 >
	        <#if column.isDateTimeColumn>
		        <td><#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??></#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower+"?datetime"/><#noparse></#if></#noparse></td>
			<#else>
				<#if (column.remarks)?index_of("#LC") &gt; 0 >
				<td><#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}Name<#noparse>)??></#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower+"Name"/><#noparse></#if></#noparse></td>
				<#else>
				<td><#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??></#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower/><#noparse></#if></#noparse></td>
				</#if>
			</#if>
			</#if>
        </#list>
				<td>
				<#list table.columns as column>
					<#if column.pk>
					<a href="<@jspEl 'ctx'/>/admin/${classNameLowerCase}/<@jspEl classNameFirstLower+"."+column.columnNameFirstLower/><#if isFK == 1><#noparse><#if (</#noparse>${classNameFirstLower}<#noparse>Query.foreignKey)??>?foreignKey=${</#noparse>${classNameFirstLower}<#noparse>Query.foreignKey}</#if></#noparse></#if>">修改</a> | 
					<a href="javascript:$.deleteRow(<@jspEl classNameFirstLower+"."+column.columnNameFirstLower/>);">删除</a> 
					</#if>
				</#list>
				</td>
				</tr>
		<#noparse>	</#list>
		<#else></#noparse>
			<tr class="main_info">
				<td colspan="6">没有相关数据</td>
			</tr>
		<#noparse></#if></#noparse>
			</tbody>
			</table>
			<#noparse><#include "admin/include/pagination.ftl" ></#noparse>
		</div>
	</form>
</body>
</html>
