<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<#assign classNameLowerCase = className?lower_case>
package ${basepackage}.service;

import java.util.*;
import java.util.List;
import org.springframework.stereotype.Service;
import com.fei.common.page.Page;
import ${basepackage}.model.*;
import ${basepackage}.model.query.*;

@Service
public interface ${className}Service {
	public ${className} get${className}ById(Integer ${classNameFirstLower}Id);

	public boolean insert${className}(${className} ${classNameFirstLower}) ;

	public List<${className}> query${className}(${className}Query ${classNameFirstLower}Query,Page page);
	
	public List<${className}> query${className}(${className}Query ${classNameFirstLower}Query);

	public void update${className}(${className} ${classNameFirstLower});

	public void delete${className}(Integer ${classNameFirstLower}Id);
}
