package com.kh.narumaru.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AfterAdvice {
	
	@Pointcut("execution(* com.kh.narumaru..*ServiceImpl.*(..))")
	public void allPointcut(){}
	
	@After("allPointcut()")
	public void finallyLog(){
		System.out.println("어드바이스");
		
	}
	
	
	
}
