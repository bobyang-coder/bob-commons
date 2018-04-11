/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */

package com.reapal.sms.service;

import java.util.*;
import java.util.List;
import org.springframework.stereotype.Service;
import com.reapal.common.page.Page;
import com.reapal.common.model.ResultList;
import com.reapal.sms.model.*;
import com.reapal.sms.model.query.*;

@Service
public interface SmsSendService {
	public SmsSend getSmsSendById(Integer smsSendId);

	public boolean insertSmsSend(SmsSend smsSend) ;

	public ResultList querySmsSend(SmsSendQuery smsSendQuery,Page page);
	
	public List<SmsSend> querySmsSend(SmsSendQuery smsSendQuery);

	public void updateSmsSend(SmsSend smsSend);

	public void deleteSmsSend(Integer smsSendId);
}
