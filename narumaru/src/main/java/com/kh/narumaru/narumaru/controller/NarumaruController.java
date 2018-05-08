package com.kh.narumaru.narumaru.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.narumaru.common.model.exception.alarmRequestException;
import com.kh.narumaru.common.model.service.AlarmService;
import com.kh.narumaru.common.model.vo.Alarm;
import com.kh.narumaru.declaration.model.service.DeclarationService;
import com.kh.narumaru.maru.exception.MaruException;
import com.kh.narumaru.maru.model.service.MaruService;
import com.kh.narumaru.maru.model.vo.MaruMember;
import com.kh.narumaru.member.model.exception.selectChanelException;
import com.kh.narumaru.member.model.service.ChannelService;
import com.kh.narumaru.member.model.service.MemberService;
import com.kh.narumaru.member.model.vo.Channel;
import com.kh.narumaru.member.model.vo.Member;
import com.kh.narumaru.naru.model.service.NaruService;
import com.kh.narumaru.naru.model.vo.Theme;
import com.kh.narumaru.narumaru.exception.NarumaruException;
import com.kh.narumaru.narumaru.model.service.NarumaruService;
import com.kh.narumaru.narumaru.model.vo.Board;
import com.kh.narumaru.narumaru.model.vo.Narumaru;
import com.kh.narumaru.payment.model.service.UsePointService;
import com.kh.narumaru.payment.model.vo.UsePoint;

@Controller
@SessionAttributes("nm")
public class NarumaruController {
	/**/
	@Autowired
	private NarumaruService nms;
	@Autowired
	private ChannelService cs;
	@Autowired
	private MaruService ms;
	@Autowired
	private AlarmService as;
	@Autowired
	private NaruService ns;
	@Autowired
	private MemberService mems;
	@Autowired
	private UsePointService us;
	@Autowired
	private DeclarationService ds;
	
	@RequestMapping("goHome.nm")
	public String goHome(){
		return "main/main";
	}
	
	@RequestMapping(value = "boardListAll.bo")
	public ModelAndView showBoardList(int nmno, ModelAndView mv, HttpServletRequest request){
		System.out.println("조회하는 나루마루번호 " + nmno);
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		ArrayList<Board> list = nms.selectBoardList(nmno);
		ArrayList<Board> colist = nms.selectCommentList(nmno);
		Narumaru nm = nms.selectNarumaruOne(nmno);
		if(list.size() == 0){
			Board newB = new Board();
			newB.setbWriter("");
			newB.setbType(0);
			newB.setNmno(nmno);
			newB.setStatus("Y");
			newB.setNeedPoint(0);
			newB.setCreateDate("");
			newB.setbTno(0);
			newB.setBno(0);
			newB.setCano(0);
			newB.setCno(0);
			newB.setIsOpen("all"); 
			newB.setComments(0);
			newB.setbLevel(0);
			if(nm.getNmCategory()==2){
				newB.setbContent("나루 가입을 환영합니다! 마음껏 글을 작성해보세요.");				
			}else{
				newB.setbContent("마루 가입을 환영합니다! 마음껏 글을 작성해보세요.");
			}
			
			list.add(newB);
		}		
		int isOwner = nms.checkNarumaruOwner(nmno, loginUser);
		System.out.println("isOwner : " + isOwner);
		Member owner = mems.selectMemberOne(isOwner);
		
		System.out.println("owner : " + owner);
		
		mv.addObject("nm", nm);
		mv.addObject("list", list);
		mv.addObject("colist", colist);
		mv.addObject("isOwner", isOwner);
		mv.addObject("owner",owner);

		if(nm.getNmCategory() ==2){
			Theme theme = nms.selectThemeOne(nmno); // 나루의 테마
			int isNeighbor = nms.checkNeighbor(nmno, loginUser); // 이웃 여부
			ArrayList<Narumaru> neighborList = ns.selectNeighborList(nmno); // 해당 나루의 이웃 리스트
			ArrayList<UsePoint> hpayList = us.selectUsePoint(loginUser.getMid()); // 로그인 유저의 구매리스트
			mv.addObject("theme", theme);
			mv.addObject("isNeighbor",isNeighbor);
			mv.addObject("hpayList",hpayList);
			mv.addObject("neList",neighborList);
			
			mv.setViewName("naru/naruBoard"); 
		}else{
			mv.setViewName("maru/maruBoard"); 
		}
		
		
		return mv;
	}
	
