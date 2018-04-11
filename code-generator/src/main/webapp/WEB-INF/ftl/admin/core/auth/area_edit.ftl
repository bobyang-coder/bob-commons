<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign ctx = request.contextPath/> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>修改</title>
	<link href="${ctx}/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/common.css" rel="stylesheet" type="text/css"/>
	<script src="${ctx}/common/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/validate.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
	<div class="path">
		<a href="${ctx}/admin/area">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/area<#if (area.areaId)??>/${area.areaId}</#if>" name="areaForm" id="areaForm" method="post" >
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
		<input type="hidden" id="areaId" name="areaId" value="<#if (area.areaId)??>${area.areaId}</#if>"/>
		<table class="input">
			<tbody>
				<tr>
				    <th><span class="red">* </span>名称：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.areaName)??>${area.areaName}</#if>" name="areaName" id="areaName"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>全称：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.fullName)??>${area.fullName}</#if>" name="fullName" id="fullName"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>简称：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.alias)??>${area.alias}</#if>" name="alias" id="alias"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>全拼：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.pyName)??>${area.pyName}</#if>" name="pyName" id="pyName"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>简拼：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.abName)??>${area.abName}</#if>" name="abName" id="abName"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>显示次序：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.displaySeq)??>${area.displaySeq}</#if>" name="displaySeq" id="displaySeq"  maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th>级别：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.lv)??>${area.lv}</#if>" name="lv" id="lv"  maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th><span class="red">* </span>父ID：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.parentId)??>${area.parentId}</#if>" name="parentId" id="parentId"  maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th>备注：</th>
				    <td>
					<input type="text" class="text" value="<#if (area.memo)??>${area.memo}</#if>" name="memo" id="memo"  maxlength="100" />
				    </td>
				</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/area";' class="return-button"/>
					<input type="button" value="提交" id="send" class="submit"/> &nbsp; 
					<input type="reset" value="重置" id="reset" class="reset"/>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>
<script type="text/javascript">
<!--
$(function () {
	
	//表单验证
	$("form :input").blur(function(){
		var $parent = $(this).parent();
		$parent.find(".red").remove();
		
		//区域ID#VNN#OS
		if( $(this).is("#areaId") ){
			var errorMsg = "";
			if( !isNotNull(this.value)){
				errorMsg = "不能为空";
			}
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     

		//名称#OS#VNN
		if( $(this).is("#areaName") ){
			var errorMsg = "";
			if( !isNotNull(this.value)){
				errorMsg = "不能为空";
			}
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     

		//显示次序#VI#OS
		if( $(this).is("#displaySeq") ){
			var errorMsg = "";
			if( isNotNull(this.value)){
				if ( !isInteger(this.value)){
					errorMsg = "请输入正确的整数";
				}
			}
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     

		//级别#OS#VI
		if( $(this).is("#lv") ){
			var errorMsg = "";
			if( isNotNull(this.value)){
				if ( !isInteger(this.value)){
					errorMsg = "请输入正确的整数";
				}
			}
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     

		//父ID#VNN
		if( $(this).is("#parentId") ){
			var errorMsg = "";
			if( !isNotNull(this.value)){
				errorMsg = "不能为空";
			}
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     



	}).keyup(function(){
	   $(this).triggerHandler("blur");
	}).focus(function(){
 	   $(this).triggerHandler("blur");
	});
	
	//提交，最终验证。
	$('#send').click(function(){
		$("form :input").trigger('blur');
		var numError = $('form .onError').length;

		if(numError){
			return false;
		}
		else{
			$('#areaForm').submit();
		}
	});

	
	//重置
	$('#reset').click(function(){
		$("form :input").each(function(index){
	 		$(".red").remove();
	 	}) 
	});


});

//-->
</script>
</body>
</html>
