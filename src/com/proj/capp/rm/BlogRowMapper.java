package com.proj.capp.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.proj.capp.damain.Blog;

public class BlogRowMapper implements RowMapper<Blog>{

	@Override
	public Blog mapRow(ResultSet rs, int i) throws SQLException {
		Blog bl=new Blog();
		bl.setLog_id(rs.getInt("log_id"));
		bl.setLog_title(rs.getString("log_title"));
		bl.setLog_desc(rs.getString("log_desc"));
		return bl;
	}
}
