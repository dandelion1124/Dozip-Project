<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>
    <link rel="stylesheet" href="./css/apply_style_04.css">
    <script src="./js/apply.js" defer></script>
    <script src="./js/jquery.js"></script>
    

    
   <style>
   #p1 {
   	text-align: center;
   }
   #p1 b{
   color:#27562b
   	
   }
   #p1 b:hover{
   	color:#eb6703;
   	text-decoration: underline;
   }
   #msg2{
   	margin:0 auto;
   }
   
   
   
.title {
    background-color: none;
    width: 600px;
    /* height: 100px; */
    margin: 0 auto;
    margin-top: 18px;
  }
  .estimate_box{
    background-color: none;
    width: 600px;
    /* height: 500px; */
    margin: 0 auto;
    margin-top: 18px;
  }
  .companies{
    background-color: rgb(248, 246, 246);
  }
  
  .title {
    display:flex;
    justify-content: space-between;
  }
  .title h3{
    color: #888;
    font-size: 28px;
    margin-top: 15px;
  }
  
  #p1 {
    font-weight: bolder;
    font-size: larger;
    margin-top: 50px;
  }
  
  #p2{
    font-size: smaller;
    margin-top: 30px;
    margin-left: 30px;
  }
  
  /*your_cost, proposed_cost*/
  .proposed_cost{
    display:flex;
  }
  .your_cost{
    display: flex;
  }
  
  .estimate_box input[type=text]{
    font-size: large;
    margin: 10px 10px 0px 10px;  /*아래 오른쪽 위 왼쪽*/
    height: 35px;
    width: 450px;
  }
  
  #li_01>img{
    width: 200px;
    height: 200px;
    border-radius: 10px;
  }
  
/*다음 페이지 넘김 버튼*/
.nextpage{
  background-color: none;
  width: 600px;
  height: 100px;
  margin: 0 auto;
  margin-top: 18px;
}
#go-back{
  margin-top: 5%;
  width: 30%;
  height: 45px;
  border-radius: 10px;
  background-color: rgb(247, 226, 169);
  border:none;
  font: bolder;
}
#go-next{
  margin-top: 5%;
  width: 69%;
  height: 45px;
  border-radius: 10px;
  background-color: rgb(235, 103, 3);
  border:none;
  font: bolder;
  color: white;
}
.nextpage button:hover{
  cursor: pointer;
}
  
  #li_01{
    display: flex;
  }
#partners_info{
border:1px solid blue;
padding: 20px;

}
   
   
   
   
   
   
   </style>
    
 

<div id = "estimate_step04">
 <section aria-label="주소 선택& 근처 업체" class="youraddr">
    <div class="title">
        <h2>근처의 인테리어업체와 직접 연락할 수 있어요.</h2><h3>4/4</h3>
 		
    </div>
    <div id="msg2">
        <p id="p1"><b>${vo.mem_name }</b> 님 근처에 <b>${count} </b>개의 인테리어 업체가 있습니다.<br/>
        클릭해서 직접 상담해 볼 수 있어요.</p>
     </div>
    <div class = "estimate_box">
   <div class = "companies">
<%-- 
		pdto.setBusiness_num(rs.getString("business_num"));
		pdto.setBusinessName(rs.getString("businessName"));
		pdto.setpTel(rs.getNString("pTel"));
		pdto.setpAddress(rs.getString("pAddress")); --%>
		
   			 
    
    <c:forEach var ="p" items="${list }">
    
    			<div id=partners_info>
    			<input id="${p.businessName }" type="checkbox"> <label for="${p.businessName }"> ${p.businessName }	</label><br>			
 				전화번호 : ${p.pTel }<br>
 				주소 :${p.pAddress}<br>
 				사업자 번호 : ${p.business_num }
 				
 				</div>
 				
 			</c:forEach>	
    
    
    
    
    
    
    
    
    
    
    
    <%-- 
     <ul style="list-style: none;"> 
     
     
     	
      <li>
        <input type="checkbox" id="company" name="company">
        <label for = "company">호철엔지니어링</label>
    </li>
        <li id="li_01">
        <p id="p2">총 공사 999건<br/>최근 상담 999건<br/><br/><br/>+보증보험<br/>+3D도면<br/>+일반도면<br/>+카드결제</p>
        </li>
     </ul>
     <ul style="list-style: none;">
        <li>
          <input type="checkbox" id="company2" name="company">
          <label for = "company2">동민아키텍쳐</label>
        </li>
        <li id="li_01">
          <p id="p2">총 공사 999건<br/>최근 상담 999건<br/><br/><br/>+보증보험<br/>+3D도면<br/>+일반도면<br/>+카드결제</p>
          </li>
        </ul>--%>
 </div>
      
      
      
      
      
      
      
      
      
      
      
      
      
        <div class="nextpage">
          <button class="button" id="go-back" onclick="location.href='estimate_apply3.do'">이전</button>
          <button class="button" id="go-next" onclick="location.href='estimate_apply5.do'">다음</button>
        </div>
    </div>
 </section>
</div>

 <%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />