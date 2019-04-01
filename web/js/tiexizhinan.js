$(function () {
	 //点击下一步弹出发送短信对话框
    $(".guide span").click(function(){
		var value = $(this).prev().html();
		$('#ldksq_content').html(value);
        $("#ldksq").show();
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

    
});
