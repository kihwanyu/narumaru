package com.kh.narumaru.member.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.narumaru.member.model.service.ChannelService;
import com.kh.narumaru.member.model.service.MemberService;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.MChannel;
import com.kh.narumaru.member.model.vo.Member;


import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.exception.birthdayChangeException;
import com.kh.narumaru.member.model.exception.genderChangeException;
import com.kh.narumaru.member.model.exception.memberChannelChangeException;
import com.kh.narumaru.member.model.exception.nameChangeException;
import com.kh.narumaru.member.model.exception.passwordChangeException;
import com.kh.narumaru.member.model.exception.phoneChangeException;
import com.kh.narumaru.member.model.exception.selectChanelException;


@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	
	@Autowired
	private MemberService ms;
	@Autowired
	private ChannelService cs;
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public ModelAndView showMainView(Member m, ModelAndView mv, SessionStatus status ){
		
	
		System.out.println("controller Member : " + m);
		
		//System.out.println("암호 일치 여부 확인 : " + passwordEncoder.matches("pass01", "$2a$10$DEDHUZOux.CEoctwh7R3ZexGZEUaCn0y8MZO.zSHoxH7zRaQhHSUu"));

		/*MemberService ms = new MemberServiceImpl();*/
		
		try {
			Member loginUser = ms.loginMember(m);
			
			//session.setAttribute("loginUser", loginUser);
			
			/*return "main/main";*/
			System.out.println("loginUser : " + loginUser);
			
			mv.addObject("loginUser", loginUser);
			mv.setViewName("main/main");
			
		} catch (LoginException e) {
			
			//model.addAttribute("message", e.getMessage());
			//return "common/errorPage";
			
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping(value="insertMember.me", method=RequestMethod.POST)
	public String showInsertMember(){
		
		return "member/memberInsertForm";
	}
	
	@RequestMapping(value="memberInsert.me")
	public String memberInsert(Member m, Model model, HttpServletRequest request){
		
		System.out.println("컨트롤러 회원가입: " + m);
		
		if(m.getGender().equals("M")){
			m.setGender("남");
		}else{
			m.setGender("여");
		}
		
		try{
			ms.insertMember(m);
			
			return "main/mainLogin";
			
		}catch (Exception e) {
			model.addAttribute("message", "회원가입실패!");
			return "common/errorPage";
		}
		
	}
	
	/*@RequestMapping(value="naverLogin.me")
	public String naverLogin(){
		
		return "main/callback";
	}
	*/
	
	@RequestMapping(value="kakaoLogin.me")
	public ModelAndView kakaoLogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv){
		
		System.out.println("여기?????????????");
		
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		
		Member m = new Member();
		m.setEmail(email);
		m.setNickName(nickname);
		
		mv.addObject("member", m);
		mv.setViewName("member/memberInsertForm");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	//마이페이지 Info start//
	@RequestMapping(value="profileChange.me", method=RequestMethod.POST)
	public void profileChange(@RequestParam(name="profile-file", required=false) MultipartFile profile
										, HttpServletRequest request, HttpSession session, HttpServletResponse response){
		
		System.out.println("profile : " + profile.getOriginalFilename());
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Member m = new Member();
		
		String message = "";
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\memberprofile";
		String fileName = "";
		System.out.println(filePath);
		
		try {
			File deleteFile = new File(filePath + "\\" + loginUser.getProfileName());
			deleteFile.delete();
			
			fileName = profile.getOriginalFilename();
			
			int dot = fileName.lastIndexOf(".");
				// dot을 포함한 뒷부분도 포함
			String ext = fileName.substring(dot);
			
			fileName = String.valueOf(loginUser.getMid()) + loginUser.getNickName() + ext;
			
			m.setMid(loginUser.getMid());
			m.setProfileName(fileName);
			
			profile.transferTo(new File(filePath + "\\" + fileName));
			
		} catch (IllegalStateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			ms.profileChange(m);
			
			response.getWriter().print("true");
		} catch (ProfileChangeException e) {
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="nickChange.me", method=RequestMethod.POST)
	public void nickNameChange(Member m, HttpSession session, HttpServletResponse response){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//System.out.println("m : " + m);
		
		m.setMid(loginUser.getMid());
		
		try {
			ms.nameChange(m);
			response.getWriter().print("true");
		} catch (nameChangeException e) {
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="birthdayChange.me", method=RequestMethod.POST)
	public void birthdayChange(Member m, HttpSession session, HttpServletResponse response){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//System.out.println("m : " + m);
		
		m.setMid(loginUser.getMid());
		
		try {
			ms.birthdayChange(m);
			response.getWriter().print("true");
		} catch (birthdayChangeException e) {
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="phoneChange.me", method=RequestMethod.POST)
	public void phoneChange(Member m, HttpSession session, HttpServletResponse response){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//System.out.println("m : " + m);
		
		String phone = m.getPhone();
		
		phone = "82+" + phone.substring(1, phone.length());
		
		m.setMid(loginUser.getMid());
		m.setPhone(phone);
		
		try {
			ms.phoneChange(m);
			response.getWriter().print("true");
		} catch (phoneChangeException e) {
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="genderChange.me", method=RequestMethod.POST)
	public void genderChange(Member m, HttpSession session, HttpServletResponse response){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		//System.out.println("m : " + m);
		
		m.setMid(loginUser.getMid());
		
		try {
			ms.genderChange(m);
			response.getWriter().print("true");
		} catch (genderChangeException e) {
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value="channelChange.me", method=RequestMethod.POST)
	public void channelChange(HttpSession session, HttpServletResponse response, @RequestParam(value="cnoArr[]")String[] cnoArr){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<MChannel> mchList = new ArrayList<MChannel>();
		
		for(String str : cnoArr){
			MChannel mch = new MChannel();
			System.out.println("cnoArr : " + str);
			mch.setMno(loginUser.getMid());
			mch.setCno(Integer.valueOf(str));
			mchList.add(mch);
		}
		
		try {
			cs.memberChannelChange(mchList);
			response.getWriter().print("true");
		} catch (memberChannelChangeException e) {
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="userPwdChange.me", method=RequestMethod.POST)
	public void userPwdChange(HttpSession session, HttpServletResponse response, @RequestParam(value="pwdArr[]")String[] pwdArr){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userPwd = loginUser.getUserPwd();
		
		String currentPwd = pwdArr[0];
		String changedPwd = pwdArr[1];
		String changedPwdRe = pwdArr[2];

		if(userPwd.equals(currentPwd)){
			if(changedPwd.equals(changedPwdRe)){
				try {
					Member m = new Member();
					m.setMid(loginUser.getMid());
					m.setUserPwd(changedPwd);
					ms.passwordChange(m);
					response.getWriter().print("0");
					/*비밀번호 변경 성공*/
				} catch (passwordChangeException e) {
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				try {
					response.getWriter().print("2");
					/*변경 비밀번호 불일치*/
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			try {
				response.getWriter().print("1");
				/*현재 비밀번호 불일치*/
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		/*try {
			cs.memberChannelChange(mchList);
			response.getWriter().print("true");
		} catch (memberChannelChangeException e) {
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}*/
	}
	//마이페이지 Info end//
	
	// 마이페이지 페이지 이동 start
	
	@RequestMapping(value="myInfoView.me")
	public ModelAndView myInfoForward(ModelAndView mv, HttpSession session){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();
		
		ArrayList<Channel> cList = null;
		ArrayList<Channel> mchList = null;
		try {
			cList = cs.selectAllChannel();
			mchList = cs.selectMemberChannel(mno);
			
			System.out.println("mchList : " + mchList);
			
			mv.addObject("cList", cList);
			mv.addObject("mchList", mchList);
			
			mv.setViewName("mypage/myPage_myInfo");
		} catch (selectChanelException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage.jsp");
		}
		
		return mv;
	}
	@RequestMapping(value="myboardView.me")
	public ModelAndView myBoardForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_myboard");
		
		return mv;
	}
	@RequestMapping(value="myLoginView.me")
	public ModelAndView myLoginForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_loginRecord");
		
		return mv;
	}
	@RequestMapping(value="invitedMaruView.me")
	public ModelAndView invitedMaruForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_invitedMaru");
		
		return mv;
	}
	@RequestMapping(value="resisteredMaruView.me")
	public ModelAndView resisteredMaruForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_resisteredMaru");
		
		return mv;
	}
	@RequestMapping(value="naruNeighborListView.me")
	public ModelAndView NaruNeighborListForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_NaruNeighborList");
		
		return mv;
	}
	@RequestMapping(value="pointPaymentView.me")
	public ModelAndView pointPaymentForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_pointPayment");
		
		return mv;
	}
	@RequestMapping(value="refundView.me")
	public ModelAndView RefundForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_refund");
		
		return mv;
	}
	// 마이페이지 페이지 이동 end
	
}
