<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#noparse><#assign ctx = request.contextPath/> </#noparse>
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first> 
<#assign classNameLowerCase = className?lower_case>
<#assign isFK = 0>
<#assign isRT = 0>
<#list table.columns as column>
<#if (column.remarks)?index_of("#LFK") &gt; 0 >
<#assign isFK = 1>
</#if>
<#if (column.remarks)?index_of("#ERT") &gt; 0>
<#assign isRT = 1>
</#if>
</#list>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>修改</title>
	<link href="<@jspEl 'ctx'/>/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="<@jspEl 'ctx'/>/common/css/common.css" rel="stylesheet" type="text/css"/>
	<script src="<@jspEl 'ctx'/>/common/js/jquery.js" type="text/javascript"></script>
	<script src="<@jspEl 'ctx'/>/common/js/validate.js" type="text/javascript"></script>
	<script src="<@jspEl 'ctx'/>/common/js/DatePicker/WdatePicker.js" type="text/javascript"></script>
	<#if isRT == 1>
	<script type="text/javascript">window.UEDITOR_HOME_URL = "<@jspEl 'ctx'/>/ueditor/";</script>
	<script src="<@jspEl 'ctx'/>/ueditor/ueditor.config.js" type="text/javascript" ></script>
	<script src="<@jspEl 'ctx'/>/ueditor/ueditor.all.min.js" type="text/javascript" ></script>
	<script src="<@jspEl 'ctx'/>/ueditor/ueditor.parse.js" type="text/javascript" ></script>
	</#if>
