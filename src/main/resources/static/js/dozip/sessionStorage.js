function SessionStorage_page01(){ /*1페이지*/
	
	/*radio 체크된 값 받기*/
	const list = document.getElementsByName('est_zoning');
	list.forEach((node)=> {
		if(node.checked){
			sessionStorage.setItem('est_zoning', node.value);
		}
	})
	const list1 = document.getElementsByName("est_use");
	list1.forEach((node)=> {
		if(node.checked){
			sessionStorage.setItem('est_use', node.value);
		}
	})
	const list2 = document.getElementsByName("group_wallpaper_item");
	list2.forEach((node)=> {
		if(node.checked){
			sessionStorage.setItem('detail01', node.value);
		}
	})
	const list3 = document.getElementsByName("group_floor_item");
	list3.forEach((node)=> {
		if(node.checked){
			sessionStorage.setItem('detail02', node.value);
		}
	})
	const list4 = document.getElementsByName("group_window_item");
	list4.forEach((node)=> {
		if(node.checked){
			sessionStorage.setItem('detail06', node.value);
		}
	})
	const list5 = document.getElementsByName("group_light_item");
	list5.forEach((node)=> {
		if(node.checked){
			sessionStorage.setItem('detail07', node.value);
		}
	})
	const list6 = document.getElementsByName("group_door_item");
	list6.forEach((node)=> {
		if(node.checked){
			sessionStorage.setItem('detail08', node.value);
		}
	})
	/*radio 체크된 값 받기 끝*/
	
	/*체크박스 배열로 값받기*/
	var all = '';
	var detail_val = document.getElementsByName("check");
	for(var i=0; i<detail_val.length; i++){
		if(detail_val[i].checked){
			all+=detail_val[i].value+"/";
		}
	}
	sessionStorage.setItem('detail', all);

	var all2 = '';
	var detail03_val = document.getElementsByName("group_kitchen_item");
	for(var i=0; i<detail03_val.length; i++){
		if(detail03_val[i].checked){
			all2+=detail03_val[i].value+"/";
		}
	}
	sessionStorage.setItem('detail03', all2);

	var all3 = '';
	var detail04_val = document.getElementsByName("group_washroom_item");
	for(var i=0; i<detail04_val.length; i++){
		if(detail04_val[i].checked){
			all3+=detail04_val[i].value+"/";
		}
	}
	sessionStorage.setItem('detail04', all3);
	
	var all4 = '';
	var detail05_val = document.getElementsByName("group_porch_item");
	for(var i=0; i<detail05_val.length; i++){
		if(detail05_val[i].checked){
			all4+=detail05_val[i].value+"/";
		}
	}
	sessionStorage.setItem('detail05', all4);
	/*체크박스 배열로 값받기 끝*/

	sessionStorage.setItem('areaP', document.getElementById("cal1").value);
	sessionStorage.setItem('areaM', document.getElementById("cal2").value);


	/*alert ("작동!");*/
}

function SessionStorage_page02(){ /*2페이지*/
   sessionStorage.setItem('est_bud', document.getElementById("estimate_cost").value);
   sessionStorage.setItem('est_start', document.getElementById("est_start").value);
   sessionStorage.setItem('est_end', document.getElementById("est_end").value);
	}

function SessionStorage_page03(){ /*3페이지*/
   sessionStorage.setItem('est_name', document.getElementById("name").value);
   sessionStorage.setItem('est_phone', document.getElementById("phone").value);
   sessionStorage.setItem('est_addr', document.getElementById("addr").value);
   sessionStorage.setItem('est_desc', document.getElementById("paragraph").value);
	}


function test(){
	var est_zoning = sessionStorage.getItem('est_zoning');
	var est_use = sessionStorage.getItem('est_use');
	var areaP = sessionStorage.getItem('areaP');
	var areaM = sessionStorage.getItem('areaM');
	var detail = sessionStorage.getItem('detail');
	var detail01 = sessionStorage.getItem('detail01');
	var detail02 = sessionStorage.getItem('detail02');
	var detail03 = sessionStorage.getItem('detail03');
	var detail04 = sessionStorage.getItem('detail04');
	var detail05 = sessionStorage.getItem('detail05');
	var detail06 = sessionStorage.getItem('detail06');
	var detail07 = sessionStorage.getItem('detail07');
	var detail08 = sessionStorage.getItem('detail08');
	
	var est_bud = sessionStorage.getItem('est_bud');
	var est_start = sessionStorage.getItem('est_start');
	var est_end = sessionStorage.getItem('est_end');
	
	var est_name = sessionStorage.getItem('est_name');  
	var est_phone = sessionStorage.getItem('est_phone'); 
	var est_addr = sessionStorage.getItem('est_addr');
	var est_desc = sessionStorage.getItem('est_desc'); 
	
	$.ajax({
		type:"post", 
		url:'estimate_apply5_ok.do', 
		datatype: "text",
		data:{
			est_zoning : est_zoning,
			est_use : est_use,
			areaP : areaP,
			areaM : areaM,
			detail : detail,
			detail01 : detail01,
			detail02 : detail02,
			detail03 : detail03,
			detail04 : detail04,
			detail05 : detail05,
			detail06 : detail06,
			detail07 : detail07,
			detail08 : detail08,
			
			est_bud : est_bud,
			est_start : est_start,
			est_end : est_end,
			
			est_name : est_name, 
			est_phone: est_phone,
			est_addr : est_addr,
			est_desc : est_desc
		}
		
		
		
		/*, success : function(result){
			alert('sessionStorage는 작동!');
			location.reload();
		}*/
	});
}