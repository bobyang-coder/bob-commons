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
		<a href="${ctx}/admin/smssend">返回</a> &raquo; 编辑
	</div>
    <form action="${ctx}/admin/smssend<#if (smsSend.keyId)??>/${smsSend.keyId}</#if>" name="smsSendForm" id="smsSendForm" method="post" >
    	<input type="hidden" name="_method" value="<#if (_method)??>${_method}</#if>"/>
		<input type="hidden" id="keyId" name="keyId" value="<#if (smsSend.keyId)??>${smsSend.keyId}</#if>"/>
		<table class="input">
			<tbody>
				<tr>
				    <th>短信类型：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.smsType)??>${smsSend.smsType}</#if>" name="smsType" id="smsType"  maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th>手机号：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.phone)??>${smsSend.phone}</#if>" name="phone" id="phone"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>短信内容：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.content)??>${smsSend.content}</#if>" name="content" id="content"  maxlength="200" />
				    </td>
				</tr>
				<tr>
				    <th>发送通道ID：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.channelId)??>${smsSend.channelId}</#if>" name="channelId" id="channelId"  maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th>发送状态：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.channelStatus)??>${smsSend.channelStatus}</#if>" name="channelStatus" id="channelStatus"  maxlength="10" />
				    </td>
				</tr>
				<tr>
				    <th>发送时间：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.sendDateTime)??>${smsSend.sendDateTime?datetime}</#if>" name="sendDateTime" id="sendDateTime" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="7" />
					
				    </td>
				</tr>
				<tr>
				    <th>创建人：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.createUserId)??>${smsSend.createUserId}</#if>" name="createUserId" id="createUserId"  maxlength="20" />
				    </td>
				</tr>
				<tr>
				    <th>创建时间：</th>
				    <td>
					<input type="text" class="text" value="<#if (smsSend.createDateTime)??>${smsSend.createDateTime?datetime}</#if>" name="createDateTime" id="createDateTime" class="text Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" maxlength="7" />
					
				    </td>
				</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="返回列表" onclick='window.location="${ctx}/admin/smssend";' class="return-button"/>
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
			$('#smsSendForm').submit();
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