	@RequestMapping(value = "boardListCategory.bo")
	public ModelAndView showCategoryBoardList(int nmno, int cano, ModelAndView mv, HttpServletRequest request){
		System.out.println("조회하는 나루마루번호 " + nmno);
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		
		ArrayList<Board> list = nms.selectCategoryBoardList(nmno, cano);
		ArrayList<Board> colist = nms.selectCommentList(nmno);
		Narumaru nm = nms.selectNarumaruOne(nmno);
		if(list.size() == 0){
			Board newB = new Board();
			newB.setbWriter("");
			newB.setbType(0);
			newB.setNmno(nmno);
			newB.setStatus("Y");
			newB.setNeedPoint(0);
			newB.setCreateDate("");
			newB.setbTno(0);
			newB.setBno(0);
			newB.setCano(0);
			newB.setCno(0);
			newB.setIsOpen("all"); 
			newB.setComments(0);
			newB.setbLevel(0);
			newB.setbContent("아직 카테고리에 글이 없습니다.");				
			
			list.add(newB);
		}		
		int isOwner = nms.checkNarumaruOwner(nmno, loginUser);
		
		mv.addObject("nm", nm);
		mv.addObject("list", list);
		mv.addObject("colist", colist);
		mv.addObject("isOwner", isOwner);

		if(nm.getNmCategory() ==2){
			Theme theme = nms.selectThemeOne(nmno); // 나루의 테마
			int isNeighbor = nms.checkNeighbor(nmno, loginUser); // 이웃 여부
			ArrayList<Narumaru> neighborList = ns.selectNeighborList(nmno); // 해당 나루의 이웃 리스트
			ArrayList<UsePoint> hpayList = us.selectUsePoint(loginUser.getMid()); // 로그인 유저의 구매리스트
			mv.addObject("theme", theme);
			mv.addObject("isNeighbor",isNeighbor);
			mv.addObject("hpayList",hpayList);
			mv.addObject("neList",neighborList);
			
			mv.setViewName("naru/naruBoard"); 
		}else{
			mv.setViewName("maru/maruBoard"); 
		}
		
		
		return mv;
	}
	
	@RequestMapping(value = "searchBoard.nm")
	public ModelAndView searchBoard(String search, Board b, ModelAndView mv, HttpServletRequest request){
		System.out.println("조회하는 나루마루번호 " + b.getNmno());
		System.out.println(b);  
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser);
		b.setbLevel(0);
		ArrayList<Board> list = nms.searchBoard(b);
		b.setbLevel(1);
		ArrayList<Board> colist = nms.searchBoard(b);
		Narumaru nm = nms.selectNarumaruOne(b.getNmno());
		Theme theme = nms.selectThemeOne(b.getNmno());
		
		int isOwner = nms.checkNarumaruOwner(b.getNmno(), loginUser);

