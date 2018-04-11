/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */

package com.reapal.sms.service;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;
import com.fei.common.page.Page;

import com.reapal.sms.model.*;
import com.reapal.sms.dao.*;
import com.reapal.sms.dao.impl.*;
import com.reapal.sms.service.*;
import com.reapal.sms.service.impl.*;
import com.reapal.sms.model.query.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/ApplicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
public class SmsSendServiceTest {

	
	@Autowired
	private SmsSendService smsSendService;
	

	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		SmsSend obj = newSmsSend();
		smsSendService.insertSmsSend(obj);
		
		smsSendService.updateSmsSend(obj);
		
		//assertNotNull(obj.getKeyId());
		
		smsSendService.deleteSmsSend(obj.getKeyId());
	
	}
	
	public static SmsSend newSmsSend() {
		SmsSend obj = new SmsSend();
		
	  	obj.setSmsType(new java.lang.String("1"));
	  	obj.setPhone(new java.lang.String("1"));
	  	obj.setContent(new java.lang.String("1"));
	  	obj.setChannelId(new java.lang.String("1"));
	  	obj.setChannelStatus(new java.lang.String("1"));
	  	obj.setSendDateTime(new java.util.Date(System.currentTimeMillis()));
	  	obj.setCreateUserId(new java.lang.String("1"));
	  	obj.setCreateDateTime(new java.util.Date(System.currentTimeMillis()));
		return obj;
	}
}
