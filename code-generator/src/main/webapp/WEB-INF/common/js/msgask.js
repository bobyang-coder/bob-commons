
$().ready( function() {	
	//主从表格从表异步加载
	$(".answer_list ul.comment").each(function(){
		var $this = $(this);
		var strHtml = "";
		$.ajax({
			url: $(this).attr("action"),
			type: "get",
			data: "",
			dataType: "json",
			cache: false,
			success: function(message) {
				for(var o in message){ 
					
					strHtml = strHtml+"<ul class=\"reply clearfix\"><li class=\"li1\">回复：</li><li class=\"li2\">"+message[o].content+"</li></ul>"
				}
				$("#child_"+$this.attr("id")).html(strHtml);
			}
		});
	})
	
	$("form :input").blur(function(){
		 var $parent = $(this).parent();
		 $parent.find(".red").remove();
		//验证标题
		 if( $(this).is('#title') ){
				if( this.value=="" || this.value.length < 6 ){
				    var errorMsg = '请输入标题。';
                   $parent.append('<span class="red onError">'+errorMsg+'</span>');
				}else{
				    var okMsg = '输入正确。';
				    $parent.append('<span class="red">'+okMsg+'</span>');
				}
		 }
		 //验证用户名
		 if( $(this).is('#askName') ){
				if( this.value=="" || this.value.length < 2 ){
				    var errorMsg = '请输入用户名。';
                   $parent.append('<span class="red onError">'+errorMsg+'</span>');
				}else{
				    var okMsg = '输入正确。';
				    $parent.append('<span class="red">'+okMsg+'</span>');
				}
		 }
		 //验证邮件
		 if( $(this).is('#email') ){
			if( this.value!=""){
				if ( this.value!="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value)){
					var errorMsg = '请输入正确的E-Mail地址。';
					$parent.append('<span class="red onError">'+errorMsg+'</span>');
				}else{
	                 var okMsg = '输入正确。';
					 $parent.append('<span class="red">'+okMsg+'</span>');
				}
			}
		 }
		//验证内容
		 if( $(this).is('#content') ){
			if( this.value=="" || this.value.length < 10 || this.value.length > 1000){
				var errorMsg = '字数限10至1000，目前'+this.value.length;
				$parent.append('<span class="red onError">'+errorMsg+'</span>');
			}else{
                 var okMsg = '输入正确。';
				 $parent.append('<span class="red">'+okMsg+'</span>');
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
		
		$askForm = $("#askForm");
		$.ajax({
			url: $askForm.attr("action"),
			type: "post",
			data: $askForm.serialize(),
			dataType: "json",
			cache: false,
			complete: function(message) {
				alert("提交成功,审核后答复！");
			}
		});
		
	 });

	
	//重置
	 $('#res').click(function(){
		$(".red").remove(); 
	 });



});