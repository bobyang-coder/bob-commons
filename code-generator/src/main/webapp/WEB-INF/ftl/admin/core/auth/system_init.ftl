<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign ctx = request.contextPath/> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="pragma" content="no-cache" />
	<meta HTTP-equiv="Cache-Control" content="no-cache, must-revalidate" />
	<meta http-equiv="expires" content="0" />
	<title>修改</title>
	<link href="${ctx}/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/common.css" rel="stylesheet" type="text/css"/>
	<script src="${ctx}/common/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/DatePicker/WdatePicker.js" type="text/javascript"></script>
	<style type="text/css">
           body{font-size:13px}
           #toolTip{border:solid 2px #666;position:absolute;display:none;z-index:101;background-color:#fbaf15;padding:2px;color:#fff;}
           .divShow{line-height:32px;height:32px;background-color:#eee;width:280px;padding-left:10px}
           .divShow span{padding-left:50px}
           .dialog{width:360px;border:solid 5px #666;position:absolute;display:none;z-index:101}
           .dialog .title{background-color:#fbaf15;padding:10px;color:#fff;font-weight:bold}
           .dialog .title img{float:right}
           .dialog .content{background-color:#fff;padding:25px;height:60px}
           .dialog .content img{float:left}
           .dialog .content span{float:left;padding-top:10px;padding-left:10px}
           .dialog .bottom{text-align:right;padding:10px 10px 10px 0px;background-color:#eee}
           .maskBottom {width:100%;height:100%; background-color:#000;position:absolute;
                  top:0px;left:0px;display:none;z-index:99}
           .mask {width:100%;height:100%; background-color:#000;position:absolute;
                  top:0px;left:0px;filter:alpha(opacity=30);display:none;z-index:100} 
           .btn {border:#666 1px solid;padding:2px;width:65px;
           filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#ffffff, EndColorStr=#ECE9D8);}
   </style>
</head>
<script type="text/javascript">

	//规则查询
	function systemInit(){
		if(confirm("你确认初始化系统吗？")){
			var offset = $('#btnOK').offset();		
			showToolTip('正在进行系统初始化，请稍候...', offset.left, offset.top);
		
			$.ajax({
				url: $("#listForm").attr("action")+ $('#year').val(),
				type: "get",
				data: "",
				dataType: "json",
				cache: false,
				success: function(message) {
					hideToolTip();
					alert('初始化完成！');
				}
			})
		}
	}
	
	//提示
	function showToolTip(s, x, y){
		$('#toolTip').html(s).css('left', x-100).css('top', y+10).show();
		
		$(document).bind("click",function(){hideToolTip();});
	}
	function hideToolTip(){
		$('#toolTip').hide();
		
		$(document).unbind("click");
	}

	$(function() {
		$("body").append("<div id='toolTip'></div>");
    	$("body").append("<div class='maskBottom'><iframe scrolling='no' height='100%' width='100%' frameborder='0' marginwidth='0' marginheight='0'></iframe></div>");
    	$("body").append("<div class='mask'></div>");       	
    	$("body").append("<div class='dialog'><div class='title'><img src='${ctx}/common/img/admin/close.gif' alt='点击可以关闭' />删除时提示</div><div class='content'><img src='${ctx}/common/img/admin/delete.jpg' /><span>您真的要删除该条记录吗？</span></div><div class='bottom'><input id='popOK' type='button' value='确定' class='btn'/>&nbsp;&nbsp;<input id='popNO' type='button' value='取消' class='btn'/></div></div>");
	});
</script>
<body>
    <form action="${ctx}/admin/system/init/" name="listForm" id="listForm" method="post" onsubmit="return checkInfo();">
    	
		<table class="input">
			<tbody>
			<tr>
				    <th>年度：</th>
				    <td>
				    <select name="year" id="year" class="">
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
					</select>
				    </td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="4">
					<input type="button" value="提交" id="btnOK" class="submit" class="submit" onclick="systemInit()"/> &nbsp; 
					<input type="reset" value="重置" class="reset" class="reset"/>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>

</body>
</html>
