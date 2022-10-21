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
				<li>계약정보 불러오기를 클릭하면 계약서 정보를 편하게 불러올 수 있어요</li>
				<li>상세히 적어주시면 많은 사람들에게 큰 도움이 될 수 있습니다!</li>
			</ul>
		</div>
		
		
		<form class="review_write_form" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>제목</th> <td><input type="text" name="r_title" id="r_title" placeholder="제목을 입력해주세요"/></td>
				</tr>
				<tr>
					<th>시공정보</th>
					<td id = "t_cont_no"><input type="text" id="tcont_no"  readonly placeholder="계약번호"/></td>
					<td><button type="button" id="load_btn" onclick="openCont()">계약번호 불러오기</button></td>
					<td><button type = "button" id = "search_cont_btn" name="submit">해당정보 불러오기</button></td>
					<script>
						function openCont(){
							window.open("/dozip/myall_contract","_blank",
									"toolbar = no, menubar = no, scrollbars=no, resizable=no, width=900, height=500, left=0, top=0");
						}
					</script>
				</tr>

			<div id = "onload_cont">
					<tr id="load_cont">
						<th>업체명</th>
						<td id = "tp_name">
							<input type="text" id="tcont_name"  readonly placeholder="업체명"/>
						</td>
						<th>공간정보</th>
						<td id = "t_title">
							<input type="text" id="tcont_title"  readonly placeholder="공간정보"/>
						</td>
						<th>착공날짜</th>
						<td id = "t_start">
							<input type="text" id="tcont_st"  readonly placeholder="공사시작 날짜"/>
						</td>
						<th>완공날짜</th>
						<td id = "t_end">
							<input type="text" id="tcont_end"  readonly placeholder="공사종료 날짜"/>
						</td>
						<th>평수</th>
						<td id = "t_area">
							<input type="text" id="tcont_area"  readonly placeholder="공사 평수"/>
						</td>
						<th>총 공사금액</th>
						<td>
							<input type="text" id="tcont_total"  readonly placeholder="총 공사 금액"/>
						</td>
					</tr>
			</div>

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
				<tr><td colspan="2" id="btn_cell"><button type="submit" disabled = 'disabled' id="r_submit_btn">후기등록하기</button></td></tr>
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

	<!-- 계약번호를 기준으로 데이터 불러오기 -->
	<script>
		$(document).on("click","button[name='submit']",function(){
			var cont_no = $('#tcont_no').val();

			alert(cont_no);

			$.ajax({
				url:'/dozip/search_cont',
				type : 'get',
				async : false,
				data : {
					cont_no: cont_no
				},
				dataType: "json",
				cache: false,
				success: function (data){
					test = data;
					var result = "";

					$(data).each(function () {
						result+=
						"<th>업체명</th>"
						+" <td id = 'tp_name'><input type='text' id='tcont_name'  readonly value='"+this.partners_name+"'/> </td>"
						+ "<th>공간정보</th>"
						+"<td id = 't_title'><input type='text' id='tcont_title'  readonly value='"+this.cont_title+"'/></td>"
						+"<th>착공날짜</th>"
						+"<td id = 't_start'> <input type='text' id='tcont_st'  readonly value='"+this.cont_start+"'/></td>"
						+"<th>완공날짜</th>"
						+"<td id = 't_end'> <input type='text' id='tcont_end'  readonly value='"+this.cont_end+"'/></td>"
						+"<th>평수</th>"
						+"<td id = 't_area'> <input type='text' id='tcont_area'  readonly value='"+this.cont_area+"'/></td>"
						+"<th>총 공사금액</th>"
						+"<td><input type='text' id='tcont_total'  readonly value='"+this.cont_total+"'/></td>"
					});

					$('#load_cont').html(result); //해당 영역에 html 함수로 문자태그 변경적용
				},
				error:function(){
					alert('계약정보 불러오기 실패');
				}
			});
		});
	</script>
    
<%-- 하단 공통부분 --%>
<jsp:include page="../common/footer.jsp" />
