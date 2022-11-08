<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .partnersinfo_div {
        padding: 20px 10px;
        font-size: 20px;
        line-height: 1.8;
        border: 1px solid darkgray;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-evenly;
        border-radius: 5px;
        box-shadow: 1px 1px 4px 1px rgb(247 226 169 / 25%);
    }
    .partnersinfo_div:hover {
        background: #FEFCF5;
        cursor: pointer;
        border: 1px solid #e1d9bd;
    }
    .partnersinfo_div  input[type="checkbox"]{
        zoom: 1.3;
    }
    .partnersinfo_div img {
        width: 100px;
        height: 100px;
    }
    img#view {
        width: 350px;
        border: 1px solid #ddd;
        padding: 30px;
    }
    div#est_file_div {
        display: flex;
        align-items: center;
        flex-direction: column-reverse;
    }
</style>

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
                <button type="button" id="certify_phone" onclick="phone_chk()">인증하기</button>

                <input type="text" id="sample6_postcode" readonly placeholder="우편번호" size="4" name="pf_zipcode">
                <input type="text" id="sample6_address"  name ="pf_addr1" readonly  placeholder="주소" size="30">
                <input type="text" id="sample6_detailAddress" name ="pf_addr2" placeholder="상세주소">
                <input type="text" id="sample6_extraAddress" name ="pf_addr3" readonly placeholder="참고항목" size=10>
                <button type="button" id="address_btn" onclick="sample6_execDaumPostcode()">주소찾기</button>
                <div class="para">
                    <h3>스타일을 알려주세요(1500자 내외)</h3>
                    <p class="textCount">0자</p><p class="textTotal">/1500자</p>
                </div>
                <textarea id="paragraph" name="paragraph" maxlength="1500" placeholder="원하는 스타일에 대해 자유롭게 써주세요"></textarea>
                <h3>원하는 스타일의 사진을 등록해주세요</h3>
                <div id="est_file_div">
                <input type="file" name="est_file" id="est_file"  accept="image/*">
<%--                    src="/images/partners/upload_plus.png"--%>
                <img id="view" src="#" style="visibility: hidden"/></div>
                <script>
                    $(function() {
                        $("#est_file").on('change', function(){
                            readURL(this);
                        });
                    });
                    function readURL(input) {
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                $('#view').attr('src', e.target.result);
                                $('#view').css('visibility', 'visible');
                            }
                            reader.readAsDataURL(input.files[0]);
                        }
                    }
                </script>
            </div>
            <div class="nextpage">
                <button type="button" class="go_back" onclick="page_back03()" >이전</button>
                <button type="button" class="go_next" onclick="apply03_check()">다음</button>
            </div>
        </section>
    </div>
</div>

<script>
    function phone_chk() {
        if (document.getElementById("phone").value == ""){
            alert('휴대폰 번호를 입력해주세요.');
        }else {
            alert('인증되었습니다.');
        }
}

function apply03_check(){ /*3 페이지 유효성 검증 */
        var est_name = document.getElementById("name").value;
        var est_phone = document.getElementById("phone").value;
        var est_addr = document.getElementById("sample6_address").value;
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
        window.scrollTo({ top: 0, behavior: "smooth" });

        $.getJSON("/dozip/search_part/"+est_addr, function(data){ //json 데이터를 get방식으로 처리, 비동기식으로 가져온 데이터는 data매개변수에 저장
            var result="";
            $(data).each(function(){ //each()함수로반복
                result += "<label for="+this.businessNum+"><div class=partnersinfo_div><div class='partners_logo'><img src="+this.p_Comp_logo+" alt='사진'></div><div>"+
                    "<input  type='checkbox' class='partenrs_btn' id="+this.businessNum+" name='businessName' value="+this.businessNum+" style='appearance: revert;'>&nbsp;업체명 : "+ this.businessName+"<br>" +
                    "&nbsp;&nbsp;&nbsp;&nbsp;연락처 : " +this.p_Tel+"<br>" +
                    "&nbsp;&nbsp;&nbsp;&nbsp;주 &nbsp;소 : " +this.p_Addr1+"<br></div></div></label>"
            });
            $('#partners_info').html(result); //해당영역에 html() 함수로 문자와 태그를 함께 변경 적용.
        });
        $.ajax({
            type: "get",
            url: '/dozip/count_partners',
            data: {
                est_addr:est_addr
            },
            datatype: "text",
            success: function (data) {
                var result="";
                result+="고객님 근처에 <b style=color:red;font-size:2em>"+data+"</b>개의 인테리어 업체가 있습니다<br/> 클릭해서 직접 상담해 볼 수 있어요";
                $('#p1').html(result); //해당영역에 html() 함수로 문자와 태그를 함께 변경 적용.
            }
        });

    }

</script>