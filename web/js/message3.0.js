$(function () {
	//进入页面的时候就先判断当前的步骤是否等于1，如果是1，则下一步按钮就不显示，否则显示
	/*var stepbefore = 10;
	if(stepbefore==10){
		$(".btnnextstep").removeClass("btn-info").css("color","#fff").removeClass("btnnextstep").addClass("btnnextstepbefore");
	}
	*/
	
	
	
	
	//点击贷款品种后面的修改按钮，弹出修改form表单 ，单独修改产品名称
	$("#editcp").click(function(){
		
		$("#tcktel").remove();
		$("#tckremark").remove();
		$("#ldksq").show();
		$("#tckselect").show();
		$("#indexdksq").attr('action','productczdbase!updateproducname.action');
   	 	var divName = $("#ldksq_c");
		var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
	});
    var phoneNumber = $('#phoneNumber').val();
    var nickname = $('#nickname').val();

	 //点击下一步弹出发送短信对话框
    $(".btnnextstep").click(function(){
 
        var step = $('#status').val();
        var step_ = $('#status').val();
        
        if(step == 30){
	        //在第二步点击的时候要先判断有没有点击保存，（保存的时候会返回一个值在ifsave隐藏框中，我去判断这个框的值是否存在。）
	        var ifsave = $("#ifsave").val();
	        if(ifsave!= 1){
	        	alert("请先点击保存按钮，以确保必填字段都填写完整！");
	        	return false;
	        }
        }
        

        if(step==0){
        	
        }else if(step == 10){
        	step = 1;
        }else if(step == 20){
        	step = 2;
        }else if(step == 30){
        	step = 2;
        }else if(step == 40){
        	step = 2;
        }else if(step == 50){
        	step = 3;
        }else if(step == 60){
        	step = 4;
        }else if(step == 70){
        	step = 5;
        }else if(step == 80){
        	step = 6;
        }else if(step == 90){
        	step = 7;
        	return ;
        }else{
        	step =1;
        }
        if(step_==30 || step_==40 || step_==70){
        	$("#ldksq").show();
        	$(".msgcontenttype").html('短信内容:');
        	
        	var gs = $("#qiyemingcheng").val();
        	var mc = $("#daikuanpingz").val();
        	var je = $("#shenqingjine").val();

            if(step_==30){
                var myDate = new Date();
            	var str = gs+"您好，您申报的"+mc+"  项目资料已通过，请在盈创官网自动导出资料一式4份，于"+  myDate.getFullYear() +"年*月*日前交至地址：高新区锦城大道539号盈创动力大厦A座5楼，如有问题请联系 "+ phoneNumber +"，"+ nickname +"，谢谢。【盈创动力】";

            	

            	$("#msgcontent").val(str);
            }else if(step_==40){
            	
            	var str = gs+"您好，您参加的"+mc+"  项目评审会评审已通过，为了不影响放款进度，请尽快和担保/银行联系安排上会，若担保公司/银行已过会，请及时告知"+ nickname +"，以便尽快出具财金局的推荐函。如有问题请联系 "+ phoneNumber +"，"+ nickname +"，谢谢。【盈创动力】";
            	$("#msgcontent").val(str);
            }else if(step_==70){
            	
            	var str = gs+"您好，经发局已经出具成长贷推荐函，盈创已经交至银行2份，一份银行自留，一份请银行转交中小担。【盈创动力】";
            	$("#msgcontent").val(str);
            }
        }else  {
        	$("#msgcontent").val('');

            $("#indexdksq").attr('action','productczdbase!donextGZLstep.action');
            $("#indexdksq").submit(); 

        }
        
        
        $("#indexdksq").attr('action','productczdbase!donextGZLstep.action');
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
    	 
    	 var content = "您好,贵公司资料未填写完整，请填写完整再提交，如有问题请联系， "+ phoneNumber +"，"+ nickname +"。";

    	 $("#msgcontent").val(content);
    	 $("#indexdksq").attr('action','productczdbase!backGZLstep.action');
    	 var divName = $("#ldksq_c");
 		 var top = ($(window).height() - $(divName).height())/2;
         var left = ($(window).width() - $(divName).width())/2;
         var scrollTop = $(document).scrollTop();
         var scrollLeft = $(document).scrollLeft();
         
         $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
    });
 
    
});
