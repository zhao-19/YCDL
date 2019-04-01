//贴息申报step3删除图片
$(function () {
	
	var zwyb = '暂无样本';
    //把当前这组图片的id找到
    var imgid = $("#id").val();
    
    
    function listnow(nowspan){
        var nowpicimgss = $("#"+nowspan).children(".div");
        nowpicimgss.each(function (i, v) {
            lefts = i * 8;
            nowpicimgss.eq(i).attr("style", "left:" + lefts + "px");
        });

    }
    
	
	$("#adapttypediv").children("input").attr("disabled",true);
	$("#tel1").val($("#cellphone").val());
    $(".delimg").click(function(){
    	
    	$("#ifdelimg").val(0);//默认不刷新
        $("#ldksq").show();
        var divName = $("#ldksq_c");

		var top = ($(window).height() - $(divName).height())/2;
        var left = ($(window).width() - $(divName).width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        $(divName).css( { position : 'absolute', 'top' : "45%", left : left + scrollLeft } ).show();
        
    
        //把当前这个的名称填写在弹出框的标题中
        $("#delt").html($(this).parent().next().html()+"图片：");
        //找到当前元素的前一个元素下的所有图片copy到delimglist中去
        var cloneimgs = $(this).prev().children().find("img");
        
        //获取当前点击删除按钮是属于哪个框
        var nowspan = $(this).prev().attr("id");
        
        $(".delimglist").html("");

        if(t=='v'){
        	var p = "";
        }else{
        	var p = "<p>&times;&nbsp;删除</p>";
        }
        cloneimgs.each(function(){
        	$("<div class='imglis'><a href='"+$(this).attr("accesskey")+"' target='_blank'><img lang='"+$(this).attr("lang")+"' src='"+$(this).attr("src")+"'/></a>"+p+"<h5><a href='"+$(this).attr("accesskey")+"' target='_blank'>&radic;&nbsp;查看</a></h5></div>").appendTo($(".delimglist"));
        })
        
        //获取delimglist中的删除按钮p,对其遍历，当点击的时候先弹出提示：“确定要删除吗？”，然后ajax把src数据给后台处理删除，
        //如果有删除，记录一下hidden框ifdelimg的值为1，点击关闭弹出框时先判断是否为1，是则刷新页面。
        
        var delps = $("#delimglist p");
        //点击删除按钮p时异步把它前面的图片 的src传到后台：
        delps.click(function(){
        	
           var choice=confirm("确认要删除吗？");
           if(choice){
               var userid = $("[name = 'userid']").val();
        	   $("#ifdelimg").val(1);
        	   var picid = $(this).prev().children("img").attr("lang");
        	   //alert('id='+picid+' * userid='+userid);
        	   // var url = $("#url").val();///interestapp/deletepic.html
	     	  
	     	   $.post("/declare_base/deletepic.html", {id : picid, userid : userid},function(data,status){
	     	      if(data==1){
	     				//参数为空，删除失败
	     	    	    alert('删除失败!');
	     	      }else if(data==2){
	     				//未登录，跳转到登陆页面
	     	    	  alert('未登陆，点击跳转到登录页面!');
	     	    	   location.href="/user/login.html";
	     	      }else if(data==3){
	     				//未能查询到该笔贴息数据
	     	    	 alert('未能查询到该笔贴息数据!');
	     	      }else if(data==4){
	     	    	 alert('当前图片不是由您上传，您没有权限删除!');
	     	      }else if(data ==0){
	     	    	  //为0表示删除成功。
	     	    	  //这里不刷新页面，而是动态去把下面的框框中的对应图片删除，且重新排列框框，且把右边显示的数字减少1（因为每次只能删除1张）
	     	    	  //把对应框(id=nowspan)下的对应图片(lang=picid)的父亲的父亲删除
	     	    	  
		     	      //这个的前面元素的值取出来减少1再赋回去。
		           	  $("#"+nowspan).prev().html($("#"+nowspan).prev().html()-1);
		           	  //框框中的对应图片删除
		           	  $("#"+nowspan).children().find("img[lang="+picid+"]").parent().parent().remove();
		           	  //把这个框框现在的图片重新排列一下
		           	  listnow(nowspan);
	     	    	  
	     	    	  //alert("ok");
	     	      }else{
	     	    	  //未知错误
	     	      }
	     			      
	     	   },"json");
	     	   $(this).parent().remove();
     	   }
        });
        
        
        $("#ldksq_lose").click(function(){
        	$(".delimglist").html("");
            $("#ldksq").hide();
            if($("#ifdelimg").val()==1){
            	location.href='/interestapp/tostep3.html?id='+imgid;
            }
        });
        
        //点击取消按钮
        $(".res").click(function(){
        	 
        	$(".delimglist").html("");
            $("#ldksq").hide();
            if($("#ifdelimg").val()==1){
            	location.href='/interestapp/tostep3.html?id='+imgid;
            }
        });
        
        return false;
    });
    
    
    
    
});
