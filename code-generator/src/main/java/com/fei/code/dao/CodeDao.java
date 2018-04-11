package com.fei.code.dao;

import com.fei.code.model.DbConfig;
import com.fei.code.model.TableInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CodeDao {
	
	public void saveComment(TableInfo tableInfo, DbConfig dbConfig);

	public List<TableInfo> getAllTables(DbConfig dbConfig);

	public TableInfo getAllColumns(String tableName, DbConfig dbConfig);

}
