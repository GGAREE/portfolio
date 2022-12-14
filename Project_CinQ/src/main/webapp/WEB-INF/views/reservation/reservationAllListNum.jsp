
<!-- place/placeAllListNum.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/reservationAllListNum.css" rel="stylesheet" type="text/css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">


</head>
<body>
   <c:import url="../default/header.jsp"/>
   <table>
       <tr height="30px"></tr>
   </table>
   <div class="main">
   	<div class="subject" >
		 <b>등록된 프로젝트 목록</b> &ensp; Project List
   	</div>
    <div class="list">
    	<table class="Table">
    	  <c:if test="${reservationList.size() == 0}">
            <tr>
               <th colspan="6">등록된 글이 없습니다</th>
            </tr> 
            <tr height="100px"></tr>
        	<tr height="100px"></tr>
        	<tr height="100px"></tr>
        	<tr height="100px"></tr>
        	<tr height="100px"></tr>   
      	  </c:if>
      	  <c:forEach var="dto" items="${reservationList}">
      		<tr height="50px"></tr>
        	<tr>
			<td id="content_id"><b>작성자 : ${dto.id}</b></td>
		    	<c:if test="${dto.image == 'nan'}">
                	<td id="content_image" rowspan="4">
                 		<b>이미지가 없습니다..</b>
              		</td>
            	</c:if>
            	<c:if test="${dto.image != 'nan'}">
                	<td id="content_image" rowspan="4">
         				<a href="${contextPath}/reservation/reservationView?write_no=${dto.write_no}">
         					<img src="${contextPath}/reservation/download?imageFileName=${dto.image}" width="600px" height="400px">
         				</a>
                	</td>
            	</c:if>
        	</tr>
        	<tr id="content_row">   
				<td id="content_title"><b>제목 : ${dto.title}</b></td>
			</tr>
			<tr id="content_row">   
				<td id="content_con">
            		<c:choose>
						<c:when test="${fn:length(dto.content) > 50}">
							내용 : ${fn:substring(dto.content, 0, 48)}...	
						</c:when>
						<c:otherwise>
							내용 : ${dto.content}
						</c:otherwise>
					</c:choose>
            	</td>
			</tr>
        	<tr>    
        	    <c:if test="${dto.location == 0}">
        	        <td>장소 추천 희망</td>
       		    </c:if>
            	<c:if test="${dto.location != 0}">
            		<td id="content_place">
            			<a href="/root/place/placeView?write_no=${dto.location}"> ▶<b>상세 장소 정보</b></a>
            		</td>
                <%-- <td><button type="button" onclick="location.href='${contextPath}/place/placeView?write_no=${dto.location}'">${dto.location}</button></td> --%>
		    	</c:if>
			</tr>
			<tr>
				<td>
					<c:if test="${dto.ticketing =='N' }">
      	  				<button type="button" onclick="location.href='${contextPath}/reservation/ticketingRegister?write_no=${dto.write_no}&location=${dto.location}'">예매등록</button>
      	  			</c:if>
					<c:if test="${dto.ticketing =='Y' }">
						<button type="button" onclick="location.href='${contextPath}/reservation/ticketView?write_no=${dto.write_no }&location=${dto.location}&show_num=${dto.show_num }'">예매 정보 확인</button>
						<button type="button" onclick="location.href='${contextPath}/ticket/ticketStop?write_no=${dto.write_no }&show_num=${dto.show_num }'">예매중지</button>
					</c:if>
				</td>
				<td>
					<button type="button" onclick="location.href='${contextPath}/reservation/reservationDelete?write_no=${dto.write_no}&imageFileName=${data.image}'">삭제</button>
				</td>
			</tr>
			<tr height="50px"></tr> 
    	  </c:forEach>
      	  	<tr>
	            <td colspan="6" align="center">
	          		<c:if test="${startPage > block}">
	            		<button onclick="location.href='reservationAllListNum?num=${startPage-1}'">이전</button>
	            	</c:if>
	               <c:forEach var="num1" begin="${startPage}" end="${endPage}">
	               	   <c:if test="${num1 == currentPage }">
	               	   	<button id="currrentPage" onclick="location.href='reservationAllListNum?num=${num1}'">${num1}</button>
	               	   </c:if>
	                  <c:if test="${num1 != currentPage }">
	                  	<button id="page" onclick="location.href='reservationAllListNum?num=${num1}'">${num1}</button>
	                  </c:if>
	               </c:forEach>
	            	<c:if test="${endPage<totalPage}">
	            		<button onclick="location.href='reservationAllListNum?num=${endPage+1}'">다음</button>
	            	</c:if>
	            </td>
	        </tr>

     </table>
    </div>
   </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html> 