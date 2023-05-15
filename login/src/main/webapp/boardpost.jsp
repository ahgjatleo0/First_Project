<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<%@ page import="kr.smhrd.model.KanbanVO" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/logoImg.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>SOORE</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
        name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
<style>
#wk_todo{
    margin-top:220px;
    float: right;
    width: 600px;
    height: 670px;
    border: 1px solid #fafafa;
}

.icon_side {
            width: 16px;
            height: 16px;
            margin-right: 5px;
        }

      .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 800px;
        height: 600px;

        /* padding: 40px; */

        /* text-align: center; */

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
      .m_head{
        height: 10%;
        padding: 20px;
        display: flex;
        justify-content: space-between;
        background-color:#e7e5e5;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }
      .m_body{
        height: 80%;
        padding: 20px;
      }
      .m_footer{
        height: 10%;
        padding: 15px;
        background-color:#e7e5e5;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        display: flex;
        justify-content: end;
      }
      .modal_title{
        font-size: 18px;
        color: gray;
        font-weight: 500;
      }
      .close_btn{
        font-size: 20px;
        color: rgb(139, 139, 139);
        font-weight: 900;
        cursor: pointer;
      }
      .modal_label{
        padding-top: 10px;
      }
      .input_box{
        width: 100%;
        border: 1px solid rgb(189, 189, 189);
        height: 30px;
      }
      .modal_btn{
        width: 80px;
        height: 30px;
        border-radius: 5px;
        text-align: center;
        font-size: 14px;
        font-weight: bolder;
        padding-top: 5px;
        margin-left: 5px;
        font-family: sans-serif;
      }
      .cancle{
        background-color: white;
        color: black;
      }
      .save{
        background-color: rgb(50, 77, 158);
        color: white;
      }
      
      
      
      
      
      
      
      
      table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        section.notice {
            /* padding: 80px 0; */
            margin-left: 0px;
        }

        .page-title {
            margin-bottom: 60px;
        }

        .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }

        .board-table {
            font-size: 13px;
            width: 100%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }

        .board-table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
        }

        .board-table a:hover {
            text-decoration: underline;
        }

        .board-table th {
            text-align: center;
        }

        .board-table .th-num {
            width: 100px;
            text-align: center;
        }

        .board-table .th-date {
            width: 200px;
        }

        .board-table th,
        .board-table td {
            padding: 14px 0;
        }

        .board-table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
        }

        .board-table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
        }

        .board-table tbody th p {
            display: none;
        }


      


        .container {
            width: 720px;
            margin-left: 0px;
        }

        .blind {
            position: absolute;
            clip: rect(0 0 0 0);
            margin: -1px;
            width: 1px;
            height: 1px;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .search {
            position: relative;
            width: 300px;
            margin-bottom: 30px;
        }

        input {
            width: 100%;
            border: 1px solid #bbb;
            border-radius: 8px;
            padding: 10px 12px;
            font-size: 14px;
        }

        #s_img {
            position: absolute;
            width: 17px;
            top: 10px;
            right: 12px;
            margin-top: 3px;
        }

        input:focus {
            outline: none;
        } 
        
     /* ---------------아래로 boardpost style css ----------------- */

      	.post {
            max-width: 800px;
            margin: 0 auto;
            border: 1px solid #ddd;
        }

        .post-title {
           padding: 0px 20px 0px 20px;
    margin-top: 15px;
    margin-bottom: 15px;
        }

        .post-content {
            padding: 0px 20px 0px 20px;
            margin-top: 0;
        }

        #comment-section {
            margin-top: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border-radius: 5px;
        }

        #comment-list {
            list-style: none;
            padding: 0;
            margin-bottom: 10px;
        }

        #comment-list li {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        #comment-list p {
            display: inline;
            margin-bottom: 5px;
            font-size: 16px;
            margin-left: 8px;
        }

        #comment-list li span {
            margin-left: 8px;
            font-size: 12px;
        }

        #comment-form {
            margin-top: 20px;
        }

        #comment-form label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
        }

        #comment-form textarea {
            margin-bottom: 30px;
            outline: none;
            width: 90%;
            height: 50px;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            resize: none;
        }
        #comment-input {
            width: 658px;
   			 margin-left: 3px;
        }
        
        #commGet {
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    margin-bottom: 10px;
        }
        
        #commGet span {
        margin-left: 10px;
    	font-size: 12px;
        }
        
        #commGetUl {
        padding-left: 0;
        }
        
           #list-btn, #update-btn, #delete-btn {
             margin-right: 10px;
		    color: #fff;
		    cursor: pointer;
		    font-size: 14px;
		    font-weight: 500;
		    padding: 6px 10px;
		    width: 55px;
		    height: 35px;
		    border: none;
		    border-radius: 5px;
		    background-color: rgb(143, 138, 138);
		    } 
       
       .button-wrapper {
       display: flex;
       width: 100%;
       justify-content: right;
       margin-top : 30px;}
       
       .commbtn-wrapper{
       display: flex;
       width: 100%;
       justify-content: right;
       }
       
       #save-comment, #cancle-comment {
       		 margin-right: 10px;
		    color: #fff;
		    cursor: pointer;
		    font-size: 14px;
		    font-weight: 500;
		    padding: 6px 10px;
		    width: 55px;
		    height: 35px;
		    border: none;
		    border-radius: 5px;
		    background-color: rgb(143, 138, 138);
       }
       
       #des_box {
         height: 200px;
         border-radius: 5px;
         font-size: 14px;
         padding-left : 10px;
         
         }
        
        input[type=file]::-webkit-file-upload-button, #upload-btn{
        border-radius: 5px;
        font-size: 14px;
        border: 0.5px solid #bbb;
       width: 85px;
       height: 28px;        
       }
        
        #upload-div{
        border-radius: 5px;
        margin: 0 auto;
        border: 1px solid #ddd;
        padding-left: 15px;
        margin-top : 20px;
        }
        
        #commList {
        margin-bottom: 5px;
       font-size: 16px;
       margin-left: 8px;
        }
        
        li {
            list-style: none;
        }

        .wrap {
            width: 200px;
             margin-left: 35px;
             margin-top : 5px;
            padding: 0;
        }

        .progress {
            position: relative;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #dedddd;

        }

        .progress div {
            position: absolute;
            left: 20px;
            top: 0px;
            display: none;
            width: 2px;
            height: 5px;
            background:rgb(90, 197, 233);
            transform-origin: 0px 100px;
            -webkit-transform-origin: 0px 20px;
            -moz-transform-origin: 0px 20px;
            -ms-transform-origin: 0px 20px;
        }

        .progress_value {
            transform: lotate(0deg);
            -webkit-transform: lotate(0deg);
            -moz-transform: lotate(0deg);
            -ms-transform: lotate(0deg);
        }

        #percent {
            position: absolute;
            z-index: 10;
            left: 5px;
            top: 5px;
            width: 30px;
            height: 30px;
            line-height: 150px;
            text-align: center;
            background: #fcfcfc;
            border-radius: 50%;

            font-size: 10px;
            font-weight: bold;
            line-height: 2.9em;
            color: #666;

        }
        
        #wk_todo {
    margin-top: 68px;
    float: right;
    width: 600px;
    height: 670px;
    border: 1px solid #fafafa;
}
        
      
    </style>
