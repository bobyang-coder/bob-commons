package com.fei.code.service;

import com.fei.code.model.CodeConfig;
import com.fei.code.model.DbConfig;
import com.fei.code.model.TableInfo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CodeService {
//	public List<Table> getAllTable(CodeConfig codeConfig);
//	
//	public Table getAllColumn(CodeConfig codeConfig);
	
	public List<TableInfo> getAllTables(DbConfig dbConfig);
	
	public TableInfo getAllColumns(String tableName, DbConfig dbConfig);

	public void saveComment(TableInfo tableInfo, DbConfig dbConfig);

	public void generator(DbConfig dbConfig, TableInfo tableInfo, CodeConfig codeConfig);

}