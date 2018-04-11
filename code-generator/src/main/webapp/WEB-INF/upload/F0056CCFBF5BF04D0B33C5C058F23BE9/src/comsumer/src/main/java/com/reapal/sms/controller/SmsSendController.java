/*
 * Web Site: http://www.reapal.com
 * Since 2014 - 2014
 */


package com.reapal.sms.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.reapal.common.controller.BaseController;
import com.reapal.common.model.ResultList;
import com.reapal.common.page.Page;
import com.reapal.common.util.StringUtils;
import com.reapal.core.auth.utils.UserRoleFilter;

import com.reapal.sms.model.*;
import com.reapal.sms.business.*;
import com.reapal.sms.model.query.*;

@Controller
@RequestMapping("/admin/smssend")
public class SmsSendController extends BaseController{

	@Autowired
	private SmsSendBusiness smsSendBusiness;
	

	/**
	 * 显示列表
	 * @param smsSend
	 * @return
	 */
	@RequestMapping
	public String list(Model model,SmsSendQuery smsSendQuery,Page page){
		
		ResultList resultList = smsSendBusiness.querySmsSend(smsSendQuery,page);
    List<SmsSend> smsSendList = resultList.getList();
    page = resultList.getPage();
		
		
		model.addAttribute("smsSendList", smsSendList);
		model.addAttribute("page", page);
		model.addAttribute("smsSendQuery", smsSendQuery);
		
		return "admin/sms/smssend_list";
	}
	
	/**
	 * 请求新增页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/new")
	public String toAdd(Model model){
		model.addAttribute("_method", "post");
		return "admin/sms/smssend_edit";
	}
	
	/**
	 * 保存信息
	 * @param user
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST)
	public String saveSmsSend(Model model,SmsSend smsSend){
		if(smsSend.getKeyId()==null || smsSend.getKeyId().intValue()==0){
			String userName = UserRoleFilter.getUserName(request);
			smsSend.setCreateUserId(userName);
			smsSend.setModifyUserId(userName);
			
			smsSendBusiness.insertSmsSend(smsSend);
		}
		return "redirect:/admin/smssend";
	}
	
	/**
	 * 请求编辑页面
	 * @param smsSendId
	 * @return
	 */
	@RequestMapping(value="/{id}", method =RequestMethod.GET)
	public String toEdit(Model model,@PathVariable Integer id){
		SmsSend smsSend = smsSendBusiness.getSmsSendById(id);
		model.addAttribute("smsSend", smsSend);
		model.addAttribute("_method", "put");
		return "admin/sms/smssend_edit";
	}
	
	/**
	 * 修改信息
	 * @param smsSend
	 * @return
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.PUT)
	public String updateSmsSend(Model model,SmsSend smsSend){
		if(smsSend.getKeyId()!=null){
			String userName = UserRoleFilter.getUserName(request);
			smsSend.setModifyUserId(userName);
			smsSendBusiness.updateSmsSend(smsSend);
	    }
		
		return "redirect:/admin/smssend";
	}
	
	
	/**
	 * 删除指定信息
	 * @param smsSendId
	 * @return
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	public void deleteSmsSend(Model model,@PathVariable java.lang.Integer id){
		smsSendBusiness.deleteSmsSend(id);
	}
	/** 
	 * 批量删除
	 * 
	 */
	@RequestMapping(method=RequestMethod.DELETE)
	public void batchDeleteSmsSend(java.lang.Integer[] ids) {
		for(int i = 0; i < ids.length; i++) {
			smsSendBusiness.deleteSmsSend(ids[i]);
		}
	}
}

