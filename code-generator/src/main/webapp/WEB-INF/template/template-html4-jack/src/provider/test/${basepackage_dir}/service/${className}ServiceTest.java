<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<#assign classNameLowerCase = className?lower_case>
package ${basepackage}.service;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.After;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import java.util.*;

import ${basepackage}.model.*;
import ${basepackage}.dao.*;
import ${basepackage}.dao.impl.*;
import ${basepackage}.service.*;
import ${basepackage}.service.impl.*;
import ${basepackage}.model.query.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-*.xml", "classpath:spring/application*.xml"})
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
@Transactional
public class ${className}ServiceTest {

	
	@Autowired
	private ${className}Service ${classNameFirstLower}Service;

	@Before
	public void before() throws Exception {
		// TODO: init your parameter here
	}

	@After
	public void after() throws Exception {
		// TODO: destroy your parameter here
	}


	/**
	 *
	 * Method: get${className}ById(Integer ${classNameFirstLower}Id)
	 *
	 */
	@Test
	public void testGet${className}ById() {
		${className} obj = new${className}();
		${classNameFirstLower}Service.insert${className}(obj);
		// TODO: Write yourself test code
		//assertNotNull(${classNameFirstLower}Service.get${className}ById(obj.get${table.idColumn.columnName}()));
	}

	/**
	 *
	 * Method: insert${className}(${className} ${classNameFirstLower})
	 *
	 */
	@Test
	public void testInsert${className}() {
		${className} obj = new${className}();
		${classNameFirstLower}Service.insert${className}(obj);
		// TODO: Write yourself test code
	}

	/**
	 *
	 * Method: query${className}(${className}Query ${classNameFirstLower}Query)
	 *
	 */
	@Test
	public void testQuery${className}(){
		// TODO: Write yourself test code
	}


	/**
	 *
	 * Method: update${className}(${className} ${classNameFirstLower})
	 *
	 */
	//@Test
	public void testUpdate${className}() {
		${className} obj = new${className}();
		${classNameFirstLower}Service.insert${className}(obj);
		${classNameFirstLower}Service.update${className}(obj);
		// TODO: Write yourself test code
	}

	/**
	 *
	 * Method: delete${className}(Integer ${classNameFirstLower}Id)
	 *
	 */
	@Test
	public void testDelete${className}(){
		${className} obj = new${className}();
		${classNameFirstLower}Service.insert${className}(obj);
		${classNameFirstLower}Service.update${className}(obj);
		${classNameFirstLower}Service.delete${className}(obj.get${table.idColumn.columnName}());
		// TODO: Write yourself test code
	}

	/**
	 * 创建对象
	 */
	public static ${className} new${className}() {
		${className} obj = new ${className}();

		<#list table.columns as column>
			<#if column.isNotIdOrVersionField>
				<#if column.isDateTimeColumn>
		obj.set${column.columnName}(new ${column.javaType}(System.currentTimeMillis()));
				<#else>
		obj.set${column.columnName}(new ${column.javaType}("1"));
				</#if>
			</#if>
		</#list>
		return obj;
	}
}
