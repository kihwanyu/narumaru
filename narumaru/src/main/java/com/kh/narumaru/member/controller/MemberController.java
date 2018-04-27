package com.kh.narumaru.member.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.kh.narumaru.member.model.service.ChannelService;
import com.kh.narumaru.member.model.service.MemberService;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.member.oauth.bo.NaverLoginBO;
import com.kh.narumaru.payment.model.exception.BankSelectAllException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.service.BankSevice;
import com.kh.narumaru.payment.model.service.PaymentService;
import com.kh.narumaru.payment.model.vo.Bank;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.Withdraw;
import com.github.scribejava.core.model.OAuth2AccessToken;

import com.kh.narumaru.common.vo.PageInfo;
import com.kh.narumaru.maru.model.service.MaruService;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.exception.birthdayChangeException;
import com.kh.narumaru.member.model.exception.genderChangeException;
import com.kh.narumaru.member.model.exception.memberChannelChangeException;
import com.kh.narumaru.member.model.exception.nameChangeException;
import com.kh.narumaru.member.model.exception.passwordChangeException;
import com.kh.narumaru.member.model.exception.phoneChangeException;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.exception.statusUpdateException;
import com.kh.narumaru.member.model.service.ChannelService;
import com.kh.narumaru.member.model.service.MemberService;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.MChannel;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.narumaru.model.service.NarumaruService;
import com.kh.narumaru.narumaru.model.vo.Narumaru;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.service.PaymentService;
import com.kh.narumaru.payment.model.vo.Payment;


