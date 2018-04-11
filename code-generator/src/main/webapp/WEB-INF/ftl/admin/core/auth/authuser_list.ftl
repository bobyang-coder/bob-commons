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
<script type="text/javascript"> 
$().ready(function() {
 
	var $listForm = $("#listForm");
	var $filterSelect = $("#filterSelect");
	var $filterOption = $("#filterOption a");

	// 年度筛选
	$filterSelect.mouseover(function() {
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function() {
			$popupMenu.hide();
		});
	});
	
	// 筛选选项
	$filterOption.click(function() {
		var $this = $(this);
		var $dest = $("#year");
		if ($this.hasClass("checked")) {
			$dest.val("");
		} else {
			$dest.val($this.attr("val"));
		}
		$listForm.submit();
		return false;
	});

 
});
</script>
<body>
	<form action="${ctx}/admin/authuser" method="get" name="listForm" id="listForm">
		<input type="hidden" id="year" name="year" value="${authUserQuery.year}" />
		<div class="bar">
			<a href="${ctx}/admin/authuser/new" class="iconButton fl">
				<span class="iconSpan addIcon">&nbsp;</span>添加
			</a>
			<a href="${ctx}/common/img/user/template/user.xlsx" id="downButton" class="iconButton fl">
				<span class="iconSpan importIcon">&nbsp;</span>模版下载
			</a>
			<a href="${ctx}/admin/authuser/import" id="importButton" class="iconButton fl">
				<span class="iconSpan importIcon">&nbsp;</span>导入
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled fl" >
					<span class="iconSpan deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton fl">
					<span class="iconSpan refreshIcon">&nbsp;</span>刷新
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						年度（<#if (authUserQuery.year)??>${authUserQuery.year}</#if>）<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu w100">
						<ul id="filterOption" class="check">
						<li><a href="javascript:;" val="2013" <#if ((authUserQuery.year)!"0")=="2013">class="checked"</#if>>2013</a></li>
						<li><a href="javascript:;" val="2014" <#if ((authUserQuery.year)!"0")=="2014">class="checked"</#if>>2014</a></li>
						<li><a href="javascript:;" val="2015" <#if ((authUserQuery.year)!"0")=="2015">class="checked"</#if>>2015</a></li>
						<li><a href="javascript:;" val="2016" <#if ((authUserQuery.year)!"0")=="2016">class="checked"</#if>>2016</a></li>
						<li><a href="javascript:;" val="2017" <#if ((authUserQuery.year)!"0")=="2017">class="checked"</#if>>2017</a></li>
						<li><a href="javascript:;" val="2018" <#if ((authUserQuery.year)!"0")=="2018">class="checked"</#if>>2018</a></li>
						<li><a href="javascript:;" val="2019" <#if ((authUserQuery.year)!"0")=="2019">class="checked"</#if>>2019</a></li>
						<li><a href="javascript:;" val="2020" <#if ((authUserQuery.year)!"0")=="2020">class="checked"</#if>>2020</a></li>
						</ul>
					</div>
				</div>
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
					<input type="text" id="keyWord" name="keyWord" value="${authUserQuery.keyWord}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="w400 popupMenu">
					<table class="input">
						<tbody>
						<tr>
							<th>用户名称：</th>
							<td><input type=text name="userName" class="text" value="${authUserQuery.userName}"></td>
						</tr>
						<tr>
							<th>登录名称：</th>
							<td><input type=text name="loginName" class="text" value="${authUserQuery.loginName}"></td>
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
						<th>年度</th>
					    <th>用户ID</th>
					    <th>用户名</th>
					    <th>登录名</th>
					    <th>登录密码</th>
					    <th>手机</th>
					    <th>办公电话</th>
					    <th>Email</th>
						<th>操作选项</th>
					</tr>
				</thead>
				<tbody>
					<#if authUserList?exists>
			    		<#list authUserList as authUser > 
						<tr>
							<td><input type="checkbox" id="ids${authUser.userId}" name="ids" value="${authUser.userId}"/></td>
							<td>${authUser_index+1}</td>
							<td><#if (authUser.year)??>${authUser.year}</#if></td>
							<td><#if (authUser.userId)??>${authUser.userId}</#if></td>
							<td><#if (authUser.userName)??>${authUser.userName}</#if></td>
							<td><#if (authUser.loginName)??>${authUser.loginName}</#if></td>
							<td><#if (authUser.loginPwd)??>${authUser.loginPwd}</#if></td>
							<td><#if (authUser.mobile)??>${authUser.mobile}</#if></td>
							<td><#if (authUser.officeTel)??>${authUser.officeTel}</#if></td>
							<td><#if (authUser.email)??>${authUser.email}</#if></td>
							<td><a href="${ctx}/admin/authuser/${authUser.userId}">修改</a> | <a href="javascript:$.deleteRow(${authUser.userId});">删除</a></td>
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
