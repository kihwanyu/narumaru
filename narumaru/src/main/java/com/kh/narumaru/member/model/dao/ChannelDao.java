package com.kh.narumaru.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.member.model.exception.memberChannelChangeException;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.MChannel;

public interface ChannelDao {

	ArrayList<Channel> selectAllChannel(SqlSessionTemplate sqlSession) throws selectChanelException;

	void memberChannelChange(SqlSessionTemplate sqlSession, ArrayList<MChannel> mchList) throws memberChannelChangeException;

	ArrayList<Channel> selectMemberChannel(SqlSessionTemplate sqlSession, int mno) throws selectChanelException;

}
