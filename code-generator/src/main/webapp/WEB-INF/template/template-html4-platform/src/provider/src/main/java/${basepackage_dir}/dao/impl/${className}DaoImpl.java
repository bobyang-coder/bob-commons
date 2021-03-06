<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<#assign classNameLowerCase = className?lower_case>
package ${basepackage}.dao.impl;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.reapal.common.dao.impl.BaseIbatis3DaoImpl;
import com.reapal.common.dynamicds.DataSourceConst;
import com.reapal.common.dynamicds.DataSourceHandle;
import com.reapal.common.page.Page;
import ${basepackage}.dao.*;
import ${basepackage}.model.*;
import ${basepackage}.model.query.*;

@Repository
public class ${className}DaoImpl extends BaseIbatis3DaoImpl<${className},Integer> implements ${className}Dao {
	public ${className} get${className}ById(Integer ${classNameFirstLower}Id) {
		return (${className})this.getById(${classNameFirstLower}Id);
	}

	public void insert${className}(${className} ${classNameFirstLower}) {
		this.insert(${classNameFirstLower});
	}

	public int getCount${className}(${className}Query ${classNameFirstLower}Query){
		return (Integer) this.selectOne("getCount${className}",${classNameFirstLower}Query);
	}
	
	public List<${className}> query${className}(${className}Query ${classNameFirstLower}Query,Page page){
		return this.selectList("list${className}", ${classNameFirstLower}Query,page.getCurrentResult(),page.getPageSize());
	}
	
	public List<${className}> query${className}(${className}Query ${classNameFirstLower}Query){
		return this.selectList("list${className}", ${classNameFirstLower}Query);
	}

	public void update${className}(${className} ${classNameFirstLower}) {
		this.update(${classNameFirstLower});
	}


	public void delete${className}(Integer ${classNameFirstLower}Id){
		this.delete(${classNameFirstLower}Id);
	}
}
