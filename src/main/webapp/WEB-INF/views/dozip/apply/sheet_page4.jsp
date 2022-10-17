<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 4페이지 --%>
<div class= "page4" hidden>

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
                <div id=partners_info></div></div>
            <div class="nextpage">
                <button type="button" class="go_back" onclick="page_back04()">이전</button>
                <button type="button" class="go_next" onclick="apply04_check()">다음</button>
            </div>
        </div>
    </section>
</div>
<script>

    function apply04_check(){ /*4 페이지 유효성 검증 */
        $('.page4').hide();
        $('.page5').show();
    }
</script>