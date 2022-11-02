<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 2페이지 --%>
<div class="page2" hidden>
    <div id="estimate_step02">
        <section aria-label="예산 선택" class="estimate_yourcost">
            <div class="title">
                <h1>예산과 일정을 알려주세요.</h1>
                <h3>2/4</h3>
            </div>
            <div>
                <p>단 한번 입력으로 조건에 맞는 전문가들과 간편하게 상담 하세요.</p><br/>
            </div>
        </section>
        <div class="estimate_box">
            <br/>
            <h2>예산</h2>
            <div class="your_cost">
                <input type="text" id="estimate_cost" name="est_bud" maxlength="7" placeholder="예산을 입력해주세요"
                       onkeyup="inputNumberFormat(this);" style="font-size: 20px;text-indent: 10px;"/>
                <h3>만원</h3>
            </div>
            <br/><br/><br/><br/>
            <hr/>
        </div>
        <div class="estimate_date">
            <br/>
            <h2>희망 시공일정</h2><br/>
            <span style="font-size:20px">오늘 날짜 : <span id="today"></span></span>
            <br>
            <br>
            <br/>
            <label for="est_start">시작일</label>&nbsp;
            <input type="text" name="est_start" id="est_start">
            ~
            <label for="est_end">종료일</label>&nbsp;
            <input type="text" name="est_end" id="est_end">
        </div>

        <!-- id : 고유한 식별 목적
                   class : 재사용을 목적
                   name : 컨트롤 요소값(value)을 서버로 전송하기위함-->

        <div class="nextpage">
            <button type="button" class="go_back" onclick="page_back02()">이전</button>
            <button type="button" class="go_next" onclick="apply02_check()">다음</button>
        </div>
    </div>
</div>

<script>
    function apply02_check() { /*2 페이지 유효성 검증 */
        var est_bud = document.getElementById("estimate_cost").value;
        var est_start = document.getElementById("est_start").value;
        var est_end = document.getElementById("est_end").value;
        document.getElementById("get_cost").innerText = est_bud;
        document.getElementById("get_start").innerText = est_start;
        document.getElementById("get_end").innerText = est_end;

        if (est_bud == "") {
            alert('예산을 입력해주세요!');
            return false;
        } else if (est_start == "") {
            alert('시작일을 알려주세요!');
            est_start.focus();
            return false;
        } else if (est_end == "") {
            alert('종료일을 알려주세요!');
            est_end.focus();
            return false;
        }
        $('.page2').hide();
        $('.page3').show();
        window.scrollTo({ top: 0, behavior: "smooth" });
    }
</script>