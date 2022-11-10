//계약서 번호로 계약서 보기
function show_contract(cont_no) {
    window.open('/partners/show_contract?cont_no=' +cont_no, '계약서', 'width=745, height=955, top=0, left=100, resizable=no')
}
//견적 상세정보 보기
function est_detail(est_num) {
    var popupWidth = 910;
    var popupHeight = 1000;
    var popupX = (window.screen.width / 2) - (popupWidth / 2);
    // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
    var popupY = (window.screen.height / 2) - (popupHeight / 2);
    // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음F
    window.open(`./detail?est_num=` + est_num, 'Child', 'width=' + popupWidth + ', height=' + popupHeight + ', top=' + popupY + ', left=' + popupX + 'resizable=no');
}