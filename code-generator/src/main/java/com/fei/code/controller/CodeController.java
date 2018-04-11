package com.fei.code.controller;

import com.fei.code.model.CodeConfig;
import com.fei.code.model.ColumnInfo;
import com.fei.code.model.DbConfig;
import com.fei.code.model.TableInfo;
import com.fei.code.service.CodeService;
import com.fei.common.controller.BaseController;
import com.fei.common.util.FileUtils;
import com.fei.common.util.ZipFileUtils;
import org.apache.tools.zip.ZipOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("admin/code")
public class CodeController extends BaseController {

	@Autowired
	private CodeService codeService;

	/**
	 * 初始化
	 */
	@RequestMapping(value="/init",method=RequestMethod.GET)
	public String init(Model model){
	
		return "admin/code/code_init";
	}
	
	/**
	 * 显示Table列表
	 */
	@RequestMapping(method=RequestMethod.GET)
	public String tablelist(Model model,DbConfig dbConfig){

		List<TableInfo> tableList = codeService.getAllTables(dbConfig);

		model.addAttribute("dbConfig", dbConfig);
		model.addAttribute("tableList", tableList);
		
		return "admin/code/table_list";
	}
	
	/**
	 * 显示字段列表编辑页面
	 */
	@RequestMapping(value="/{tableName}", method =RequestMethod.GET)
	public String itemList(Model model, DbConfig dbConfig, @PathVariable String tableName){

		TableInfo tableInfo = codeService.getAllColumns(tableName,dbConfig);
		
		model.addAttribute("tableInfo", tableInfo);
		model.addAttribute("dbConfig", dbConfig);
		
		return "admin/code/column_list";
	}
	
	
	/**
	 * 保存配置信息
	 */
	@RequestMapping(method=RequestMethod.POST)
	public String save(Model model, DbConfig dbConfig, TableInfo tableInfo){
		String[] arrRemark = request.getParameterValues("remarks");
		List<ColumnInfo> listItem = new ArrayList<ColumnInfo>();
		for(String remark:arrRemark){
			System.out.println(remark);
			String[] mark = remark.split("@");
			ColumnInfo item = new ColumnInfo();
			item.setColName(mark[0]);
			item.setColType(mark[1]);
			item.setComments(mark[2]);
			listItem.add(item);
		}
		tableInfo.setListColumn(listItem);
		codeService.saveComment(tableInfo,dbConfig);

		return "redirect:/admin/code/"+tableInfo.getTableName()+"?url="+dbConfig.getUrl()+"&driver="+dbConfig.getDriver()+"&username="+dbConfig.getUsername()+"&password="+dbConfig.getPassword()+"&schema="+dbConfig.getSchema();
	}
	
	/**
	 * 生成代码
	 */
	@RequestMapping(value="/generate",method=RequestMethod.POST)
	public String generate(DbConfig dbConfig, TableInfo tableInfo, CodeConfig codeConfig, HttpServletResponse response){
		String model = tableInfo.getComments().substring(tableInfo.getComments().indexOf("#")+1);
		codeConfig.setBasepackage("com.reapal." + model);
		codeConfig.setPath_model("" + model.replaceAll("\\.", "/"));
		codeConfig.setPath_mybatis("mybatis." + model);
		codeConfig.setPath_admin("admin." + model);
		codeConfig.setPath_front("front." + model);
		codeConfig.setPath_html5("html5." + model);
		
		codeConfig.setOutRoot(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/upload/"+request.getSession().getId());
		codeConfig.setTemplateName(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/template/template-html4-jack");
		
		codeService.generator(dbConfig,tableInfo,codeConfig);
		
		//打包下载
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition","attachment; filename=src.zip");  
		System.out.println("in BatchDownload................");   
		try {
			ZipFileUtils zip = new ZipFileUtils();
			ZipOutputStream zos = new ZipOutputStream(response.getOutputStream());
			//zip.zip(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/upload/src",request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/upload/src.zip");
			zip.zip(new File(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/upload/"+request.getSession().getId()+"/src"),zos,"");
			
			zos.flush();
			zos.close();
			
			//删除目录
			FileUtils.DeleteFolder(request.getSession().getServletContext().getRealPath("/")+"/WEB-INF/upload/"+request.getSession().getId());
			
		} catch (IOException e) {
			e.printStackTrace();
		}     

		//return "redirect:/admin/code/"+tableInfo.getTableName()+"?url="+dbConfig.getUrl()+"&driver="+dbConfig.getDriver()+"&username="+dbConfig.getUsername()+"&password="+dbConfig.getPassword()+"&schema="+dbConfig.getSchema();
		return null;
	}
}

