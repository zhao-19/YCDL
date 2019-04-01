$(function () {
	//保存,method="pingshenhui!update.action"
	$(".savedetaile").click(function(){
		$('#form').attr('action','pingshenhui!update.action');
		$('#form').submit();
	});
	//新增,method="pingshenhui!insert.action" 
	$(".adddetaile").click(function(){
		$('#form').attr('action','pingshenhui!insert.action');
		$('#form').submit();
	});
	
	
	
	//明细表有数据的时候才显示
	if($("#ifValue").val()>0){
		$("#ifshowTab").show();
	}else{
		$("#ifshowTab").hide();
	}
	
	// 处理评审时间
	/*var trs = $("#pingshenMxDataBody tr");
	$.each(trs, function (k, v) {
		var pTime = $(v).attr("time").split("-");
		// 取时间框
		$(this).find(".time1").val(pTime[0]);
		$(this).find(".time2").val(pTime[1]);
		
	});*/
	function getLocalTime(nS) {
		var d = new Date(nS);
		return d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
	} 
	
	 //点击下一步弹出发送短信对话框
    $("#selectPbczdbase").click(function(){
    	//ajax异步请求查询贷款申请表审核通过数据返回到id为pbczdbaseTablec的table表里面
    	//1.查询之后返回到当前
    	$.post("productczdbase!selectListNotAduit.action",function(data){
    		var dataObj= eval("("+data+")");
    		var htmlStr = "";
    		$.each(dataObj, function(k, v) {
    			htmlStr+='<tr>'+
    			'<th width="20"><input lang="'+v.id+'" type="checkbox" name="dataCheckBox" dataId='+v.id+' compName='+v.qiyemingcheng+' money='+v.shenqingjine+' />'+
    			'</th><th style="display: none;">'+v.id+'</th>'+
    			'<th>'+v.userid+'</th>'+
    			'<th class="sxmc">'+v.qiyemingcheng+'</th>'+
    			'<th>'+v.shenqingjine+' 万</th>'+
    			'<th>'+v.daikuanpingz+'</th>'+
    			'<th>'+v.daikuanqixian+' 月</th>'+
    			'<th>'+v.status_trans+'</th>'+
    			'<th>'+v.checkuser+'</th>'+
    			'<th>'+getLocalTime(v.lastchgtime)+'</th></tr>';
    		});
    		$("#dataBody").html(htmlStr);
    	});
    	
    	
        $("#ldksq").show();
        var divName = $("#ldksq_c");
		var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
    });
    
    $(".shaixuan").click(function(){
    	var shaixuanInput = $(this).prev().val();
    	//alert(shaixuanInput);
    	var reg = new RegExp(shaixuanInput);
    	$("#dataBody tr th.sxmc").each(function(){
    		
    		if(!($(this).html().match(reg))){
    			$(this).parent().hide();
    		}else{
    			$(this).parent().show();
    		}
    	});
    	
    });
    

	 //2.点击确定把选中的数据的id通过ajax传送到后台.
   $("#btn-successok").click(function(){
   	//ajax异步请求到后台,把对应Id的贷款申请表中的数据插入到评审会明细表中
   	//1.查询之后返回到当前
	   var strid = getDataIds();
	   var pshid = $("#singleid").val();
//	   alert(strid+"***"+pshid);return;
			// 保存数据
			$.post("pingshenhui!pshEdit.action",{productIds:strid,pingshenhuiId:pshid}, function(data) {
				if(data==1){
					location.reload();
				}
			});
			// 设置数据
			$("#ldksq").hide();
			
   	return;
   });

   
   $("#refreshamt").click(function(){
	   	//ajax异步请求到后台,把对应Id的贷款申请表中的数据插入到评审会明细表中
	   	//1.查询之后返回到当前
		   var strid = getDataIds();
		   var pshid = $("#singleid").val();
//		   alert(strid+"***"+pshid);return;
				// 保存数据
				$.post("pingshenhui!pshEdit.action",{productIds:strid,pingshenhuiId:pshid}, function(data) {
					if(data==1){
						location.reload();
					}
				});
				// 设置数据
				$("#ldksq").hide();
				
	   	return;
	   });
   
   
   
    $("#ldksq_lose").click(function(){
        $("#ldksq").hide();
    });
    $("#ldksq_lose2").click(function(){
        $("#ldksq").hide();
    });
    
    $("#checkBox").bind("click",function(){
    	if($(this).prop("checked")){
    		$("#dataBody input[type=checkbox]").prop("checked",true);
    	}else{
    		$("#dataBody input[type=checkbox]").prop("checked", false);
    	}
    });
    


    function getDataIds() {
    	var dataList = $("#dataBody input[name=dataCheckBox]:checked");
    	var Ids = '';
    	var htmlStr = ""; // 数据
    	$.each(dataList, function(k, v) {
    		Ids += $(this).attr("lang")+','; 
    	});
    	Ids = Ids.substring(0,Ids.length-1);
    	return Ids;
    }
    
  
    //第二个时间失去焦点的时候,把它及其它前面一个Input的时间值组成一个字符串传递给后台
    $('.example_2').click(function(){
    	$('.example_2').removeClass('example_2e');
    	$(this).addClass('example_2e').siblings().removeClass('example_2e');
    });
    
    //产品名称相同的添加一个颜色
    $('.chanpingmingcheng').each(function(){
    	
    	if($(this).html()=='&nbsp;成长贷'){
    		$(this).css({'color':'#DC143C'})
    	}
    	if($(this).html()=='&nbsp;壮大贷'){
    		$(this).css({'color':'#0000FF'})
    	}
    	if($(this).html()=='&nbsp;新创贷'){
    		$(this).css({'color':'#FFD700'})
    	}
    	if($(this).html()=='&nbsp;开行统借统还贷款'){
    		$(this).css({'color':'#c0c'})
    	}
    	if($(this).html()=='&nbsp;口行统借统还贷款'){
    		$(this).css({'color':'#008000'})
    	}
    	
    });
    
    
    
    
});

