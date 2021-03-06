package com.kh.narumaru.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.exception.birthdayChangeException;
import com.kh.narumaru.member.model.exception.genderChangeException;
import com.kh.narumaru.member.model.exception.nameChangeException;
import com.kh.narumaru.member.model.exception.passwordChangeException;
import com.kh.narumaru.member.model.exception.phoneChangeException;
import com.kh.narumaru.member.model.exception.statusUpdateException;
import com.kh.narumaru.member.model.vo.LogInfo;
import com.kh.narumaru.member.model.vo.Member;


@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public Member loginCheck(Member m) throws LoginException {
		
		Member member = null;
		
		System.out.println("memberdao : " + m);
		
		String id = m.getEmail().substring(0, m.getEmail().lastIndexOf('@'));
		
		System.out.println(id);
		
		
		//id += "@naver.com";
		
		String cryptPwd = sqlSession.selectOne("Member.selectPwd", id);
		//String cryptPwd = sqlSession.selectOne("Member.selectPwd", m.getEmail());
		System.out.println(cryptPwd);
		
		//passwordEncoder.matches(m.getUserPwd(), cryptPwd)
		if(!passwordEncoder.matches(m.getUserPwd(), cryptPwd)){
			throw new LoginException("로그인실패!!");
		}else{
			member = sqlSession.selectOne("Member.loginCheck", m);
			System.out.println("memberdao2 : " + member);
		}
		
		return member;
	}


	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("Member.insertMember", m);
	}


	@Override
	public void profileChange(SqlSessionTemplate sqlSession, Member m) throws ProfileChangeException {
		
		int result = sqlSession.update("Member.profileChange", m);
		
		if(result <= 0){
			throw new ProfileChangeException("회원 프로필 변경 실패!!");
		}
	}


	@Override
	public void birthdayChange(SqlSessionTemplate sqlSession, Member m) throws birthdayChangeException {
		
		int result = sqlSession.update("Member.birthdayChange", m);
		
		if(result <= 0){
			throw new birthdayChangeException("생년월일 변경 실패!!");
		}
	}


	@Override
	public void nameChange(SqlSessionTemplate sqlSession, Member m) throws nameChangeException {
		int result = sqlSession.update("Member.nameChange", m);
		
		if(result <= 0){
			throw new nameChangeException("이름 변경 실패!!");
		}
	}


	@Override
	public void genderChange(SqlSessionTemplate sqlSession, Member m) throws genderChangeException {
		int result = sqlSession.update("Member.genderChange", m);
		
		if(result <= 0){
			throw new genderChangeException("성별 변경 실패!!");
		}
	}


	@Override
	public void phoneChange(SqlSessionTemplate sqlSession, Member m) throws phoneChangeException {
		int result = sqlSession.update("Member.phoneChange", m);
		
		if(result <= 0){
			throw new phoneChangeException("핸드폰번호 변경 실패!!");
		}
	}


	@Override
	public void passwordChange(SqlSessionTemplate sqlSession, Member m) throws passwordChangeException {
		int result = sqlSession.update("Member.passwordChange", m);
		
		if(result <= 0){
			throw new passwordChangeException("비밀번호 변경 실패!!");
		}
	}


	@Override
	public void memberStatusUpdate(SqlSessionTemplate sqlSession, Member m) throws statusUpdateException {
		int result = sqlSession.update("Member.statusUpdate",m);
		
		if(result <= 0){
			throw new statusUpdateException("회원 상태정보 변경 실패-탈퇴");
		}
	}


	@Override
	public String findEmail(SqlSessionTemplate sqlSession, Member m) {
		
		String email = sqlSession.selectOne("Member.findEmail", m); 
		
		return email;
	}


	@Override
	public String sendPwd(SqlSessionTemplate sqlSession, Member m) {
		
		String id = m.getEmail().substring(0, m.getEmail().lastIndexOf('@'));
		m.setEmail(id);
		System.out.println("비밀번호 찾기 멤버 : "+m);
		String result = sqlSession.selectOne("Member.selectPwd2", m);
		
		return result;
	}

	
	@Override
	public void sendUpdatePwd(SqlSessionTemplate sqlSession, Member m) {
		
		String id = m.getEmail().substring(0, m.getEmail().lastIndexOf('@'));
		m.setEmail(id);
		
		int result = sqlSession.update("Member.sendUpdatePwd2", m);
		
	}


	@Override
	public LogInfo selectNation(SqlSessionTemplate sqlSession,LogInfo li) {
		
		long userIp = li.getLongIp();
		
		sqlSession.selectOne("Member.selectNation", userIp);
		
		return li;
	}

	public Member selectMemberOne(int mno) {
		return (Member)sqlSession.selectOne("Member.selectMemberOne", mno);
	}


	@Override
	public void insertLogInfo(SqlSessionTemplate sqlSession, LogInfo li2) {
		
		sqlSession.insert("Member.insertLogInfo", li2);
		System.out.println("로그인인포 인서트 완료");
		
	}

	@Override
	public int getLoginCount(SqlSessionTemplate sqlSession, int mno) {
		
		int count = 0;
		
		Integer result = sqlSession.selectOne("Member.getLoginCount", mno);
		
		if(result != null){
			count = result;
		}
		return count;
		
	}

	@Override
	public ArrayList<LogInfo> getLoginListCount(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<LogInfo> list = (ArrayList)sqlSession.selectList("Member.getLoginListCount", pi, rowBounds);
		
		return list;
	}

}











