<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/script/js/reservation.js"/>'></script>
<script type="text/javascript">
	function check() {
		if($(".checkBox").is(':checked')){
			$("#checkButton").css('display','none');
			$("#notCheckButton").css('display','block');
		} else {
			$("#checkButton").css('display','block');
			$("#notCheckButton").css('display','none');
		}
		
	}
</script>
<style type="text/css">
body {
	background-color: rgba(0, 13, 0, 0.04);
}
*{
   font-family: 'Hahmlet', serif;
}
#reservationForm {
   margin-top : 3%;
   text-align: center;
   background-color: rgba(0, 3, 0, 0.02);
   width: 1000px;
   margin-left: 18%;
   border: 1px solid silver;
}
.Box{
   padding-top: 5%;
   display:inline-block;
   position: relative;
   width: 400px;
   height: 40%;
   }

.Box_1{
	display: inline-block;
	width: 65%;
}
.Box_2{
	display: inline-block;
	width: 550px;
	height: 40%;
	margin-bottom: 5%;
}
.Box1{
   padding-right: 10%;
   position: relative;
   width: 90%;
   height: 50%;
   display:inline-block;
}
.Box1_1{
   display: inline-block;
   float: left;
   width: 40%;
   padding-left: 5%;
   text-align: right;
}
.Box1_2{
   display: inline-block;
   float:right;
   width: 45%;
   padding-right: 10%;
   text-align: right;
   }
#ProfileTitle {
  position: relative;
  top: 1px;  
  left: 1px;  
  padding: .8em .5em; 
  color:    #464646;
  cursor: text;
  font-size: 17px;
  font-weight: bold;
}
label {
  position: relative;
  top: 1px;  
  left: 1px;  
  padding: .8em .5em; 
  color:    #464646;
  cursor: text;
  font-size: 17px;
  font-weight: bold;
  
}

.textbox input[type="text"] {
  width: 55%;  
  height: auto; 
  line-height : normal;  
  padding: .3em .2em; 
  font-family: inherit; 
  border: 1.3px solid 	#464646;
  border-radius: 0.2em;  
  outline-style: none;  
  -webkit-appearance: none; 
  -moz-appearance: none;
  appearance: none;
}
.textbox input[type="number"] {
  width: 55%;  
  height: auto; 
  line-height : normal;  
  padding: .3em .2em; 
  font-family: inherit; 
  border: 1.3px solid 	#464646;
  border-radius: 0.2em;  
  outline-style: none;  
  -webkit-appearance: none; 
  -moz-appearance: none;
  appearance: none;
}

#img {
	  max-width: 300px;
	  min-width: 300px;
	  max-height: 300px;
	  min-height: 300px;
     /* width: 100%;
      height: 100%*/
      object-fit: cover;
   }
textarea {
   resize: none;
   border-radius: 3%;
}
button {
   margin: 0;
   padding: 0;
   position: relative;
    border: none;
    display: inline-block;
    padding: 5px 15px;
    border-radius: 5px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 200;
    transition: 0.25s;
   box-sizing: border-box;
   margin: 20px;
   background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
   }
button:hover {
   letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
   background-color: #323232;
    color: white;
   }

.date {
   display: inline-block;
}
.button {
	position: relative;
	
}
.checkButtonBox {
	padding-left: 60px;
}
#checkButton{
	display : block;
}
#notCheckButton{
	display : none;
}

.button{
	padding-right: 280px;
}

.back{
	position: relative;
	/* top: 126%;
	right: 45%; */
	top: -117px;
	right: -100px;
}

#resetButton {
	position:relative;
	left : -280px;
	top : 520px;
	
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp" />
   <hr>
   <div id="reservationForm">
      <br>
      <br>
      <c:if test="${placeData != null }">
      	<button id="resetButton" type="button" onclick="location.href='../reservation/reservationForm'">??????</button>
      </c:if>
      <form id="form" name="reservation" class="reservationForm"
         action="${contextPath }/reservation/reservation"
         enctype="multipart/form-data" method="post">
         <div class="textbox">
            <label>?????????</label><input type="hidden" id="agree" name="id" value="${loginUser}">${loginUser}
            <br>
         </div>
      <div class="Box">
        <div class="Box_1">
        <br>
         <c:if test="${placeData == null}">
         	<label>???????????????????????? </label>
         	<input type="checkbox" id="location" class="checkBox" name="location"
               value="0" onchange="check()" ><br><br>
            <img id="placeImg" src="#" id="preview" width="300px" height="300px"><br> 
            <div class="checkButtonBox">
            <button type="button" id="checkButton" onclick="rentOkView()">???????????? ????????????</button>
            <button type="button" id="notCheckButton">??????????????? ???????????? !</button>
            </div>
         </c:if>
         <c:if test="${placeData != null}">
            <input type="hidden" id="location" name="location"
               value="${placeData.write_no}">
            <c:if test="${placeData.image == 'nan'}">
               <b>???????????? ????????????</b>
               <br>
            </c:if>
            <c:if test="${placeData.image != 'nan'}">
               <img id="placeImg"
                  src="${contextPath}/place/download?imageFileName=${placeData.image}"
                  width="250px" height="250px">
            
               <br>
            </c:if>
            <div class="textbox">
               <label>??????</label> <input type="text" name="location"
                  value="${placeData.loc_sep_name}"><br>
               <br>
            </div>
            <b>????????? : ${placeData.loc_name} </b>
            <br>
            <br>
         </c:if>
         </div>
         </div>
         <div class="Box_2">
           <div class="TeamProfile">
         	<br> 
         	<p id="ProfileTitle">????????? ????????? ??????????????????</p>
         	<img src="#" id="preview" width="300px" height="300px"><br> 
            <input type="file" name="image"
            value="???????????????" onchange="readURL(this)"><br>
             </div>
      	   </div>
      <br><br>
      <div class="Box1">
         <div class="Box1_1">
         <div class="textbox">
            <label>??????</label><input type="text" name="title"><br>
         </div>
         <br>
         <div class="textbox">
            <label>????????????</label> <input type="number" min="0" max="100" name="max_count"><br>
            <br>
         </div>
         <div class="textbox">
            <label>??????</label>
            <textarea  id="contentc" rows="8" cols="35" name="content"
               placeholder="?????? ?????? ?????? *???????????? *????????????"></textarea>
            <br>
            <br>
            </div>
         </div>
         <div class="Box1_2">
         <div class="textbox">
            <label>?????????</label> 
            <input type="text" name="tel"  placeholder=" - ??? ????????? 13?????? ????????? ????????? ????????? "><br>
            <br>
         </div>
         <div class="textbox">
            <label>????????????</label> 
            <input type="text" name="price"><br>
         </div>
         <br> 
         <div class="textbox">
            <label>????????? ??????</label> 
            <input type="number" min="0" max="100" name="team_count"/><br>
            <br>
         </div>
         <br>
         <div class="textbox">
            <label>?????? ??????</label>
         <div class="date">
            <input type="date" id="start_date" name="start_date">  
         </div>
         <div class="date">
             <input type="date" id="end_date" name="end_date"><br>
         </div>
         </div>
         </div>
         <br>
         <br> 
      </div>
      <div class="button">
         <button type="submit" value="????????????">????????????</button>
         <%-- <button type="button" onclick="location.href='../member/myinfo2?id=${loginUser}'">????????????</button> --%>
      </div>
      <br><br>
   </form>
   
   <button class="back" type="button" onclick="location.href='../index'">?????????</button>
   
</div>

<br><br><br><br><br>
<c:import url="../default/footer.jsp"/>
</body>
</html>