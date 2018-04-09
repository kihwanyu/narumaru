<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	*{
		margin:0 auto;
		list-style:none;
		text-decoration:none;
	}
	.footer-top a::after, .footer-middle span::after{
		content: '';
    	display: inline-block;
    	width: 0;
    	height: 14px;
    	margin: 2px 4px 0 8px;
    	vertical-align: text-top;
    	border-left: 1px solid rgba(0,0,0,.15);
	}
</style>
	<div id="container" style="background-color:#f7f8f9; color:gray; font-size:0.9em; border-top:1px solid rgba(0,0,0,.15);">
	<br>
		<div align="center" class="footer-top">
			<a href="#" style="color:gray;">&nbsp;이용약관 </a>
			<a href="#" style="color:gray;">&nbsp;개인정보처리방침 </a>
			<a href="#" style="color:gray;">&nbsp;도움 센터 </a>
			<a href="#" style="color:gray; border-right:0;">&nbsp;소개 </a>
			&nbsp;
			<label>© NARUMARU, INC.</label>
		</div>
		<br>
		<div align="center" class="footer-middle">
			<span>주식회사 나루마루</span><span>사업자등록번호:있으면좋겠다</span><span>조:지 아이 조</span><span>팀장:유기환</span><br>
			<span>책임정보관리 책임자:김지현</span><span>주소:서울특별시 강남구 역삼1동 강남구 테헤란로14길 6</span><br>
			<span>연락처:010-4919-3656</span><span>이메일:slayra@naver.com</span>
		</div>		
		<br>
	</div>