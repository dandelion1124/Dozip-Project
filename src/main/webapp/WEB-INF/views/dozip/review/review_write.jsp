<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/dozip/review_write.css" />
<jsp:include page="../common/header.jsp" />
<%-- 상단 공통부분 끝 --%>

<div class="review_write_wrap">
	<hr/>
	<div class="review_guide">
		<p id = "r_guide">후기 작성 가이드</p>
		<ul>
			<li>필수 항목을 모두 채워주세요</li>
			<li>계약정보 불러오기를 클릭하면 계약서 정보를 편하게 불러올 수 있어요!</li>
			<p id = "cont_guide">계약정보 불러오기 가이드</p>
			<li id = "cont_rguide">계약번호 불러오기 버튼 클릭 => 계약 번호 선택 => 해당 정보 불러오기 클릭</li>
			<li>상세히 적어주시면 많은 사람들에게 큰 도움이 될 수 있습니다!</li>
		</ul>
	</div>


	<form action="upload_review_ok" class="review_write_form" id = "review_form" method="post" onsubmit="return review_check()">
		<div class = "review_write_start">
			<div class = "review_title">
				<h3>제목</h3>
				<div><input type="text" name="re_title" id="r_title" placeholder="제목을 입력해주세요"/></div>
			</div>
			<div class = "cont_inform">
				<h3>시공정보</h3>
				<div class = "cont_inform_c">
					<div id = "t_cont_no"><input type="text" id="tcont_no" name = "cont_no"  readonly placeholder="계약번호"/></div>
					<div><button type="button" id="load_btn" onclick="openCont()">계약번호 불러오기</button></div>
					<div><button type = "button" id = "search_cont_btn" name="submit">해당정보 불러오기</button></div>
					<script>
						function openCont(){
							window.open("/dozip/myall_contract","_blank",
									"toolbar = no, menubar = no, scrollbars=no, resizable=no, width=900, height=500, left=0, top=0");
						}
					</script>
				</div>
			</div>

			<div id = "onload_cont">
				<div id="load_cont">
					<div id = "tp_name">
						<h4>업체명</h4>
						<input type="text" id="tcont_name" name = "partners_name" readonly placeholder="업체명"/>
					</div>
					<div id = "t_title">
						<h4>공간정보</h4>
						<input type="text" id="tcont_title" name = "cont_title" readonly placeholder="공간정보"/>
					</div>
					<div id = "t_start">
						<h4>착공일</h4>
						<input type="text" id="tcont_st" name = "cont_start "  readonly placeholder="공사시작 날짜"/>
					</div>
					<div id = "t_end">
						<h4>완공일</h4>
						<input type="text" id="tcont_end" name = "cont_end"  readonly placeholder="공사종료 날짜"/>
					</div>
					<div id = "t_area">
						<h4>평수</h4>
						<input type="text" id="tcont_area" name = "cont_area"  readonly placeholder="공사 평수"/>
					</div>
					<div id= "t_money">
						<h4>총 공사금액</h4>
						<input type="text" id="tcont_total" name = "cont_total" readonly placeholder="총 공사 금액"/>
					</div>
				</div>
			</div>
			<div class = "r_cont_main">
				<h3>내용</h3>
				<div class="review_cont"><textarea  name="re_cont" id="r_cont"  placeholder="내용을 입력해주세요"></textarea></div>
			</div>

			<div class = "star">
				<h2>종합별점</h2>
				<div id="test">
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
				</div>
			</div>
			<div><button type="submit" id="r_submit_btn">내용 등록하기</button></div>
		</div>
	</form>
</div>

<%-- 스크립트 --%>

<script>
	function review_check(){
		if($.trim($('#r_title').val()) == ''){
			alert('제목을 입력해주세요');
			$('#r_title').focus();
			return false;
		}
		if($.trim($('#tcont_no').val()) == ''){
			alert('계약번호를 선택해주세요');
			$('#tcont_no').focus();
			return false;
		}
		if($.trim($('#tcont_name').val()) == ''){
			alert('계약정보를 불러와주세요');
			$('#tcont_name').focus();
			return false;
		}
		if($.trim($('#r_cont').val()) == ''){
			alert('내용을 입력해주세요');
			$('#r_cont').focus();
			return false;
		}
	}
</script>
<!-- 계약번호를 기준으로 데이터 불러오기 -->
<script>
	$(document).on("click","button[name='submit']",function(){
		var cont_no = $('#tcont_no').val();

		alert(cont_no +'  계약을 불러옵니다');

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
				var result = "";

				$(data).each(function () {
					result+=
							" <div id = 'tp_name'>" + "<h3>업체명</h3>"+
							"<input type='text' id='tcont_name'  readonly value='"+this.partners_name+"'/> </div>"
							+"<div id = 't_title'>" + "<h3>공간정보</h3>"+
							"<input type='text' id='tcont_title'  readonly value='"+this.cont_title+"'/></div>"
							+"<div id = 't_start'> " + "<h3>착공일</h3>"+
							"<input type='text' id='tcont_st'  readonly value='"+this.cont_start.substring(0,10)+"'/></div>"
							+"<div id = 't_end'> " + "<h3>완공일</h3>"+
							"<input type='text' id='tcont_end'  readonly value='"+this.cont_end.substring(0,10)+"'/></div>"
							+"<div id = 't_area'> " + "<h3>평수</h3>"+
							"<input type='text' id='tcont_area'  readonly value='"+this.cont_area+"'/></div>"
							+"<div id= 't_money'>" + "<h3>총 공사금액</h3>"+
							"<input type='text' id='tcont_total'  readonly value='"+this.cont_total+"'/></div>"
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
