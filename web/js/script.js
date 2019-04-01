// JavaScript Document
//用户中心左边侧栏收缩与展开效果
function navList(id) {
	var $obj = $("#J_navlist");
/*    
    $obj.find("h4").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });*/
    $obj.find("p").hover(function () {
        if ($(this).hasClass("on")) { return true; }else{
        $(this).addClass("hover");}
    }, function () {
        if ($(this).hasClass("on")) { return true; }else{
        $(this).removeClass("hover");}
    });
    $obj.find("h4").click(function (){
        var $div = $(this).siblings(".list-item");
        if ($(this).parent().hasClass("selected")) {
            $div.slideUp(300);
            $(this).parent().removeClass("selected");
        }
        if ($div.is(":hidden")) {
            $("#J_navlist div.li").find(".list-item").slideUp(300);
            $("#J_navlist div.li").removeClass("selected");
            $(this).parent().addClass("selected");
            $div.slideDown(300);
        } else { 
            $div.slideUp(300);
        }
    });
}
