package com.liuzx.mingxin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liuzx.mingxin.dao.RoleMapper;
import com.liuzx.mingxin.domain.Role;

@Service
public class RoleService {
	@Autowired
	RoleMapper roleMapper;
	
	public Role selectById(int roleId){
		return roleMapper.selectById(roleId);
	}
	public Role createGustRole(){
		Role role = new Role();
		role.setId(7);
		role.setName("游客");
		role.setRoleOrder(50);
		role.setImgUrl("/images/newrole/guest.png");
		return role;
	}
	public Role selectByUid(String uid){
		return roleMapper.selectByUid(uid);
	}
}
