package com.fei.code.model;

import java.io.Serializable;

public class ColumnInfo implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
	
	private String colName;
	private String colType;
	private String comments;

	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
	public String getColType() {
		return colType;
	}
	public void setColType(String colType) {
		this.colType = colType;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}

