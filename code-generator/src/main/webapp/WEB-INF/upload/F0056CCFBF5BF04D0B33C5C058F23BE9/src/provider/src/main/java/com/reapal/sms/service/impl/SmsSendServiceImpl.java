/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */

package com.reapal.sms.service.impl;

import java.util.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.dubbo.config.annotation.Service;
import com.reapal.common.model.ResultList;
import com.reapal.common.page.Page;
import com.reapal.sms.service.*;
import com.reapal.sms.dao.*;
import com.reapal.sms.model.*;
import com.reapal.sms.model.query.*;

@Service
public class SmsSendServiceImpl implements SmsSendService {
	@Autowired
	private SmsSendDao smsSendDao;
	
	public SmsSend getSmsSendById(Integer smsSendId) {
		return smsSendDao.getSmsSendById(smsSendId);
	}

	public boolean insertSmsSend(SmsSend smsSend) {
		smsSendDao.insertSmsSend(smsSend);
		return true;
	}

	public ResultList querySmsSend(SmsSendQuery smsSendQuery,Page page){
		ResultList resultList = new ResultList();
		page.setTotalResult(smsSendDao.getCountSmsSend(smsSendQuery));

    resultList.setPage(page);
    resultList.setList(smsSendDao.querySmsSend(smsSendQuery,page));

		return resultList;
	}
	
	public List<SmsSend> querySmsSend(SmsSendQuery smsSendQuery){
		return smsSendDao.querySmsSend(smsSendQuery);
	}

	public void updateSmsSend(SmsSend smsSend) {
		smsSendDao.updateSmsSend(smsSend);
	}


	public void deleteSmsSend(Integer smsSendId){
		smsSendDao.deleteSmsSend(smsSendId);
	}
}
