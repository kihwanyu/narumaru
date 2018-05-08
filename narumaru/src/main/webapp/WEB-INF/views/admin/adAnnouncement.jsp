<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>/*  */
	.FAQsubMenu{
		display:none;
		width:200px;
		height:100px;
		background:yellow;
	}

</style>
<title>:: naru ? maru ! :: 공지 글쓰기 </title>
<link href="${ contextPath }/resources/admin/build/css/custom.min.css" rel="stylesheet">
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

<body class="nav-md">
    <div class="container body">
      <div class="main_container">
 		<jsp:include page = "../common/adMenubar.jsp"/>
        
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>공지 쓰기</h3>
              </div>

         
            </div>
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>공지 글쓰기 <small>Naru? Maru! :: Admin</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method= "post" action = "adAnnounce.ad">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"> 제목 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name"  name="noTitle" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
             
                      <div class="form-group" >
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">게시판 타입</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div id="gender" class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input type="radio" id = "Noticebtn" name="noType" value="700"> &nbsp; 공지사항 &nbsp;
                            </label>
                            <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input type="radio" id="FAQbtn" name="noType" value="800"> FAQ
                 			  
                            </label>
                            
                            <div class="FAQsubMenu">
	                            <select name="subType">
	                 			  	<option value = 801> 자주묻는 질문</option>
	                 			  	<option value = 802>로그인, 회원가입 질문</option>
	                 			  	<option value = 803>알림, 새소식</option>
	                 			  	<option value = 804>나루마루 설정</option>
	                 			  	<option value = 805>마루 멤버</option>
	                 			  	<option value = 806>기타</option>
                 			  	</select>
                 			</div>
                 			<script>
                 			$(function(){
                 				$("#FAQbtn").on("change",function(){
                 					
                					$(".FAQsubMenu").css('display','block');
                 					
                 				});
                 				$("#Noticebtn").on("change", function(){
                 					$(".FAQsubMenu").css('display','none');
                 				})
                 			});
                 			</script>
                          </div>
                          	
                  
                        </div>
                      </div>
                    
                      
                      <!-- textarea -->
                  
                <div class="x_title">
                 
                  <div class="clearfix"></div>
                </div>
                <div class="x_content"  style="margin-left: 80px;width: 780px;">
                  <div id="alerts"></div>
                  <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      </ul>
                    </div>

                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li>
                          <a data-edit="fontSize 5">
                            <p style="font-size:17px">Huge</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 3">
                            <p style="font-size:14px">Normal</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 1">
                            <p style="font-size:11px">Small</p>
                          </a>
                        </li>
                      </ul>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                      <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                      <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                      <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                      <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                      <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                      <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                      <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                      <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                      <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
                      <div class="dropdown-menu input-append">
                        <input class="span2" placeholder="URL" type="text" data-edit="createLink" />
                        <button class="btn" type="button">Add</button>
                      </div>
                      <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
                      <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                      <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                    </div>
                  </div>

                  <div id="editor-one" class="editor-wrapper" contenteditable = "true" name="noContent">
                  	<textarea style ="width:741px;height:231px;resize:none;" name="noContent" ></textarea>
                  
                  </div>

                  <textarea name="descr" id="descr" style="display:none;"></textarea>
                  
                  <br />

                  <div class="ln_solid"></div>
                </div>
          
              <!-- endTextArea -->
              
              
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          
						  <button class="btn btn-primary" type="reset">메인으로</button>
                          <button type="submit" class="btn btn-success">등록</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>   
          </div>
        </div>
        <!-- /page content -->
      </div>
    </div>

  </body>
</html>