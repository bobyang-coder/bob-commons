var product = {
	init: function(){
		this.fav();
		this.detail();
		this.changeLocation();
	},
	changeLocation: function(){
		var $t = $("#change-location");
		var $e = $("#choose-location");
		var $province = $e.find("select[name = province]");
		var $city = $e.find("select[name = city]");
		$t.on("click", function(){
			$e.toggle();
		});
		$province.on("change", function(){
			$city.empty().append('<option value="">\u6b63\u5728\u8bfb\u53d6</option>');
			$.ajax({
				type: 'POST',
				data: 'province=' + $province.val(),
				url: '/index.php/Site/Ajax/getCity',
				dataType: 'JSON',
				success: function(json){
					$city.empty().append('<option value="">\u8bf7\u9009\u62e9\u5730\u533a</option>');
					$.each(json.data, function(i){
						$city.append('<option value="' + json.data[i].region_id + '">' + json.data[i].region_name + '</option>');
					});
				},
				error: function(){
					_alert("\u8bfb\u53d6\u5730\u533a\u5217\u8868\u5931\u8d25");
					$("#choose-location").hide();
				}
			});
		});
		$city.on("change", function(){
			if( $city.val().length > 0 ){
				$.ajax({
					type: 'POST',
					data: '&city_id=' + $city.val() + '&goods_id=' + $("input[name = goods_id]").val(),
					url: '/index.php/Site/Ajax/setCityCookie',
					dataType: 'JSON',
					success: function(json){
						if( parseInt(json.data.success) === 1 ){
							$("#current-location").html( $city.find(":selected").text() );
							if( $("#add-to-cart").size() > 0 ){
								if( parseInt(json.data.o2o) != 1 ){
									if( parseInt(json.data.tmall) != 0 ){
										$("#add-to-cart").hide();
										$("#stockout").hide();
										$("#goto-tmall").show();
									}else{
										$("#add-to-cart").hide();
										$("#goto-tmall").hide();
										$("#stockout").show();
									}
								}else{
									$("#stockout").hide();
									$("#goto-tmall").hide();
									$("#add-to-cart").show();
								}
							}				
						};
					},
					error: function(){
						_alert("\u8bbe\u7f6e\u5730\u533a\u5931\u8d25\uff0c\u8bf7\u8054\u7cfb\u5ba2\u670d");
					},
					complete: function(){
						$("#choose-location").hide();
					}
				});
			}
		});
	},
	fav: function(){
		$(".favorite").on("click", function(){
			InAjaxLoader();
			$.ajax({
				type: 'POST',
				data: 'productId=' + $(this).attr('rel'),
				url: 'favorite',
				success: function(data){
					UnAjaxLoader();
					switch( parseInt(data, 10) ){
						case 0:
							alert('\u8bf7\u5148\u767b\u5f55\u7f51\u7ad9');
							break;
						case 1:
							alert('\u5546\u54c1\u6536\u85cf\u6210\u529f');
							break;
						case 2:
							alert('\u5df2\u7ecf\u6536\u85cf\u8fc7\u4e86');
							break;
						default:
							alert('\u6536\u85cf\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5');
							break;
					};
				}
			});
		});
	},
	detail: function(){
		$.each( $(".detail").find("img:hidden") , function(){
			$(this).removeAttr("width").removeAttr("height");
	        if( $(this).width() >= 620 ){
	            $(this).attr("width", 310).removeAttr("height").show();
	        }else{
	        	$(this).attr("width", $(this).width()/2).removeAttr("height").show();
	        }
	    });
	}
};

$(function(){
	product.init();
});