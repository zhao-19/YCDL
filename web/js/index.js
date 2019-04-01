//对double类型的文本框，初始无值的时候，不能为0.0而设置为空。
function defaultNull(cla,ele,val,claignore){
	var val = val;
	//alert(""+cla+" "+ele+":not("+claignore+")");
	$(""+cla+" "+ele+":not("+claignore+")").each(function(){
		//console.log($(this).val()+"*");
		
		if($(this).val()==val){
			//alert($(this).val());
			$(this).val("");
		}
	});

}



//3)页面加载完成时，所有金额的数字展示又要改写成数字逗号形式
$(document).ready(function(){
	
	//右边list页面的导出提示
	$('.daochutishi').html('（资料审批通过后才能导出！）');
	$('.daochutishi2').html('（资料审批通过且在2017-04-01之后的才能导出！）');
	
	
	//在新添加时(t=a时)不调用排列样式,其它情况下，有值都要排列样式
	// alert(t);


	 if((typeof(t) != "undefined")&& (t != 'a')){
		 styleNum("isBankZint");
	 }else if(typeof(t) == "undefined"){
         styleNum("isBankZint");
     }
		 
	
});
function styleNum(att){
	$("["+att+"]").each(function(){
		//有值才显示样式
		if(this.value.length>0){
			this.onchange();
		}
	});
}




//1)把金额都自动以数字逗号形式填写
// function formatNum(str){
// 	//查找字符串，如果里面有逗号了我就不验证了，直接返回true
// 	var strx = str;
// 	var hasdh = strx.indexOf(",");
// 	if(hasdh != -1){
// 		return strx;
// 	}else{
//
// 		var newStr = "";
// 		var count = 0;
//
// 		if(str.indexOf(".")==-1){
// 		   for(var i=str.length-1;i>=0;i--){
// 		 if(count % 3 == 0 && count != 0){
// 		   newStr = str.charAt(i) + "," + newStr;
// 		 }else{
// 		   newStr = str.charAt(i) + newStr;
// 		 }
// 		 count++;
// 		   }
// 		   str = newStr + ".00"; //自动补小数点后两位
// 		   //str = newStr; //自动补小数点后两位
// 		   return str;
// 		}
// 		else
// 		{
// 		   for(var i = str.indexOf(".")-1;i>=0;i--){
// 		 if(count % 3 == 0 && count != 0){
// 		   newStr = str.charAt(i) + "," + newStr;
// 		 }else{
// 		   newStr = str.charAt(i) + newStr; //逐个字符相接起来
// 		 }
// 		 count++;
// 		   }
// 		   str = newStr + (str + "00").substr((str + "00").indexOf("."),3);
// 		   //console.log(str)
// 		   return str;
// 		 }
//
// 	}
// }
function formatNum(str){//逗号型数字
    console.log(126)
    if(str==""){return str;}
    //查找字符串，如果里面有逗号了我就不验证了，直接返回true
    var reg=/,/ig;
    str=str.replace(reg,'');
    var fushu;
    if(str[0]=="-"){
        fushu="-";
    }else{
        fushu="";
    }
    var reg2=/-/ig
    str=str.replace(reg2,'');
    var newStr = "";
    var count = 0;

    if(str.indexOf(".")==-1){
        for(var i=str.length-1;i>=0;i--){
            if(count % 3 == 0 && count != 0){
                newStr = str.charAt(i) + "," + newStr;
            }else{
                newStr = str.charAt(i) + newStr;
            }
            count++;
        }
        str = fushu+newStr + ".00"; //自动补小数点后两位
        //str = newStr; //自动补小数点后两位
        return str;
    }
    else
    {
        for(var i = str.indexOf(".")-1;i>=0;i--){
            if(count % 3 == 0 && count != 0){
                newStr = str.charAt(i) + "," + newStr;
            }else{
                newStr = str.charAt(i) + newStr; //逐个字符相接起来
            }
            count++;
        }
        str = fushu+newStr + (str + "00").substr((str + "00").indexOf("."),3);
        return str;
    }

}

function toDecimal(x) {// 补零
    var f = parseFloat(x);
    if (isNaN(f)) {
        return '';
    }
    var f = Math.floor(x*100)/100;
    var s = f.toString();
    var rs = s.indexOf('.');
    if (rs < 0) {
        rs = s.length;
        s += '.';
    }
    while (s.length <= rs + 2) {
        s += '0';
    }
    return s;
}
//2)点击提交按钮的时候，遍历所有的金额，把金额的值又还原为纯数字
function nativeNum(att){
	$("["+att+"]").each(function(){
		$(this).val($(this).val().replace(/,/ig, ''));
	});
}

