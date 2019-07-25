package com.proj.capp.dao;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;

//no @repository no @service no @ComponentScan
abstract public class BaseDAO extends NamedParameterJdbcDaoSupport {
	@Autowired
	public void setDataSource2(DataSource ds) {
		super.setDataSource(ds);
	}

}
