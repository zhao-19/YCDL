/**
 * 首页广告js code by zsj
 */
$(function () {
	//会员注册成功提示
	/*var registerok = $('#registerok').val();
	var custmanage = $('#custmanage').val();
	var registerstr = "您已成功注册成为盈创动力科技金融服务平台用户，您的客户经理是【"+custmanage+"】，已为您自动登录。";
	$('.registerok').html(registerstr);
	if(registerok==1){
		$('.registerok_wk').fadeIn('slow');
		setTimeout(function(){
			$('.registerok_wk').fadeOut();
		},5000);
		$('#registerok').val('0');
	}
	*/
	var g_big_top = true;//顶部广告开关（1张大图，1张小图）
	var g_zhongjian = false;	//中间广告开关
	var g_left = true;//左边广告开关
	var g_footer = true;//底部广告开关，是债权融资那一栏对应的广告
	
	//顶部广告
	if(g_big_top){
		var topGuanggao_wk = $("#top-guanggao-wk");
		topGuanggao_wk.show();
		var topGuanggao_a = $("#top-guanggao-a");
		var cookieg_big_top = $.cookie("g_big_top");
		var topBig_src = "../image/index/g-big-top.jpg";//要求图宽1200px,高200px,
		var topSmall_src = "../image/index/g-small-top.jpg";//要求图宽1200px,高80px,
		if(cookieg_big_top){
			//有cookie
			topGuanggao_a.css({"height":"80px","background":"url('"+topSmall_src+"') no-repeat 50% 0"});
		}else{
			//无cookie
			topGuanggao_a.css({"height":"200px","background":"url('"+topBig_src+"') no-repeat 50% 0"});
			$.cookie('g_big_top', 'g_big_top_cookie');
			setTimeout(function(){
				topGuanggao_a.animate({
					height:80
				},function(){
					topGuanggao_a.css({"background":"url('"+topSmall_src+"') no-repeat 50% 0"});
				});
			
			},2000);

		}
		
		$("#topclose").click(function(){
			topGuanggao_wk.fadeOut();
		});
		 
	}else{
		topGuanggao_wk.remove();
	}
	
	
	//左边广告
	if(g_left){
		var left_small = $("#left_small");
		left_small.show();
		var left_big = $("#left_big");
		var categorysone = $(".categorysone");
		
		left_small.bind("mouseenter",function(e){
		    left_big.stop(true,true).animate({
		            width:"1300px"
		        },50);
		    });
		categorysone.bind("mouseleave",function(e){
			left_big.css("width","0px");
	
		});
	
	
		$("#left_big_close").click(function(){
			left_big.stop(true,true).animate({
	            width:"0px"
	        },50);
	    });
	}else{
		$("#left_small").remove();
		$("#left_big").remove();
	}
	
	
	//底部广告
	var noclosebzf = true;
	if(g_footer){
		$(window).scroll(function(){
	        if ($(window).scrollTop()>300 && noclosebzf){
	            $(".middle_guanggao").addClass("middle_guanggao_f");
	        }else{
	        	$(".middle_guanggao").removeClass("middle_guanggao_f");
	        }
	    });
		
		$("#footerclose").click(function(){
			$(".middle_guanggao").removeClass("middle_guanggao_f");
			noclosebzf = false;
		});
		
	}else{
		$("#footer_big").remove();
	}
	
	
	
	//中间广告
	if(g_zhongjian){
		//加入cookie判断，第一次时是显示大图，24小时之内默认只显示小图，只有点击小图才显示大图
		//$.cookie("the_cookie",null);//删除cookie测试下  
		var cookiehello = $.cookie("the_cookie");
		if(cookiehello){
			//alert(cookiehello+"have");
			//直接把广告放在左边
			$("#topad_countdown").addClass("sea_topad").html("查看");
			$("#topad_bottom").css("width","100px");
			$("#topad").css({"width":"100px","height":"61.8px","left":"0px","top":"80px"});
			$("#topad_wk").css({"width":"108px","height":"122px","left":"0px","top":"80px"});
			$("#topad_wk").removeClass("topad_wk2");
			$("#topad_wk").show();
			$("#topad").show();
			
			
			
		}else{
			//alert(cookiehello+"no");
			
		    //1自动展开*****************
		
			//页面内容加载完毕时弹出整个画面大框和内容广告块在屏幕中央
	        $("#topad_wk").show();
	        var divName = $("#topad");
	
			var top = ($(window).height() - $(divName).height())/2;
	        var left = ($(window).width() - $(divName).width())/2;
	        var scrollTop = $(document).scrollTop();
	        var scrollLeft = $(document).scrollLeft();
	        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
	        
	        
	        
	        
	        
	        //5秒后自动关闭，退回到左边位置
	        var top_timeId = 0;
			var top_timeLeft = 4;
			function top_countt(){
				if(top_timeLeft<=0){
					window.clearInterval(top_timeId);
					//$("#topad_wk").hide();
					
					$("#topad_countdown").addClass("sea_topad").html("查看");
					$("#topad_bottom").animate({
						width:"100px"
					},2000);
	
					$("#topad").animate({
						width:"100px",
						height:"61.8px",
						left:"0px",
						top:"80px"
					},2000);
					$("#topad_wk").animate({
						width:"108px",
						height:"122px",
						left:"0px",
						top:"80px"
					},2000);
					$("#topad_wk").removeClass("topad_wk2");
	
				}else{
					$("#toptime").html(top_timeLeft).show();
					//timeId = window.setInterval("countt()",1000);
					top_timeLeft--;
				}
				
			}
			//写的自动关闭函数必须要调用
			top_timeId = setInterval(function(){
	       	 top_countt();
	        }, 1000);
	        
			//同时创建cookie
			//$.cookie('the_cookie', 'the_value', { expires: 1 }); 
			$.cookie('the_cookie', 'the_value');//当没有指明 cookie有效时间时，所创建的cookie有效期默认到用户关闭浏览器为止 
	
			
			
			
	}
		
		
		
		//点击关闭时隐藏
	    $("#topad_close").click(function(){
	        $("#topad_wk").hide();
	       
	    });
			
			
			
			
			
			//2.再次展开*****************
			
			$(".sea_topad").live("click",function(){
				
				//点击查看的时候要从新恢复整个画面大框和内容块在屏幕中央
				$("#topad_wk").show();
				var divName = $("#topad");
	
				var top = (($(window).height() - 400)/2)-125;
		        var left = ($(window).width() - 800)/2;
		        var scrollTop = $(document).scrollTop();
		        var scrollLeft = $(document).scrollLeft();
		        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
				
				
				//点击查看从新 恢复外框的高宽
				$("#topad_wk").addClass("topad_wk2");
				//恢复几秒后关闭提示框的内容
				$("#topad_countdown").removeClass("sea_topad").html("秒后关闭").prepend("<span id='toptime'>5</span>");
				//恢复底部框的宽度
				$("#topad_bottom").animate({
					width:"796px"
				},2000);
				//恢复广告内容框的宽度、高度，恢复后又要自动5秒后关闭
				$("#topad").animate({
					width:"796px",
					height:"490px"
				},2000,function(){
					var top_timeId = 0;
					var top_timeLeft = 4;
					function top_countt(){
						if(top_timeLeft<=0){
							window.clearInterval(top_timeId);
							
							$("#topad_countdown").addClass("sea_topad").html("查看");
							$("#topad_bottom").animate({
								width:"100px"
							},2000);
							$("#topad").animate({
								width:"100px",
								height:"61.8px",
								left:"0px",
								top:"80px"
							},2000);
							$("#topad_wk").animate({
								width:"108px",
								height:"122px",
								left:"0px",
								top:"80px"
							},2000);
							$("#topad_wk").removeClass("topad_wk2");
	
						}else{
							$("#toptime").html(top_timeLeft).show();
							top_timeLeft--;
						}
						
					}
					top_timeId = setInterval(function(){
			       	 top_countt();
			        }, 1000);
				});
	
		        
		        
			});

	}else{
		$("#topad_wk").remove();
	}
    
    
});
