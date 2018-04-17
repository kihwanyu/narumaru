package com.kh.narumaru.maru.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.dao.MaruDao;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.vo.Member;

@Service
public class MaruServiceImpl implements MaruService{
	@Autowired
	private MaruDao md;
	@Override
	public ArrayList<MaruMember> selectMaruMemberList(int nmno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MaruMember selectMaruMemberOne(int nmno, int mno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMaruMember(MaruMember mm) throws MaruException { 
		md.insertMaruMember(mm);
		
	}

	@Override
	public void deleteMaruMember(int nmno, int mno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countMaruMember(int nmno) throws MaruException {
		return md.countMaruMember(nmno);
		
	}

	@Override
	public ArrayList selectMaruList(int mno) throws MaruException {
		ArrayList maruList = md.selectMaruList(mno);
		return maruList;
	}

}
