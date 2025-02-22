<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 댓글 목록 보기</title>
<link rel="stylesheet" href="<c:url value='/css/r_styles.css'/>">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
<h5>내가 쓴 댓글</h5><br>
<table class="table">
      <thead>
         <tr>
         <th scope="col">댓글 내용</th>
         <th scope="col">댓글 작성자</th>
         <th scope="col">댓글 작성일</th>
         </tr>
      </thead>
      
      <c:forEach items="${myReplyList }" var="myReplyList">
      	<tr>
      		<td>
				 <a href="/a_board/readView?a_bno=${myReplyList.a_bno }&page=${scri.page }&perPageNum=${scri.perPageNum }&searchType=${scri.searchType }&keyword=${scri.keyword }&cateType=${scri.cateType }&id=${scri.id }">
				 <c:out value="${myReplyList.r_content }"/>
				 </a>
      		</td>
      		<td><c:out value="${myReplyList.nick }"/></td>
      		<td><fmt:formatDate value="${myReplyList.r_regdate }" pattern="yyyy-MM-dd"/></td>
      	</tr>
      </c:forEach>
   </table>
  
     <!-- 페이징 처리 -->
   <div style="text-align:center;">
             <c:if test="${pageMaker.prev }">
            <a href="myReplyList${pageMaker.mymakeSearch(pageMaker.startPage - 1 )}">이전</a>
         </c:if>
                     
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <c:out value="${pageMaker.cri.page == idx ? '' : '' }"/>
               <a href="myReplyList${pageMaker.mymakeSearch(idx)}">${idx }</a>
         </c:forEach>
                  
         <c:if test="${pageMaker.next && pageMakerendPage > 0 }">
            <a href="myReplyList${pageMaker.mymakeSearch(pageMaker.endPage + 1)}">다음</a>
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