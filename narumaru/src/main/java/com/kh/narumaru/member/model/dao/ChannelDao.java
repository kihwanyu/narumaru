package com.kh.narumaru.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;

public interface ChannelDao {

	ArrayList<Channel> selectAllChannel(SqlSessionTemplate sqlSession) throws selectChanelException;

}
