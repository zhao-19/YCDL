$(function () {
	 //点击下一步弹出发送短信对话框
	 
	 var qiyemingcheng = $("#qiyemingcheng").val();
     var lxr = $("#lxr").val();
     var lxrsj = $('#lxrsj').val();
    $(".btnnextstep").click(function(){

        
        $("#ldksq").show();
        $(".msgcontenttype").html('短信内容:');
        $('.title').val(lxrsj);
        $("#msgcontent").val(lxr + "您好，"+ qiyemingcheng +"申请的贷款贴息初审获得成都高新区财政金融局初审通过，请将相关申报材料胶装一份报盈创动力五楼且带上财务章（用于收据盖章）。如有疑问请联系申报通知中对应的联系人。");
        //点击通过action路径
        $("#indexdksq").attr('action','interestapp!update.action');
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
    $("#backstep").click(function(){
    	 $("#ldksq").show();
    	 
    	 $(".msgcontenttype").html('驳回原因:');
    	 $('.title').val(lxrsj);
    	 $("#msgcontent").val(lxr + "您好，很遗憾"+ qiyemingcheng +"申请的贷款贴息未获得成都高新区财政金融局初审通过，原因：xxxxxxxxxxxxxxxxxxxx。如有疑问请联系申报通知中对应的联系人。");
    	 //点击驳回action路径
    	 $("#indexdksq").attr('action','interestapp!update.action');
    	 var divName = $("#ldksq_c");
 		 var top = ($(window).height() - $(divName).height())/2;
         var left = ($(window).width() - $(divName).width())/2;
         var scrollTop = $(document).scrollTop();
         var scrollLeft = $(document).scrollLeft();
         
         $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
    });
    
    
});
