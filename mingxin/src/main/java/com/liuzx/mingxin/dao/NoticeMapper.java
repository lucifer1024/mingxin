package com.liuzx.mingxin.dao;


import java.util.List;

import org.springframework.stereotype.Component;

import com.liuzx.mingxin.domain.Notice;
@Component
public interface NoticeMapper {
	   int deleteById(int id);

	    int insert(Notice notice);


	    Notice selectById(int id);
	    
	    List<Notice> selectAll();

	    int updateById(Notice notice);
	    
	    int updateByIdSelective(Notice notice);
	    
}
