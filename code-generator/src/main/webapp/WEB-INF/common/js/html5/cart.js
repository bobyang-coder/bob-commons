var cart = {
	init: function(){
		this.isWechat();
		this.full();
		this.num();
		this.del();
		this.changeType();
		this.changeNum();
	},
	isWechat: function(){
		var ua = navigator.userAgent.toLowerCase();
		if(ua.match(/MicroMessenger/i)=="micromessenger") {
			$("input[name = wechat]").val("1");
	 	}
	},
	reset: function(a,b,c,d){
		$("#C1").html(a);
		$("#C2").html(b + "\u6761");
		$("#C3").html("-" + c + "\u5143");
		$("#C4").html(d + "\u5143");
		$(".old_num").empty();
		for(var i = 0; i <= parseInt(a); i++){
			if( i == parseInt(b) ){
				$("<option value="+ i +" selected=\"selected\">"+ i +"</option>").appendTo( $(".old_num") )
			}else{
				$("<option value="+ i +">"+ i +"</option>").appendTo( $(".old_num") )
			}
		}
	},
	ajax: function(p_id, p_num, c_type, c_num, a_type){
		InAjaxLoader();
		$.ajax({
			type: 'POST',
			data: 'id=' + p_id + '&number=' + p_num + '&type=' + c_type + '&change=' + c_num,
			url: '/index.php/Order/OrderAjax/getCart',
			dataType: 'JSON',
			success: function(json){
				UnAjaxLoader();
				if( typeof a_type == "object" ){
					if( json.goods_num == 0 ){
						window.location.reload(0);
						return false;
					}else{
						$(a_type).parents("dl").remove();
					}
				}
				cart.reset(json.goods_num,json.change_num,json.change_total,json.total);
			}
		});
	},
	num: function(){
		$(".goods_num").on("change", function(){
			var arr = $(".goods_num");
			var count = 0;
			for(var i = 0; i < arr.length; i++){
				count += parseInt(arr.eq(i).val());
			}
			if(count > 5){
				alert("\u6bcf\u4e2a\u8ba2\u5355\u6700\u591a\u8ba2\u8d2d\u4e94\u6761");
				window.location.reload(0);
			}else{
				cart.ajax($(this).parents("dl").attr("key"),$(this).val(),"","","");
			}		
	    });
	},
	del: function(){
		$(".del").on("click", function(){
	        if(confirm("确定删除此商品")){
	            cart.ajax($(this).parents("dl").attr("key"),"","","",$(this));
	            
	        }
	    });
	},
	changeType: function(){
		$(".jthg").find(':radio').on("click", function(){
	        cart.ajax("","",$(this).val(),"","");
	    });
	},
	changeNum: function(){
		$(".old_num").on("change", function(){
	        cart.ajax("","","",$(this).val(),"");
	    });
	},
	full: function(){
		if( parseInt($('.w').attr('full')) == 1 ){
			alert("\u6bcf\u4e2a\u8ba2\u5355\u6700\u591a\u8ba2\u8d2d\u4e94\u6761");
		}
	}
};

$(function(){
	cart.init();
});