function countSecond(obj,second){     // 如果秒数还是大于0，则表示倒计时还没结束
    if(second>=0){           // 获取默认按钮上的文字    	
        obj.value = ''+second+''+'s后自动关闭';         // 时间减一
        second--;         // 一秒后重复执行
        setTimeout(function(){countSecond(obj,second);},1000);     // 否则，按钮重置为初始状态
    }
}


//一次点击保存或提交按钮后的5秒时间内再次点击无效（5秒内不再触发提交）
var buttonDefaultValue = "";
function countDown(obj,second){     // 如果秒数还是大于0，则表示倒计时还没结束
                if(second>=0){           // 获取默认按钮上的文字
                	obj.style.backgroundColor="#ccc";
                	obj.style.cursor="default"
                    obj.disabled = true;                     // 按钮里的内容呈现倒计时状态
                    obj.value = ''+second+''+'s后可再次提交';         // 时间减一
                    second--;         // 一秒后重复执行
                    setTimeout(function(){countDown(obj,second);},1000);     // 否则，按钮重置为初始状态
                }else{         // 按钮置未可点击状态
                	obj.style.backgroundColor="#FE9485";
                	obj.style.cursor="pointer"
                    obj.disabled = false;            // 按钮里的内容恢复初始状态
                    obj.value = buttonDefaultValue;
                }
            }


//百度统计
var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	var bsrc = "";
	if (location.href.indexOf("www.jykjjr.com") != -1) {			//简阳站
		bsrc = "https://hm.baidu.com/hm.js?3257ebe7e9d1f8312c047c5aa053c8a6";
	} else if (location.href.indexOf("www.qbjkjjr.com") != -1) {	//青白江
		bsrc = "https://hm.baidu.com/hm.js?ec945fba96b73e2fd0eb36d95a68bf96";
	} else {
		bsrc = "https://hm.baidu.com/hm.js?3de657c4e1ff9404c6520e0f3be1671f";
	}
	hm.src = bsrc
	var s = document.getElementsByTagName("script")[0]; 
	s.parentNode.insertBefore(hm, s);
})();