@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private MemberService ms;
	@Autowired
	private ChannelService cs;
	@Autowired
	private NarumaruService nms;
	@Autowired
	private MaruService mas;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private PaymentService ps; 
	@Autowired
	private BankSevice bs;
	
	/* NaverLoginBO 
	private NaverLoginBO naverLoginBO;

	 NaverLoginBO 
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}*/
	
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public ModelAndView showMainView(Member m, ModelAndView mv, SessionStatus status ){
		
	
		System.out.println("controller Member : " + m);
		
		//System.out.println("암호 일치 여부 확인 : " + passwordEncoder.matches("pass01", "$2a$10$DEDHUZOux.CEoctwh7R3ZexGZEUaCn0y8MZO.zSHoxH7zRaQhHSUu"));

		/*MemberService ms = new MemberServiceImpl();*/
		
	/*	HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        
        String userIp = request.getHeader("X-FORWARDED-FOR");
		
		System.out.println(userIp);
		*/
		
		
		
		
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
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(m.getGender().equals("M")){
			m.setGender("남");
		}else{
			m.setGender("여");
		}
		
		Narumaru nm = new Narumaru();
		
		nm.setIsOpen("공개");
		nm.setNmTitle(m.getNickName() + "님의 나루");
		nm.setNmCategory(2);
		nm.setNmIntro(m.getNickName() + "님의 나루입니다.");
		
		try{
			m.setUserPwd(passwordEncoder.encode(m.getUserPwd()));
			System.out.println("컨트롤러 회원가입: " + m);
			ms.insertMember(m);
			m.setUserPwd(request.getParameter("userPwd"));
			//loginUser = ms.loginMember(m);
			int nmno = nms.insertNarumaru(nm).getNmno();
			
			/*MaruMember mm = new MaruMember();
			mm.setMno(loginUser.getMid());
			mm.setNmno(nmno);
			mm.setConLevel(0);
			System.out.println("mm:"+mm);
			mas.insertMaruMember(mm);*/
			
			return "main/mainLogin";
			
		}catch (Exception e) {
			model.addAttribute("message", "회원가입실패!");
			e.printStackTrace();
			return "common/errorPage";
		}
		
	}
	
	
	//카카오 이메일 인증
	@RequestMapping(value="kakaoLogin.me")
	public ModelAndView kakaoLogin(HttpServletRequest request, HttpServletResponse response, ModelAndView mv){
		
		System.out.println("여기?????????????");
		
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		
		System.out.println("다음 이메일 " + email);
		System.out.println("다음 이름 : " + nickname);
		
		Member m = new Member();
		m.setEmail(email);
		m.setNickName(nickname);
		
		mv.addObject("member", m);
		mv.setViewName("member/memberInsertForm");
		
		return mv;
	}
	
		//네이버 인증
		@RequestMapping("/naverCallback.me")
		public ModelAndView callback(Member m, HttpSession session, HttpServletRequest request, ModelAndView mv) throws IOException {
	
			String clientId = "X5Nvd2AMVmO6GqWemA5v";//애플리케이션 클라이언트 아이디값";
			String clientSecret = "yf8f2GtrEs";//애플리케이션 클라이언트 시크릿값";
			String code = request.getParameter("code");
			String state = request.getParameter("state");
			String redirectURI = URLEncoder.encode("http://127.0.0.1:8011/narumaru/naverCallback.me", "UTF-8");
			String apiURL;
			apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + state;
			String access_token = "";
			String refresh_token = "";
			StringTokenizer stok = null;
			
			

			System.out.println("apiURL="+apiURL);
			try {
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				
				int responseCode = con.getResponseCode();
				
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
				
				JSONParser parser = new JSONParser();
				
				Object obj2 = parser.parse(res.toString());
				JSONObject jsonObj2 = (JSONObject) obj2;
				
				access_token = (String) jsonObj2.get("access_token");
				
				br.close();
				if(responseCode==200) {
					System.out.println("네이버 토큰 발급 " + res.toString());
				}
				
			} catch (Exception e) {
				System.out.println(e);
			}
			
			//토큰 발급 후
			
			String token = access_token;// 네이버 로그인 접근 토큰;
	        String header = "Bearer " + token; // Bearer 다음에 공백 추가
	        String email = "";
	        String gender = "";
	        
	        try {
	            String apiURL1 = "https://openapi.naver.com/v1/nid/me";
	            URL url1 = new URL(apiURL1);
	            HttpURLConnection con1 = (HttpURLConnection)url1.openConnection();
	            con1.setRequestMethod("GET");
	            con1.setRequestProperty("Authorization", header);
	            int responseCode1 = con1.getResponseCode();
	            BufferedReader br1;
	            if(responseCode1==200) { // 정상 호출
	                br1 = new BufferedReader(new InputStreamReader(con1.getInputStream()));
	            } else {  // 에러 발생
	                br1 = new BufferedReader(new InputStreamReader(con1.getErrorStream()));
	            }
	            String inputLine1;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine1 = br1.readLine()) != null) {
	                response.append(inputLine1);
	            }
	            
	            
	            JSONParser parser = new JSONParser();
				Object obj3 = parser.parse(response.toString());
				JSONObject jsonObj3 = (JSONObject) obj3;
				JSONObject jsonObj4 = (JSONObject) jsonObj3.get("response");
				
				m.setEmail((String) jsonObj4.get("email"));
				m.setNickName((String) jsonObj4.get("name"));
				
	            br1.close();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        
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
			loginUser.setProfileName(fileName);
			
			profile.transferTo(new File(filePath + "\\" + fileName));
			
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {
			ms.profileChange(m);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", loginUser);
			
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
		loginUser.setNickName(m.getNickName());
		
		try {
			ms.nameChange(m);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", loginUser);
			
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
		loginUser.setBirthDay(m.getBirthDay());
		try {
			ms.birthdayChange(m);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", loginUser);
			
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
		loginUser.setPhone(phone);
		
		try {
			ms.phoneChange(m);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", loginUser);
			
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
		loginUser.setGender(m.getGender());
		
		try {
			ms.genderChange(m);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", loginUser);
			
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
		System.out.println("mchList : " + mchList);
		try {
			cs.memberChannelChange(mchList);
			response.getWriter().print("true");
		} catch (memberChannelChangeException e) {
			try {
				response.getWriter().print("false");
				e.printStackTrace();
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
		
		if(passwordEncoder.matches(currentPwd, userPwd)){
			if(changedPwd.equals(changedPwdRe)){
				try {
					Member m = new Member();
					m.setMid(loginUser.getMid());
					m.setUserPwd(passwordEncoder.encode(changedPwd));
					
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
	@RequestMapping(value="memberDropout.me")
	public ModelAndView memberDropout(ModelAndView mv, Member m, HttpSession session){
		/*탈퇴 N*/
		m.setStatus("N");
		
		try {
			ms.memberStatusUpdate(m);
			
			session.removeAttribute("loginUser");
			mv.setViewName("main/mainLogin");
		} catch (statusUpdateException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		
		return mv;
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
		int b_type = 100; /*나루 초기값*/
		
		
		
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
	public ModelAndView pointPaymentForward(ModelAndView mv, @RequestParam(defaultValue="1") int currentPage, HttpSession session){

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
		
		try {
			
			listCount = ps.getPaymentListCount(mno);
			
			maxPage = (int)((double)listCount / limit + 0.9);
			startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
			endPage = startPage + limit -1;
			if(maxPage<endPage){
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, mno);
			
			ArrayList<Payment> pList = ps.selectPaymentList(pi);
			
			int totalPoint = ps.selectTotalPoint(mno);
			
			mv.addObject("pList", pList);
			mv.addObject("pi", pi);
			mv.addObject("totalPoint",totalPoint);
			mv.setViewName("mypage/myPage_pointPayment");
		} catch (PaymentListSelectException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	@RequestMapping(value="refundView.me")
	public ModelAndView RefundForward(ModelAndView mv, @RequestParam(defaultValue="1") int currentPage, HttpSession session){
		
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
		
		try {
			/*환급 내역 LIST*/
			
			listCount = ps.getRefundListCount(mno);
			
			maxPage = (int)((double)listCount / limit + 0.9);
			startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
			endPage = startPage + limit -1;
			if(maxPage<endPage){
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, mno);
			
			ArrayList<Withdraw> wList = ps.selectWithdrawList(pi);
			
			System.out.println("wList : " + wList);
			
			/*은행 LIST*/
			ArrayList<Bank> bankList = bs.selectAllBankList();
			
			/*사용자 총 포인트 량*/
			int userTotalPoint = ps.selectTotalPoint(mno);
			
			mv.addObject("wList", wList);
			mv.addObject("pi", pi);
			mv.addObject("bankList", bankList);
			mv.addObject("userTotalPoint",userTotalPoint);
			mv.setViewName("mypage/myPage_refund");
			
		} catch (BankSelectAllException | PaymentListSelectException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 마이페이지 페이지 이동 end
	
}
