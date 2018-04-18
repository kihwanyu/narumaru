package com.kh.narumaru.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.narumaru.member.model.dao.ChannelDao;
import com.kh.narumaru.member.model.exception.memberChannelChangeException;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.MChannel;

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
	@Override
	public void memberChannelChange(ArrayList<MChannel> mchList) throws memberChannelChangeException {
		
		cd.memberChannelChange(sqlSession ,mchList);
	}
	@Override
	public ArrayList<Channel> selectMemberChannel(int mno) throws selectChanelException {

		ArrayList<Channel> mchList = cd.selectMemberChannel(sqlSession, mno);
		
		return mchList;
	}

}
