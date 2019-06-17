<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      
      <title>AdminqnaDetail.jsp</title>
      
      <link rel="shortcut icon" href="/resources/images/icon.png" />
      <link rel="apple-touch-icon" href="/resources/images/icon.png" />
      
      <!-- [if lt IE 9]>
      <script src="../js/html5shiv.js"></script> 
      <![endif]-->
      
      <!-- <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" /> -->
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <!-- <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script> -->
      <script type="text/javascript">
   
      var butChk = 0;
      $(function(){
    	  $("#pwdChk").css("visibility","hidden");	
  
    	  //수정 버튼 클릭 시 처리
    	  $("#updateFormBtn").click(function(){
    	  	$("#pwdChk").css("visibility", "visible");
    	  	$("qa_pwd").focus();
    	  	$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color", "#000099");
    	  	butChk = 1;
  		});
    	  
    	  
      	//삭제 버튼 클릭 시 댓글 확인 후 처리 이벤트
      	$("#qnaDeleteBtn").click(function(){
      		$.ajax({
      			url : "/admin/qna/replyCnt",
      			type : "post",
      			data : "qa_num="+$("#qa_num").val(),
      			dataType : "text",
      			error : function(){
      				alert('시스템 오류 입니다. 관리자에게 문의 하세요');
      			},
      			success : function(resultData){
      				if(resultData==0){
      					$("#pwdChk").css("visibility","visible");
      					$("#msg").text("작성시 입력한 비번을 입력해 주세요.").css("color","#0000099");
      					btnChk = 2;
      				}else{
      					alert("댓글 존재시 게시물 작성할 수 없음.\n댓글 삭제 후 다시 확인 바람");
      					return;
      				}
      			}
      		});
      	});
      	
      	//비밀번호 입력 양식 enter 제거
      	$("#qa_pwd").bind("keydown", function(event){
      		if(event.keycode == 13){
      			event.preventDefault();
      			
      		}	
      	});
      	
      	//비밀번호 확인 버튼 클릭 시
      	$("#pwdBtn").click(function(){
      		qnaPwdConfirm();	
      	});
      	
      	//목록 버튼 클릭 시
      	$("#qnaListBtn").click(function(){
      		var queryString= "?pageNum="+$("#pageNum").val()+"&amount="+$("#amount").val();
      		location.href="/admin/qna/qnaList"+queryString;
      	});
      	
      });
      	
      	//비밀번호 확인 버튼 클릭 실질적인 처리 함수
      	function qnaPwdConfirm(){
      		if(!chkSubmit($('#qa_pwd'), "비밀번호를")) return;
      		else{
      			$.ajax({
      				url : "/admin/qna/pwdConfirm",
      				type : "post",
      				data : $("#f_pwd").serialize(),
      				datatype : "text",
      				error : function(){
      					alert('시스템 오류. 관리자에게 문의바람');
      				},
      				success : function(resultData){
      					var goUrl="";
      					if(resultData=="실패"){
      						$("#msg").text("작성 시 입력한 비번과 일치하지 않음").css("color", "blue");
      						$("#qa_pwd").select();
      						
      					}else if(resultData=="성공"){
      						$("#msg").text("");
      						if(butChk == 1){
      							goUrl = "/admin/qna/updateForm";
      						}else if(butChk == 2){
      							goUrl = "/admin/qna/qnaDelete";
      						}
      						$("#f_data").attr("action", goUrl);
      						$("#f_data").submit();
      						
      						}
      					}
      			});
      		}
      	}
      
      </script>
   	
   </head>
	<body>
		<div>
			<div class="contentTit page-header"><h3 class="text-center">QnA관리</h3></div>
		
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="qa_num" value="${detail.qa_num}">
				<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}">
				<input type="hidden" name="amount" id="amount" value="${data.amount}">
			</form>
		
			<div class="btnArea col-md-4">
			<input type="button" value="목록" id="qnaListBtn" class="btn btn-primary">
			</div>
			<br/>
			
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td>작성자</td>
							<td class="text-left">${detail.qa_author}</td>
							<td>작성일</td>
							<td class="text-left">${detail.qa_date}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3" class="text-left">${detail.qa_title}</td>
						</tr>
						<tr class="table-height">	
							<td>내용</td>
							<td colspan="3" class="text-left">${detail.qa_content}</td>				
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 상세보여주기 종료 -->
			<jsp:include page="reply.jsp" />
		
		</div>
	</body>
</html>