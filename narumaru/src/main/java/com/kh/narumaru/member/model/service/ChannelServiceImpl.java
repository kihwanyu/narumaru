package com.kh.narumaru.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.member.model.dao.ChannelDao;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Autowired
	private ChannelDao cd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public ArrayList<Channel> selectAllChannel() throws selectChanelException {
		
		ArrayList<Channel> cList = cd.selectAllChannel(sqlSession);
		
		return cList;
	}

}
