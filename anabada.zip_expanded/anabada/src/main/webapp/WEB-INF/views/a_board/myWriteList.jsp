<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시글 목록</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
#delBtn {
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
   float:right;
}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
/* 체크 박스 전체 선택 */
/* $(function() {
	$(".allDel").click(function() {
		if($(".allDel").is(":checked")) {
			$("input[name=NChk]").prop("checked", true);	
		}
		else {
			$("input[name=NChk]").prop("checked", false);
		}
	});
	
	$("#delBtn").click(function() {
		
		if($("input[name=NChk]").is(":checked") == false) {
			alert("삭제할 게시글을 선택하세요.");
			return;
		}
		
		if(confirm("게시글을 삭제하시겠습니까?")) {
			
			var delArr = new Array(); //삭제될 게시글 번호 담음
			
			$("input[name=NChk]:checked").each(function(i) {
				delArr.push($(this).val());
			});
			
			$.ajax({
				url: "a_board/myWriteListDelete",
				type: "GET",
				data: {delArr: delArr},
				success: function(data) {
					alert("삭제되었습니다.");
					window.location.reload();
				}
			});
		}
		else {
			return;
		}
	});
}); */

</script>
</head>

<body>

<div>
	<jsp:include page="../includes/nav.jsp"/>
	<jsp:include page="../includes/miniHeader.jsp"/>
</div> 

<section class="container">
<form style="width:1000px;">
<jsp:include page="/WEB-INF/views/includes/myPageHeader.jsp" />			

<div class="aboardcon">
	<div class="row justify-content-center">
		<h5>내가 쓴 게시글</h5> 
		<!-- <h5 class="col-md-11">내가 쓴 게시글</h5> 
	 	<input type="button" id="delBtn" name="delBtn" value="삭제" class="col-md-20"/> -->
	</div>
 	
 	<br>
 	
 	<table class="table">
      <thead>
         <tr>
         <!-- <th scope="col"><input type="checkbox" id="delchk" name="delchk" class="allDel"/></th> -->
         <th scope="col">지역</th>
         <th scope="col">말머리</th>
         <th scope="col">제목</th>
         <th scope="col">작성자</th>
         <th scope="col">작성일</th>
         <th scope="col">조회수</th>
         </tr>
      </thead>

  	<!-- 게시글 목록 -->
      <c:forEach items="${myWriteList }" var="myWriteList" varStatus="status">
         <tr>
         	<!-- <td>
         	<input type="checkbox" id="NChk" name="NChk"/>
         	</td> -->
            <td>
               <input type="hidden" id="a_bno" name="a_bno" value="${myWriteList.a_bno }"/>
            	<c:choose>
			   <c:when test="${myWriteList.loca == 1 }">
			   		<c:out value="강원"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 2 }">
			   		<c:out value="경기"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 3 }">
			   		<c:out value="경남"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 4 }">
			   		<c:out value="경북"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 5 }">
			   		<c:out value="부산"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 6 }">
			   		<c:out value="서울"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 7 }">
			   		<c:out value="인천"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 8 }">
			   		<c:out value="전남"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 9 }">
			   		<c:out value="전북"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 10 }">
			   		<c:out value="제주"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 11 }">
			   		<c:out value="충남"/>
			   </c:when>
			    <c:when test="${myWriteList.loca == 12 }">
			   		<c:out value="충북"/>
			   </c:when>
               </c:choose>
            </td>
            
            <td>
               <c:choose>
                  <c:when test="${myWriteList.a_type == 1 }">
                     <c:out value="동네생활"/>
                  </c:when>
                  <c:when test="${myWriteList.a_type == 2 }">
                     <c:out value="동네맛집"/>
                  </c:when>
                  <c:otherwise>
                     <c:out value="같이해요"/>
                  </c:otherwise>
               </c:choose>            
            </td>
            
            <td>
               <a href="/a_board/readView?a_bno=${myWriteList.a_bno }&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&cateType=${scri.cateType }&id=${scri.id }">
               <c:out value="${myWriteList.a_title }"/>
               </a>
            </td>
            
            <td><c:out value="${myWriteList.nick }"/></td>
            <td><fmt:formatDate value="${myWriteList.a_regdate }" pattern="yyyy-MM-dd"/></td>
            <td><c:out value="${myWriteList.a_cnt }"/></td>
         </tr>
      	</c:forEach>
   	</table>
   <!-- 게시글 목록 끝 -->
   
    <!-- 페이징 처리 -->
   <div style="text-align:center;">
         <c:if test="${pageMaker.prev }">
            <a href="myWriteList${pageMaker.mymakeSearch(pageMaker.startPage - 1 )}">이전</a>
         </c:if>
                     
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <c:out value="${pageMaker.cri.page == idx ? '' : '' }"/>
               <a href="myWriteList${pageMaker.mymakeSearch(idx)}">${idx }</a>
         </c:forEach>
                  
         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
            <a href="myWriteList${pageMaker.mymakeSearch(pageMaker.endPage + 1)}">다음</a>
         </c:if>
   </div>
   <!-- 페이징 처리 끝 -->
   </div>
  </form>
</section>

<div>
	<jsp:include page="../includes/footer.jsp" />
</div> 

</body>
</html>