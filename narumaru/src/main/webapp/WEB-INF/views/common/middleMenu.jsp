<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.maruBody{
		background: #eef0f3;
	}
	.wrap{	
		width:1000px;		
	}
	.ul li{
		display:inline-block;
	}
	.innerMenu{
		/* background:yellow; */
		width:1000px;
		margin-top:50px;
		position:relative;			
	}
	.innerTop{
		background:yellowgreen;
		height:30px;
		width:100%;
		margin-bottom:10px;	
		position:fixed;		
	}
	.innerTopMenu{
		/* background:green; */
		width:500px;
		height:100%;
	}
	.innerTopUl li{
		/* border:1px solid black; */
		color:white;
		margin-right:20px;
		margin-left:20px;
	}
	.innerTopUl li:hover {
		font-size: 1.5em;
		text-decoration: underline;
	}
	.leftArea{
		float:left;
		top:100px;
		width:240px;
		position:fixed;	
	}
	.maruProfile{
		width:200px;
		height:150px;
		border:1px solid lightgray;
	}
	.maruName{
		width:200px;
	}
	.maruMember{
		width:200px;
	}
	.maruSetting{
		width:200px;
	}
	.rightArea{	
		border:1px solid lightgray;
		width:240px;
		top:100px;
		/* position:fixed; */
	}
	.rightTitle{
		border:1px solid lightgray;
		padding:10px;
	}
	.rightMenu{
		width:240px;
		background:white;
		margin-top:50px;
		position:fixed;
	}
	.chatContent{
		padding:10px;
		border:1px solid lightgray;
	}
	.pointer{
		cursor:pointer;
	}
	.sub{
		position:absolute;
		width:150px;
		background:white;
		border:1px solid lightgray;
		display:none;
	}
	.chatPhoto{
		float:left;
		border:1px solid lightgray;
		width:25px;
		height:25px;
	}
	
	.content{
		width:500px;
		top:100px;	
	}

	.dumi{
		height:50px;
	}
	.searchArea{	
		background:white;	
		padding:auto;
	}
	.boardInsert{
		background:white;
		width:500px;
		height:200px;
		border:1px solid lightgray;			
	}
	.textArea{
		width:100%;
		height:90%;
	}
	.boardInsert li{
		margin-right:20px;
	}
	.boardInsertcontent{
		height:100px;
	}
	.boardInsertTab{
		height:50px;
		background:gray;
		bottom:0px;
	}
	.boardInsertUl{
		float:left;
		width:400px;
	}
	.boardInsertUl li{
		cursor:pointer;
		margin-top:9px;
		width:30px;
		height:30px;
		border:1px solid lightgray;
	}
	.inertBoardBtn{
		height:100%;
	}
	.boardInfo{
		padding:10px;
		height:50px;
	}
	.writerPhoto{
		height:70px;
		width:70px;
		border:1px solid lightgray;
		display:inline-block;	
		float:left;
		margin-right:10px;
	}
	.size100per{
		height:100%;
		width:100%;	
	}
	.boardBtn{
		height:40px;
		width:40px;
		border:1px solid lightgray;
	}
	.boardContent{
		padding:20px;
	}
	.boardfoot{
		height:50px;
		bottom:0px;
	}
	.marginAuto{
		margin-left:auto;
		martgin-right:auto;
	}
	.footUl li{
		float:left;
		margin-left:50px;
		cursor:pointer;
	}
	.insertReply{
		display:none;
		background:gray;
	}
	.replyArea{
		padding:10px;
	}
	.content > div{
		margin-top:10px;
		background:white;
		border:1px solid lightgray;
	}
	.floatRight{
		float:right;
	}
	.albumContent{
		height:400px;
	}	
	.albumMiniContent{
		border:1px solid lightgray;
	}
	#calendar {
    	max-width: 900px;
    	margin: 0 auto;
    	height:500px;
  	}
  	.inlineBlock{
  		display:inline-block;
  	}
  	.photoThumb{
  		width:150px;
  		height:100px;
  		border:1px solid lightgray;
  		margin:10px;
  	}
  	.note-editor{
  		z-index:0;
  	}
</style>
</head>
<body>
	<div class="innerTop">
		<div class="marginAuto innerTopMenu">
			<ul class="ul innerTopUl marginAuto">
				<li><a href="boardListAll.bo?nmno=${ nm.nmno }">전체글</a></li>
				<li><a href="showMaruAlbum.ma">사진첩</a></li>
				<li><a href="showMaruCalendar.ma">일정</a></li>
				<li><a href="showMaruMember.ma">멤버</a></li>
			</ul>
		</div>
	</div>
</body>
</html>