String.prototype.trim=function(){
     return this.replace(/(^\s*)|(\s*$)/g,'');
}


function sendTime(){
	var jiangeshijian = $("#jiangeshijian").val();
	var now = $('.example_2e').eq(0);
	var nowVal = now.val();
	var pVal = now.prev().prev().val();
	var nVal = now.next().next().val();
	var shenqingid = now.attr('lang');
	var xuhao = now.attr('accesskey');
	if(typeof(pVal) == 'undefined'){
		pVal = nowVal;
		nVal = nVal;
	}
	if(typeof(nVal) == 'undefined'){
		nVal = nowVal;
		pVal = pVal;
	}

	$('.example_2').removeClass('example_2e');
	//alert(pVal+'***'+nVal+'&&&'+shenqingid+'$$$'+xuhao+'))'+jiangeshijian);//这里的pVal和nowVal只可能是有值或者无值,不会为undefined
	//return;
	$.post("pingshenhuimingxi!setTime.action",{"pVal":pVal,"nVal":nVal, "shenqingid": shenqingid, "xuhao":xuhao,"jiangeshijian":jiangeshijian}, function(data) {
		if(data==205){
			location.reload();
		}
	});

}
    


function sortFunc(obj, id, pId, xuhao) {
	$.post("pingshenhuimingxi!sortXuhao.action",{"type":obj,"id":id, "pId":pId, "xh": xuhao}, function(data) {
		if(data==200){
			location.reload();
		}
	});
}




function deleFunc() {
	var Ids = $("input[name=ids]:checked");
	var htmlStr = ""; // 数据
	$.each(Ids, function(k, v) {
		htmlStr += $(this).attr("value")+','; 
	});
	
	var v = htmlStr.substring(0,htmlStr.length-1);
	
	
	
	var pId = $("#singleid").val();

	
 	$.post("pingshenhuimingxi!deletes.action",{"ids":v, "pId":pId}, function(data) {
		if(data==200){
			location.reload();
		}
	});
}