</head>

<body>
    <div class="wrapper">
        <div class="modal" id="modal">
            <div class="modal_body">
                <div class="m_head">
                    <div class="modal_title">게시물 작성</div>
                    <div class="close_btn" id="close_btn">X</div>
                </div>
                <div class="m_body">
                       <div class="modal_label">project_name</div>
                       <input type="text" class="input_box" name = "project_name"/>
                          
                       <div class="modal_label">Title</div>
                       <input type="text" class="input_box" id="name_box" name="post_title"/>
                          
                       <div class="modal_label">Description</div>
                       <textarea class="input_box" id="des_box" name="post_detail"></textarea>
                </div>
                <div class="m_footer">
                    	<button type="reset" class="modal_btn cancle" id="close_btn">CANCLE</button>
                    	<button type="submit" class="modal_btn save" id="save_btn">SAVE</button>
                </div>
            </div>
        </div>
        <div class="sidebar">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="first.jsp">
                        <img src="assets/img/logoImg.png" id="logoImg" />
                        <img src="https://fontmeme.com/permalink/230419/234f3f0f39dbad0f4907a4e9073178d0.png" alt="radio-canada-font" border="0" id="logo"></a>
                </div>
                <ul class="nav">
                    <li>
                        <p style="font-size: 10px; margin-left: 20px; color: gray;">USER</p>
                    </li>
                    <li>
                        <div id="userInfo">
                        	<img src="assets/img/user_icon.png" style="width: 45px; height: 45px; margin-left: 75px;" >
                             <br><br>
                        	<span style="margin-left: 35px;"> ${member.USER_NAME}님 어서오세요.</span>		
                            <br><br>
                            ID : ${member.USER_ID}@soore.do
                        </div>
                    </li>
                    <li>
                        <p style="font-size: 10px; margin-left: 20px; color: gray;">MENU</p>
                    </li>
                    <li>
                        <a class="nav-link" href="Gomain.do">
                            <img alt="" src="assets/img/main.png" class="icon_side">
                            <p>Main</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Gogantt.do">
                            <img alt="" src="assets/img/gantt.png" class="icon_side">
                            <p>Gantt Chart</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="Gocalendar.do">
                            <img alt="" src="assets/img/calendar2.png" class="icon_side">
                            <p>Calendar</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Goworklist.do">
                            <img alt="" src="assets/img/list2.png" class="icon_side">
                            <p>Work List</p>
                        </a>
                    </li>
                   
                </ul>
            </div>
        </div>

        <div class="main-panel">
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class="container-fluid">
                    <p class="navbar-brand"></p>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                        aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                </div>
            </nav>
            
            <div id="container">
                <div id="wk_title">
                     <h3>${show.project_name}</h3>
                </div>
                
                <%
                  	
                      KanbanVO show = (KanbanVO) request.getAttribute("show");
                      String startStr = show.getProject_start();
                      String endStr = show.getProject_end();
                      
                      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                      
                      LocalDate start = LocalDate.parse(startStr, formatter);
                      LocalDate end = LocalDate.parse(endStr, formatter);
                      LocalDate today = LocalDate.now();
                      
                      
                      // 상태 state
                      long days = ChronoUnit.DAYS.between(start, end);
                      long daysSinceStart = ChronoUnit.DAYS.between(start, today);
                     int daysSince = (int)daysSinceStart;
                      long priority_days = ChronoUnit.DAYS.between(today, end); // end-today
                      int daysInt = (int) priority_days; // long 타입인 days를 int로 변환 
                      
                      String state = "";
                      int progress = 0;
                      String priority = "";
                      
                      String btnColor= "";
                      
                   	// 우선순위 priority 
                      String imgSrc = "";
                      String spanColor = "";
                     

                      if (daysInt < 7) {
                    	  priority = "긴급";
                    	  imgSrc = "assets/img/a.png";
                          spanColor = "red";
                      } else if (daysInt < 30) {
                    	  priority = "높음";
                    	  imgSrc = "assets/img/b.png";
                          spanColor = "orange";
                      } else if (daysInt < 50) {
                    	  priority = "보통";
                    	  imgSrc = "assets/img/c.png";
                          spanColor = "black";
                      } else if (daysInt < 100) {
                    	  priority = "낮음";
                    	  imgSrc = "assets/img/d.png";
                          spanColor = "black";
                          
                      }
                      
                      if (daysSince < 0) {
                    	  // 시작 전
                    	    state = "요청";
                    	    btnColor = "#00b2ff";
                    	    progress = 0;
                    	} else if (daysSince < days - 7) {
                    		// 종료날짜- 7일 전
                    	    state = "진행";
                    	    btnColor = "#00b01c";
                    	    progress = 60;
                    	} else if (daysSince <= days) {
                    		// 종료 전
                    	    state = "피드백";
                    	    btnColor = "#fd7900";
                    	    progress = 80;
                    	} else {
                    	    state = "완료";
                    	    btnColor = "#402a9d";
                    	    progress = 100;
                    	    priority = "없음";
                    	    spanColor = "black";
                    	    imgSrc = "assets/img/d.png";
                    	    
                    	}
                      

                      // 진척도
                      
                      
					%>
                <div id="right">
                    <div id="wk_feed" class="feed d-flex">
                        <div class="feed a">상태 <br><button style="background-color: <%=btnColor %>; width: 60px; height: 30px; border-radius: 20px; font-size: 12px; border: white; margin-top: 10px; font-weight: bold; color: white;"><%=state %></button>
                        </div>
                        <div class="feed a">우선 순위 <br>
                        <div style="margin-top: 10px;"><img src="<%= imgSrc %>" style="margin: 5px; width: 20px; height:20px"><span style="color: <%= spanColor %>; font-size: 16px;"><%=priority %></div>
                           
                        </div>
                        <div class="feed a">진척도 <div class="wrap">
											     
					        <div class="progress" data-percent="<%= progress %>">
					            <span id="percent"></span>
					        </div>
					    </div>
					     </div>

                        <div class="feed a">시작 날짜 <br>
                            <div style="margin-top: 10px;"></div><span style="font-weight: bold; font-size: 15px;">${show.project_start}</span>
                        </div>
                        <div class="feed a">마감 날짜 <br>
                            <div style="margin-top: 10px;"></div><span style="font-weight: bold; font-size: 15px;">${show.project_end}</span>
                        </div>
                    </div>
                      
            

                    <div id="wk_board" style="margin-top:80px;">
                    
                    <div class="bd_container" style="overflow: visible;">
        <!-- board list area -->
		
        <div id="board-list">
            <div class="container">
               
                <div class="post" style="border-radius: 5px;">
           			 <h5 class="post-title">${vo.post_title}</h5>
            	</div>
       			 <hr>
       			 
       			 <div style="width: 100%; height: 250px;"> 
            	 <p class="post-content">${vo.post_detail}</p>
        		 </div>
        		 
        		 <div style="width: 100%">
        		 <p><span>첨부파일</span>
        		 <span><jsp:include page="filedownload.jsp" /></span>
        		 </p>
        		 </div>
        		 
        		  <div>
                  	<form action="FileUpload.do" method="post" enctype="multipart/form-data">
                    	 <div id="upload-div" >
               				파일 업로드 : <input type="file" name="file"  id="file-upload" style= " border: none; width: 470px;">   
                			<button type="submit" id="upload-btn">업로드</button>
                 		 </div>
              		 	</form>
           			 </div>
              
               <div class="button-wrapper">
                     <button id="list-btn" onclick="location.href='BoardList.do?projectName=${show.project_name}'">목록</button>
                     <button id="update-btn" onclick ="location.href='BoardUpdateForm.do?id=${vo.post_id}'">수정</button>
                     <button id="delete-btn" onclick ="location.href='BoardRemove.do'">삭제</button>
                 </div>
        		 
        		 
				<div id="comment-section">
				         <span><br></span>
				     <form id="commReg" method="post">
				         <div id="ttts" style="width: 100%">
				             <textarea id="comment-input" rows="5" placeholder="댓글 입력" name="cm_detail" required ></textarea>
					
						<div class = commbtn-wrapper>
                         	<button type="button" id="save-comment">등록</button>
                         	<button type="reset" id="cancle-comment">취소</button>
                    	</div>

				     </form>
				     <span><br></span>
				     
					<ul id = "commGetUl">
	                  <c:forEach items="${list}" var="vo1">   
	                     <li style="list-style-type: none; margin-bottom : 5px; margin-left : 10px;">
	                     <img alt="" src="assets/img/user_icon.png" style="width: 14px; height: 14px;"><span style="font-size:14px ; margin-top:4px">    ${vo1.cm_writer} </span>
	                     </li>
	                      <li id="commGet">
	                        <p id="commList">
	                        ${vo1.cm_detail}</p>
	                        <span><fmt:formatDate value = "${vo1.indate}" pattern="yyyy.M.d."/></span>
	                    
	                     	</li>
	                  	</c:forEach>
	            	</ul>

				     
				     <ul id="comment-list">
				     	
				         <!-- 저장 되어있는 댓글 불러오는 영역 -->
				     </ul>
				 </div>
		                       
		                  
		            </div>
		            <!-- <button style="float: right; margin: 10px; position: fixed; top: 0; right: 0;">글쓰기</button> -->
		        </div>
		
		  		  </div>
                    
                 </div>
                </div>

                <div id="wk_todo">
                    <iframe src="todo_frame.jsp" frameborder="0"
                        style="width: 550px; height: 650px; margin: 10px; "></iframe>
                        
                </div>
            </div>

        </div>

    </div>


