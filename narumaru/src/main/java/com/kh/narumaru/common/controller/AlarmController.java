package com.kh.narumaru.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.exception.alarmResponseException;
import com.kh.narumaru.common.model.service.AlarmService;
import com.kh.narumaru.common.model.vo.Alarm;
import com.kh.narumaru.member.model.vo.Member;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService as;
	
	@RequestMapping(value="")
	public ModelAndView alramRequestTemplet(ModelAndView mv, HttpSession session){
		/*Sample Controller*/
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		/*INSERT INTO ALARM_TYPE VALUES (100,'관리자-공지사항');
		INSERT INTO ALARM_TYPE VALUES (101,'관리자-QA 답변');
		
		INSERT INTO ALARM_TYPE VALUES (102,'관리자-입금 완료');
		INSERT INTO ALARM_TYPE VALUES (103,'마루-환급 거부');
		
		INSERT INTO ALARM_TYPE VALUES (200,'나루-게시글 댓글');
		INSERT INTO ALARM_TYPE VALUES (201,'나루-게시글 등록');
		INSERT INTO ALARM_TYPE VALUES (202,'나루-이웃 신청');
		INSERT INTO ALARM_TYPE VALUES (203,'나루-이웃 수락');
		INSERT INTO ALARM_TYPE VALUES (204,'나루-결제선 구매');
		
		INSERT INTO ALARM_TYPE VALUES (300,'마루-게시글 댓글');
		INSERT INTO ALARM_TYPE VALUES (301,'마루-게시글 등록');
		INSERT INTO ALARM_TYPE VALUES (302,'마루-회원 초대');
		INSERT INTO ALARM_TYPE VALUES (303,'마루-회원 가입신청');
		INSERT INTO ALARM_TYPE VALUES (304,'마루-회원 가입승인');
		INSERT INTO ALARM_TYPE VALUES (305,'마루-회원 가입소개');
		
		
		*/
		
		/*INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 100, sysdate, 1, null, null, 1, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 101, sysdate, 1, null, null, 1, default);
		
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 200, sysdate, 1, 2, 1, 1, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 201, sysdate, 1, 2, 1, 1, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 202, sysdate, 1, 2, 1, 1, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 203, sysdate, 1, 2, 1, 1, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 204, sysdate, 1, 2, 1, 1, default);
		
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 300, sysdate, 1, 2, 4, 1, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 301, sysdate, 1, 2, 4, 1, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 302, sysdate, 1, 2, 4, null, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 303, sysdate, 1, 2, 4, null, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 304, sysdate, 1, 2, 4, null, default);
		INSERT INTO ALARM VALUES(SEQ_ANO.NEXTVAL, 305, sysdate, 1, 2, 4, null, default);*/
		
		int mno = loginUser.getMid();
		
		ArrayList<Alarm> alarm = new ArrayList<>();
		// 보낼 유저의 번호를 구한다.
		ArrayList<Integer> sendUser = null;
		
		/*Controller에서 Alarm객체에 값을 채운 후 Service로 보내주세요.*/
		for(int i = 0; i < sendUser.size(); i++){
			alarm.get(i).setSend_mno(mno);
		}
		
		try {
			as.alarmRequest(alarm);
		} catch (alarmRequestException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	/*알람 상태 개수*/
	@RequestMapping(value="alarmStatusCount.al")
	public void alarmStatusCount(HttpSession session, HttpServletResponse response){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();
		
		int count = as.alarmStatusCount(mno);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		try {
			new Gson().toJson(count, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	/*알람 리스트 불러오기*/
	@RequestMapping(value="alarmList.al")
	public void alarmResponse(HttpSession session, HttpServletResponse response){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();
		
		try {
			ArrayList<Alarm> aList = as.alarmResponse(mno);
			
			System.out.println("aList : " + aList);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			
			try {
				new Gson().toJson(aList, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} catch (alarmResponseException e) {
			e.getStackTrace();
		}
	}
	/*알람 상태 수정*/
	@RequestMapping(value="alarmStatusUpdate.al")
	public void alarmStatusUpdate(@RequestParam(value="ano") int ano){
		
			as.alarmStatusUpdate(ano);
			
	}
}
