/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */

package com.reapal.sms.dao.impl;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.reapal.common.dao.impl.BaseIbatis3DaoImpl;
import com.reapal.common.dynamicds.DataSourceConst;
import com.reapal.common.dynamicds.DataSourceHandle;
import com.reapal.common.page.Page;
import com.reapal.sms.dao.*;
import com.reapal.sms.model.*;
import com.reapal.sms.model.query.*;

@Repository
public class SmsSendDaoImpl extends BaseIbatis3DaoImpl<SmsSend,Integer> implements SmsSendDao {
	public SmsSend getSmsSendById(Integer smsSendId) {
		DataSourceHandle.setDataSourceType(DataSourceConst.READ);
		return (SmsSend)this.getById(smsSendId);
	}

	public void insertSmsSend(SmsSend smsSend) {
		DataSourceHandle.setDataSourceType(DataSourceConst.WRITE);
		this.insert(smsSend);
	}

	public int getCountSmsSend(SmsSendQuery smsSendQuery){
		DataSourceHandle.setDataSourceType(DataSourceConst.READ);
		return (Integer) this.selectOne("getCountSmsSend",smsSendQuery);
	}
	
	public List<SmsSend> querySmsSend(SmsSendQuery smsSendQuery,Page page){
		DataSourceHandle.setDataSourceType(DataSourceConst.READ);
		return this.selectList("listSmsSend", smsSendQuery,page.getCurrentResult(),page.getPageSize());
	}
	
	public List<SmsSend> querySmsSend(SmsSendQuery smsSendQuery){
		DataSourceHandle.setDataSourceType(DataSourceConst.READ);
		return this.selectList("listSmsSend", smsSendQuery);
	}

	public void updateSmsSend(SmsSend smsSend) {
		DataSourceHandle.setDataSourceType(DataSourceConst.WRITE);
		this.update(smsSend);
	}


	public void deleteSmsSend(Integer smsSendId){
		DataSourceHandle.setDataSourceType(DataSourceConst.WRITE);
		this.delete(smsSendId);
	}
}
