/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */


package com.reapal.sms.business;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import java.util.List;

import com.reapal.common.model.ResultList;
import com.reapal.common.page.Page;
import com.reapal.sms.model.SmsSend;
import com.reapal.sms.service.SmsSendService;
import com.reapal.sms.model.query.SmsSendQuery;

@Component
public class SmsSendBusiness {

	@Reference(timeout = 3000)
	private SmsSendService smsSendService;
	
	/**
	 * 显示列表
	 */
	public ResultList querySmsSend(SmsSendQuery smsSendQuery,Page page){
		return smsSendService.querySmsSend(smsSendQuery,page);
	}
	
	
	/**
	 * 保存信息
	 */
	public void insertSmsSend(SmsSend smsSend){
		if(smsSend.getKeyId()==null || smsSend.getKeyId().intValue()==0){	
			smsSendService.insertSmsSend(smsSend);
		}
	}
	
	
	/**
	 * 修改信息
	 */
	public String updateSmsSend(SmsSend smsSend){
		if(smsSend.getKeyId()!=null){
			smsSendService.updateSmsSend(smsSend);
	  }
		
		return "";
	}
	
	/**
	 * 得到对象
	 */
	public SmsSend getSmsSendById(Integer smsSendId){
        return smsSendService.getSmsSendById(smsSendId);
  }
  
	/**
	 * 删除指定信息
	 */
	public void deleteSmsSend(java.lang.Integer id){
		smsSendService.deleteSmsSend(id);
	}

}