		mv.addObject("nm", nm);
		mv.addObject("list", list);
		mv.addObject("colist", colist);
		mv.addObject("isOwner", isOwner);
		mv.addObject("theme", theme);
		if(nm.getNmCategory() ==2){
			mv.setViewName("naru/naruBoard"); 
		}else{
			mv.setViewName("maru/maruBoard"); 
		}
		
		
		return mv;
	}
	
	
	
	@RequestMapping(value = "selectNarumaruName.bo")
	public void selectNarumaruName(HttpServletResponse response, int nmno, String bWriter, String bContent, String createDate){
		Narumaru nm = nms.selectNarumaruOne(nmno);
		
		try {
			HashMap hm = new HashMap();
			String nmName = nm.getNmTitle();
			
			hm.put("nmName", nmName);
			hm.put("bWriter", bWriter);
			hm.put("bContent", bContent);
			hm.put("createDate", createDate);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(hm, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "selectBoardListAjax.bo")
	public void selectBoardListAjax(HttpServletRequest request, HttpServletResponse response){
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		try {
			ArrayList<Board> list = null;
			ArrayList<Board> colist = null;
			
			list = nms.selectWritedBoardList(loginUser.getMid());
			colist = nms.selectCommentListAll();

			HashMap resultMap = new HashMap();
			
			resultMap.put("list", list);
			resultMap.put("colist", colist);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(resultMap, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="selectChannelList.nm")
	public void checkNarumaruOwner(HttpServletRequest request, HttpServletResponse response) throws selectChanelException{
		try {
			ArrayList<Channel> clist = cs.selectAllChannel();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(clist, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "checkNarumaruOwner.nm")
	public void checkNarumaruOwner(int nmno, HttpServletRequest request, HttpServletResponse response){
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		try {
			int isOwner = nms.checkNarumaruOwner(nmno, loginUser);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(isOwner, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "toUpdateBoardPage.nm")
	public ModelAndView toUpdateBoardPage(int bno, int nmno, ModelAndView mv){
		Narumaru nm = nms.selectNarumaruOne(nmno);
		Board b = nms.selectBoardOne(bno);
		
		mv.addObject("nm", nm);
		mv.addObject("b", b);

		mv.setViewName("naru/naruUpdateBoard");
		
		return mv;
	}
	
	@RequestMapping("insertNarumaruBoard.nm")
	public String insertNaruBoard( int nmno, HttpServletRequest request, @RequestParam(name="files", required=false) MultipartFile file) throws NarumaruException{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles";
		
		System.out.println(nmno);
		Enumeration iter = request.getParameterNames();
		while(iter.hasMoreElements()){
			String parameterName = (String) iter.nextElement();
			System.out.println(parameterName + ":" + request.getParameter(parameterName));
		}
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser"); 
		
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardHidden = request.getParameter("boardHidden");
		
		int channel = 0;  
		if(request.getParameter("channel") != null) channel = Integer.parseInt(request.getParameter("channel"));
		int category = 0; 
		if(request.getParameter("category") != null) category=Integer.parseInt(request.getParameter("category"));
		int needPoint = 0;
		if(request.getParameter("needPoint") != null) needPoint=Integer.parseInt(request.getParameter("needPoint"));
		int targetBno = 0;
		if(request.getParameter("targetBno") != null) targetBno=Integer.parseInt(request.getParameter("targetBno"));
		int bLevel = 0;
		if(request.getParameter("bLevel") != null) bLevel=Integer.parseInt(request.getParameter("bLevel"));
		int bType = 0;
		if(request.getParameter("bType") != null) bType=Integer.parseInt(request.getParameter("bType"));		
		
		String openLevel = request.getParameter("openLevel");
		String replyCondition = request.getParameter("replyCondition");
		
		System.out.println(boardTitle);
		System.out.println(boardContent); 
		System.out.println(boardHidden);
		System.out.println("채널:" + channel);
		System.out.println(category);
		System.out.println(needPoint);
		System.out.println(openLevel);
		System.out.println(replyCondition);
		
		Board b = new Board();
		
		b.setbTitle(boardTitle);
		b.setbContent(boardContent);
		
		if(boardHidden==null){
			b.setbHidden("");
		}else{
			b.setbHidden(boardHidden);
		}
		b.setCno(channel);

		if(nms.selectNarumaruType(nmno) == 1){
			// 마루일때
			
			if(targetBno!=0){
				bType = 201;
			}else{
				bType = 200;
			}
		}else{
			// 나루일때
			if(targetBno!=0){
				bType = 101;
			}else{
				bType = 100;
			}
		}
		b.setbType(bType);
		b.setMno(loginUser.getMid());
		b.setCano(category);
		b.setNmno(nmno);
		b.setIsOpen(openLevel);
		b.setbLevel(bLevel);
		b.setTargetBno(targetBno);
		b.setbType(bType);
		b.setNeedPoint(needPoint);
		nms.insertNarumaruBoard(b);
		
		if(targetBno!=0){
			ArrayList<Alarm> alarm = new ArrayList<>();
			// 보낼 유저의 번호를 구한다. 
			ArrayList<Integer> sendUser = null;
			sendUser = new ArrayList<>();
			sendUser.add(b.getMno());
			
			int oriWriterMo = nms.getBoardWriter(b);
			
			//Controller에서 Alarm객체에 값을 채운 후 Service로 보내주세요.
			for(int i = 0; i < sendUser.size(); i++){
				alarm.add(new Alarm());
				alarm.get(i).setReceive_mno(oriWriterMo);
				alarm.get(i).setSend_mno(sendUser.get(i));
				alarm.get(i).setSend_bno(b.getTargetBno());
				alarm.get(i).setAtno(300);
				alarm.get(i).setSend_nmno(nmno);
				System.out.println(alarm);
			}
			
			try {
				as.alarmRequest(alarm);
			} catch (alarmRequestException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
	@RequestMapping("updateBoardOne.nm")
	public String updateBoardOne(int nmno, HttpServletRequest request) throws NarumaruException{
		Member loginUser = (Member)request.getSession().getAttribute("loginUser"); 
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardHidden = request.getParameter("boardHidden");
		
		int channel = 0;  
		if(request.getParameter("channel") != null) channel = Integer.parseInt(request.getParameter("channel"));
		int category = 0; 
		if(request.getParameter("category") != null) category=Integer.parseInt(request.getParameter("category"));
		int needPoint = 0;
		if(request.getParameter("needPoint") != null) needPoint=Integer.parseInt(request.getParameter("needPoint"));
		
		String openLevel = request.getParameter("openLevel");
		String replyCondition = request.getParameter("replyCondition");
		
		Board b = new Board();
		
		b.setBno(bno);
		b.setbTitle(boardTitle);
		b.setbContent(boardContent);
		
		if(boardHidden==null){
			b.setbHidden("");
		}else{
			b.setbHidden(boardHidden);
		}
		b.setCno(channel);
		
		int bType = 0; 

		if(nms.selectNarumaruType(nmno) == 1){
			// 마루일때
			bType = 200;
		}else{
			// 나루일때
			bType = 100;
		}
		
		b.setbType(bType);
		b.setMno(loginUser.getMid());
		b.setCano(category);
		b.setNmno(nmno);
		b.setIsOpen(openLevel);
		
		nms.updateBoardOne(b);
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
	@RequestMapping("insertComment.nm")
	public void insertComment(HttpServletRequest request, int nmno, int bno, String bContent) throws NarumaruException{
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		Board b = new Board();
		
		b.setbContent(bContent);
		int bType = 0; 

		if(nms.selectNarumaruType(nmno) == 1){
			// 마루일때
			bType = 201;
		}else{
			// 나루일때
			bType = 101;
		}
		b.setbLevel(1);
		b.setTargetBno(bno);
		b.setNmno(nmno);
		b.setbType(bType);
		b.setMno(loginUser.getMid());
		b.setIsOpen("all");
		b.setNeedPoint(0);
		
		nms.insertComment(b);
		
		ArrayList<Alarm> alarm = new ArrayList<>();
		// 보낼 유저의 번호를 구한다.
		ArrayList<Integer> sendUser = null;
		sendUser = new ArrayList<>();
		sendUser.add(b.getMno());
		
		int oriWriterMo = nms.getBoardWriter(b);
		
		//Controller에서 Alarm객체에 값을 채운 후 Service로 보내주세요.
		for(int i = 0; i < sendUser.size(); i++){
			alarm.add(new Alarm());
			alarm.get(i).setReceive_mno(oriWriterMo);
			alarm.get(i).setSend_mno(sendUser.get(i));
			alarm.get(i).setSend_bno(b.getTargetBno());
			alarm.get(i).setAtno(300);
			alarm.get(i).setSend_nmno(nmno);
			System.out.println(alarm);
		}
		
		try {
			as.alarmRequest(alarm);
		} catch (alarmRequestException e) {
			e.printStackTrace();
		}
		System.out.println("인서트됨");
	}
	
	@RequestMapping("deleteBoardOne.nm")
	public String deleteBoardOne(int bno, int nmno, int type) throws NarumaruException{
		nms.deleteBoardOne(bno);
		
		if(type == 1) return "redirect:/boardListAll.bo?nmno="+nmno;
		else return "redirect:myboardView.me";
	}
	
	@RequestMapping("reportBoardOne.nm")
	public String reportBoardOne(int bno, int nmno, int type, String reason, HttpServletRequest request) throws NarumaruException{
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int mno = loginUser.getMid();
		
		ds.reportBoardOne(mno, bno, reason, nmno);
		
		if(type == 1) return "redirect:/boardListAll.bo?nmno="+nmno;
		else return "redirect:myboardView.me";
	}
	
	@RequestMapping("insertNarumaru.nm")
	public String insertNarumaru(Narumaru nm, ModelAndView mv, HttpServletRequest request){
		System.out.println(nm);
		try {
			int nmno = nms.insertNarumaru(nm).getNmno();
			System.out.println(nmno);
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			
			//나루마루의 주인을 추가함
			MaruMember mm = new MaruMember();
			mm.setMno(loginUser.getMid());
			mm.setNmno(nmno);
			mm.setConLevel(0);
			System.out.println("mm:"+mm);
			ms.insertMaruMember(mm);
			
		} catch (NarumaruException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");			
		} catch (MaruException e) {
			mv.addObject("message", e.getMessage());
			mv.setViewName("common/errorPage");	
		}
		
		return "redirect:/boardListAll.bo?nmno="+nm.getNmno();
	}
	
	@RequestMapping("updateDefault.nm")
	public String updateDefault(int nmno, HttpServletRequest request){
		Narumaru nm = new Narumaru();
		
		nm.setNmno(nmno);
		nm.setNmTitle(request.getParameter("nmTitle"));
		nm.setNmIntro(request.getParameter("nmIntro"));
		
		nms.updateDefault(nm);
		
		return "redirect:/boardListAll.bo?nmno="+nmno;
	}
	
	@RequestMapping("narumaruSelectOne.nm")
	public void narumaruSelectOne(@RequestParam(value="nmno") int nmno, HttpServletRequest request, HttpServletResponse response){
		
		Narumaru nm = nms.selectNarumaruOne(nmno); 
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		try {
			new Gson().toJson(nm, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectChannelBoardList.nm")
	public void selectChannelBoardList(int cno, HttpServletRequest request, HttpServletResponse response){
		ArrayList<Board> list = nms.selectChannelBoardList(cno);

		try {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("searchNarumaruBoard.nm")
	public ModelAndView searchNarumaruBoard(String searchCondition, ModelAndView mv){
		ArrayList<Board> blist = nms.searchNarumaruBoard(searchCondition);
		ArrayList<Narumaru> nmlist = nms.searchNarumaru(searchCondition);
		ArrayList<Narumaru> narulist = nms.searchNarumaru(searchCondition);
		ArrayList<Narumaru> marulist = nms.searchNarumaru(searchCondition);
		
		int naruCount = 0;
		int maruCount = 0;
		
		for(Narumaru nm : nmlist){
			if(nm.getNmCategory() == 1) {
				maruCount++;
				marulist.add(nm);
			}
			else {
				naruCount++;
				narulist.add(nm);
			}
		}
		
		mv.addObject("blist", blist);
		mv.addObject("marulist", nmlist);
		mv.addObject("narulist", nmlist);
		mv.addObject("naruCount", naruCount);
		mv.addObject("maruCount", maruCount);
		mv.addObject("searchCondition", searchCondition);
		mv.setViewName("maru/maruSearchResult");
		
		return mv;
	}
	
	@RequestMapping("searchNarumaruBoardDetail.bo")
	public ModelAndView searchNarumaruBoardDetail(String searchCondition, ModelAndView mv){
		ArrayList<Board> blist = nms.searchNarumaruBoard(searchCondition);
		
		mv.addObject("blist", blist);
		mv.addObject("searchCondition", searchCondition);
		mv.setViewName("maru/maruSearchResultDetail");
		
		return mv;
	}
	
	@RequestMapping("selectBestNaru.nm")
	public void selectBestNaru(HttpServletRequest request, HttpServletResponse response){
		try {
			ArrayList<Narumaru> list = nms.selectBestNaru();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectBestMaru.nm")
	public void selectBestMaru(HttpServletRequest request, HttpServletResponse response){
		try {
			ArrayList<Narumaru> list = nms.selectBestMaru();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
