$(function () {
	
	
	//点击贷款品种后面的修改按钮，弹出修改form表单 ，单独修改产品名称
	$("#editcp").click(function(){
		
		$("#tcktel").remove();
		$("#tckremark").remove();
		$("#ldksq").show();
		$("#tckselect").show();
		$("#indexdksq").attr('action','productapp!updateproducname.action');
   	 	var divName = $("#ldksq_c");
		var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
	});
	
	
	 //初审的页面  点击下一步弹出发送短信对话框
	var gs = $("#qiyemingcheng").val();
	var je = $("#loanamt").val();
    var phoneNumber = $('#phoneNumber').val();
    var nickname = $('#nickname').val();
    
	

 	 
	$(".btnnextstep").click(function(){
		//var content = gs+"您好,贵公司申请的金额为"+je+"万的贷款基础资料审核通过，请在盈创官网下载“人行-查询企业征信委托证明书”，并在网上填写贷款详细资料，如有问题请联系， 85212147，段然。";

		var content = gs+'您好,贵公司申请的金额为'+je+'万的贷款基础资料审核通过，请在盈创官网下载“人行-查询企业征信委托证明书”和“企业PPT模板”，并在网上填写贷款详细资料，如有问题请联系， '+ phoneNumber +'，'+ nickname +'。【盈创动力】';

		$("#memovalue").val($("#memo").val());

        $("#ldksq").show();
        $(".msgcontenttype").html('短信内容:');
        
		$("#status2").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083");

        $("#msgcontent").val(content);
        $("#indexdksq").attr('action','productapp!update.action');
        var divName = $("#ldksq_c");
		var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
    });

    $("#ldksq_lose").click(function(){
        $("#ldksq").hide();
    });
    $("#ldksq_lose2").click(function(){
        $("#ldksq").hide();
    });
    
	 //点击驳回
    $(".backstep").click(function(){
    	
		 $("#memovalue").val($("#memo").val());

    	 $("#ldksq").show();
	    	$("#status2").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084");

    	 $(".msgcontenttype").html('驳回原因:');
    	 var content = gs+"您好,贵公司暂时还不符合贷款要求本次申请未能获得通过，如有问题请联系， "+ phoneNumber +"，"+ nickname +"。";

    	 $("#msgcontent").val(content);
    	 $("#indexdksq").attr('action','productapp!update.action');
    	 var divName = $("#ldksq_c");
 		 var top = ($(window).height() - $(divName).height())/2;
         var left = ($(window).width() - $(divName).width())/2;
         var scrollTop = $(document).scrollTop();
         var scrollLeft = $(document).scrollLeft();
         
         $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
    });
 
    
});
