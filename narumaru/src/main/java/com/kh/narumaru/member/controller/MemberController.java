package com.kh.narumaru.member.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.member.oauth.bo.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.narumaru.member.model.exception.LoginException;
import com.kh.narumaru.member.model.exception.ProfileChangeException;
import com.kh.narumaru.member.model.exception.birthdayChangeException;
import com.kh.narumaru.member.model.exception.nameChangeException;
import com.kh.narumaru.member.model.exception.selectChanelException;


@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	
	
	
	@Autowired
	private MemberService ms;
	@Autowired
	private ChannelService cs;
	
	
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
		
		try {
			Member loginUser = ms.loginMember(m);
			
			//session.setAttribute("loginUser", loginUser);
			
			/*return "main/main";*/
			
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
	
	
	//카카오 이메일 인증
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
	//마이페이지 Info end//
	
	// 마이페이지 페이지 이동 start
	@RequestMapping(value="myInfoView.me")
	public ModelAndView myInfoForward(ModelAndView mv){
		
		ArrayList<Channel> cList = null;
		try {
			cList = cs.selectAllChannel();
			System.out.println("cList : " + cList);
			mv.addObject("cList", cList);
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
