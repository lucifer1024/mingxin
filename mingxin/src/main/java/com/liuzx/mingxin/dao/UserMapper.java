package com.liuzx.mingxin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.liuzx.mingxin.domain.User;
@Component
public interface UserMapper {
	   int deleteByUid(String userId);

	    int insert(User user);

	    int insertSelective(User user);

	    User selectByUid(String userId);
	    
	    List<User> selectSelective(Map<String,Object> map);

	    int updateByUidSelective(User user);

	    int updateByUid(User user);
	    
	    
	    int updateByMap(Map<String,Object> map);

	    
	    List<HashMap<String,Object>> selectByOrder(Map<String,Object> map);

	    
}
