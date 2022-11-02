<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 5페이지 --%>
<div class = "page5" hidden>
    <title>Step 5</title>

    <div id="estimate_step05">
        <section aria-label="견적요청" class="estimate_yourcost">
            <div class="title">
                <h2>고객님의 견적요청내용입니다.</h2><h3></h3>
            </div>
            <p class="subtitle">견적요청내용을 확인하시고 맞다면 요청을 보내주세요.</p><br />
            <div class="estimate_box_page4">
                <table class="tg" style= "table-layout: fixed; width: 460px;" background = "/images/dozip/receipt.png">
                    <colgroup>
                        <col style="width: 300px">
                        <col style="width: 200px">
                    </colgroup>

                    <tbody>
                    <tr class="table">
                        <td class="left">고객님 성함</td>
                        <td class="right"><div id="get_name"></div></td>
                    </tr>
                    <tr class="table">
                        <td class="left">전화번호</td>
                        <td class="right"><div id="get_phone"></div></td>
                    </tr>
                    <tr class="table">
                        <td class="left">주소</td>
                        <td class="right"><div id="get_addr"></div></td>
                    </tr>
                    <tr class="table">
                        <td class="left">공간유형</td>
                        <td class="right"><div id="get_zoning"></div></td>
                    </tr>
                    <tr class="table">
                        <td class="left">건물유형</td>
                        <td class="right"><div id="get_use"></div></td>
                    </tr>
                    <tr class="table">
                        <td class="left">면적 (공급면적)</td>
                        <td class="right"><div id="get_area"></div>평</td>
                    </tr>
                    <tr class="table">
                        <td class="left">세부선택</td>
                        <td class="right"><div id="get_detail"></div></td>
                    </tr>
                    <tr class="table">
                        <td class="left">고객님의 예산</td>
                        <td class="right"><div id="get_cost"></div>만원</td>
                    </tr>
                    <tr class="table">
                        <td class="left">날짜</td>
                        <td class="right"><div id="get_start"></div> ~ <div id="get_end"></div></td>
                    </tr>
                    </tbody>
                </table>
            </img>

            </div>
            <input type="hidden" id="d" name="d">
            <input type="hidden" id="d3" name="d3">
            <input type="hidden" id="d4" name="d4">
            <input type="hidden" id="d5" name="d5">
            <input type="hidden" id="bNum" name="bNum">
            <div class="nextpage">
                <button type="button" class="go_back" onclick="page_back05()">이전</button>
                <button class="go_next" >진행하기</button>
            </div>
        </section>
    </div>
</div>
</form>
</body>