<!--   Core JS Files   -->
<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="assets/js/plugins/bootstrap-switch.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Chartist Plugin  -->
<script src="assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="assets/js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script type="text/javascript">

// 글쓰기 - 모달 보이기
$(document).on('click', '#add-btn', function (e) {
    console.log("click event");
    $('#modal').addClass('show');

});

// 모달 닫기
$(document).on('click', '#close_btn', function (e) {
    console.log("click event");
    $('#modal').removeClass('show');

});

// 데이터 전송
$('#save_btn').on('click',()=>{
   var sendData = $('#sendData').serialize();
   
   $.ajax({
      url: 'BoardRegister.do',
      type: 'post',
      data: sendData,
      success: function(data) {
         console.log('성공')
         $("#modal").modal('hide'); // 모달 닫기
      },
      error: function(error) {
         console.log(error);
         }
      })
   })

   $("#save_btn").on("click", function(){
  // 등록 버튼 클릭 시 input 내용 초기화
  $("input[type=text]").val("");
  $("textarea").val("");
  });


// 댓글 등록 부분 변수 지정 
const commentForm = document.getElementById('comment-form');
const commentList = document.getElementById('comment-list');
const commentInput = document.getElementById('comment-input');
const saveButton = document.getElementById('save-comment'); // submit 버튼 id

