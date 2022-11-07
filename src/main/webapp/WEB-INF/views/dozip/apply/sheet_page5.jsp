<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    #epart1, #epart2, #epart3 { box-shadow: 0 0 10px rgba(0, 0, 0, 0.15); padding: 5px; margin-bottom: 20px; background-color: white;  border-radius: 5px; }
    .subtitle { margin-bottom: 0px; margin-top: 0px; }
    .title { display: -webkit-box; }
    .conlon { width: 10px; margin-right: 10px;}
</style>
<%-- 5페이지 --%>
<div class = "page5" hidden>
    <title>Step 5</title>

    <div id="estimate_step05">
        <section aria-label="견적요청" class="estimate_yourcost">
            <div class="title">
                <img src="/images/dozip/icons8-estimate-48.png" style="padding-top: 13px;"/><h2>고객님의 견적요청내용입니다</h2><h3></h3>
            </div>
            <p class="subtitle">견적요청내용을 확인하시고 맞다면 요청을 보내주세요</p><br />
            <div class="estimate_box_page5">
                <div id="epart1">
                    <table>
                        <tr class="table">
                            <td class="left">의뢰인</td>
                            <td class="right"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_name"></span></td>
                        </tr>
                        <tr class="table">
                            <td class="left">전화번호</td>
                            <td class="right"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_phone"></span></td>
                        </tr>
                        <tr class="table">
                            <td class="left">주소<img src="/images/dozip/icons8-verified-account-24.png" style="width: 15px; height: 15px;"/></td>
                            <td class="right" style="border-bottom: none;"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_addr"></span></td>
                        </tr>
                    </table>
                </div>
                <div id="epart2">
                    <table>
                        <tr class="table">
                            <td class="left">공간유형</td>
                            <td class="right"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_zoning"></span>공간</td>
                        </tr>
                        <tr class="table">
                            <td class="left">건물유형</td>
                            <td class="right"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_use"></span></td>
                        </tr>
                        <tr class="table">
                            <td class="left">면적(공급면적)</td>
                            <td class="right"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_area"></span>평(<span id="get_area2"></span>m<sup>2</sup>)</td>
                        </tr>
                        <tr class="table">
                            <td class="left">세부선택</td>
                            <td class="right" style="border-bottom: none;"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_detail"></span></td>
                        </tr>
                    </table>
                </div>
                <div id="epart3" style="margin-bottom: 0;">
                    <table>
                        <tr class="table">
                            <td class="left">희망예산<img src="/images/dozip/icons8-verified-account-24.png" style="width: 15px; height: 15px;"/></td>
                            <td class="right"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_cost"></span>만원</td>
                        </tr>
                        <tr class="table">
                            <td class="left">시공기간<img src="/images/dozip/icons8-verified-account-24.png" style="width: 15px; height: 15px;"/></td>
                            <td class="right" style="border-bottom: none;"><img class="conlon" src="/images/dozip/icons8-colon-100.png"/><span id="get_start"></span> ~ <span id="get_end"></span></td>
                        </tr>
                    </table>
                </div>

                <input type="hidden" id="d" name="d">
                <input type="hidden" id="d3" name="d3">
                <input type="hidden" id="d4" name="d4">
                <input type="hidden" id="d5" name="d5">
                <input type="hidden" id="bNum" name="bNum">
            </div>
            <div class="nextpage">
                <button type="button" class="go_back" onclick="page_back05()">이전</button>
                <button class="go_next" >진행하기</button>
            </div>
        </section>
    </div>
</div>
</form>
</body>