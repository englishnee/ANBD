<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
.chk input[type='radio'] {
	display:none;
}
.chk input[type='radio']+span {
	display:inline-block;
	padding:5px 5px;
	border:1px solid #AEB6BF;
	border-radius:10px;
	background-color:white;
	text-align:center;
	cursor:pointer;
}
.chk input[type='radio']:checked+span {
	background-color:#8E9091;
	color:white;
	border-radius:10px;
}
.container {
	width: 100%;
  	min-width: 1000px;
  	max-width: 1000px;
  	margin: 0 auto 0 auto;
}
.mcont {
 	margin: 0 auto;
  	padding: 15px 20px 50px 20px;
 	box-sizing: border-box;
}
.subtn, .rebtn {
   display:inline-block;
   padding:4px 4px;
   border:1px solid #AEB6BF;
   border-radius:6px;
   background-color:white;
   text-align:center;
   cursor:pointer;
   font-size:14px;
   width:45px;
   height:30px;
}
</style>
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

	//글 수정 유효성 검사
	function formChk() {
				
		if($("input:radio[name='a_type']:checked").length < 1) {
			alert("말머리를 선택해주세요.");
			return false;
		}
		if($("#title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if(CKEDITOR.instances['content'].getData() == "") {
			alert("내용을 입력해주세요.");
			CKEDITOR.instances['content'].focus();
			return false;
		}
	}
	
</script>
</head>
<body>

<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/miniHeader.jsp"/>
</div>

<!-- 게시글 수정 -->
<section class="container">
<form name="updateForm" method="post" action="/a_board/update" class="mcont" onsubmit="return formChk()">
	<input type="hidden" name="a_bno" value="${update.a_bno }" readonly="readonly"/>
	<input type="hidden" name="page" value="${scri.page }"/>
	<input type="hidden" name="perPageNume" value="${scri.perPageNum }"/>
	<input type="hidden" name="searchType" value="${scri.searchType }"/>
	<input type="hidden" name="keyword" value="${scri.keyword }"/>
	<input type="hidden" name="cateType" value="${scri.cateType }"/>
	
	<table>
		<tr>
			<td>
				 <label class="chk"> 
            		<input type="radio" id="cate" name="a_type" value="1"<c:out value="${update.a_type eq '1' ? 'checked' : ''}"/>/><span>동네생활</span>
         		 </label>
         		 <label class="chk">        
            		<input type="radio" id="cate" name="a_type" value="2"<c:out value="${update.a_type eq '2' ? 'checked' : ''}"/>/><span>동네맛집</span>
         		 </label>
         		 <label class="chk">
            		<input type="radio" id="cate" name="a_type" value="3"<c:out value="${update.a_type eq '3' ? 'checked' : ''}"/>/><span>같이해요</span>
         		 </label>
			</td>
		</tr>
		
		<tr>
			<td>
				<br>
				<select id="loca" name="loca" class="form-select form-select-sm">
					<option value="1"<c:out value="${update.loca eq '1' ? 'selected' : ''}"/>/><span>강원</span>
					<option value="2"<c:out value="${update.loca eq '2' ? 'selected' : ''}"/>/><span>경기</span>
					<option value="3"<c:out value="${update.loca eq '3' ? 'selected' : ''}"/>/><span>경남</span>
					<option value="4"<c:out value="${update.loca eq '4' ? 'selected' : ''}"/>/><span>경북</span>
					<option value="5"<c:out value="${update.loca eq '5' ? 'selected' : ''}"/>/><span>부산</span>
					<option value="6"<c:out value="${update.loca eq '6' ? 'selected' : ''}"/>/><span>서울</span>
					<option value="7"<c:out value="${update.loca eq '7' ? 'selected' : ''}"/>/><span>인천</span>
					<option value="8"<c:out value="${update.loca eq '8' ? 'selected' : ''}"/>/><span>전남</span>
					<option value="9"<c:out value="${update.loca eq '9' ? 'selected' : ''}"/>/><span>전북</span>
					<option value="10"<c:out value="${update.loca eq '10' ? 'selected' : ''}"/>/><span>제주</span>
					<option value="11"<c:out value="${update.loca eq '11' ? 'selected' : ''}"/>/><span>충남</span>
					<option value="12"<c:out value="${update.loca eq '12' ? 'selected' : ''}"/>/><span>충북</span>
				</select>
				<br>
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="a_title" class="form-label">제목</label>
				<input type="text" id="title" name="a_title" class="chk form-control" value="${update.a_title }" placeholder="제목을 입력해주세요."/>
			</td>
		</tr>
		
		
		<tr>
			<td>
				<br>
				<label for="a_content" class="form-label">내용</label>
				<textarea id="content" name="a_content" placeholder="내용을 입력해주세요."><c:out value="${update.a_content }"/></textarea>
				<script type="text/javascript">
					CKEDITOR.replace('content', {filebrowserUploadUrl: '/a_board/fileUpload', 
					enterMode: CKEDITOR.ENTER_BR,
					shiftEnterMode: CKEDITOR.ENTER_P,
					width:930, height:300});
				</script>
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="nick" class="form-label">작성자</label>
				<input type="text" id="nick" name="nick" class="form-control" value="${update.nick }" readonly/>
			</td>
		</tr>
	</table>
	<!-- 게시글 수정 끝 -->
	
	
	<!-- 저장 및 취소 버튼 -->
	<div style="text-align:right;">
		<br>
		<button type="submit" class="subtn">저장</button>&nbsp;
		<!-- .cancel_btn이 안먹어서 history.go(-2)로 변경, 게시글 목록으로 넘어가게 함 -->
		<button type="reset" onclick="javascript:history.go(-2)" class="rebtn">취소</button>
	</div>
</form>
</section>

<div>
	<jsp:include page="../includes/footer.jsp" />
</div>
</body>
</html>