saveButton.addEventListener('click', () => {
    const sendData = $('#commReg').serialize();

    $.ajax({
        url: 'CommReg.do',
        type: 'post',
        data: sendData,
        success: function(data) {
            console.log('성공')
            addCommentToList(commentInput.value);
            commentInput.value = ''; // submit후 입력창 초기화 
        },
        error: function(error) {
            console.log(error);
        }
    })
});



// 입력한 댓글 댓글창 아래로 바로 뜨도록
   function addCommentToList(comment) {
    const newComment = document.createElement('li');
     const commenter = document.createElement('img');
     const commenterName = document.createElement('span');
     const commentContent = document.createElement('p');
     const commentInfo = document.createElement('span');
     const now = new Date();

     commenter.src = 'assets/img/user_icon.png';
     commenter.alt = '';
     commenter.style.width = '14px';
     commenter.style.height = '14px';

     commenterName.innerText = '작성자';
     commentContent.innerText = comment;
     commentInfo.innerText = now.toLocaleDateString();

     newComment.appendChild(commenter); // 작성자 이미지 추가
     newComment.appendChild(commenterName); // 작성자 이름 추가
     newComment.appendChild(document.createElement('br')); // 줄바꿈 추가
     newComment.appendChild(commentContent); // 내용 추가
     newComment.appendChild(commentInfo); // 날짜 추가
     newComment.style.listStyleType = 'none'; // 리스트 마커 제거
     newComment.style.marginBottom = '5px'; // 마진 추가
     newComment.classList.add('commGet1'); // 클래스 추가
     commentContent.classList.add('comment-list'); // 클래스 추가
     commentInfo.classList.add('commDate'); // 클래스 추가

     const commentList = document.querySelector('#comment-list');
     commentList.insertBefore(newComment, commentList.firstChild); // 댓글달리는 곳에 li 삽입
    // commentList.appendChild(newComment); // 댓글달리는 곳에 li 삽입
} 

   (function () {
       var doms = '';
       var $m = $('.progress');
       var $data = $m.find('#percent');
       var data = $m.data('percent');
       var com = Math.round(data / 100 * 360);
       var dur = 2000;

       var getVendorPrefix = function () {
           var body = document.body || document.documentElement,
               style = body.style,
               transition = "Transition",
               vendor = ["Moz", "Webkit", "ms"],
               lastGage,
               i = 0;
           while (i < vendor.length) {
               if (typeof style[vendor[i] + transition] === "string") {
                   return vendor[i];
               }
               i++;
           }
           return false;
       };
       var prefix = getVendorPrefix();
       var transform = prefix + 'Transform';

       for (var i = 0; i <= com; i++) {
           doms = '<div class="gage-bar"></div>';
           $m.append(doms);
           $('.gage-bar:last').css(transform, 'rotate(' + i + 'deg)');
       }

       //$m.append(doms);

       $m.find('div').each(function (index, item) {
           $(item).stop().delay(index * 5).fadeIn(50);
       });

       for (var j = 0; j <= data; j++) {
           (function (index) {
               var time = (360 / 100 * index) * 5;
               setTimeout(function () {
                   $data.text(index + '%');
               }, time);
           })(j);
       }
   })();

</script>

</body>
</html>