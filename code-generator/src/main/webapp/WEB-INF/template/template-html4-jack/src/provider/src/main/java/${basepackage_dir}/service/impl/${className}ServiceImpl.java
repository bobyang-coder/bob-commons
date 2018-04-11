<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<#assign classNameLowerCase = className?lower_case>
package ${basepackage}.service.impl;

import java.util.*;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.reapal.common.model.ResultList;
import com.reapal.common.page.Page;
import ${basepackage}.service.*;
import ${basepackage}.dao.*;
import ${basepackage}.model.*;
import ${basepackage}.model.query.*;

@Service
public class ${className}ServiceImpl implements ${className}Service {
	@Autowired
	private ${className}Dao ${classNameFirstLower}Dao;
	
	public ${className} get${className}ById(Integer ${classNameFirstLower}Id) {
		return ${classNameFirstLower}Dao.get${className}ById(${classNameFirstLower}Id);
	}

	public boolean insert${className}(${className} ${classNameFirstLower}) {
		${classNameFirstLower}Dao.insert${className}(${classNameFirstLower});
		return true;
	}

	public ResultList query${className}(${className}Query ${classNameFirstLower}Query,Page page){
		ResultList resultList = new ResultList();
		page.setTotalResult(${classNameFirstLower}Dao.getCount${className}(${classNameFirstLower}Query));

    resultList.setPage(page);
    resultList.setList(${classNameFirstLower}Dao.query${className}(${classNameFirstLower}Query,page));

		return resultList;
	}
	
	public List<${className}> query${className}(${className}Query ${classNameFirstLower}Query){
		return ${classNameFirstLower}Dao.query${className}(${classNameFirstLower}Query);
	}

	public void update${className}(${className} ${classNameFirstLower}) {
		${classNameFirstLower}Dao.update${className}(${classNameFirstLower});
	}


	public void delete${className}(Integer ${classNameFirstLower}Id){
		${classNameFirstLower}Dao.delete${className}(${classNameFirstLower}Id);
	}
}
