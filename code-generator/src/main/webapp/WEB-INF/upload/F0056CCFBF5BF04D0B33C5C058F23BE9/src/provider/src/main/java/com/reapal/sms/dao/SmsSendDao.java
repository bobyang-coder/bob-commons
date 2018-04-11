/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */

package com.reapal.sms.dao;

import java.util.*;
import org.springframework.stereotype.Repository;
import com.reapal.common.page.Page;
import com.reapal.sms.model.*;
import com.reapal.sms.model.query.*;

@Repository
public interface SmsSendDao {
	public SmsSend getSmsSendById(Integer smsSendId);

	public void insertSmsSend(SmsSend smsSend);

	public int getCountSmsSend(SmsSendQuery smsSendQuery);
	
	public List<SmsSend> querySmsSend(SmsSendQuery smsSendQuery,Page page);
	
	public List<SmsSend> querySmsSend(SmsSendQuery smsSendQuery);

	public void updateSmsSend(SmsSend smsSend);

	public void deleteSmsSend(Integer smsSendId);
}
