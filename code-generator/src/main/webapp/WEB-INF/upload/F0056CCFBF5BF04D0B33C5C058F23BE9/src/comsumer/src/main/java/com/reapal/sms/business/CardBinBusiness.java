/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */


package com.reapal.payframework.core.system.business;

import com.reapal.common.model.ResultList;
import com.reapal.common.page.Page;
import com.reapal.payframework.core.system.model.CardBin;
import com.reapal.payframework.core.system.model.query.CardBinQuery;
import com.reapal.payframework.core.system.service.CardBinService;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import java.util.List;


@Component
public class CardBinBusiness{

    @Reference(timeout = 3000)
    private CardBinService cardBinService;

	/**
	 * 显示列表
	 */
	public ResultList queryCardBin(CardBinQuery cardBinQuery,Page page){
		return cardBinService.queryCardBin(cardBinQuery,page);
	}
	
	
	/**
	 * 保存信息
	 */
	public void insertCardBin(CardBin cardBin){
		if(cardBin.getKeyId()==null || cardBin.getKeyId().intValue()==0){
			String userName = "";
			cardBin.setCreateUserId(userName);
			cardBin.setModifyUserId(userName);
			
			cardBinService.insertCardBin(cardBin);
		}
	}
	
	
	/**
	 * 修改信息
	 * @param cardBin
	 */
	public String updateCardBin(CardBin cardBin){
		if(cardBin.getKeyId()!=null){
			String userName = "";
			cardBin.setModifyUserId(userName);
			cardBinService.updateCardBin(cardBin);
	    }
		
		return "";
	}
	
	public CardBin getCardBinById(Integer cardBinId){
        return cardBinService.getCardBinById(cardBinId);
    }
	/**
	 * 删除指定信息
	 */
	public void deleteCardBin(java.lang.Integer id){
		cardBinService.deleteCardBin(id);
	}

	/** 
	 * 批量删除
	 */
	public void batchDeleteCardBin(java.lang.Integer[] ids) {
		for(int i = 0; i < ids.length; i++) {
			cardBinService.deleteCardBin(ids[i]);
		}
	}

}

