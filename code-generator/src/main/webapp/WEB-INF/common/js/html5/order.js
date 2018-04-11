var order = {
	init: function(){
        this.user();
		this.brand();
		this.store();
        //this.getDateList();
        //this.getTimeList();
		this.invoice();
		this.coupon();
		this.validation();
	},
	user: function(){

		var CTRL = $(".user_select"),
			LIST = $(".user_list"),
			SAVE = $('.user_save');

		var NAME = $('input[name = consignee]'),
			GENDER = $('select[name = gender]'),
			MOBILE = $('input[name = tel]'),
			MAIL = $('input[name = email]'),
			NUMBER = $('input[name = number]');

		CTRL.on("click", function(){
			if( $(this).is(".open") ){
				$(this).removeClass("open");
				$(this).text("[\u9009\u62e9\u5e38\u7528\u8054\u7cfb\u4eba]");
				LIST.hide();
			}else{
				$(this).addClass("open");
				$(this).text("[\u6536\u8d77]");
				LIST.show();
			}
		});

		LIST.delegate("dt", "click", function() {
			var data = $(this).parents("dl").attr("widget-data").split("|");
			NAME.val( data[0] );
			GENDER.find("option[value = "+ data[1] +"]").attr("selected", "selected");
			MOBILE.val( data[2] );
			MAIL.val( data[3] );
			NUMBER.val( data[4] );
			CTRL.click();
		});

		LIST.delegate("dd", "click", function() {
			if(confirm("\u786e\u5b9a\u5220\u9664\uff1f")){
				var UID = $(this).parents("dl").attr("uid");
				InAjaxLoader();
				$.ajax({
					type: "POST",
					data: "cid=" + UID,
					url: "/index.php/Order/OrderAjax/deleteConsignee",
					success: function(data){
						UnAjaxLoader();
						if( data != 1 ){
							alert("\u5220\u9664\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5");
						}else{
							LIST.find("dl[uid = "+ UID + "]").remove();
							if( LIST.find('dl').size() == 0 ){
								CTRL.click();
								CTRL.hide();
							}
						}
					}
				});	
			}
		}); 

		SAVE.on('click', function(){
			if( LIST.children('dl').size() >= 5 ){
				alert('\u6700\u591a\u4e94\u4e2a\u5e38\u7528\u4fe1\u606f');
				return false;
			}
			var REG = /^([a-zA-Z0-9]+[_|\_|\.|\-]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.|\-]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if( NAME.val().trim().length == 0 ){
				NAME.focus();
				return false;
			}
			if( !(/^1[3|4|5|8][0-9]\d{8}$/.test( MOBILE.val().trim() )) ){
				MOBILE.focus();
				return false;
			}
			if( !REG.test( MAIL.val().trim() ) ){
				MAIL.focus();
				return false;
			}
			if( !(/^[a-zA-Z0-9]{4,4}$/).test( NUMBER.val().trim() )){
				NUMBER.focus();
				return false;
			}
			InAjaxLoader();
			$.ajax({
				type: 'POST',
				data: 'name='+ NAME.val() +'&gender='+ GENDER.val() +'&email='+ MAIL.val() +'&mobile='+ MOBILE.val() +'&number='+ NUMBER.val(),
				url: '/index.php/Order/OrderAjax/addConsignee',
				success: function(data){
					UnAjaxLoader();
					LIST.append( data );
					CTRL.show();
				}
			});
		});

	},
	brand: function(){
		var $brand = $('select[name = auto_brand]');
		var $vehicle = $('select[name = vehicle]');
		var _All = '\u8bf7\u9009\u62e9\u8f66\u7cfb';
		var _Loading = '\u6b63\u5728\u8bfb\u53d6\u8f66\u7cfb';
		
		$brand.on("change", function(){
			$("#order_store").hide();
			if( $(this).val().trim().length == 0 ){
				$vehicle.empty().append('<option value="">' + _All + '</option>');
			}else{
				$vehicle.empty().append('<option value="">' + _Loading + '</option>');
				InAjaxLoader();
				$.ajax({
					type: 'POST',
					data: 'auto_brand=' + $brand.val(),
					url: '/index.php/Ajax/MachVehicle',
					dataType: 'JSON',
					success: function(json){
						UnAjaxLoader();
						$vehicle.empty().append('<option value="">' + _All + '</option>');
						$.each(json.data, function(i, v){
							$vehicle.append('<option value="' + v + '">' + v + '</option>');
						});
					}
				});
				
			}
		});

		$vehicle.on("change", function(){
                    var A  = $('select[name = area]');
                    InAjaxLoader();
                    $.ajax({
                            type: 'POST',
                            data: 'brand=' + $brand.val() + "&vehicle" + $vehicle.val(),
                            url: '/index.php/Order/OrderAjax/getSpecialStore',
                            dataType: 'JSON',
                            success: function(json){
                                    UnAjaxLoader();
                                    A.empty().append('<option value="">\u8bf7\u9009\u62e9\u5730\u533a</option>');
                                    $.each(json.data, function(i, v){
                                           A.append('<option value="' + json.data[i].region_id + '">' + json.data[i].region_name + '</option>');
                                    });
                            }
                    });
                    //$('select[name = province]').children(":first").attr("selected", "selected").siblings(":selected").removeAttr("selected");
                    //$('select[name = city]').empty().append('<option value="">\u8bf7\u9009\u62e9\u5730\u533a</option>');
                    //$('select[name = area]').empty().append('<option value="">\u8bf7\u9009\u62e9\u5730\u533a</option>');
                    $('select[name = store]').empty().append('<option value="">\u8bf7\u9009\u62e9\u53ef\u9884\u7ea6\u95e8\u5e97</option>');
                    $('select[name = date]').empty().append('<option value="">\u8bf7\u9009\u62e9\u53ef\u5b89\u88c5\u65e5\u671f</option>');
                    $('select[name = time]').empty().append('<option value="">\u8bf7\u9009\u62e9\u53ef\u5b89\u88c5\u65f6\u95f4</option>');
                    if( $(this).val().trim().length > 0 ){
                            $("#order_store").show();
                    }else{
                            $("#order_store").hide();
                    }
			
		});
	},
	store: function(){
		var B = $('select[name = auto_brand]'),
			V = $('select[name = vehicle]'),
			P = $('select[name = province]'),
			C = $('select[name = city]'),
			A = $('select[name = area]'),
			S = $('select[name = store]'),
			D = $('select[name = date]'),
			T = $('select[name = time]');

		var C_ALL = "\u8bf7\u9009\u62e9\u5e02",
			A_ALL = "\u8bf7\u9009\u62e9\u5730\u533a",
			S_ALL = "\u8bf7\u9009\u62e9\u53ef\u9884\u7ea6\u95e8\u5e97",
			D_ALL = "\u8bf7\u9009\u62e9\u53ef\u5b89\u88c5\u65e5\u671f",
			T_ALL = "\u8bf7\u9009\u62e9\u53ef\u5b89\u88c5\u65f6\u95f4";
		
		var _Loading = "\u6b63\u5728\u8bfb\u53d6 ...";

		P.on("change", function(){
			A.empty().append('<option value="">' + A_ALL + '</option>');
			S.empty().append('<option value="">' + S_ALL + '</option>');
			D.empty().append('<option value="">' + D_ALL + '</option>');
			T.empty().append('<option value="">' + T_ALL + '</option>');
			if( B.val().trim().length > 0 && V.val().trim().length > 0 && P.val().trim().length > 0 ){
				C.empty().append('<option value="">' + _Loading + '</option>');
				InAjaxLoader();
				$.ajax({
					type: 'POST',
					data: 'id='+ P.val() + '&brand=' + B.val() + '&vehicle=' + V.val(),
					url: '/index.php/Order/OrderAjax/get_city',
					dataType: 'JSON',
					success: function(json){
						UnAjaxLoader();
						C.empty().append('<option value="">' + C_ALL + '</option>');
						$.each(json.data, function(i, v){
							C.append('<option value="' + json.data[i].region_id + '">' + json.data[i].region_name + '</option>');
						});
					}
				});
			}else{
				C.empty().append('<option value="">' + C_ALL + '</option>');
			}
		});

		C.on("change", function(){
			S.empty().append('<option value="">' + S_ALL + '</option>');
			D.empty().append('<option value="">' + D_ALL + '</option>');
			T.empty().append('<option value="">' + T_ALL + '</option>');
			if( B.val().trim().length > 0 && V.val().trim().length > 0 && P.val().trim().length > 0 ){
				A.empty().append('<option value="">' + _Loading + '</option>');
				InAjaxLoader();
				$.ajax({
					type: 'POST',
					data: 'id='+ C.val() + '&brand=' + B.val() + '&vehicle=' + V.val(),
					url: '/index.php/Order/OrderAjax/get_area',
					dataType: 'JSON',
					success: function(json){
						UnAjaxLoader();
						A.empty().append('<option value="">' + A_ALL + '</option>');
						$.each(json.data, function(i, v){
							A.append('<option value="' + json.data[i].region_id + '">' + json.data[i].region_name + '</option>');
						});
					}
				});
			}else{
				A.empty().append('<option value="">' + A_ALL + '</option>');
			}
		});

		A.on("change", function(){
			D.empty().append('<option value="">' + D_ALL + '</option>');
			T.empty().append('<option value="">' + T_ALL + '</option>');
			if( B.val().trim().length > 0 && V.val().trim().length > 0 && C.val().trim().length > 0 ){
				S.empty().append('<option value="">' + _Loading + '</option>');
				InAjaxLoader();
				$.ajax({
					type: 'POST',
					data: 'id='+ A.val() + '&brand=' + B.val() + '&vehicle=' + V.val(),
					url: '/index.php/Order/OrderAjax/get_store',
					dataType: 'JSON',
					success: function(json){
						UnAjaxLoader();
						S.empty().append('<option value="">' + S_ALL + '</option>');
						$.each(json.data, function(i, v){
							S.append('<option value="' + json.data[i].id + '">' + json.data[i].store_name + '</option>');
						});
					}
				});	
			}else{
				S.empty().append('<option value="">' + S_ALL + '</option>');
			}
		});

		S.on("change", function(){
			T.empty().append('<option value="">' + T_ALL + '</option>');
			if( S.val().trim().length > 0 ){
				D.empty().append('<option value="">' + _Loading + '</option>');
				InAjaxLoader();
				$.ajax({
					type: 'POST',
					data: 'store_id=' + S.val(),
					url: '/index.php/Order/OrderAjax/getDateList',
					dataType: 'JSON',
					success: function(json){
						UnAjaxLoader();
						D.empty().append('<option value="">' + D_ALL + '</option>');
						$.each(json.data, function(i, v){
							D.append('<option value="' + i + '">' + v + '</option>');
						});
					}
				});
			}else{
				D.empty().append('<option value="">' + D_ALL + '</option>');
			}
		});

		D.on("change", function(){
			if( D.val().trim().length > 0 ){
				T.empty().append('<option value="">' + _Loading + '</option>');
				InAjaxLoader();
				$.ajax({
					type: 'POST',
					data: 'store_id=' + S.val() + '&date=' + D.val(),
					url: '/index.php/Order/OrderAjax/getTimeList',
					dataType: 'JSON',
					success: function(json){
						UnAjaxLoader();
						T.empty().append('<option value="">' + T_ALL + '</option>');
						$.each(json.data, function(i, v){
							T.append('<option value="' + v + '">' + v + '</option>');
						});
					}
				});				
			}else{
				T.empty().append('<option value="">' + T_ALL + '</option>');
			}
		});

	},
	invoice: function(){
		$("select[name = invoice]").on("change", function(){
			if( $(this).val() == 1 ){
				$(".invoice-input").show();
			}else{
				$(".invoice-input").hide();
			}
		});
	},
	coupon: function(){
		$(".coupon").on("click", function(){
			var code = prompt("\u8bf7\u8f9316\u516d\u4f4d\u4f18\u60e0\u7801");
			if( code.length == 16){
				InAjaxLoader();
				$.ajax({
					type: 'POST',
					data: 'code=' + code,
					url: '/index.php/Order/OrderAjax/addCoupon',
					dataType: 'JSON',
					success: function(json){
						UnAjaxLoader();
						if(json.success == 1){
							$(".coupon").hide();
							$(".total").html(json.total);
							$("input[name = coupon]").val(code);
						}else{
							alert("\u65e0\u6548\u7684\u4f18\u60e0\u7801");
						}
					}
				});
			}else{
				alert("\u65e0\u6548\u7684\u4f18\u60e0\u7801");
			}
		});
	},
	validation: function(){
		$(".button").on("click", function(){
			// user info
			//var email_reg = /^([a-zA-Z0-9]+[_|\_|\.|\-]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.|\-]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			var mobile_reg = /^1[3|4|5|8][0-9]\d{8}$/;
			var consignee = $("input[name = consignee]");
			var tel = $("input[name = phone]");
			//var email = $("input[name = email]");
			//var number = $("input[name = number]");
			if( consignee.val().length == 0 ){
				consignee.focus();
				return false;
			}
			if( !mobile_reg.test( tel.val().trim() ) ){
				tel.focus();
				return false;
			}
//			if( !email_reg.test( email.val().trim() ) ){
//				email.focus();
//				return false;
//			}
//			if( !(/^[a-zA-Z0-9]{4,4}$/).test( number.val().trim() ) ){
//				number.focus();
//				return false;
//			}
			// car & store
//			var brand = $("select[name = auto_brand]");
//			var vehicle = $("select[name = vehicle]");
//			var province = $('select[name = province]');
//			var city = $('select[name = city]');
//			var store = $("select[name = store]");
//			var date = $("select[name = date]");
//			var time = $("select[name = time]");
//			if( brand.val().length == 0 ){
//				brand.focus();
//				return false;
//			}
//			if( vehicle.val().length == 0 ){
//				vehicle.focus();
//				return false;
//			}
//			if( province.val().length == 0 ){
//				province.focus();
//				return false;
//			}
//			if( city.val().length == 0 ){
//				city.focus();
//				return false;
//			}
//			if( store.val().length == 0 ){
//				store.focus();
//				return false;
//			}
//			if( date.val().length == 0 ){
//				date.focus();
//				return false;
//			}
//			if( time.val().length == 0 ){
//				time.focus();
//				return false;
//			}
			// invoice
//			var invoice = $("select[name =invoice]");
//			var invoice_title = $("input[name = invoice_title]");
//			if( invoice.val() == 1 ){
//				if( invoice_title.val().length == 0 ){
//					invoice_title.focus();
//					return false;
//				}
//			}
			// submit
			$("form").submit();
			$(this).hide();
		});
	}
};

$(function(){
	order.init();
});
