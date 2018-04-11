<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>   
<#assign classNameLowerCase = className?lower_case>   
<#assign pkJavaType = table.idColumn.javaType>   

package ${basepackage}.controller;

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

import com.fei.common.controller.BaseController;
import com.fei.common.page.Page;
import com.fei.common.util.StringUtils;
import com.fei.common.util.UserRoleFilter;

import ${basepackage}.model.*;
import ${basepackage}.service.*;
import ${basepackage}.model.query.*;

@Controller
@RequestMapping("/admin/${classNameLowerCase}")
public class ${className}Controller extends BaseController{

	@Autowired
	private ${className}Service ${classNameFirstLower}Service;
	
	<#assign isFK = 0 />
	<#assign columnName = "" />
	<#assign javaType = "" />
	<#list table.columns as column>
	<#if (column.remarks)?index_of("#LFK") &gt; 0 >
		<#assign isFK = 1 />
		<#assign javaType = column.javaType />
		<#assign columnName = column.columnName />
	</#if>
	</#list>

	/**
	 * 显示列表
	 * @param ${classNameFirstLower}
	 * @return
	 */
	@RequestMapping
	public String list(Model model,${className}Query ${classNameFirstLower}Query,Page page){
		setComm();

		<#if isFK == 1 >
		if(StringUtils.isNotEmpty(${classNameFirstLower}Query.getForeignKey())){
			${classNameFirstLower}Query.set${columnName}(${classNameFirstLower}Query.getForeignKey());
		}
		</#if>
		
		List<${className}> ${classNameFirstLower}List = ${classNameFirstLower}Service.query${className}(${classNameFirstLower}Query,page);
		model.addAttribute("${classNameFirstLower}List", ${classNameFirstLower}List);
		model.addAttribute("page", page);
		model.addAttribute("${classNameFirstLower}Query", ${classNameFirstLower}Query);
		
		return backTheme+"/teacher/${classNameLowerCase}_list";
	}
	
	/**
	 * 请求新增页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/new")
	public String toAdd(Model model<#if isFK == 1 >,${className} ${classNameFirstLower}</#if>){
		setComm();
		<#if isFK == 1 >
		if(StringUtils.isNotEmpty(${classNameFirstLower}.getForeignKey())){
			${classNameFirstLower}.set${columnName}(${classNameFirstLower}.getForeignKey());
		}
		model.addAttribute("${classNameFirstLower}", ${classNameFirstLower});
		</#if>
		model.addAttribute("_method", "post");
		return backTheme+"/teacher/${classNameLowerCase}_edit";
	}
	
	/**
	 * 保存信息
	 * @param user
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST)
	public String save${className}(Model model,${className} ${classNameFirstLower}){
		if(${classNameFirstLower}.getKeyId()==null || ${classNameFirstLower}.getKeyId().intValue()==0){
			String userName = UserRoleFilter.getUserName(request);
			${classNameFirstLower}.setCreateUserId(userName);
			${classNameFirstLower}.setModifyUserId(userName);
			
			${classNameFirstLower}Service.insert${className}(${classNameFirstLower});
		}
		<#if isFK == 1 >
		if(StringUtils.isNotEmpty(${classNameFirstLower}.getForeignKey())){
			return "redirect:/admin/${classNameLowerCase}?foreignKey="+${classNameFirstLower}.getForeignKey();
		}
		</#if>
		return "redirect:/admin/${classNameLowerCase}";
	}
	
	/**
	 * 请求编辑页面
	 * @param ${classNameFirstLower}Id
	 * @return
	 */
	@RequestMapping(value="/{id}", method =RequestMethod.GET)
	public String toEdit(Model model,@PathVariable Integer id<#if isFK == 1 >,${javaType} foreignKey</#if>){
		setComm();
		${className} ${classNameFirstLower} = ${classNameFirstLower}Service.get${className}ById(id);
		<#if isFK == 1 >
		${classNameFirstLower}.setForeignKey(foreignKey);		
		</#if>
		model.addAttribute("${classNameFirstLower}", ${classNameFirstLower});
		model.addAttribute("_method", "put");
		return backTheme+"/teacher/${classNameLowerCase}_edit";
	}
	
	/**
	 * 修改信息
	 * @param ${classNameFirstLower}
	 * @return
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.PUT)
	public String update${className}(Model model,${className} ${classNameFirstLower}){
		if(${classNameFirstLower}.getKeyId()!=null){
			String userName = UserRoleFilter.getUserName(request);
			${classNameFirstLower}.setModifyUserId(userName);
			${classNameFirstLower}Service.update${className}(${classNameFirstLower});
	    }
		
		<#if isFK == 1 >
		if(StringUtils.isNotEmpty(${classNameFirstLower}.getForeignKey())){
			return "redirect:/admin/${classNameLowerCase}?foreignKey="+${classNameFirstLower}.getForeignKey();
		}
		</#if>
		return "redirect:/admin/${classNameLowerCase}";
	}
	
	
	/**
	 * 删除指定信息
	 * @param ${classNameFirstLower}Id
	 * @return
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.DELETE)
	public void delete${className}(Model model,@PathVariable java.lang.Integer id){
		${classNameFirstLower}Service.delete${className}(id);
	}
	/** 
	 * 批量删除
	 * 
	 */
	@RequestMapping(method=RequestMethod.DELETE)
	public void batchDelete${className}(java.lang.Integer[] ids) {
		for(int i = 0; i < ids.length; i++) {
			${classNameFirstLower}Service.delete${className}(ids[i]);
		}
	}
}

