package com.kh.narumaru.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.narumaru.member.model.dao.MemberDao;
import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.exception.birthdayChangeException;
import com.kh.narumaru.member.model.exception.genderChangeException;
import com.kh.narumaru.member.model.exception.nameChangeException;
import com.kh.narumaru.member.model.exception.passwordChangeException;
import com.kh.narumaru.member.model.exception.phoneChangeException;
import com.kh.narumaru.member.model.exception.statusUpdateException;
import com.kh.narumaru.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
    private JavaMailSender javaMailSender;
	@Autowired
	private MemberDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	
	@Override
	public Member loginMember(Member m) throws LoginException{

		return md.loginCheck(m);
	}
	@Override
	public void insertMember(Member m) {
		
		int result = md.insertMember(sqlSession, m);
		
	}


	@Override
	public void profileChange(Member m) throws ProfileChangeException {
		
		md.profileChange(sqlSession, m);
		
	}


	@Override
	public void birthdayChange(Member m) throws birthdayChangeException {

		md.birthdayChange(sqlSession, m);
	}


	@Override
	public void nameChange(Member m) throws nameChangeException {

		md.nameChange(sqlSession, m);
	}


	@Override
	public void genderChange(Member m) throws genderChangeException {
		md.genderChange(sqlSession, m);
	}


	@Override
	public void phoneChange(Member m) throws phoneChangeException {
		md.phoneChange(sqlSession, m);
	}


	@Override
	public void passwordChange(Member m) throws passwordChangeException {
		md.passwordChange(sqlSession, m);
	}

	
	@Override
	public void memberStatusUpdate(Member m) throws statusUpdateException {
		md.memberStatusUpdate(sqlSession, m);
	}
	
	
	@Override
	public String findEmail(Member m) {
		
		return md.findEmail(sqlSession, m);
	}
	@Override
	public boolean sendPwd(Member m) {
		
		boolean result = false;
		
		String result1 = "";
		
		result1 = md.sendPwd(sqlSession, m);
		System.out.println("result1 : " + result1);
		
		if(result1 != null){
			result = true;
		}
		
		return result;
	}
	
	@Override
	public void sendUpdatePwd(Member m) {
		
		md.sendUpdatePwd(sqlSession, m);
		
	}
	@Override
	public Member selectMemberOne(int mno) {
		return md.selectMemberOne(mno);
	}

}

















