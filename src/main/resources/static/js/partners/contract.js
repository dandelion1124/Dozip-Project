function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}





function contract_write() {
    if($.trim($('#cont_total').val())=='' || $.trim($('#cont_cost1').val())=='' ||
        $.trim($('#cont_date1').val())==''|| $.trim($('#cont_cost2').val())=='' ||
        $.trim($('#cont_date2').val())==''|| $.trim($('#cont_cost3').val())=='' ||
        $.trim($('#cont_date3').val())=='' || $.trim($('#partners_tel').val())=='')
    {
        swal('NOTICE','계약 내용을 빠짐없이 입력해주세요','error');
        return false;
    }
    function params_list() {
        var params = {};  //배열 선언
        var data = $("#contract_form").serializeArray(); //폼태그에 있는 데이터 담기

        $.each(data, function () { //반복문
            var name = $.trim(this.name);  //name 변수에 this.data 의 name 파라미터 값
            var value = $.trim(this.value);  //value 변수에 this.data 의 value 값
            params[name] = value; //params 배열에 키, 값 쌍으로 저장
        });
        return params;
    }

    $.ajax({
        type: 'post',
        url: 'write_contract_ok',
        data: {
            data: JSON.stringify(params_list())
        },
        datatype: "json",
        success: function (data) {
            if (data.status == 1) {
                alert('계약서 작성 완료!')
                window.opener.location.href = '/partners/estimate_list'
                self.close()
            }
        }
    });
}