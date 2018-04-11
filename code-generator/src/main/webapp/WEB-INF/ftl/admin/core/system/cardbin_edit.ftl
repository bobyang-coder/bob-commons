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
		<a href="${ctx}/admin/cardbin">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/cardbin<#if (cardBin.keyId)??>/${cardBin.keyId}</#if>" name="cardBinForm" id="cardBinForm" method="post" >
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
		<input type="hidden" id="keyId" name="keyId" value="<#if (cardBin.keyId)??>${cardBin.keyId}</#if>"/>
		<table class="input">
			<tbody>
				<tr>
				    <th><span class="red">* </span>银行名称：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.bankName)??>${cardBin.bankName}</#if>" name="bankName" id="bankName"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>银行编码：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.bankCode)??>${cardBin.bankCode}</#if>" name="bankCode" id="bankCode"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>卡名称：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.cardName)??>${cardBin.cardName}</#if>" name="cardName" id="cardName"  maxlength="100" />
				    </td>
				</tr>
				<tr>
				    <th>总长度：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.totalLen)??>${cardBin.totalLen}</#if>" name="totalLen" id="totalLen"  maxlength="3" />
				    </td>
				</tr>
				<tr>
				    <th><span class="red">* </span>有效长度：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.validLen)??>${cardBin.validLen}</#if>" name="validLen" id="validLen"  maxlength="3" />
				    </td>
				</tr>
				<tr>
				    <th><span class="red">* </span>卡值：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.cardValue)??>${cardBin.cardValue}</#if>" name="cardValue" id="cardValue"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>卡类型：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.cardType)??>${cardBin.cardType}</#if>" name="cardType" id="cardType"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>备注：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.note)??>${cardBin.note}</#if>" name="note" id="note"  maxlength="200" />
				    </td>
				</tr>
				<tr>
				    <th>创建人：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.createUserId)??>${cardBin.createUserId}</#if>" name="createUserId" id="createUserId"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>创建时间：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.createDateTime)??>${cardBin.createDateTime?datetime}</#if>" name="createDateTime" id="createDateTime" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="7" />
					
				    </td>
				</tr>
				<tr>
				    <th>最后修改人：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.modifyUserId)??>${cardBin.modifyUserId}</#if>" name="modifyUserId" id="modifyUserId"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>最后修改时间：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.modifyDateTime)??>${cardBin.modifyDateTime?datetime}</#if>" name="modifyDateTime" id="modifyDateTime" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="7" />
					
				    </td>
				</tr>
				<tr>
				    <th>删除标记（1有效、2无效）：</th>
				    <td>
					<input type="text" class="text" value="<#if (cardBin.deleteFlag)??>${cardBin.deleteFlag}</#if>" name="deleteFlag" id="deleteFlag"  maxlength="1" />
				    </td>
				</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/cardbin";' class="return-button"/>
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
		
		//银行名称#OS#OC#VNN
		if( $(this).is("#bankName") ){
			var errorMsg = "";
			if( !isNotNull(this.value)){
				errorMsg = "不能为空";
			}
			
			if(errorMsg!= ""){
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}
		}     

		//有效长度#OS#VNN#VI
		if( $(this).is("#validLen") ){
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

		//卡值#OS#VNN
		if( $(this).is("#cardValue") ){
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
			$('#cardBinForm').submit();
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
