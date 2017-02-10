package com.liuzx.mingxin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.liuzx.mingxin.domain.Role;
@Component
public interface RoleMapper {
	   int deleteById(int id);

	    int insert(Role role);

	    int insertSelective(Role role);

	    Role selectById(int id);
	    
	    List<Role> selectSelective(Map<String,Object> map);

	    int updateBySelective(Role role);

	    int updateById(Role role);
	    
	    Role selectByUid(String uid);
}
