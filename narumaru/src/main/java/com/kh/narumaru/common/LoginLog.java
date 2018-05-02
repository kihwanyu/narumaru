package com.kh.narumaru.common;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.narumaru.member.model.vo.Member;

@Repository
@Aspect
public class LoginLog {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginLog.class);
	
	@Pointcut("execution(* com.kh.narumaru..*ServiceImpl.login*(..))")
	public void loginPointcut(){}
	
	@AfterReturning(pointcut="loginPointcut()", returning="returnObj")
	public void logining(JoinPoint jp, Object returnObj){
		if(returnObj instanceof Member){
			Member m = (Member)returnObj;
			
			logger.info(new Date() + " : $" + m.getEmail() + "$님이 접속했습니다.");
		}
		
	}
	
}
