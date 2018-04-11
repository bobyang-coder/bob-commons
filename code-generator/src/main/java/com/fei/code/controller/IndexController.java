package com.fei.code.controller;

import com.fei.common.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController extends BaseController {

	/**
	 * 首页配置
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String init(Model model){
		return "redirect:/admin/code/init";
	}
}

