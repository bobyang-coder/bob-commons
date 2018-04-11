
function TimeFormat(a)
{
	var b =	document.getElementById(a).value;
	var digits = "0123456789:";
	var i = 0;
	var sLength = b.length;
	while ((i < sLength))
	{
		var c = b.charAt(i);
		if (digits.indexOf(c) == -1) 
		{
			alert("请输入4位数字,如0903");
			document.getElementById(a).value = "";
			document.getElementById(a).focus();
			return false;
		}
		i++;
	}
	if((b.length >0 && b.length < 4) || (b.indexOf(":") != -1 && b.length != 5))
	{
		alert("请输入4位数字,如0903");
		document.getElementById(a).value = "";
		document.getElementById(a).focus();
	}
	else if(b.length != 0)
	{
		var x = b.substr(0,2);

		var y = "";
		if(b.length == 4)
			y = b.substr(2,4);
		else if(b.length == 5)
			y = b.substr(3,4);

		if(parseInt(x) > 24)
		{
			alert("请输入正确的时间");
			document.getElementById(a).value = "";
			document.getElementById(a).focus();
			return ;
		}
		if(parseInt(y) > 59)
		{
			alert("请输入正确的时间");
			document.getElementById(a).value = "";
			document.getElementById(a).focus();
			return ;
		}
        if(x=='24' && y=='00'){
        	x='23';
        	y='59';
        }
		if(b.indexOf(":") == -1)
			document.getElementById(a).value = x+":"+y;
	
	}	
}

function TimeFormatZhengDian(a)
{
	var b =	document.getElementById(a).value;
	var digits = "0123456789:";
	var i = 0;
	var sLength = b.length;
	while ((i < sLength))
	{
		var c = b.charAt(i);
		if (digits.indexOf(c) == -1) 
		{
			alert("请输入4位数字,如0903");
			document.getElementById(a).value = "";
			document.getElementById(a).focus();
			return false;
		}
		i++;
	}
	if((b.length >0 && b.length < 4) || (b.indexOf(":") != -1 && b.length != 5))
	{
		alert("请输入4位数字,如0903");
		document.getElementById(a).value = "";
		document.getElementById(a).focus();
	}
	else if(b.length != 0)
	{
		var x = b.substr(0,2);

		var y = "";
		if(b.length == 4)
			y = b.substr(2,4);
		else if(b.length == 5)
			y = b.substr(3,4);
		if(y.substr(0,1)=='0'){
			y = y.substr(1,2);
		}
		if(parseInt(x) > 24)
		{
			alert("请输入正确的时间");
			document.getElementById(a).value = "";
			document.getElementById(a).focus();
			return ;
		}
		if(parseInt(y) > 59)
		{
			alert("请输入正确的时间");
			document.getElementById(a).value = "";
			document.getElementById(a).focus();
			return ;
		}
		if(parseInt(y) > 0 && parseInt(y) != 30)
		{
			if(parseInt(x)==23 && parseInt(y)==59){
				
			}else{
				alert("您好，保留时间只可输入半点或整点");
				document.getElementById(a).value = "";
				document.getElementById(a).focus();
				return ;
			}
		}
		if(b.length == 4)
			y = b.substr(2,4);
		else if(b.length == 5)
			y = b.substr(3,4);
        if(x=='24' && y=='00'){
        	x='23';
        	y='59';
        }
		if(b.indexOf(":") == -1)
			document.getElementById(a).value = x+":"+y;
	
	}	
}



/*
 * 将一个日期加上指定天数，返回新的日期，格式为:yyyy-MM-dd
 * strDate:原日期, n:要添加的的天数
 */
function calToDate(strDate, n){
	var start = new Date(strDate.substring(0,4),strDate.substring(5,7)-1,strDate.substring(8,10));
	var end = new Date(start.getTime() + n*24*3600*1000);
	var endYear = (end.getYear()<1000 ? end.getYear()+1900 : end.getYear());
	var endMonth = (end.getMonth()+1)<10? "0"+(end.getMonth()+1):(end.getMonth()+1);
	var endDate = (end.getDate())<10?"0"+end.getDate():end.getDate();		
	return ( endYear + "-" + endMonth + "-" +endDate );	
}

