/*평/m2 계산기*/
function calculator(num) {
  if (num == 1) {
    document.getElementById('cal2').value = parseFloat(document.getElementById('cal1').value) * 3.3058;
  } else {
    document.getElementById('cal1').value = parseFloat(document.getElementById('cal2').value) / 3.3058;
  }
}
function change(){
	$('#cal1').val("");
}

/*전체선택*/
$(document).ready(function(){
  $('#allCk').click(function () {
    var checked = $('#allCk').is(':checked');
  
     if (checked){
       $('[name=check]').prop('checked', true);
       $("[name='detail']").show();
      }else{
        $('[name=check]').prop('checked', false);
        $("[name='detail']").hide();}
  });
  $("input[name=check]").click(function(){
    var totalBt = $('input[name=check]').length;
    var checkedBt = $('input[name=check]:checked').length;
    
    if(totalBt != checkedBt){
      $('input[name=checkAll]').prop('checked', false);
    }else{
      $('input[name=checkAll]').prop('checked', true);
    }
});
});

/*라디오*/

$('#1').change(function () {
  if ($('#1').val() == 'on') {
    $('#type01').show();
    $('#type02').hide();
  }
});
$('#2').change(function () {
  if ($('#2').val() == 'on') {
    $('#type02').show();
    $('#type01').hide();
  }
});

/*토글*/
/*$('#wall').click(function () {
	if($('#wall').is(':checked')){
   		$("#detail01").show();
	}else{
		$("#detail01").hide();
	}
});*/
$('#wall').click(function () {
  $("#detail01").toggle();
});

$('#floor').click(function () {
  $("#detail02").toggle();
});

$('#kitchen').click(function () {
  $("#detail03").toggle();
});

$('#washroom').click(function(){
  $("#detail04").toggle();
});

$('#porch').click(function(){
  $("#detail05").toggle();
});

$("#window").click(function(){
  $("#detail06").toggle();
});

$("#light").click(function(){
  $("#detail07").toggle();
});

$("#door").click(function(){
  $("#detail08").toggle();
});
/*토글 끝*/

/*checkbox 선택취소시 초기화*/
$("#wall").click(function(){
 if($("input:checkbox[id=wall]").is(":checked") == false){
  $("input:radio[name=group_wallpaper_item]").prop('checked', false);
 }
});
$("#floor").click(function(){
  if($("input:checkbox[id=floor]").is(":checked") == false){
   $("input:radio[name=group_floor_item]").prop('checked', false);
  }
 });
 $("#kitchen").click(function(){
  if($("input:checkbox[id=kitchen]").is(":checked") == false){
   $("input:checkbox[name=group_kitchen_item]").prop('checked', false);
  }
 });
 $("#washroom").click(function(){
  if($("input:checkbox[id=washroom]").is(":checked") == false){
   $("input:checkbox[name=group_washroom_item]").prop('checked', false);
  }
 });
 $("#porch").click(function(){
  if($("input:checkbox[id=porch]").is(":checked") == false){
   $("input:checkbox[name=group_porch_item]").prop('checked', false);
  }
 });
 $("#window").click(function(){
  if($("input:checkbox[id=window]").is(":checked") == false){
   $("input:radio[name=group_window_item]").prop('checked', false);
  }
 });
 $("#light").click(function(){
  if($("input:checkbox[id=light]").is(":checked") == false){
   $("input:radio[name=group_light_item]").prop('checked', false);
  }
 });
 $("#door").click(function(){
  if($("input:checkbox[id=door]").is(":checked") == false){
   $("input:radio[name=group_door_item]").prop('checked', false);
  }
 });
/*checkbox 선택취소시 초기화 끝*/

/*천단위로 콤마찍기*/
function comma(str) {
  str = String(str);
  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
  str = String(str);
  return str.replace(/[^\d]+/g, '');
}

function inputNumberFormat(obj) {
  obj.value = comma(uncomma(obj.value));
}

function inputOnlyNumberFormat(obj) {
  obj.value = onlynumber(uncomma(obj.value));
}

function onlynumber(str) {
  str = String(str);
  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1');
}

/*달력*/
$(function () {
  //오늘 날짜를 출력
  $("#today").text(new Date().toLocaleDateString());

  //datepicker 한국어로 사용하기 위한 언어설정
  $.datepicker.setDefaults($.datepicker.regional['ko']);

  // 시작일(est_start)은 종료일(est_end) 이후 날짜 선택 불가
  // 종료일(est_end)은 시작일(est_start) 이전 날짜 선택 불가

  //시작일.
  $('#est_start').datepicker({
    showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
    buttonImage: "images/calendar.gif", // 버튼 이미지
    buttonImageOnly: true,             // 버튼 이미지만 표시할지 여부
    buttonText: "",             // 버튼의 대체 텍스트
    dateFormat: "yy-mm-dd",             // 날짜의 형식
    changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
    //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
    onClose: function (selectedDate) {
      // 시작일(est_start) datepicker가 닫힐때
      // 종료일(est_end)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
      $("#est_end").datepicker("option", "minDate", selectedDate);
    }
  });

  //종료일
  $('#est_end').datepicker({
    showOn: "both",
    buttonImage: "images/calendar.gif",
    buttonImageOnly: true,
    buttonText: "",
    dateFormat: "yy-mm-dd",
    changeMonth: true,
    //minDate: 0, // 오늘 이전 날짜 선택 불가
    onClose: function (selectedDate) {
      // 종료일(est_end) datepicker가 닫힐때
      // 시작일(est_start)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
      $("#est_start").datepicker("option", "maxDate", selectedDate);
    }
  });
});

//글자수
$('#paragraph').keyup(function (e) {
	let content = $(this).val();
    
    // 글자수 세기
    if (content.length == 0 || content == '') {
    	$('.textCount').text('0자');
    } else {
    	$('.textCount').text(content.length + '자');
    }
});