</head>
<body>
	<div class="path">
		<a href="<@jspEl 'ctx'/>/admin/${classNameLowerCase}<#if isFK == 1><#noparse><#if (</#noparse>${classNameFirstLower}<#noparse>.foreignKey)??>?foreignKey=${</#noparse>${classNameFirstLower}<#noparse>.foreignKey}</#if></#noparse></#if>">返回</a> &raquo; 编辑
	</div>
	<#list table.columns as column>
	<#if column.pk>
    <form action="<@jspEl 'ctx'/>/admin/${classNameLowerCase}<#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??>/</#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower/><#noparse></#if></#noparse>" name="${classNameFirstLower}Form" id="${classNameFirstLower}Form" method="post" >
    </#if>
	</#list>
		<#if isFK == 1>
    	<#noparse><#if (</#noparse>${classNameFirstLower}<#noparse>.foreignKey)??>
		<input type="hidden" name="foreignKey" id="foreignKey" value="${</#noparse>${classNameFirstLower}<#noparse>.foreignKey}"/>
		</#if></#noparse>
		</#if>
    	<input type="hidden" name="_method" value="<#noparse><#if (_method)??>${_method}</#if></#noparse>"/>
	<#list table.columns as column>
		<#if column.pk>
		<input type="hidden" id="${column.columnNameFirstLower}" name="${column.columnNameFirstLower}" value="<#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??></#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower/><#noparse></#if></#noparse>"/>
		</#if>
	</#list>	
		<table class="input">
			<tbody>
			<#list table.columns as column>
				<#if !column.htmlHidden>
				<#if column.sqlName != "Create_User_ID" && column.sqlName != "Create_Date_Time" && column.sqlName != "Modify_User_ID" && column.sqlName != "Modify_Date_Time" && column.sqlName != "Delete_Flag">
				<tr>
				    <th><#if (column.remarks)?index_of("#VNN") &gt; 0 ><span class="red">* </span></#if><#if (column.remarks)?index_of("#") &gt; 0 >${(column.remarks)?substring(0,(column.remarks)?index_of("#"))}<#else>${column.remarks}</#if>：</th>
				    <td>
				    <#if column.isDateTimeColumn>
					<input type="text" class="text" value="<#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??></#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower+"?datetime"/><#noparse></#if></#noparse>" name="${column.columnNameLower}" id="${column.columnNameLower}" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="${column.size}" />
					
					<#elseif (column.remarks)?index_of("#EPS") &gt; 0>
					<#noparse><@parameter parentId=</#noparse>${(column.remarks)?substring((column.remarks)?index_of("#EPS")+4,(column.remarks)?index_of("&"))}>
					<select id="${column.columnNameLower}" name="${column.columnNameLower}" class="">
	                    <#noparse><#list  parameterList as para>
						<option value="${para.parameterId}"   
						<#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??><#if (para.parameterId==</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)>selected</#if> </#if>
						>${para.parameterName}</option>			
					</#list>
					</select>
					</@parameter>
					</#noparse>
					
					<#elseif (column.remarks)?index_of("#EPC") &gt; 0>
					<#noparse><@parameter parentId=</#noparse>${(column.remarks)?substring((column.remarks)?index_of("#EPC")+4,(column.remarks)?index_of("&"))}>
					<#noparse><#list  parameterList as para></#noparse>
					<label class="checkbox-inline"><input type="checkbox" name="${column.columnNameLower}" <#noparse>value="${para.parameterId}" <#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)?index_of(para.parameterId) &gt; -1 >checked</#if><#elseif para_index==0>checked</#if>>${para.parameterName}</label>	
					</#list>
					</@parameter>
					</#noparse>
					
					<#elseif (column.remarks)?index_of("#EPR") &gt; 0>
					<#noparse><@parameter parentId=</#noparse>${(column.remarks)?substring((column.remarks)?index_of("#EPR")+4,(column.remarks)?index_of("&"))}>
					<#noparse><#list  parameterList as para></#noparse>
					<label class="redio-inline"><input type="radio" name="${column.columnNameLower}" <#noparse>value="${para.parameterId}" <#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)?index_of(para.parameterId) &gt; -1 >checked</#if><#elseif para_index==0>checked</#if>>${para.parameterName}</label>	
					</#list>
					</@parameter>
					</#noparse>
					
					<#elseif (column.remarks)?index_of("#EDS") &gt; 0>
					<#noparse><@dept parentId=</#noparse>${(column.remarks)?substring((column.remarks)?index_of("#EDS")+4,(column.remarks)?index_of("&"))}>
					<select id="${column.columnNameLower}" name="${column.columnNameLower}" class="">
	                    <#noparse><#list deptList as dept>
						<option value="${dept.deptId}"   
						<#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??><#if (dept.deptId==</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)>selected</#if> </#if>
						>${dept.deptName}</option>			
					</#list>
					</select>
					</@dept>
					</#noparse>
					
					<#elseif (column.remarks)?index_of("#EOR") &gt; 0>
					<label><input type="radio" name="${column.columnNameLower}" class="radio" value="0" <#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>=="0")>checked="checked"</#if></#if></#noparse> />否</label>
					<label><input type="radio" name="${column.columnNameLower}" class="radio" value="1" <#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>=="1")>checked="checked"</#if></#if></#noparse> />是</label>
					
					<#elseif (column.remarks)?index_of("#ERT") &gt; 0>
					<script type="text/plain" id="editor" name="${column.columnNameLower}">
				    <#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??></#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower/><#noparse></#if></#noparse>
				    </script>
				    
					<#else>
					<input type="text" class="text" value="<#noparse><#if (</#noparse>${classNameFirstLower}.${column.columnNameFirstLower}<#noparse>)??></#noparse><@jspEl classNameFirstLower+"."+column.columnNameFirstLower/><#noparse></#if></#noparse>" name="${column.columnNameLower}" id="${column.columnNameLower}"  maxlength="${column.size}" />
					</#if>
				    </td>
				</tr>
				</#if>
				</#if>
			</#list>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="返回列表" onclick='window.location="<@jspEl 'ctx'/>/admin/${classNameLowerCase}<#if isFK == 1><#noparse><#if (</#noparse>${classNameFirstLower}<#noparse>.foreignKey)??>?foreignKey=${</#noparse>${classNameFirstLower}<#noparse>.foreignKey}</#if></#noparse></#if>";' class="return-button"/>
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
		
	<#list table.columns as column>
		<#if (column.remarks)?index_of("#V") &gt; 0 >
		//${column.remarks}
		if( $(this).is("#${column.columnNameLower}") ){
			var errorMsg = "";
			<#if (column.remarks)?index_of("#VNN")  &gt; 0 >
			if( !isNotNull(this.value)){
				errorMsg = "不能为空";
			}
			<#if (column.remarks)?index_of("#VI") &gt; 0 || (column.remarks)?index_of("#VD") &gt; 0 || (column.remarks)?index_of("#VE") &gt; 0 || (column.remarks)?index_of("#VM") &gt; 0 || (column.remarks)?index_of("#VT") &gt; 0  >
			else{
				<#if (column.remarks)?index_of("#VI") &gt; 0 >
				if ( !isInteger(this.value)){
					errorMsg = "请输入正确的整数";
				}
				</#if>
				<#if (column.remarks)?index_of("#VD") &gt; 0 >
				if ( !isDecimal(this.value)){
					errorMsg = "请输入正确的数字";
				}
				</#if>
				<#if (column.remarks)?index_of("#VE") &gt; 0 >
				if ( !isEmail(this.value)){
					errorMsg = "请输入正确的邮件地址";
				}
				</#if>
				<#if (column.remarks)?index_of("#VM") &gt; 0 >
				if ( !isMobile(this.value)){
					errorMsg = "请输入正确的手机号码";
				}
				</#if>
				<#if (column.remarks)?index_of("#VT") &gt; 0 >
				if ( !isPhone(this.value)){
					errorMsg = "请输入正确的固话号码";
				}
				</#if>
			}
				</#if>
			<#else>
			if( isNotNull(this.value)){
				<#if (column.remarks)?index_of("#VI") &gt;0 >
				if ( !isInteger(this.value)){
					errorMsg = "请输入正确的整数";
				}
				</#if>
				<#if (column.remarks)?index_of("#VD") &gt; 0 >
				if ( !isDecimal(this.value)){
					errorMsg = "请输入正确的数字";
				}
				</#if>
				<#if (column.remarks)?index_of("#VE") &gt; 0 >
				if ( !isEmail(this.value)){
					errorMsg = "请输入正确的邮件地址";
				}
				</#if>
				<#if (column.remarks)?index_of("#VM") &gt; 0 >
				if ( !isMobile(this.value)){
					errorMsg = "请输入正确的手机号码";
				}
				</#if>
				<#if (column.remarks)?index_of("#VT") &gt; 0 >
				if ( !isPhone(this.value)){
					errorMsg = "请输入正确的固话号码";
				}
				</#if>
			}
			</#if>
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     

		</#if>
	</#list>


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
			$('#${classNameFirstLower}Form').submit();
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
<#if isRT == 1>
<script type="text/javascript"> 
	//实例化编辑器
	var ue = UE.getEditor('editor');
	var domUtils = UE.dom.domUtils;
 
	ue.addListener("ready", function() {
		ue.focus(true);
	});
</script>
</#if>
</body>
</html>
