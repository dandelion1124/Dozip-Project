    //payT 로 시공 상태 조회
    $('#interior_status').change(function (){
    let est_check = $('#interior_status option:selected').val();
    location.href ='/partners/interior_list?est_check='+est_check;
});
    //payT 로 정산 상태 조회
    $('#balance_status').change(function(){
    let pay_state = $('#balance_status option:selected').val();
    location.href ='/partners/interior_list?pay_state='+pay_state;
});

/* 일정등록*/

    function schedule_regit(cont_no){
        let regitCheck=confirm('일정 등록을 하시겠습니까?')
        if(regitCheck){
            $.ajax({
                type:'post',
                url:'schedule_regit',
                data :{
                    cont_no:cont_no
                },
                success: function (){
                    swal('등록완료');
                    location.reload();
                }
            });
        }
    }

/*정산 상세 내역 */
    function balance_detail(pay_date1) {


        var popupWidth = 1100;
        var popupHeight = 500;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음F
        window.open(`./monthly_detail?pay_date=` + pay_date1, 'Child', 'width=' + popupWidth + ', height=' + popupHeight + ', top=' + popupY + ', left=' + popupX + 'resizable=no');
    }
    function balance_detail_ing(pay_date1) {

        var popupWidth = 1100;
        var popupHeight = 500;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음F
        window.open(`./monthly_detail?pay_date_ing=` + pay_date1, 'Child', 'width=' + popupWidth + ', height=' + popupHeight + ', top=' + popupY + ', left=' + popupX + 'resizable=no');
    }


    /*시공완료, 시공중 토글전환 */
    const btn1 = document.getElementById("select_status_btn1");
    const btn2 = document.getElementById("select_status_btn2");
    const div1 = document.getElementById("balance_detail_select_status_div1");
    const div2 = document.getElementById("balance_detail_select_status_div2");
    const search1 = document.getElementById("balance_detail_search_bar1");
    const search2 = document.getElementById("balance_detail_search_bar2");
    const table1 = document.getElementById("balance_detail_main_table1");
    const table2 = document.getElementById("balance_detail_main_table2");

    const style = "border : 2px solid dimgray";
    btn1.onclick = function (event) {
        div1.style.cssText = 'border : 2px solid dimgray; background:cornflowerblue; border-bottom:transparent';
        div2.style.cssText = 'border:transparent; border-bottom:2px solid dimgray';
        table1.style.display = 'inline-table';
        table2.style.display = 'none';
        search1.style.display = 'block';
        search2.style.display = 'none';
    }
    btn2.onclick = function (event) {
        div1.style.cssText = 'border:transparent; border-bottom:2px solid dimgray; background:none';
        div2.style.cssText = 'border : 2px solid dimgray; background:cornflowerblue; border-bottom:transparent';
        table1.style.display = 'none';
        table2.style.display = 'inline-table';
        search1.style.display = 'none';
        search2.style.display = 'block';
    }