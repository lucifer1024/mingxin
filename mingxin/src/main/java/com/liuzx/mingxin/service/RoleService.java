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
}
