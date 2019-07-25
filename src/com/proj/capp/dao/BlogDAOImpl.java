package com.proj.capp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.proj.capp.damain.Blog;
import com.proj.capp.rm.BlogRowMapper;

@Repository
public class BlogDAOImpl extends BaseDAO implements BlogDAO {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void save(Blog bl) {
		String sql = "INSERT INTO blog(log_title,log_desc)VALUES(:log_title,:log_desc)";
		Map m = new HashMap();
		m.put("log_title", bl.getLog_title());
		m.put("log_desc", bl.getLog_desc());

		KeyHolder kh = new GeneratedKeyHolder();
		SqlParameterSource ps = new MapSqlParameterSource(m);
		super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
		bl.setLog_id(kh.getKey().intValue());

	}

	@Override
	public List<Blog> findAll() {
		String sql="SELECT log_id,log_title,log_desc FROM Blog";
		return getJdbcTemplate().query(sql, new BlogRowMapper());
	}

}
