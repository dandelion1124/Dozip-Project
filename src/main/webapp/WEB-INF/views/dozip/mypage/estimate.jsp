<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="/js/dozip/jquery.js"></script>
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
    .detail_info { width: 27%; }
  </style>
</head>
<body>
<div class="request_detail">
  <p class="label_badge">
    <span class="label_val1">${e.est_use}</span>
    <span class="label_val2">[${e.est_detail.substring(0, e.est_detail.length() - 1)}]</span>
  </p>


  <div class="request_detail_title">
    <h3>${e.est_addr} 견적서</h3>
    <input type="button" id="request_detail_closeBtn" value="닫기" onclick="window.close()">
  </div>

  <div class="greeb_box_container">
    <div class="green_box">
      <ul class="box-cell5">
        <li class="detail_info">
          <div class="dt">
            <p class="ico1">희망 예산</p>
          </div>
          <div class="dd"><span id="bud">${e.est_bud}</span></div>
        </li>

        <li class="detail_info">
          <div class="dt">
            <p class="ico3">희망 시공시작일</p>
          </div>
          <div class="dd">${fn:substring(e.est_start,0 ,10)}</div>
        </li>
        <li class="detail_info" style="border-right: none;">
          <div class="dt">
            <p class="ico4">희망 시공종료일</p>
          </div>
          <div class="dd">${fn:substring(e.est_end, 0, 10)}</div>
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
        <dd class="sec-cont">${e.est_zoning}</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">건물유형</dt>
        <dd class="sec-cont">${e.est_use}</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">인테리어 종류</dt>
        <dd class="sec-cont">[${e.est_detail.substring(0, e.est_detail.length() - 1)}]</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">세부 선택</dt>
        <dd class="sec-cont">${e.est_detail} ${e.est_detail01} ${e.est_detail02}
          ${e.est_detail03} ${e.est_detail04} ${e.est_detail05} ${e.est_detail06} ${e.est_detail07} ${e.est_detail08}</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">시공 규모(평 수)</dt>
        <dd class="sec-cont">${e.est_areaM}m<sup>2</sup>(${e.est_areaP}평)</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">시공 주소</dt>
        <dd class="sec-cont">${e.est_addr}</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">희망 예산</dt>
        <dd class="sec-cont"><span id="bud2">${e.est_bud}</span></dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">희망 시공시작일</dt>
        <dd class="sec-cont">${fn:substring(e.est_start, 0, 10)}</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">희망 시공완료일</dt>
        <dd class="sec-cont">${fn:substring(e.est_end, 0, 10)}</dd>
      </dl>
      <dl class="sec-item">
        <dt class="sec-title">희망 스타일</dt>
        <dd class="sec-cont">
          ${e.est_desc}
        </dd>
      </dl>
    </div>
  </div>
</div>
<script>
  function change(str){
    let inMoney = $(str).text();
    let outMoney = (parseInt(inMoney)*10000).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    return outMoney+" 원";
  }
  $(document).ready(function(){
    $('#bud').text(change('#bud'));
    $('#bud2').text(change('#bud2'));
  })
</script>
</body>
</html>