package com.kh.narumaru.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.common.model.vo.PageInfo;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.payment.model.exception.PaymentInsertException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.exception.WithdrawListSelectException;
import com.kh.narumaru.payment.model.exception.refundInsertException;
import com.kh.narumaru.payment.model.service.PaymentService;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.UsePoint;
import com.kh.narumaru.payment.model.vo.UserPointObject;
import com.kh.narumaru.payment.model.vo.Withdraw;

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
	
	/* 포인트 환급 */
	@RequestMapping(value="pointRefund.pa")
	public ModelAndView pointRefund(ModelAndView mv, Withdraw w, HttpSession Session, @RequestParam(name="currentPoint") int currentPoint){
		
		System.out.println("w : " + w);
		/*수수료*/
		int amount = (int) (w.getPoint()*0.15)+1000;
		
		Member loginUser = (Member)Session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();
		
		w.setMno(mno);
		w.setAmount(amount);
		
		try {
			ps.refundInsert(w);
			
			mv.addObject("currentPoint", currentPoint);
			mv.addObject("amount", amount);
			mv.addObject("point", w.getPoint());
			
			mv.setViewName("mypage/myPage_refundResult");
		} catch (refundInsertException e) {
			mv.addObject("currentPoint", currentPoint);
			
			mv.setViewName("mypage/myPage_refundResult");
		}
		
		return mv;
	}
	/*포인트 환급 취소*/
	
	@RequestMapping(value="withDrawDelete.pa")
	public void withdrawDelete(@RequestParam(value="wno") int wno, HttpServletResponse response){
		System.out.println("wno : " + wno);
		
		try {
			ps.deleteWithdraw(wno);
			response.getWriter().print("Y");
		} catch (WithdrawListSelectException | IOException e) {
			try {
				response.getWriter().print("N");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}
	@RequestMapping(value="usinghistoryView.pa")
	public void usinghistoryView(@RequestParam(defaultValue="1") int currentPage
								, HttpServletResponse response, HttpSession session){
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int mno = m.getMid();
		
		//페이징처리
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		/*limit = 10;*/
		limit = 5;
		
		int listCount = 0;
		
			
		listCount = ps.getUsingHistoryListCount(mno);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, mno);
		
		ArrayList<UsePoint> uList = ps.selectUsingHistoryList(pi);
		
		int userPointTotal = ps.getUserPointTotal(mno);
		
		UserPointObject upObj = new UserPointObject(uList, pi, userPointTotal);
		
		System.out.println("upObj : " + upObj);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		try {
			new Gson().toJson(upObj, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/* 계좌 인증 - 미완성 */
	/*@RequestMapping(value="accountCertified.pa")
	public ModelAndView accountCertified(ModelAndView mv){
		
		AccountCertified ac = new AccountCertified();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		ac.setBank_code_std("004");
		ac.setAccount_holder_info("9405261");
		ac.setAccount_num("09210204249509");
		ac.setTran_dtime(sdf.format(new Date()));
		
		RestTemplate rest = new RestTemplate();
		
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
		
		headers.add("Authorization", "l7xxb859970098d5403590947fb7c6ae079b");
		
		String url = "https://openapi.open-platform.or.kr/inquiry/real_name";
		
		HttpEntity<Object> requestEntity = new HttpEntity<Object>(headers);
		
		ResponseEntity<AccountCertified> response = rest.exchange(url, HttpMethod.GET, requestEntity, AccountCertified.class, spitterId);
		AccountCertified spitter = response.getBody();
		
		
		
		System.out.println(data);
		
		//mv.setViewName("common/paymentResult");
		
		return mv;
	}*/
}
