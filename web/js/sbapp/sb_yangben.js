//贴息申报step3删除图片
$(function () {
	
	
    $(".img_yangbenl").click(function(){
        $("#ldksq").show();
        
    
        //把当前这个的名称填写在弹出框的标题中
        $("#delt").html($(this).children().find("p").html()+"图片：");
        //找到当前元素下的所有图片copy到delimglist中去
        var cloneimgs = $(this).children().find("img");

        $(".delimglist").html("");
        cloneimgs.each(function(){
        	$("<div class='imglis'><img lang='"+$(this).attr("lang")+"' src='"+$(this).attr("src")+"'/></div>").appendTo($(".delimglist"));
        })
        
        
        var divName = $("#ldksq_c").css({"max-height":$(window).height()-60});
        var divName = $("#delimglist").css({"max-height":$(window).height()-60});
        var divName = $("#delimglist img").css({"max-height":$(window).height()-120});
        
        
        var divName = $("#ldksq_c");
        divName.css({"margin-left":$(window).width()/2-($(divName).width()/2),"margin-top":$(window).height()/2-($(divName).height()/2+14)})

        

        $("#ldksq_lose").click(function(){
        	$(".delimglist").html("");
            $("#ldksq").hide();
        });
        
        //点击取消按钮
        $(".res").click(function(){
        	 
        	$(".delimglist").html("");
            $("#ldksq").hide();
        });
        
        
    });
    
    
    
    
});
