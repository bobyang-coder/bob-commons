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
		<a href="${ctx}/admin/parameter">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/parameter<#if (para.parameterId)??>/${para.parameterId}</#if>" name="parameterForm" id="parameterForm" method="post" >
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
		<input type="hidden" id="parameterId" name="parameterId" value="<#if (para.parameterId)??>${para.parameterId}</#if>"/>
		<table class="input">
			<tbody>
				<tr>
				    <th><span class="red">* </span>参数ID：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.parameterId)??>${para.parameterId}</#if>" name="parameterId" id="parameterId"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th><span class="red">* </span>参数名称：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.parameterName)??>${para.parameterName}</#if>" name="parameterName" id="parameterName"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>参数值：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.parameterValue)??>${para.parameterValue}</#if>" name="parameterValue" id="parameterValue"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>父ID：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.parentId)??>${para.parentId}</#if>" name="parentId" id="parentId"  maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th>备注：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.remark)??>${para.remark}</#if>" name="remark" id="remark"  maxlength="200" />
				    </td>
				</tr>
				<tr>
				    <th>创建人：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.createUserId)??>${para.createUserId}</#if>" name="createUserId" id="createUserId"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>创建时间：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.createDateTime)??>${para.createDateTime?datetime}</#if>" name="createDateTime" id="createDateTime" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="7" />
					
				    </td>
				</tr>
				<tr>
				    <th>最后修改人：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.modifyUserId)??>${para.modifyUserId}</#if>" name="modifyUserId" id="modifyUserId"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>最后修改时间：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.modifyDateTime)??>${para.modifyDateTime?datetime}</#if>" name="modifyDateTime" id="modifyDateTime" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="7" />
					
				    </td>
				</tr>
				<tr>
				    <th>删除标记（1有效、2无效）：</th>
				    <td>
					<input type="text" class="text" value="<#if (para.deleteFlag)??>${para.deleteFlag}</#if>" name="deleteFlag" id="deleteFlag"  maxlength="1" />
				    </td>
				</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/parameter";' class="return-button"/>
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
		
		//参数ID#OS#VNN#VI
		if( $(this).is("#parameterId") ){
			var errorMsg = "";
			if( !isNotNull(this.value)){
				errorMsg = "不能为空";
			}
			else{
				if ( !isInteger(this.value)){
					errorMsg = "请输入正确的整数";
				}
			}
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     

		//参数名称#OS#OC#VNN
		if( $(this).is("#parameterName") ){
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
			$('#parameterForm').submit();
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
