/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */

package com.reapal.sms.model;

import java.io.Serializable;

import com.reapal.common.util.SpringUtils;
import com.reapal.common.util.StringUtils;
import com.reapal.core.cache.ParameterCache;
import com.reapal.core.cache.DeptCache;

public class SmsSend implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 主键ID */
	private Long keyId;
	/** 短信类型 */
	private java.lang.String smsType;
	/** 手机号 */
	private java.lang.String phone;
	/** 短信内容 */
	private java.lang.String content;
	/** 发送通道ID */
	private java.lang.String channelId;
	/** 发送状态 */
	private java.lang.String channelStatus;
	/** 发送时间 */
	private java.util.Date sendDateTime;
	/** 创建人 */
	private java.lang.String createUserId;
	/** 创建时间 */
	private java.util.Date createDateTime;

	public Long getKeyId() {
		return this.keyId;
	}
	
	public void setKeyId(Long value) {
		this.keyId = value;
	}
	
	
	
	
	
	public java.lang.String getSmsType() {
		return this.smsType;
	}
	
	public void setSmsType(java.lang.String value) {
		this.smsType = value;
	}
	
	
	
	
	
	public java.lang.String getPhone() {
		return this.phone;
	}
	
	public void setPhone(java.lang.String value) {
		this.phone = value;
	}
	
	
	
	
	
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}
	
	
	
	
	
	public java.lang.String getChannelId() {
		return this.channelId;
	}
	
	public void setChannelId(java.lang.String value) {
		this.channelId = value;
	}
	
	
	
	
	
	public java.lang.String getChannelStatus() {
		return this.channelStatus;
	}
	
	public void setChannelStatus(java.lang.String value) {
		this.channelStatus = value;
	}
	
	
	
	
	
	public java.util.Date getSendDateTime() {
		return this.sendDateTime;
	}
	
	public void setSendDateTime(java.util.Date value) {
		this.sendDateTime = value;
	}
	
	
	
	
	
	public java.lang.String getCreateUserId() {
		return this.createUserId;
	}
	
	public void setCreateUserId(java.lang.String value) {
		this.createUserId = value;
	}
	
	
	
	
	
	public java.util.Date getCreateDateTime() {
		return this.createDateTime;
	}
	
	public void setCreateDateTime(java.util.Date value) {
		this.createDateTime = value;
	}
	
	
	
	
	

}

