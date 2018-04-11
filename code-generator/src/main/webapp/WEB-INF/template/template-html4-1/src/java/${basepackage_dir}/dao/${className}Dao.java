<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<#assign classNameLowerCase = className?lower_case>
package ${basepackage}.dao;

import java.util.*;
import org.springframework.stereotype.Repository;
import com.fei.common.page.Page;
import ${basepackage}.model.*;
import ${basepackage}.model.query.*;

@Repository
public interface ${className}Dao {
	public ${className} get${className}ById(Integer ${classNameFirstLower}Id);

	public void insert${className}(${className} ${classNameFirstLower});

	public int getCount${className}(${className}Query ${classNameFirstLower}Query);
	
	public List<${className}> query${className}(${className}Query ${classNameFirstLower}Query,Page page);
	
	public List<${className}> query${className}(${className}Query ${classNameFirstLower}Query);

	public void update${className}(${className} ${classNameFirstLower});

	public void delete${className}(Integer ${classNameFirstLower}Id);
}
