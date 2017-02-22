package com.liuzx.mingxin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liuzx.mingxin.dao.NoticeMapper;
import com.liuzx.mingxin.domain.Notice;

@Service
public class NoticeService {
	@Autowired
	NoticeMapper noticeMapper;
	public int insert(Notice notice){
		return noticeMapper.insert(notice);
	}
	public int update(Notice notice){
		return noticeMapper.updateById(notice);
	}
	public int updateContent(int id,String content){
		Notice notice = new Notice();
		notice.setId(id);
		notice.setContent(content);
		return noticeMapper.updateByIdSelective(notice);
	}
	public int updatePublish(int id,int isPublish){
		Notice notice = new Notice();
		notice.setId(id);
		notice.setIsPublish(isPublish);
		return noticeMapper.updateByIdSelective(notice);
	}
	public int deleteById(int id){
		return noticeMapper.deleteById(id);
	}
	public List<Notice>  selectAll(){
		return noticeMapper.selectAll();
	}
	public Notice  selectById(int id){
		return noticeMapper.selectById(id);
	}
}