function DateAdd(sdate, days) {
    var a = new Date(sdate);
    a = a.valueOf();
    a = a + days * 24 * 60 * 60 * 1000;
    a = new Date(a);
    return a;
}
/**
 * 对指定时间加小时
 * @param {Object} strTime 操作的时间
 * @param {Object} n 需添加的小时
 */
function calToHour(strTime,n){
	 var timeArray = strTime.split(":");
	 var timeInt = parseInt(timeArray[0])+n;
	 if(timeInt<10){
		 return "0"+timeInt+":"+timeArray[1];;
	 }else{
		 return timeInt+":"+timeArray[1];;
	 }
	
}


//计算两日期之间的天数，不取绝对值
function  DateDiffNoAbs(beginDate,endDate){    
    var  arrbeginDate,  Date1,  Date2, arrendDate,  iDays  
    arrbeginDate=  beginDate.split("-")  
    Date1=  new  Date(arrbeginDate[0]  +  '-'  +  arrbeginDate[1]  +  '-'  +  arrbeginDate[2])    //转换为2007-8-10格式
    arrendDate=  endDate.split("-")  
    Date2=  new  Date(arrendDate[0]  +  '-'  +  arrendDate[1]  +  '-'  +  arrendDate[2])  
    iDays  =  parseInt((Date2 - Date1)  /  1000  /  60  /  60  /24)    //转换为天数 
    return  iDays  
}

//获取两个日期间的天数 //beginDate和endDate都是yyyy-MM-dd格式
function  DateDiff(beginDate,  endDate){    
	var  arrbeginDate,  Date1,  Date2, arrendDate,  iDays  
	arrbeginDate=  beginDate.split("-")
	Date1=  new  Date(arrbeginDate[0]  +  '-'  +  arrbeginDate[1]  +  '-'  +  arrbeginDate[2])    //转换为2007-8-10格式
	arrendDate=  endDate.split("-")  
	Date2=  new  Date(arrendDate[0]  +  '-'  +  arrendDate[1]  +  '-'  +  arrendDate[2])  
	iDays  =  parseInt(Math.abs(Date2-  Date1)  /  1000  /  60  /  60  /24)    //转换为天数 
	return  iDays  
}
 //计算两日期之间的小时数
   function  DateDiffHours(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
       var  aDate,  oDate1,  oDate2,  iDays  
       aDate  =  sDate1.split("-")  
       oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2006格式  
       aDate  =  sDate2.split("-")  
       oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
       iHour  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  )    //把相差的毫秒数转换为小时  
       return  iHour  
   } 
