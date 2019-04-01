//盈创活动的我要参加和资料下载弹出框 
$(function () {

	
	$("#adapttypediv").children("input").attr("disabled",true);
	$("#tel1").val($("#cellphone").val());
    //login  start
    var b=1;
    $("#join").click(function(){
    	

    	
    	//进入页面 有几个参数协助判断，即：该用户是否已经有报名记录 ，有报名记录，则去用户中心修改 。
    	//								 无报名记录 则 ，附带当前登录用户的姓名 ，电话，岗位 。
    	//0 未登录 ，1 已经登录 未报名，2 已经报名 3  未填写详细的信息
    	if($('#flag').val()=='0'){
    		//提示需要先登录 再报名 ，跳转到登录页面
    		alert('请先登录再报名');
    		window.location="/user/login.html"
    		return false;
    	}

    	if($('#flag').val()=='3'){
    		//提示需要先登录 再报名 ，跳转到登录页面
    		alert('请填写完整用户信息');
    		window.location="/usercenter/usercenter.html"
    		return false;
    	}
    	
    	if($('#flag').val()=='4'){
    		//提示需要先登录 再报名 ，跳转到登录页面
    		alert('当前用户类型不能报名该活动');
    		return false;
    	}
    	
    	//alert($('#flag').val());
    	if($('#flag').val()=='2'){
    		//提示 已经报名了，如果要修改则调整到用户中心
    		//alert('已经存在您的报名记录，如果要修改请到用户中心修改');
    		/*if (confirm("已经存在您的报名记录，如果要修改请到用户中心修改")) {  
                location.href="/usercenter/getActivitieslist.html";
            }else {  
            	return false;
            }  
    		return false;*/
    		//已经报名，就把信息获取放入td中
    		//<input type="text" id="0" name="胡晓峰" lang="13548051028" accesskey="互联网金融服务部副经理">
    		var ybmxx = $(".ybm .yinp");
    		var tabtrstd = $("#tabtrs .ip1");
    		ybmxx.each(function(i,v){
    			//alert();
    			tabtrstd.eq(i).val($(this).attr("name"));
    			if(i>1&&i<=3){
    				$("#delete1val").val(1);
    				$("#numtr1").addClass("trshow");
    				$("#numtr1 input").attr("disabled",true);
    				$("#numtr1 input").css("color","#888");
    			}
    			if(i>3&&i<=6){
    				$("#numtr1").addClass("trshow");
    				$("#numtr1 input").attr("disabled",true);
    				$("#numtr1 input").css("color","#888");
    				
    				$("#numtr2").addClass("trshow");
    				$("#delete2val").val(1);
    				$("#numtr2 input").attr("disabled",true);
    				$("#numtr2 .more").hide();
    				$("#numtr2 input").css("color","#888");
    			}
    			if(i>6&&i<=9){
    				$("#numtr1").addClass("trshow");
    				$("#numtr1 input").attr("disabled",true);
    				$("#numtr1 .more").hide();
    				$("#numtr1 input").css("color","#888");
    				
    				$("#numtr2").addClass("trshow");
    				$("#delete2val").val(1);
    				$("#numtr2 input").attr("disabled",true);
    				$("#numtr2 .more").hide();
    				$("#numtr2 input").css("color","#888");
    				
    				$("#numtr3").addClass("trshow");
    				$("#delete3val").val(1);
    				$("#numtr3 input").attr("disabled",true);
    				$("#numtr3 .more").hide();
    				$("#numtr3 input").css("color","#888");
    				
    			}
    		});
    		var persons = $('.ifperson input[type=checkbox]');    
    	    persons.each(function(i,v){
    	    	var person_tel =  persons.eq(i).attr("lang");
    	    	//遍历3个tr中是否含有该单击元素的电话
        		var tabtrs = $("#tabtrs .ip1");
        		var tr1tel = tabtrs.eq(1).val();
        		var tr2tel = tabtrs.eq(4).val();
        		var tr3tel = tabtrs.eq(7).val();
        		if(person_tel==tr1tel || person_tel==tr2tel || person_tel==tr3tel){
        			$('.ifperson input[type=checkbox]').eq(i).attr("checked",true);
        			$('.ifperson input[type=checkbox]').eq(i).attr("disabled",true);
        		}
        		
    	    });
    	}
    	// 将cellphone 显示在第一行输入框
    	
    	
    	
        $("#ldksq").show();
        var divName = $("#ldksq_c");

		if(b==1){
			 var top = ($(window).height() - $(divName).height())/2-47;
		}else{
			var top = ($(window).height() - $(divName).height())/2;
			b++;
		}
       
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();
    });

    $("#ldksq_lose").click(function(){
        $("#ldksq").hide();
    });

    // end
    //点击加号让隐藏的显示出来

    $("#more").click(function(){

    	var divName2 = $("#ldksq_c");
		var top2 = ($(window).height() - $(divName2).height())/2;
		var delete2val = $("#delete2val").val();
		var delete3val = $("#delete3val").val();
		if(delete2val==0 && delete3val==0){
			$("#numtr2").addClass("trshow");
			$("#delete2val").val(1);
			$(divName2).css("top",top2-17.5);
			return;
		}
		if(delete2val==0 && delete3val==1){
			$("#numtr2").addClass("trshow");
			$("#delete2val").val(1);
			$(divName2).css("top",top2-17.5);
			return;
		}
		
		if(delete2val==1 && delete3val==0){
			$("#numtr3").addClass("trshow");
			$("#delete3val").val(1);
			$(divName2).css("top",top2-17.5);
			return;
		}
		if(delete2val==1 && delete3val==1){
			return;
		}
		
    });
    
    $("#delete2").click(function(){
    	 //把对应的复选框的钩钩去掉
	    var tr2tel = $("#numtr2 .ip1").eq(1).val();
	    var checkboxtrs = $(".ifperson .person1");
	    checkboxtrs.each(function(i,v){
	    	var tid = i;
	    	var checkboxtel = checkboxtrs.eq(i).attr("lang");
	    	if(tr2tel==checkboxtel){
	    		checkboxtrs[tid].checked = false;
			}
	    });
    	
    	var divName3 = $("#ldksq_c");
		var top3 = ($(window).height() - $(divName3).height())/2;
	    $("#numtr2").removeClass("trshow");
	    $("#numtr2 input").val("");
	    $("#delete2val").val(0);
	    $(divName3).css("top",top3+17.5);
    });
    
    $("#delete3").click(function(){
    	
    	//把对应的复选框的钩钩去掉
	    var tr2tel = $("#numtr3 .ip1").eq(1).val();
	    var checkboxtrs = $(".ifperson .person1");
	    checkboxtrs.each(function(i,v){
	    	var tid = i;
	    	var checkboxtel = checkboxtrs.eq(i).attr("lang");
	    	if(tr2tel==checkboxtel){
	    		checkboxtrs[tid].checked = false;
			}
	    });
    	
    	
    	var divName4 = $("#ldksq_c");
		var top4 = ($(window).height() - $(divName4).height())/2;
	    $("#numtr3").removeClass("trshow");
	    $("#numtr3 input").val("");
	    $("#delete3val").val(0);
	    $(divName4).css("top",top4+17.5);
    });
    
    
    //提交按钮
    $("#sgbtn").click(function(){
    	//先判断所有增加的文本框都是否填写了内容，如果没有填写就返回
    	var inpsofshow = $("#tabtrs").find(".trshow").find("input[class=ip1]");
    	var flag = 0;
    	inpsofshow.each(function(){
    		if(($(this).val().length) < 1){
    			alert("请填写完整才可报名！");
    			$(this).focus();
    			flag = 1;
    			return false;
    		}
    	});
    	if(flag){return false;}
    	
    	
    	//判断3行中是否有姓名、或电话号码是相同的，若有则不允许通过
        var inpsofshow = $("#tabtrs").find(".trshow").find("input[class=ip1]");
        var tr1name = inpsofshow.eq(0).val();
        var tr2name = inpsofshow.eq(3).val();
        var tr3name = inpsofshow.eq(6).val();
        var tr1tel = inpsofshow.eq(1).val();
        var tr2tel = inpsofshow.eq(4).val();
        var tr3tel = inpsofshow.eq(7).val();
        
        if(tr2name && tr2name.length>0){
        	if(tr1name==tr2name || tr1name==tr3name || tr2name==tr3name){alert("姓名不能重复,请检查");flag = 1;return false;}
        }
        if(tr2tel && tr2tel.length>0){
        	if(tr1tel==tr2tel || tr1tel==tr3tel || tr2tel==tr3tel){alert("电话不能重复,请检查");flag = 1;return false;}
        }
    	
    	var username1 = $("username1").val();
    	var tel1 = $("tel1").val();
    	var station1 = $("station1").val();
    	if(username1==''){
    		alert('请填写姓名！');
    		username1.focus();
    	}
    	if(tel1==''){
    		alert('请填写电话！');
    		  tel1.focus();
    	}
    /*	var partten = /^1[3,4,5,8]\d{9}$/;
        var partten2 = /^0(([1,2]\d)|([3-9]\d{2}))\d{7,8}$/;
        var partten3 = /^0(\d{2,3})+-(\d{7,8})$/;
        if(!partten.test(tel1)&&!partten2.test(tel1)&&!partten3.test(tel1))
        {
            alert('请输入有效的电话号码！');
            tel1.focus();
            return false;
        }
    	*/
    	
    	if(station1==''){
    		alert('请填写岗位！');
    		station1.focus();
    	}
    	
    	
    	$.ajax({
            url:'/college/submit.html?e.id='+$("#activitiid").val(),
            type:'POST',
            dataType:"json",
            data:{
                username1:$("#username1").val(),
                tel1:$("#tel1").val(),
                station1 : $("#station1").val(),
                username2:$("#username2").val(),
                tel2:$("#tel2").val(),
                station2 : $("#station2").val(),
                username3:$("#username3").val(),
                tel3:$("#tel3").val(),
                station3 : $("#station3").val(),   
                activitiid:$("#activitiid").val(),   
            	activities_name:$("#activities_name").val()
            },
            beforeSend : function () {
            },
            success : function (data) {
                if(data.code==0){
                	alert(data.content);
                    location.reload();
                    $("#ldksq").hide();
                }else  {
                	 alert(data.content);
                }
            }});

    });
    
    //勾选常用联系人时，把对应的数据填入下面的tr表格中
    var persons = $('.ifperson input[type=checkbox]');    
    persons.each(function(i,v){
    	persons.eq(i).change(function(){
    		
    		var divName2 = $("#ldksq_c");
    		var top2 = ($(window).height() - $(divName2).height())/2;
    		var delete1val = $("#delete1val").val();
    		var delete2val = $("#delete2val").val();
    		var delete3val = $("#delete3val").val();
    		
    		
    		
    		
    		if(persons.eq(i).prop("checked")){
    			var person_name =  persons.eq(i).attr("name");
    			var person_tel =  persons.eq(i).attr("lang");
    			var person_station =  persons.eq(i).attr("accesskey");
    			//遍历3个tr中是否含有该单击元素的电话
        		/*var tabtrs = $("#tabtrs .ip1");
        		var tr1tel = tabtrs.eq(1).val();
        		var tr2tel = tabtrs.eq(4).val();
        		var tr3tel = tabtrs.eq(7).val();
    			alert(person_tel+"||"+tr1tel+"||"tr2tel+"||"tr3tel);return;
    			*/
    			
    			
    		
    			if(delete1val == 0 && delete2val==0 && delete3val==0){
    				$("#delete1val").val(1);
    				$("#numtr1 input").eq(0).val(person_name);
    				$("#numtr1 input").eq(1).val(person_tel);
    				$("#numtr1 input").eq(2).val(person_station);
    				return;
    			}
    			if(delete1val == 0 && delete2val==1 && delete3val==0){
    				$("#delete1val").val(1);
    				$("#numtr1 input").eq(0).val(person_name);
    				$("#numtr1 input").eq(1).val(person_tel);
    				$("#numtr1 input").eq(2).val(person_station);
    				return;
    			}
    			if(delete1val == 0 && delete2val==1 && delete3val==1){
    				$("#delete1val").val(1);
    				$("#numtr1 input").eq(0).val(person_name);
    				$("#numtr1 input").eq(1).val(person_tel);
    				$("#numtr1 input").eq(2).val(person_station);
    				return;
    			}
    			if(delete1val == 0 && delete2val==0 && delete3val==1){
    				$("#delete2val").val(1);
    				$("#numtr1 input").eq(0).val(person_name);
    				$("#numtr1 input").eq(1).val(person_tel);
    				$("#numtr1 input").eq(2).val(person_station);
    				return;
    			}

    			if(delete1val == 1 && delete2val==0 && delete3val==0){
    				$("#delete2val").val(1);
    				$("#numtr2 input").eq(0).val(person_name);
    				$("#numtr2 input").eq(1).val(person_tel);
    				$("#numtr2 input").eq(2).val(person_station);
    				$("#numtr2").addClass("trshow");
    			    $(divName2).css("top",top2-17.5);
    				return;
    			}
    			if(delete1val == 1 && delete2val==0 && delete3val==1){
    				$("#delete2val").val(1);
    				$("#numtr2 input").eq(0).val(person_name);
    				$("#numtr2 input").eq(1).val(person_tel);
    				$("#numtr2 input").eq(2).val(person_station);
    				$("#numtr2").addClass("trshow");
    			    $(divName2).css("top",top2-17.5);
    				return;
    			}
    			if(delete1val == 1 && delete2val==1 && delete3val==0){
    				$("#delete3val").val(1);
    				$("#numtr3 input").eq(0).val(person_name);
    				$("#numtr3 input").eq(1).val(person_tel);
    				$("#numtr3 input").eq(2).val(person_station);
    				$("#numtr3").addClass("trshow");
    			    $(divName2).css("top",top2-17.5);
    				return;
    			}
    			
    		}else{
    			
    			var person_name =  persons.eq(i).attr("name");
    			var person_tel =  persons.eq(i).attr("lang");
    			var person_station =  persons.eq(i).attr("accesskey");
    			var divName2 = $("#ldksq_c");
        		var top2 = ($(window).height() - $(divName2).height())/2;
        		var delete1val = $("#delete1val").val();
        		var delete2val = $("#delete2val").val();
        		var delete3val = $("#delete3val").val();
        		//遍历3个tr中是否含有该单击元素的电话
        		var tabtrs = $("#tabtrs .ip1");
        		var tr1tel = tabtrs.eq(1).val();
        		var tr2tel = tabtrs.eq(4).val();
        		var tr3tel = tabtrs.eq(7).val();
        		//alert(tr1tel+'***'+tr2tel+'***'+tr3tel);
        		//alert("&"+person_tel);
        		//alert(person_tel ==tr1tel);
        		if(person_tel ==tr1tel){
        			//第一行该被隐藏【数据该被清空】
        			$("#numtr1 input").val("");
        			$("#delete1val").val(0);
    				return;
        		}
        		if(person_tel ==tr2tel){
        			//第一行该被隐藏【数据该被清空】
        			$("#numtr2").removeClass("trshow");
        			$("#numtr2 input").val("");
        			$("#delete2val").val(0);
    			    $(divName2).css("top",top2+17.5);
    				return;
        		}
        		if(person_tel ==tr3tel){
        			//第一行该被隐藏【数据该被清空】
        			$("#numtr3").removeClass("trshow");
        			$("#numtr3 input").val("");
        			$("#delete3val").val(0);
    			    $(divName2).css("top",top2+17.5);
    				return;
        		}
        		
    			
    		}
    	});
    });
    
    
    
    
  
    
    
    
    
});
