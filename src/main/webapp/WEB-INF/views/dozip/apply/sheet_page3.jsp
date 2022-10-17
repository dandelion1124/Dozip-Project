<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 3 페이지 --%>
<div class = "page3" hidden>
    <title>Step 3</title>
    <div class="estimate_step03">
        <section aria-label="예산 선택" class="estimate_yourcost">
            <div class="title">
                <h2>상세 내용을 알려주세요</h2><h3>3/4</h3>
            </div>
            <p class="subtitle">단 한번 입력으로 조건에 맞는 전문가들과 간편하게 상담 하세요</p><br />
            <div class="estimate_box_page3">
                <h3>의뢰인 정보 입력</h3>
                <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
                <input type="text" id="phone" name="phone" oninput="hypenTel(this)" placeholder="휴대폰 번호를 입력해 주세요" maxlength="13"/>
                <button type="button" id="certify_phone" >인증하기</button>

<%--수정 작업중

수정 작업중

수정 작업중
수정 작업중

수정 작업중

                                                        --%>


                <input type="text" id="sample6_postcode" readonly placeholder="우편번호" size="4" name="pf_zipcode">
                <input type="text" id="sample6_address"  name ="pf_addr1" readonly  placeholder="주소" size="30">
                <input type="text" id="sample6_detailAddress" name ="pf_addr2" placeholder="상세주소">
                <input type="text" id="sample6_extraAddress" name ="pf_addr3" readonly placeholder="참고항목" size=10>

                <h1 style="color:red"> 수정중</h1>



                <input type="text" id="addr" name="addr" placeholder="주소를 입력해 주세요">
                <button type="button" id="address_btn" onclick="sample6_execDaumPostcode()">주소찾기</button>




                <%--수정 작업중

                수정 작업중

                수정 작업중
                수정 작업중

                수정 작업중

                --%>
                <div class="para">
                    <h3>스타일을 알려주세요(1500자 내외)</h3>
                    <p class="textCount">0자</p><p class="textTotal">/1500자</p>
                </div>
                <textarea id="paragraph" name="paragraph" maxlength="1500" placeholder="원하는 스타일에 대해 자유롭게 써주세요"></textarea>

            </div>
            <div class="nextpage">
                <button type="button" class="go_back" onclick="page_back03()" >이전</button>
                <button type="button" class="go_next" onclick="apply03_check()">다음</button>
            </div>
        </section>
    </div>
</div>
<script>
    function apply03_check(){ /*3 페이지 유효성 검증 */
        var est_name = document.getElementById("name").value;
        var est_phone = document.getElementById("phone").value;
        var est_addr = document.getElementById("addr").value;
        var est_desc = document.getElementById("paragraph").value;
        document.getElementById("get_name").innerText = est_name;
        document.getElementById("get_phone").innerText = est_phone;
        document.getElementById("get_addr").innerText = est_addr;
        //document.getElementById("get_desc").innerText = est_desc;

        if(est_name == ""){
            alert('성함을 알려주세요!');
            name.focus();
            return false;
        }
        if(est_phone == "") {
            alert('전화번호을 알려주세요!');
            phone.focus();
            return false;
        }if(est_addr == "") {
            alert('주소를 알려주세요!');
            addr.focus();
            return false;
        }
        if (est_desc == "") {
            alert('세부 스타일을 알려주세요!');
            paragraph.focus();
            return false;
        }

        $('.page3').hide();
        $('.page4').show();

        $.getJSON("/dozip/search_part/"+est_addr, function(data){ //json 데이터를 get방식으로 처리, 비동기식으로 가져온 데이터는 data매개변수에 저장
            var result="";
            $(data).each(function(){ //each()함수로반복
                result += "<div class=partnersinfo_div style='border: 2px solid blue;  width: 400px;'>"+
                    "<input type=checkbox style='appearance: revert;'> <label for="+this.businessName+">"+this.businessName+"</label><br>" +
                    "전화번호 : " +this.p_Tel+"<br>" +
                    "주소 :" +this.p_Address+"<br>" +
                    "사업자 번호 : "+this.businessNum+"</div>"
            });
            $('#partners_info').html(result); //해당영역에 html() 함수로 문자와 태그를 함께 변경 적용.
        });








    }

</script>