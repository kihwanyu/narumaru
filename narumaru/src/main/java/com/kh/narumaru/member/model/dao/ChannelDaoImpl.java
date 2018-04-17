package com.kh.narumaru.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;

@Repository
public class ChannelDaoImpl implements ChannelDao{

	@Override
	public ArrayList<Channel> selectAllChannel(SqlSessionTemplate sqlSession) throws selectChanelException {
		
		ArrayList<Channel> cList = (ArrayList)sqlSession.selectList("selectAllChanel");
		
		if(cList == null){
			throw new selectChanelException("채널 리스트 출력 실패");
		}
		
		return cList;
	}

}
