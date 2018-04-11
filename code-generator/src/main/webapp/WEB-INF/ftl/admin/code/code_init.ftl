<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign ctx = request.contextPath/> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<title>列表</title>

	<link href="${ctx}/common/css/base.css" rel="stylesheet" type="text/css"/>
	<link href="${ctx}/common/css/common.css" rel="stylesheet" type="text/css"/>
	<script src="${ctx}/common/js/jquery.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/common.js" type="text/javascript"></script>
	<script src="${ctx}/common/js/list.js" type="text/javascript"></script>
</head>
<body>
	<form action="${ctx}/admin/code" method="get" name="listForm" id="listForm">
		<div class="bar">
			<div class="buttonWrap">
				<a href="javascript:;" id="refreshButton" class="iconButton fl">
					<span class="iconSpan refreshIcon">&nbsp;</span>刷新

				</a>
			</div>
		</div>
		
		<div class="body-box">
			<input type="hidden" name="_method" id="_method" value=""/>
			<table id="listTable" class="list">
				<thead>
					<tr>
						<th>序号</th>

						<th>数据库</th>
	
					<th>类型</th>

						<th>操作</th>

					</tr>
				</thead>
				
				<tbody>
		
		
		
               <tr>
               <td>1</td>
               <td>report210(10.168.16.210:1521/devps)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=report&password=report&schema=REPORT">选定</a>

               </td>
               </tr>	


               <tr>
               <td>2</td>
               <td>message210(10.168.16.210:1521/devps)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=message&password=message&schema=MESSAGE">选定</a>

               </td>
               </tr>


  			   <tr>
               <td>3</td>
               <td>base210(10.168.16.210:1521/devps)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=base&password=base&schema=BASE">选定</a>

               </td>
               </tr>
			
			
  			   <tr>
               <td>4</td>
               <td>center210(10.168.16.210:1521/devps)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=center&password=center&schema=CENTER">选定</a>

               </td>
               </tr>

 			   <tr>
               <td>5</td>
               <td>dk211(10.168.16.211:1521/devpr)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.211:1521:devpr&driver=oracle.jdbc.driver.OracleDriver&username=dk&password=dk&schema=DK">选定</a>

               </td>
               </tr>

               <tr>
               <td>6</td>
               <td>cashier-16-211(10.168.16.211:1521/devpr)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.211:1521:devpr&driver=oracle.jdbc.driver.OracleDriver&username=cashier&password=cashier&schema=CASHIER_R">选定</a>

               </td>
               </tr>
			   
			   
               <tr>
               <td>7</td>
               <td>fast-16-211(10.168.16.211:1521:devpr)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.211:1521:devpr&driver=oracle.jdbc.driver.OracleDriver&username=fast&password=fast&schema=FAST">选定</a>

               </td>
               </tr>

               <tr>
               <td>8</td>
               <td>agent210(10.168.16.210:1521/devps)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=agent&password=agent1&schema=AGENT">选定</a>

               </td>
               </tr>
			   
			   
               <tr>
               <td>9</td>
               <td>account(10.168.16.210:1521/devps)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=account&password=account&schema=ACCOUNT">选定</a>

               </td>
               </tr>
			   
			   
			   <tr>
               <td>10</td>
               <td>identify-16-211(10.168.16.211:1521:devpr)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.211:1521:devpr&driver=oracle.jdbc.driver.OracleDriver&username=identify&password=identify&schema=IDENTIFY">选定</a>

               </td>
               </tr>


             
                           <tr>
               <td>11</td>
               <td>>csmfnace(10.168.16.210:1521/devps)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=csmfnace&password=csmfnace&schema=CSMFNACE">选定</a>

               </td>
               </tr>
               
               
               <tr>
               <td>12</td>
               <td>CASHIER(10.168.17.212:1521:testnewall)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.17.212:1521:testnewall&driver=oracle.jdbc.driver.OracleDriver&username=cashier&password=cashiernew12&schema=CASHIER">选定</a>

               </td>
               </tr>
               
               <tr>
               <td>13</td>
               <td>fast-17-212(10.168.17.212:1521:testnewall)</td>
               <td>Oracle</td>
               <td>
               <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.17.212:1521:testnewall&driver=oracle.jdbc.driver.OracleDriver&username=fast&password=fastnew12&schema=FAST">选定</a>
               </td>
               </tr>

               <tr>
                   <td>14</td>
                   <td>tariff210(10.168.16.210:1521/devps)</td>
                   <td>Oracle</td>
                   <td>
                       <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=tariff&password=tariff&schema=TARIFF">选定</a>

                   </td>
               </tr>
               <tr>
                   <td>15</td>
                   <td>blanknote210(10.168.16.210:1521/devps)</td>
                   <td>Oracle</td>
                   <td>
                       <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=blanknote&password=blanknote&schema=BLANKNOTE">选定</a>

                   </td>
               </tr>
               <tr>
                   <td>16</td>
                   <td>settle210(10.168.16.210:1521/devps)</td>
                   <td>Oracle</td>
                   <td>
                       <a href="${ctx}/admin/code?url=jdbc:oracle:thin:@10.168.16.210:1521:devps&driver=oracle.jdbc.driver.OracleDriver&username=settle&password=settle&schema=SETTLE">选定</a>

                   </td>
               </tr>

               </tbody>
			</table>
		</div>
	</form>
</body>
</html>
