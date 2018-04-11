package com.fei.code.service.impl;

import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorProperties;
import com.fei.code.dao.CodeDao;
import com.fei.code.model.CodeConfig;
import com.fei.code.model.DbConfig;
import com.fei.code.model.TableInfo;
import com.fei.code.service.CodeService;
import com.fei.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;


@Service
public class CodeServiceImpl implements CodeService {
	@Autowired
	private CodeDao codeDao;
	
	public List<TableInfo> getAllTables(DbConfig dbConfig){
		return codeDao.getAllTables(dbConfig);
	}
	
	public TableInfo getAllColumns(String tableName, DbConfig dbConfig){
		return codeDao.getAllColumns(tableName,dbConfig);
	}
	

	
	public void saveComment(TableInfo tableInfo, DbConfig dbConfig){
		codeDao.saveComment(tableInfo,dbConfig);
	}
	
	/*
	 * 1、设置数据库属性：数据库连接串、用户名、密码
	 * 2、设置配置属性：
	 * */
	public void generator(DbConfig dbConfig, TableInfo tableInfo, CodeConfig codeConfig){
		
		init(dbConfig,tableInfo,codeConfig);
		
		GeneratorFacade g = new GeneratorFacade();
		try {
			g.deleteOutRootDir();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			g.generateByTable(tableInfo.getTableName(),codeConfig.getTemplateName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void init(DbConfig dbConfig, TableInfo tableInfo, CodeConfig codeConfig){
		//数据库类型至java类型映射
		GeneratorProperties.setProperty("java_typemapping.java.sql.Timestamp", "java.util.Date");
		GeneratorProperties.setProperty("java_typemapping.java.sql.Date", "java.util.Date");
		GeneratorProperties.setProperty("java_typemapping.java.sql.Time", "java.util.Date");
		GeneratorProperties.setProperty("java_typemapping.java.lang.Byte", "Integer");
		GeneratorProperties.setProperty("java_typemapping.java.lang.Short", "Integer");
		GeneratorProperties.setProperty("java_typemapping.java.math.BigDecimal", "Long");
		GeneratorProperties.setProperty("java_typemapping.java.sql.Clob", "String");
		
		if(dbConfig.getUrl().indexOf("mysql")>0){
			GeneratorProperties.setProperty("jdbc.url", dbConfig.getUrl()+"?useUnicode=true&amp;characterEncoding=UTF-8");
			GeneratorProperties.setProperty("dbType", "mysql");
		}else{
			GeneratorProperties.setProperty("jdbc.url", dbConfig.getUrl());
			GeneratorProperties.setProperty("dbType", "oracle");
		}
		GeneratorProperties.setProperty("jdbc.driver", dbConfig.getDriver());
		GeneratorProperties.setProperty("jdbc.username", dbConfig.getUsername());
		GeneratorProperties.setProperty("jdbc.password", dbConfig.getPassword());
		if(StringUtils.isNotEmpty(dbConfig.getSchema()))
			GeneratorProperties.setProperty("jdbc.schema", dbConfig.getSchema());
		//GeneratorProperties.setProperty("jdbc.catalog", codeConfig.getCatalog());
		
		
		if(StringUtils.isNotEmpty(codeConfig.getOutRoot()))
			GeneratorProperties.setProperty("outRoot", codeConfig.getOutRoot());
		GeneratorProperties.setProperty("tableRemovePrefixes", codeConfig.getTableRemovePrefixes());
		
		GeneratorProperties.setProperty("namespace", codeConfig.getNamespace());
		
		String model = "";
		if(tableInfo.getComments().indexOf("#")>0) {
			model = tableInfo.getComments().substring(tableInfo.getComments().indexOf("#")+1);
		}
		
		GeneratorProperties.setProperty("basepackage", codeConfig.getBasepackage() + model);
		GeneratorProperties.setProperty("basepackage_controller", codeConfig.getBasepackage() + ".controller");
		GeneratorProperties.setProperty("path_model", codeConfig.getPath_model()+model);
		GeneratorProperties.setProperty("path_mybatis", codeConfig.getPath_mybatis()+model);
		GeneratorProperties.setProperty("path_admin", codeConfig.getPath_admin()+model);
		GeneratorProperties.setProperty("path_front", codeConfig.getPath_front()+model);
		GeneratorProperties.setProperty("path_html5", codeConfig.getPath_html5()+model);
		
	}
	
	
//	public List<Table> getAllTable(CodeConfig codeConfig){
//		//DataSourceProvider.setDataSource(null);
//		//init(codeConfig);
//		TableFactory tableFactory = TableFactory.getInstance();
//		
//		return tableFactory.getAllTables();
//	}
//	
//	public Table getAllColumn(CodeConfig codeConfig){
//		//init(codeConfig);
//		
//		TableFactory tableFactory = TableFactory.getInstance();
//		
//		return tableFactory.getTable(codeConfig.getTableName());
//	}
}