//取当前日期
  function getCurrentDate(){
  		var now= new Date();
		var year=now.getYear();
		var month=now.getMonth()+1;
		var day=now.getDate();
		if(day<10){
			day = "0"+day;
		}
		var current = year+"-"+month+"-"+day;
		if(month<10){
			current = year+"-0"+month+"-"+day;
		}
		return current;
  }
  function getCurrenttime(){
		var nowdate = new Date();
		var year = nowdate.getYear();
		var mon = nowdate.getMonth()+1;
		var day = nowdate.getDate();
		var hours = nowdate.getHours();
		var min = nowdate.getMinutes();
		var date = year+"-"+mon+"-"+day+" "+hours+":"+min;
		return date;
		
	}
  function getCurrenttimeSecond(){
		var nowdate = new Date();
		var year = nowdate.getYear();
		var mon = nowdate.getMonth()+1;
		if(mon<10){
			mon = "0"+mon;
		}
		var day = nowdate.getDate();
		if(day<10){
			day = "0"+day;
		}
		var hours = nowdate.getHours();
		if(hours<10){
			hours = "0"+hours;
		}
		var min = nowdate.getMinutes();
		if(min<10){
			min = "0"+min;
		}
		var date = year+"-"+mon+"-"+day+" "+hours+":"+min+":00";
		return date;
		
	}
  //获取当前小时数
  function getCurrentHour(){
	  	var nowdate = new Date();
		var year = nowdate.getYear();
		var mon = nowdate.getMonth()+1;
		var day = nowdate.getDate();
		var hours = nowdate.getHours();
		return hours;
  }
  function getCurTime(){
		var nowdate = new Date();
		var year = nowdate.getYear();
		var mon = nowdate.getMonth()+1;
		var day = nowdate.getDate();
		var hours = nowdate.getHours();
		if(hours<10){
			hours = "0"+hours;
		}
		var min = nowdate.getMinutes();
		if(min<10){
			min = "0"+min;
		}
		var date = hours+":"+min;
		
		return date;
		
	}
    function getAddCurTime(minute){
		var nowdate = new Date();
		nowdate.setMinutes(nowdate.getMinutes()+minute)
		var year = nowdate.getYear();
		var mon = nowdate.getMonth()+1;
		var day = nowdate.getDate();
		var hours = nowdate.getHours();
		if(hours<10){
			hours = "0"+hours;
		}
		var min = nowdate.getMinutes();
		if(min<10){
			min = "0"+min;
		}
		var date = hours+":"+min;
		
		return date;
		
	}
  //字符串转日期
  function StringToDate(DateStr)   
	{    
	    var converted = Date.parse(DateStr);   
	    var myDate = new Date(converted);   
	    if (isNaN(myDate))   
	    {    
	        //var delimCahar = DateStr.indexOf('/')!=-1?'/':'-';   
	        var arys= DateStr.split('-');   
	        myDate = new Date(arys[0],--arys[1],arys[2]);   
	    }   
	    return myDate;   
	} 
  //比较时间，时间格式xx:xx
    function compareTime(time1,time2){
    	var t1 = time1.split(":");
    	var t2 = time2.split(":");
    	if(parseInt(t2[0],10)>parseInt(t1[0],10)){
    		return true;
    	}else if(parseInt(t2[0],10)==parseInt(t1[0],10)){
    		if(parseInt(t2[1],10)>parseInt(t1[1],10)){
    			return true;
    		}
    	}
    	return false;
    }

	//校验开始时间、结束时间是否为空
	function checkDateIsNull(date1, date2, msg){
		var startDate = $("#" + date1).val();
		var endDate = $("#" + date2).val();	
				
		if(startDate == "" && endDate == ""){
			if(msg != undefined){
				alert(msg + "请选择时间段!");
			} else {
				alert("请选择时间段!");
			}			
			return false;
		}
		if(startDate!="" && endDate==""){
			if(msg != undefined){
				alert(msg + "请选择结束时间!");
			} else {
				alert("请选择结束时间!");
			}
			return false;
		}
		if(startDate=="" && endDate!=""){
			if(msg != undefined){
				alert(msg + "请选择开始时间!");
			} else {
				alert("请选择开始时间!");
			}			
			return false;
		}
		
		return true;
	}
	
	//时间校验
	function lastDateCheck(date1,date2, msg){
		var d1 = $("#" + date1).val().split('-');
		var d2 = $("#" + date2).val().split('-');
		date1 = new Date(d1[0],d1[1]-1,d1[2]);
		date2 = new Date(d2[0],d2[1]-1,d2[2]);
		
		if(date2 >= date1){
		 	return true;
		}else{ 
			if(msg != undefined){
				alert(msg + "错误：结束时间早于开始时间!");
			} else {
				alert("错误：结束时间早于开始时间!");
			}
			return false;
		}
	}


	
	//校验整数(正整数 + 负整数 + 0)	
	function validateInteger(obj, msg){
		var num = obj.value;
		if(num==''){
			return true;
		}
		if(!isInteger(num)){
			if(msg != undefined){
				alert(msg);
			} else {
				alert("请输入整数！");
			}		    
		    obj.value="";
		    obj.focus();
			return false;	
		}		
		return true;	
	}
	
	
	
	
	//校验非负整数即自然数(正整数 + 0)
	function validateNaturalNum(obj, msg){
		var num = obj.value;
		if(num==''){
			return true;
		}
		if(!isInteger(num)){
			if(msg != undefined){
				alert(msg);
			} else {
				alert("请输入正整数或0！");
			}		    
		    obj.value="";
		    obj.focus();
			return false;	
		}		
		return true;	
	}
	
		
	
	
	//校验正整数
	function validatePositiveNum(obj, msg){
		var num = obj.value;
		if(num==''){
			return true;
		}
		if(!isPositiveNum(num)){
			if(msg != undefined){
				alert(msg);
			} else {
				alert("请输入正整数！");
			}
		    obj.value="";
		    obj.focus();
			return false;	
		}		
		return true;	
	}

	//校验负整数
	function validateNegativeNum(obj, msg){
		var num = obj.value;
		if(num==''){
			return true;
		}
		if(!isNegativeNum(num)){
			if(msg != undefined){
				alert(msg);
			} else {
				alert("请输入负整数！");
			}
		    obj.value="";
		    obj.focus();
			return false;	
		}		
		return true;	
	}
	
	//校验浮点数（小数）
	function validateDecimal(obj, msg){
		var num = obj.value;
		if(num==''){
			return true;
		}
		if(!isDecimal(num)){
			if(msg != undefined){
				alert(msg);
			} else {
				alert("请输入数字（包括小数）！");
			}
		    obj.value="";
		    obj.focus();
			return false;	
		}		
		return true;	
	}
	
	//校验非负浮点数（小数）
	function validateNotNegativeDecimal(obj, msg){
		var num = obj.value;
		if(num==''){
			return true;
		}
		if(!isNotNegativeDecimal(num)){
			if(msg != undefined){
				alert(msg);
			} else {
				alert("请输入非负数（包括小数）！");
			}
		    obj.value="";
		    obj.focus();
			return false;	
		}		
		return true;	
	}
	
	//校验空
	function isNotNull(s) { 
		if (s=="") return false;
		return true;
	}
	
	//校验整数(正整数 + 负整数 + 0)
	function isInteger(s) {
		var patrn=/^-?\d+$/; 
		if (!patrn.exec(s)) return false;
		return true;
	}
	
	//校验非负整数即自然数(正整数 + 0)
	function isNaturalNum(s) {
		var patrn=/^\d+$/; 
		if (!patrn.exec(s)) return false;
		return true;
	}
	
	//校验正整数
	function isPositiveNum(s) {
		var patrn=/^[1-9][0-9]*$/; 
		if (!patrn.exec(s)) return false;
		return true;
	}
	
	//校验负整数
	function isNegativeNum(s) {
		var patrn=/^-[1-9][0-9]*$/; 
		if (!patrn.exec(s)) return false;
		return true;
	}
	
	//校验浮点数（小数）
	function isDecimal(s) {
		var patrn=/^(-?\d+)(\.\d+)?$/; 
		if (!patrn.exec(s)) return false;
		return true;
	}
	//校验非负浮点数（小数）
	function isNotNegativeDecimal(s) {
		var patrn=/^(\d+)(\.\d+)?$/; 
		if (!patrn.exec(s)) return false;
		return true;
	}
	
	//校验日期格式
	 function isDate(s) {
         var date = s;
         var result = date.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);

         if (result == null)
             return false;
         var d = new Date(result[1], result[3] - 1, result[4]);
         return (d.getFullYear() == result[1] && (d.getMonth() + 1) == result[3] && d.getDate() == result[4]);
     }
	//校验邮箱地址
	function isEmail(s) {
		var patrn=/.+@.+\.[a-zA-Z]{2,4}$/; 
		if (!patrn.exec(s)) return false;
		return true;
	}

	//校验普通电话号、传真号
	function isPhone(s) {
		var patrn=/^([0-9]{3,4})?([-])?[0-9]{6,8}([-][0-9]{1,6})?$/;
		if (!patrn.exec(s)) return false;
		return true;
	}
	
	/*判断是否是手机号*/
	function isMobile(s){			
		var patrn=/^1[3,4,5,8]{1}(\d){9}$/;
		if (!patrn.exec(s)) return false;
		return true;
	}
	/*
	* 判断是否是中国移动的手机号
	* 移动：134、135、136、137、138、139、147、150、151、152、154、157(TD)、158、159、182、183、187、188 
	* 联通：130、131、132 、145、155、156、185、186
	* 电信：180、189、133、153、（1349卫通）
	*/
	function isChinaMobile(s){		
		var patrn=/^13[5,6,7,8,9]{1}(\d){8}$/;
		var patrn1=/^15[0,1,2,4,7,8,9]{1}(\d){8}$/;
		var patrn2=/^18[2,3,7,8]{1}(\d){8}$/;
		var patrn3=/^134[0-8]{1}(\d){7}$/;
		var patrn4=/^14[7]{1}(\d){8}$/;
		if(!patrn.exec(s)&&!patrn1.exec(s)&&!patrn2.exec(s)&&!patrn3.exec(s)&&!patrn4.exec(s)) return false;
		return true;
	}	

	
