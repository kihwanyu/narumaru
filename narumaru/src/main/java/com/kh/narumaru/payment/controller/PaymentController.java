package com.kh.narumaru.payment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.service.PaymentService;
import com.kh.narumaru.payment.model.vo.Payment;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService ps;
	
	@RequestMapping(value="paymentInsert.pa")
	/*포인트 결제*/
	public ModelAndView PaymentInsert(ModelAndView mv, Payment p, HttpSession session){
		
		System.out.println("p : " + p);
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		p.setMno(loginUser.getMid());
		
		try {
			int result = ps.PaymentInsert(p);
			
			mv.addObject("errorWhether", true);
			mv.addObject("p",p);
			mv.addObject("totalPoint", result);
			mv.setViewName("common/paymentResult");
		} catch (PaymentInsertException e) {
			mv.addObject("errorWhether", false);
			mv.addObject("errorMessage", e.getMessage());
			mv.setViewName("common/paymentResult");
		}
		
		return mv;
	}
	/*결제 화면 표시*/
	@RequestMapping(value="paymentView.pa")
	public ModelAndView showMaruInsertView(ModelAndView mv){
		   
		mv.setViewName("common/payment");
		
		return mv;
	}
	/*결제 에러화면 표시*/
	@RequestMapping(value="paymentError.pa")
	public ModelAndView paymentError(ModelAndView mv, @RequestParam(name="error_msg")String error_msg){
		
		mv.addObject("errorWhether", false);
		mv.addObject("errorMessage", error_msg);
		mv.setViewName("common/paymentResult");
		
		return mv;
	}
}
