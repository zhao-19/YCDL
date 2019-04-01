$(function () {
	 //点击下一步弹出发送短信对话框
    $(".btnnextstep").click(function(){
 
        var step = $('#status').val();
        if(step==0){
        	
        }else if(step == 10){
        	step = 1;
        }else if(step == 20){
        	step = 1;
        }else if(step == 30){
        	step = 2;
        }else if(step == 40){
        	step = 3;
        }else if(step == 50){
        	step = 4;
        }else if(step == 60){
        	step = 5;
        }else if(step == 70){
        	step = 6;
        }else if(step == 80){
        	step = 7;
        	return ;
        }else{
        	step =1;
        }

        $("#ldksq").show();
        $(".msgcontenttype").html('短信内容:');
        
        $("#msgcontent").val($("#qiyemingcheng").val()+'您好，您申请的'+$("#daikuanpingz").val()+'  '+$("#step"+(step+1)).children('a').html()+'，请保持电话畅通。');
        $("#indexdksq").attr('action','productczdbase!donextstep2.action');
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
    	 $("#msgcontent").val('');
    	 $("#indexdksq").attr('action','productczdbase!backstep2.action');
    	 var divName = $("#ldksq_c");
 		 var top = ($(window).height() - $(divName).height())/2;
         var left = ($(window).width() - $(divName).width())/2;
         var scrollTop = $(document).scrollTop();
         var scrollLeft = $(document).scrollLeft();
         
         $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
    });
 
    
});
