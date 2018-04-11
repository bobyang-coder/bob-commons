/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */

package com.reapal.sms.model.query;

import com.reapal.sms.model.SmsSend;
import com.reapal.sms.model.*;


public class SmsSendQuery extends SmsSend {
	private static final long serialVersionUID = 1L;
	
	/** 关键字查询 */
	private java.lang.String keyWord;

	public java.lang.String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(java.lang.String keyWord) {
		this.keyWord = keyWord;
	}
	
}
