package com.kh.narumaru.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.exception.memberChannelChangeException;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.MChannel;

@Repository
public class ChannelDaoImpl implements ChannelDao{

	@Override
	public ArrayList<Channel> selectAllChannel(SqlSessionTemplate sqlSession) throws selectChanelException {
		
		ArrayList<Channel> cList = (ArrayList)sqlSession.selectList("selectAllChanel");
		
		if(cList == null){
			throw new selectChanelException("채널 리스트 출력 실패 - 전체 채널 검색 실패");
		}
		
		return cList;
	}

	@Override
	public void memberChannelChange(SqlSessionTemplate sqlSession, ArrayList<MChannel> mchList) throws memberChannelChangeException {
		sqlSession.delete("memberChannelDelete",mchList.get(0));
		
		for(int i = 0; i < mchList.size(); i++){
			int insertResult = sqlSession.insert("memberChannelInsert",mchList.get(i));
			if(insertResult <= 0){
				throw new memberChannelChangeException("회원 채널 변경 실패 !! - UPDATE");
			}
		}
	}

	@Override
	public ArrayList<Channel> selectMemberChannel(SqlSessionTemplate sqlSession, int mno) throws selectChanelException {
		
		ArrayList<Channel> mchList = (ArrayList)sqlSession.selectList("selectMemberChannel", mno);
		
		if(mchList == null){
			throw new selectChanelException("채널 리스트 출력 실패 - 회원 채널 검색 실패!!");
		}
		
		return mchList;
	}
}
