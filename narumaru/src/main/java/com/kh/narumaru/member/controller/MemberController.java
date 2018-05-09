package com.kh.narumaru.member.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;
import java.util.HashMap;

import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpRequest;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import com.kh.narumaru.member.model.vo.LogInfo;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.member.oauth.bo.NaverLoginBO;
import com.kh.narumaru.payment.model.exception.BankSelectAllException;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.service.BankSevice;
import com.kh.narumaru.payment.model.service.PaymentService;
import com.kh.narumaru.payment.model.vo.Bank;
import com.kh.narumaru.payment.model.vo.Payment;
import com.kh.narumaru.payment.model.vo.Stats;
import com.kh.narumaru.payment.model.vo.UsePoint;
import com.kh.narumaru.payment.model.vo.Withdraw;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.narumaru.common.model.service.NeighborService;
import com.kh.narumaru.common.model.vo.Neighbor;
import com.kh.narumaru.common.model.vo.PageInfo;
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
import com.kh.narumaru.narumaru.model.vo.InvateMember;
import com.kh.narumaru.narumaru.model.vo.Narumaru;
import com.kh.narumaru.payment.model.exception.PaymentListSelectException;
import com.kh.narumaru.payment.model.service.PaymentService;
import com.kh.narumaru.payment.model.vo.Payment;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	@Autowired
	private JavaMailSender mailSender;
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
	@Autowired
	private NeighborService nc;
	
	@RequestMapping(value="findMember.me")
	public String findMember(){
		
		return "member/findMember";
	}
	
	@RequestMapping(value="logout.me", method=RequestMethod.GET)
	public String logout(/*HttpSession session*/SessionStatus status){
		
		status.setComplete();
		
		return "main/mainLogin";
	}
	
	
	@RequestMapping(value="findEmail.me")
	public ModelAndView findEmail(ModelAndView mv,HttpServletRequest request, HttpServletResponse response){
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		System.out.println("이메일찾기" + name + "  " + phone);
		
		Member m = new Member();
		
		m.setNickName(name);
		m.setPhone(phone);
		
		String email = ms.findEmail(m);
		System.out.println(email);
		
		m.setEmail(email);
		
		mv.addObject("Member", m);
		mv.setViewName("jsonView");	
		
		return mv;
		
	}
	
	@RequestMapping(value="searchPwd.me")
	public ModelAndView searchPwd(ModelAndView mv,HttpServletRequest request, HttpServletResponse response){
		
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String message2 = "";
		System.out.println("비밀번호찾기" + email + "  " + phone);
		
		Member m = new Member();
		Member m2 = null;
		
		m.setEmail(email);
		m.setPhone(phone);
		
		boolean result = false;
		result = ms.sendPwd(m);
		
		if(result == true){
			System.out.println("회원가입여부 있음");
			
			int[] newPwd = new int[6];
			String newPwd2 = "a";
			for(int i = 0; i < newPwd.length; i++){
				
				int ran = new Random().nextInt(10);
				newPwd[i] = ran; 	
			}
			
			for(int i = 0; i<newPwd.length; i++){
				System.out.println(newPwd[i]);
				newPwd2 += newPwd[i];
			}
			System.out.println(newPwd2);
			
			m2 = new Member();
			m2.setEmail(email);
			m2.setUserPwd(newPwd2);
			
			m2.setUserPwd(passwordEncoder.encode(newPwd2));
			ms.sendUpdatePwd(m2);
			
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom("wlgus12312@gmail.com");
			message.setTo(email);
			message.setSubject("나루마루 비밀번호 찾기안내");
			message.setText("나루마루입니다. 비밀번호가 " + newPwd2 + " 로 변경되었습니다.");
			
			mailSender.send(message);
			
			message2 = "비밀번호가 가입한 메일로 전송되었습니다.";
		}else{
			System.out.println("회원가입여부 없음");
			message2 = "가입한 정보가 없습니다.";
		}
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
		
		mv.addObject("Message", message2);
		mv.setViewName("jsonView");	
		
		return mv;
	}
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public ModelAndView showMainView(LogInfo li, Member m, ModelAndView mv, SessionStatus status, HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("controller Member : " + m);
		
		if(m.getEmail().equals("")){
			String nameError = "아이디 / 비밀번호를 입력하세요!!";
			mv.addObject("message", nameError);
			mv.setViewName("common/errorPage");
			return mv;
			
		}
		//아이피 받아오기
		String ip = request.getHeader("X-Forwarded-For");
       // System.out.println(">>>> X-FORWARDED-FOR : " + ip);
        if (ip == null) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null) {
            ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null) {
            ip = request.getRemoteAddr();
        }
        System.out.println(">>>> Result : IP Address : "+ip);
		
		try {
			Member loginUser = ms.loginMember(m);
			//session.setAttribute("loginUser", loginUser);
			/*return "main/main";*/
			System.out.println("loginUser : " + loginUser);
			
			//로그인포 객체 생성
			li.setEmail(loginUser.getEmail());
			li.setUserIp(ip);
			
			long time = System.currentTimeMillis(); 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			String str = dayTime.format(new Date(time));
			System.out.println(str);
			
			li.setTime(str);
			
			//String nation = ms.loginNation(li.getUserIp());
			
			//String ParseIP = ms.parseIP(ip); 
			
			String[] o1 = new String[4];
			
			o1 = ip.split("\\.");
			//ip = "174.36.207.186";
			//o1 = ip.split("\\.");
			/*for (int i = 0; i < o1.length; i++) {
				System.out.println("노애미 아이피" + o1[i]);
			}*/
			
			long intIp = 0;
			
			intIp = (Long.parseLong(o1[0])*16777216)
		             + (Long.parseLong(o1[1])*65536)
		             + (Long.parseLong(o1[2])*256)
		             + Long.parseLong(o1[3]);
			
			li.setLongIp(intIp);
			
			LogInfo li2 = ms.selectNation(li);
			
			System.out.println("로그객체 : " + li2);
			
			li2.setMno(loginUser.getMid());
			li2.setSuccess_value("KR");
			
			ms.insertLogInfo(li2);
			
			mv.addObject("loginUser", loginUser);
			
			if(loginUser.getMid() <= 6){
				mv.setViewName("redirect:/adMain.ad");
			}else{
				mv.setViewName("main/main");
			}
			
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
			ms.insertMember(m);
			System.out.println("컨트롤러 회원가입: " + m);
			m.setUserPwd(request.getParameter("userPwd"));
			Member loginUser = ms.loginMember(m);
			int nmno = nms.insertNarumaru(nm).getNmno();
			
			MaruMember mm = new MaruMember();
			mm.setMno(loginUser.getMid());
			mm.setNmno(nmno);
			mm.setConLevel(0);
			System.out.println("mm:"+mm);
			mas.insertMaruMember(mm);
			
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
		
		//국제 번호
		//phone = "82+" + phone.substring(1, phone.length());
		
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
	
	@RequestMapping(value="myLoginView.me")
	public ModelAndView myLoginForward(HttpSession session,LogInfo li,ModelAndView mv, @RequestParam(defaultValue="1") int currentPage){
		
		System.out.println("으흠..접속이되나");
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();	
		
		//페이징처리
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		/*limit = 10;*/
		limit = 5;
		
		int listCount = 0;
		
		listCount = ms.getLoginCount(mno);
		
		System.out.println("listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, mno);
		
		ArrayList<LogInfo> loginList = ms.getLoginListCount(pi);
		
		System.out.println("loginList : " + loginList);
		
		mv.addObject("loginList", loginList);
		mv.addObject("pi", pi);
		mv.setViewName("mypage/myPage_loginRecord");
		
		return mv;
	}
	
	
	@RequestMapping(value="invitedMaruView.me")
	public ModelAndView invitedMaruForward(ModelAndView mv, HttpSession session
											, @RequestParam(defaultValue="1") int currentPage){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();	
		
		//페이징처리
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		/*limit = 10;*/
		limit = 5;
		
		int listCount = 0;
		
		listCount = mas.getInvitedMaruCount(mno);
		
		System.out.println("listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, mno);
		
		ArrayList<InvateMember> InvateMemberList = mas.selectInvitedMaruCount(pi);
		
		System.out.println("InvateMemberList : " + InvateMemberList);
		
		mv.addObject("InvateMemberList", InvateMemberList);
		mv.addObject("pi", pi);
		mv.setViewName("mypage/myPage_invitedMaru");
		
		return mv;
	}
	@RequestMapping(value="resisteredMaruView.me")
	public ModelAndView resisteredMaruForward(ModelAndView mv){
		
		mv.setViewName("mypage/myPage_resisteredMaru");
		
		return mv;
	}
	@RequestMapping(value="naruRevenue.me")
	public ModelAndView naruRevenueForward(ModelAndView mv, HttpSession session
											, @RequestParam(defaultValue="1") int currentPage
											, @RequestParam(defaultValue="2018") int year){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();	
		
		//페이징처리
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		/*limit = 10;*/
		limit = 5;
		
		int listCount = 0;
		
		listCount = ps.getRevenueListCount(mno);
		
		System.out.println("listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, mno);
		
		ArrayList<UsePoint> uList = ps.selectRevenueList(pi);
		
		ArrayList<String> beingYearList = ps.getBeingYearList(mno);
		
		Stats s = new Stats();
		
		s.setMno(mno);
		s.setYear(year);
		
		ArrayList<Stats> sList = ps.selectYearMonthRevenueStats(s);
		
		int count = 0;
		
		String[] statsArr = new String[12];
		
		for(int i = 0; i < statsArr.length; i++){
			System.out.println("i : " + i);
			System.out.println("count : " + count);
			if(count < sList.size()&&i==Integer.valueOf(sList.get(count).getMonth())-1){
				statsArr[i] = String.valueOf(sList.get(count).getAmount());
				count++;
			}else {
				statsArr[i] = "0";
			}
		}
		
		int revenuePoint = ps.getRevenueTotalPoint(mno);
		
		mv.addObject("uList", uList);
		mv.addObject("pi", pi);
		mv.addObject("statsArr",statsArr);
		mv.addObject("year",year);
		mv.addObject("revenuePoint",revenuePoint);
		mv.addObject("beingYearList", beingYearList);
		mv.setViewName("mypage/myPage_NaruRevenueList");
		
		return mv;
		
	}
	
	@RequestMapping(value="naruNeighborListView.me")
	public ModelAndView NaruNeighborListForward(ModelAndView mv, HttpSession session, @RequestParam(defaultValue="1") int currentPage){
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int mno = loginUser.getMid();	
		
		//페이징처리
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		/*limit = 10;*/
		limit = 5;
		
		int listCount = 0;
		
		listCount = nc.getNeighborListCount(mno);
		
		System.out.println("listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1)*limit + 1;
		endPage = startPage + limit -1;
		if(maxPage<endPage){
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage, mno);
		
		ArrayList<Neighbor> nList = nc.selectNeighborList(pi);
		
		System.out.println("nList : " + nList);
		
		mv.addObject("nList", nList);
		mv.addObject("pi", pi);
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
	@RequestMapping(value="myboardView.me")
	public ModelAndView myBoardForward(ModelAndView mv){
		mv.setViewName("mypage/myPage_myboard"); 
		
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