//5，首页融资交易列表向上滚动效果
function AutoScroll(obj){
	//找到传入id元素下的第一个ul，添加500毫秒完成的marginTop：-37px动画
    $(obj).find("ul:first").animate({
        marginTop:"-37px"
    },500,function(){
    	//，动画结束后随即还原为marginTop:0px，并把下面的第一个li放回到ul的最后一个子元素
        $(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
    });
}
$(document).ready(function(){
	//文档加载完毕就开始以2秒调用一次动画的方式一直执行
    setInterval('AutoScroll("#scrollDiv")',2000);
});




//1，顶部栏目导航鼠标放上去子栏目向下滑动显示效果
$(document).ready(function(){
	
	$(".index_cj_nav ul li").hover(function(){
		
		//console.log($(this).attr(""));
		lrqiehuan($(this).attr("class"));
		    		
        // $(this).children("a").addClass("index_action");
        var subnav = $(this).children(".subnavs");
        //下面这句是为了防止动画反复不停的执行，判断匹配元素is(':animated')判断是否处于动画状态，如果处于动画状态
        if(subnav.is(':animated')){
            subnav.stop(true,true);//则停止该动画，且调整动画状态到动画末尾
        }
        subnav.fadeToggle("1000");//执行slide动画
        
        //判断是显示时，加导航的底线，隐藏的去掉导航的底线
        if(subnav.is(':hidden')){
        	//$(".headernav").removeClass("bbtom");
        	$(this).parent().children().find(".firsta").removeClass("navhover2");
        }else{
        	//$(".headernav").addClass("bbtom");
        	$(this).parent().children().find(".firsta").removeClass("navhover2");
        	$(this).children(".firsta").addClass("navhover2");
        }
    }
)
});


function lrqiehuan(pli){
	
	
	
	 
	
	
	 /*使用场所左右切换 start---------------------------------------------------------------*/

   //修改js内置的trim()函数使其在ie6,7,8中可用
   String.prototype.trim = function () {
       return this .replace(/^\s\s*/, '' ).replace(/\s\s*$/, '' );
   }
   //下面的下上切换是自己分析后手写的效果，原理是根据css设置的.listsli的个数和宽度，得到总宽度设置给装listli的外框(.listwk)。再根据外面显示框（.csgylb）的宽度，确定默认的显示个数2。
   //在程序中还加有判断移动参数如果不等于默认上面分析的默认显示个数，则从新根据显示外框除以移动参数向下取整得到新的listli的宽度each遍历设置给.listli     并得到新的.listwk的宽度
   var pli = pli;
   var listlis = $('.'+pli+' .csgylb .listli');

//   var listlis = $('.csgylb .listli');
   var listli_width = listlis.eq(0).width();
   var listwk = $('.'+pli+' .csgylb .listwk');
   var listlislength = listlis.length;//总的li个数
   //获取显示框的宽度
   var showwk = $('.'+pli+' .csgylb').width();


   //设置外框的宽度刚好装下所有的元素
   listwk.width(listli_width*listlislength);
   //取得外框的总宽度
   var listwk_width = listli_width*listlislength;
   //设置移动参数（默认每次移动2个的宽度）movelength
   var movelength = 4;//这里的效果只能是2，其它个数的还不可以。（这个值可以动态修改）
   //如果数据只有一屏（2条），下一页就不能点击。如果总数据少于一屏显示个数，next就不能点击。
   if(listlislength<=movelength){
   	$('.'+pli+' .csgyl .next').addClass('disabled');
   }
   //根据设置的移动参数，动态改变每个小listli的宽度。
   if(movelength !=2 ){
       //如果不等于页面的默认显示个数，就根据显示外框和新设置的这个显示个数重新计算.listli和.listwk的宽度。
       listli_width = Math.floor(showwk/movelength);
       listlis.each(function(){
          $(this).width(listli_width);
       });
       listwk_width = listli_width*listlislength;
       $('.'+pli+' .csgylb .listwk').width(listwk_width);
   }

   //单位移动距离
   var movedistance = movelength *listli_width;
   //同时得到初始化宽度
   var chushiwidth = movedistance;
   //当前外框的left值
   var nowleft = 0;
   //alert(listli_width+'||'+listwk_width.width());//这样获取的宽度是可以兼容IE6,7,8的
   //$(document).attr('title',nowindex+"^");

   $('.'+pli+' .csgyl .next').click(function(){
       //获取当前left值
       nowleft = Math.abs(listwk.get(0).offsetLeft) ;
       if(($(this).attr('class')).trim() === 'next'){
           if(movedistance >= (listwk_width-nowleft-chushiwidth)){
               //大于，说明不够移动一次单位长度，就直接设置left值
               listwk.animate({
                   left:-(listwk_width-chushiwidth)
               },300);
               $('.'+pli+' .csgyl .next').addClass('disabled');
           }else{
               listwk.animate({
                   left:-(nowleft+movedistance)
               },300);
           }
           $('.'+pli+' .csgyl .prev').removeClass('disabled');
       }else{
           //alert('不能点击');
       }

   });

   $('.'+pli+' .csgyl .prev').click(function(){
       //获取当前left值
       nowleft = Math.abs(listwk.get(0).offsetLeft) ;
       if(($(this).attr('class')).trim() === 'prev'){
           if(movedistance >= nowleft){
               listwk.animate({
                   left:0
               },300);
               $('.'+pli+' .csgyl .prev').addClass('disabled');
           }else{
               listwk.animate({
                   left:-(nowleft-movedistance)
               },300);
           }
           $('.'+pli+' .csgyl .next').removeClass('disabled');
       }else{
           //alert('不能点击');
       }

   });

   /*使用场所左右切换 end*/
   
 //还原为变量的初始值：
/*	console.log("nowleft="+nowleft);
	console.log("movedistance="+movedistance);
	console.log("listwk_width="+listwk_width);
	console.log("chushiwidth="+chushiwidth);
	console.log("listwk="+listwk);*/
	
}

//2，banner图左边的类似淘宝商品切换选框
$(document).ready(function(){
	//移入到某个栏目类别上，获取当前类别index，右边内容框显示，右边对应index的小内容框显示，其他小内容框隐藏
	//当前栏目类别加上current样式，其他移除，当前栏目类别动画形式像左边padding10个像素
    $(".categorys>.all_nav dd").mouseenter(
    		
        function (e) {

            var index=$(this).index();
            $(".cate-content-list").show();
            var divs=$(".cate-content-list>.cate-mc");
            divs.hide();
            divs.eq(index).show();

            $(this).addClass("current");
            $(this).stop().animate({paddingLeft:'110px'});

            $(this).siblings().removeClass("current");
            e.stopPropagation();
            //e.preventDefault();
            //return false;
        }
        
    );

    $(".categorys>.all_nav dd").mouseleave(
        function (e) {
        	//移开时，当前栏目类别动画形式向右边padding10个像素复原
            $(this).stop().animate({paddingLeft:'100px'});
            e.stopPropagation();
            //e.preventDefault();
            //return false;
        }
        
    );

    $(".categorys").mouseleave(function(e){
    	//移开整个大框时，右边内容框隐藏，左边移除current样式
        $(".cate-content-list").hide();
        $(".all_nav dd").removeClass("current");
        e.stopPropagation();

    });

});



//3，首页右边浮动框显示与隐藏
$(function(){

    //首先将#back-to-top隐藏
    $("#totop").hide();

    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
    //$(function(){
        $(window).scroll(function(){
            if ($(window).scrollTop()>300){
                $("#totop").fadeIn();
            }else{
                $("#totop").fadeOut();
            }
        });
    //});
        
        
    //首页 点击返回顶部 
     $("#backtop").click(function(){
    	 $('body,html').animate({scrollTop:0},500);
    	 return false;
     });
        
});



function myConfirm(val,val1,val2,val3){
	$("#myConfirm").show();
    $("#myConfirm h4").html("您还未填写企业基本情况表，填写后方可申报补贴");//显示，停留，隐藏
    $("#myConfirm .sure").html(val1);
    $("#myConfirm .cancel").html(val2);
    $("#myConfirm .sure").click(function(){
		window.location=""+val3+"";	
						
	});
    $("#myConfirm .cancel").click(function(){$("#myConfirm").hide();return false;});
}


/*
function delSure(v1,v2){
	$("#delSure").show();
	$("#delSure h4").html("确定要删除此栏申报？");//显示，停留，隐藏
	$("#delSure .delsure").html('确定');
    $("#delSure .delcancel").html('取消');
    $("#delSure .delsure").click(function(){
    	$("#delSure").hide();
    	deleteCore(v1,v2);
						
	});
    $("#delSure .delcancel").click(function(){$("#delSure").hide();});
}*/



$(document).ready(function(){

	
	
//加的效果
$(".add").click(function(){
var n=$(this).prev().val();
var num=parseInt(n)+1;
if(num==0){ return;}
$(this).prev().val(num);
});
//减的效果
$(".jian").click(function(){
var n=$(this).next().val();
var num=parseInt(n)-1;
if(num==0){ return}
$(this).next().val(num);
});
});

//4,导航栏菜单是否选中
function menu_init(cupage){
	$("#index").attr("class","firsta");
    $("#news").attr("class","firsta");
    $("#product").attr("class","firsta");
    $("#stock").attr("class","firsta");
    $("#incre").attr("class","firsta");
    $("#college").attr("class","firsta");
    $("#data").attr("class","firsta");
    $("#files").attr("class","firsta");
    $("#aboutus").attr("class","firsta");
    $("#"+cupage).attr("class","yjbgc navhover");//其实只有这句生效
  };

 
//5，会员中心左边子栏目选中  
function leftnav_init(cupage){
	    $("#basicinfo").attr("class","");
	    $("#qiyeinfo").attr("class","");
	    $("#debtsinfo").attr("class","");
	    $("#redebtsinfo").attr("class","");
	    $("#regiinfo").attr("class","");
	    $("#comregiinfo").attr("class","");
	    $("#qiyeinfo").attr("class","");
	    $("#jigouinfo").attr("class","");
	    $("#personinfo").attr("class","");
	    $("#interestapp").attr("class","");
	    $("#publishguquanlist").attr("class","");
	    $("#appointmentguquanlist").attr("class","");
	    $("#interestapp2").attr("class","");
	    //贴息申报的第2到11个
	    $("#hlwbt").attr("class","");
	    $("#kjcxbt").attr("class","");
	    $("#qygzbt").attr("class","");
	    $("#ipohjbt").attr("class","");
	    $("#sscgbt").attr("class","");
	    $("#jwsscgbt").attr("class","");
	    $("#czbgbt").attr("class","");
	    $("#zzgbbt").attr("class","");
	    $("#yggqbt").attr("class","");
	    $("#xypjbt").attr("class","");
	    $("#xypjbt").attr("class","qysqjbxx");
	    $("#rzzlbt").attr("class","");
	    $("#kjbxbt").attr("class","");
	    $("#zwrzbt").attr("class","");
	    $("#allbt").attr("class","");
	    $("#downloadbt").attr("class","");
	    

	    $("#"+cupage).attr("class","leftnavhover");//其实只有这3句生效
	    $("#"+cupage).parent().css("display","block");
	    $("#"+cupage).parent().parent().addClass("selected");
        $("#"+cupage).parent().parent().parent('.list-item').show();
	  };

	  
	  
	  function checkEachNeedDate(elem){
		    var xunhuanbzf=true;//设置循环查找标识符
		    $("#"+elem+" .needDate").each(function(){
		        if($(this).val().length<1){
		            $(this).parent().children("span").html("该日期是必填项！").show();
		            xunhuanbzf = false;
		            return false;//return false才是结束掉each循环，return只是跳过此次循环
		        }else{
		        	$(this).parent().children("span").hide();
		        }
		    });
		    if(xunhuanbzf){
		        return true;
		    }else{
		        return false;
		    }
		}
  


