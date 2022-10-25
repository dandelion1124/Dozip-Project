<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>시공상세정보</title>
    <link rel="stylesheet" href="/css/partners/partners_style2.css">
    <style>
        .request_detail_title {
            display: flex;
            justify-content: space-between;
        }
        input#request_detail_closeBtn {
            height: 30px;
            margin-top: 23px;
            background: #00A5FF;
            border: none;
            color: white;
        }
        input#request_detail_closeBtn:hover{
            background: #000069;
        }
evbn
    </style>
</head>
<body>
<div class="request_detail">
    <p class="label_badge">
        <span class="label_val1">${ev.est_use}</span>
        <span class="label_val2">[${ev.est_detail}]</span>
    </p>


    <div class="request_detail_title">
        <h3>${ev.est_addr} 견적문의</h3>
        <input type="button" id="request_detail_closeBtn" value="닫기" onclick="window.close()">
    </div>

    <div class="greeb_box_container">
        <div class="green_box">
            <ul class="box-cell5">
                <li class="detail_info">
                    <div class="dt">
                        <p class="ico1">희망 예산</p>
                    </div>
                    <div class="dd"><span style="color:red">sample</span></div> <!-- 500만원 -->
                </li>
                <li class="detail_info">
                    <div class="dt">
                        <p class="ico2">모집마감일</p>
                    </div>
                    <div class="dd"><span style="color:red">sample</span></div>
                </li>
                <li class="detail_info">
                    <div class="dt">
                        <p class="ico3">희망 시공시작일</p>
                    </div>
                    <div class="dd"><span style="color:red">sample</span></div>
                </li>
                <li class="detail_info">
                    <div class="dt">
                        <p class="ico4">희망 시공종료일</p>
                    </div>
                    <div class="dd"><span style="color:red">sample</span></div>
                </li>
            </ul>
        </div>
    </div>


    <div class="detail-op-sec">
        <div class="sec-head">
            <div class="sec-head-title">
                의뢰 세부 정보
            </div></hr>
        </div>
        <div class="sec-cont-wrap">
            <dl class="sec-item">
                <dt class="sec-title">공간유형</dt>
                <dd class="sec-cont">${ev.est_zoning}</dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">건물유형</dt>
                <dd class="sec-cont">${ev.est_use}</dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">인테리어 종류</dt>
                <dd class="sec-cont">[${ev.est_detail}]</dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">세부 선택</dt>
                <dd class="sec-cont"><span style="color:red">sample</span></dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">시공 규모(평 수)</dt>
                <dd class="sec-cont">${ev.est_areaM}m<sup>2</sup>(${ev.est_areaP}평)</dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">시공 주소</dt>
                <dd class="sec-cont">${ev.est_addr}</dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">희망 예산</dt>
                <dd class="sec-cont"><span style="color:red">sample</span></dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">희망 시공시작일</dt>
                <dd class="sec-cont"><span style="color:red">sample</span></dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">희망 시공완료일</dt>
                <dd class="sec-cont"><span style="color:red">sample</span></dd>
            </dl>
            <dl class="sec-item">
                <dt class="sec-title">희망 스타일</dt>
                <dd class="sec-cont">
                    ${ev.est_desc}
                        <span style="color:red">입찰신청일경우 파트너스 메세지도 넣기</span>
                </dd>
            </dl>
        </div>
    </div>
</div>

</body>
</html>