<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/admin/admin_writeList.css"/>

<jsp:include page = "./include/header.jsp"/>
<%-- 상단 공통부분 끝 --%>

<%-- 본문 내용 --%>
<div class = "wrap">
    <div class = "write_info">
        <div class = "table_type">
            <p id = "table_info">원하는 관리 게시판을 선택하세요</p>
        </div>
    </div>
    <div class = "table_btn">
        <input type = "button" id = "port_btn" value = "포트폴리오" onclick="view(1)"/>
        <input type = "button" id = "review_btn" value = "고객후기" onclick="view(2)"/>
    </div>

    <div id = "port_cont">
        <!-- 검색필터 -->
        <div id="search_filter">
            <h3 class="text-center">검색필터</h3>
            <div class="search_cont">
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <select class="search_toggle" data-toggle="dropdown">
                            <option>사업자번호</option>
                            <option>제목</option>
                            <option>공사유형</option>
                            <option>주소</option>
                            <option>평수</option>
                            <option>공사비용</option>
                            <option>공사기간</option>
                            <option>프리미엄여부</option>
                        </select>
                    </div>

                    <input type="hidden" name="search_param" value="필터" id="search_param1">
                    <input type="text" class="search_box" name="x" placeholder="검색어를 입력하세요">
                    <span class="input-group-btn">
							<button class="search_btn" value = "검색" type="button">검색</button>
						</span>
                </div>
            </div>
        </div>

        <div class = "port_table">
            <script>
                function view(arg){
                    var t1 = document.getElementById("tb_port");
                    var t2 = document.getElementById("tb_review");
                    var t3 = document.getElementById("search_filter");
                    var t4 = document.getElementById("rsearch_filter");
                    if(arg == 1){
                        t1.style.display = "block";
                        t2.style.display= "none";
                        t3.style.display = "block";
                        t4.style.display = "none";
                    }
                    else{
                        t2.style.display = "block";
                        t4.style.display = "block";
                        t1.style.display = "none";
                        t3.style.display = "none";
                    }
                }
            </script>
            <table id = "tb_port" border = "1" >
                <tr>
                    <th width = "50" id = "tb_n">번호</th>
                    <th width = "150" id = "tb_num">사업자번호</th>
                    <th width = "200" id = "tb_title">제목</th>
                    <th width = "150" id = "tb_type">공사유형</th>
                    <th width = "180" id = "tb_adress">주소</th>
                    <th width = "80" id = "tb_area">평수</th>
                    <th width = "120" id = "tb_cost">비용</th>
                    <th width = "80" id = "tb_period">공사기간</th>
                    <th width = "100" id = "tb_premium">프리미엄여부</th>
                    <th width = "100" id = "tb_date">작성일자</th>
                    <th width = "80" id = "tb_delete">삭제</th>
                </tr>
                <%! int i = 0; %>
                <% for(i=1; i<=15; i+=2) { %>
                <tr>
                    <td id="no"><%=i %></td>
                    <td id="pnum">111-11-111111</td>
                    <td id="title">이보다 완벽할 수 없다</td>
                    <td id="type">주거공간/아파트</td>
                    <td id="adress">서울시 강남구 역삼동</td>
                    <td id ="area">50평</td>
                    <td id ="cost">3000만원</td>
                    <td id = "period">3주</td>
                    <td id = "premium">프리미엄</td>
                    <td id = "date">2022-10-10</td>
                    <td id = "p_delete">
                        <button id = "del_btn" value = "삭제" type = "button">삭제</button>
                    </td>
                </tr>
                <tr class = "even">
                    <td id="no2"><%=i+1 %></td>
                    <td id="pnum2">222-11-111111</td>
                    <td id="title2">이보다 완벽할 수 없다</td>
                    <td id="type2">상업공간/상가</td>
                    <td id="adress2">부산시 해운대구 우동3</td>
                    <td id ="area2">40평</td>
                    <td id ="cost2">5000만원</td>
                    <td id = "period2">3주</td>
                    <td id = "premium2">일반</td>
                    <td id = "date2">2022-10-12</td>
                    <td id = "p_delete2">
                        <button id = "del_btn2" value = "삭제" type = "button">삭제</button>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </div>
    <br>

    <div id = "review_cont">
        <div id="rsearch_filter">
            <h3 class="text-center">검색필터</h3>
            <div class="search_cont">
                <div class="input-group">
                    <div class="input-group-btn search-panel">
                        <select class="search_toggle" data-toggle="dropdown">
                            <option>사업자번호</option>
                            <option>아이디</option>
                            <option>글번호</option>
                            <option>업체명</option>
                            <option>공간정보</option>
                            <option>공사기간</option>
                            <option>평수</option>
                            <option>비용</option>
                            <option>내용</option>
                            <option>별점</option>
                        </select>
                    </div>

                    <input type="hidden" name="search_param" value="필터" id="search_param">
                    <input type="text" class="search_box" name="x" placeholder="검색어를 입력하세요">
                    <span class="input-group-btn">
							<button class="search_btn" value = "검색" type="button">검색</button>
						</span>
                </div>
            </div>
        </div>
        <table id = "tb_review" border = "1">
            <tr>
                <th width = "50" id = "tb_num2">번호</th>
                <th width = "130" id = "comp_num">사업자 번호</th>
                <th width = "100" id = "comp_id">아이디</th>
                <th width = "80" id = "tb_no">글번호</th>
                <th width = "120" id = "comp_name">업체명</th>
                <th width = "180" id = "comp_type">공간정보</th>
                <th width = "80" id = "comp_period">공사기간</th>
                <th width = "80" id = "comp_area">평수</th>
                <th width = "80" id = "comp_cost">비용</th>
                <th width = "250" id = "comp_cont">리뷰내용</th>
                <th width = "80" id = "comp_rate">별점</th>
                <th width = "80" id = "comp_del">삭제</th>
            </tr>
            <%! int j = 0; %>
            <% for(j=1; j<=15; j++) { %>
            <tr>
                <td  id="r_num"><%=j %></td>
                <td  id="r_cnum">759-41-00656</td>
                <td  id="co_id">shc1004</td>
                <td  id="r_contno">No1592</td>
                <td  id = "comp_rname">호철디자인</td>
                <td  id = "r_type">주거공간/아파트</td>
                <td  id ="r_time">3주</td>
                <td  id = "r_area">50평</td>
                <td  id = "r_cost">3000만원</td>
                <td  id = "r_cont">매우 만족스러워요...</td>
                <td  id = "r_rate">5점</td>
                <td  id = "r_del">
                    <button id = "review_del" value = "삭제" type = "button">삭제</button>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    <br>

</div>







<%-- 하단 공통부분--%>
<jsp:include page = "./include/footer.jsp"/>