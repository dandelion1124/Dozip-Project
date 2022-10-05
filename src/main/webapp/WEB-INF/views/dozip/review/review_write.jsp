<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

	<div class="review_write_wrap">
	<hr/>
		<div class="review_guide">
			<p>후기 작성 가이드</p>
			<ul>
				<li>필수 항목을 모두 채워주세요.</li>
				<li>참고가 되는 사진을 같이 올려주시면 추가 포인트 1000p가 지급됩니다.</li>
				<li>베스트 후기로 선정되면 추가 포인트 5000p가 지급됩니다.</li>
				<li>상세히 적어주시면 많은 사람들에게 큰 도움이 될 수 있습니다.</li>
			</ul>
		</div>
		
		
		<form class="review_write_form" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>제목</th> <td><input type="text" name="r_title" id="r_title" placeholder="제목을 입력해주세요"/></td>
				</tr>
				<tr>
					<th>시공정보</th> <td><button id="load_btn">계약정보 불러오기</button></td>
				</tr>
				<tr id="load_cont">
					<th></th><td>업체명 : 불러온정보<br/>공간정보 : 불러온정보<br/>공사기간 : 불러온정보 <br/> 평수 : 불러온정보<br/></td>
				</tr>
				<tr>
					<th>태그선택</th>
					<td>
						<select name="choice1" class="choice_group">
							<option selected>스타일</option>
							<option value="모던">모던</option>
							<option value="심플/미니멀">심플/미니멀</option>
							<option value="내추럴">내추럴</option>
							<option value="빈티지">빈티지</option>
							<option value="럭셔리">럭셔리</option>
						</select>
						<select name="choice2" class="choice_group">
							<option selected>비용</option>
							<option value="1000만원 이하">1000만원 이하</option>
							<option value="1000만원대">1000만원대</option>
							<option value="2000만원대">2000만원대</option>
							<option value="3000만원대">3000만원대</option>
							<option value="4000만원대">4000만원대</option>
							<option value="5000만원대">5000만원대</option>
							<option value="6000만원 이상">6000만원 이상</option>
						</select>
						<select name="choice3" class="choice_group">
							<option selected>기타</option>
							<option value="one">1번</option>
							<option value="two">2번</option>
							<option value="three">3번</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th><td><textarea  name="r_cont" id="r_cont"  placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>사진첨부</th>
					<td>
						<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
    					<div id="image_container"></div>
					</td>
				</tr>
				<tr>
					<th>종합별점</th>
					<td id="test">
						<div class="star_area">
						<div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars" name="rating" value="5"	v-model="ratings"  onclick="getScore(event);"/>
								<label for="5-stars" class="star pr-4">★</label>
							<input type="radio" id="4-stars" name="rating" value="4"	v-model="ratings"  onclick="getScore(event);"/>
								<label for="4-stars" class="star">★</label>
							<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"  onclick="getScore(event);" />
								<label for="3-stars" class="star">★</label>
							<input type="radio"	id="2-stars" name="rating" value="2" v-model="ratings"  onclick="getScore(event);"/>
								<label for="2-stars" class="star">★</label>
							<input type="radio" id="1-star"	name="rating" value="1" v-model="ratings"  onclick="getScore(event);"/>
								<label for="1-star"	class="star">★</label>
						</div>
						<div class="star_score">
							<span id="result">
								<script>
									function getScore(event) {
										document.getElementById('result').innerText = event.target.value;
									}
								</script> 
							</span>
							점
						</div>
					</div>
					</td>
				</tr>
				<tr><td colspan="2" id="btn_cell"><button type="submit" id="r_submit_btn">후기등록하기</button></td></tr>
			</table>
		</form>

	
	</div>
<%-- 스크립트 --%>
	 <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
    
<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />
