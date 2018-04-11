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
	<script type="text/javascript">window.UEDITOR_HOME_URL = "${ctx}/ueditor/";</script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="${ctx}/ueditor/ueditor.parse.js"></script>
</head>
<body>
	<div class="path">
		<a href="${ctx}/admin/article">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/article<#if (article.id)??>/${article.id}</#if>" name="articleForm" id="articleForm" method="post" >
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
		<input type="hidden" id="id" name="id" value="<#if (article.id)??>${article.id}</#if>"/>
		<table class="input">
			<tbody>
			<tr>
				    <th>标题：</th>
				    <td>
						<input type="text" class="text w500" value="<#if (article.title)??>${article.title}</#if>" name="title" id="title"  maxlength="200" />
				    </td>
			</tr><tr>
				    <th>作者：</th>
				    <td>
							<input type="text" class="text" value="<#if (article.author)??>${article.author}</#if>" name="author" id="author"  maxlength="20" />
				    </td>
			</tr><tr>
				    <th>文章类型：</th>
				    <td>
							<input type="text" class="text" value="<#if (article.articleCategory)??>${article.articleCategory}</#if>" name="articleCategory" id="articleCategory"  maxlength="20" />
				    </td>
			</tr>
			<tr>
				    <th>设置：</th>
				    <td>
						<label><input type="checkbox" value="1" <#if (article.isPublication)!"1"=="1">checked="checked"</#if> name="isPublication" id="isPublication" />是否发布</label>
						<label><input type="checkbox" value="1" <#if (article.isTop)!"0"=="1">checked="checked"</#if> name="isTop" id="isTop" />是否置顶</label>
				    	<label><input type="checkbox" value="1" <#if (article.isCommend)!"0"=="1">checked="checked"</#if> name="isCommend" id="isCommend" />是否推荐</label>
				    </td>
			</tr>
			<tr>
				    <th>图片地址：</th>
				    <td>
							<input type="text" class="text" value="<#if (article.imgUrl)??>${article.imgUrl}</#if>" name="imgUrl" id="imgUrl"  maxlength="100" />
				    </td>
			</tr>
			<tr>
				    <th>内容：</th>
				    <td>
				    <script type="text/plain" id="editor" name="content">
				    <#if (article.content)??>${article.content}</#if>
				    </script>
				    </td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/article?articleCategory=<#if (article.articleCategory)??>${article.articleCategory}</#if>";' class="return-button"/>
					<input type="submit" value="提交" class="submit" class="submit"/> &nbsp; 
					<input type="reset" value="重置" class="reset" class="reset"/>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>
<script type="text/javascript">
	//实例化编辑器
	var ue = UE.getEditor('editor');
	var domUtils = UE.dom.domUtils;

	ue.addListener("ready", function() {
		ue.focus(true);
	});
</script>
</body>
</html>
