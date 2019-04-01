<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<div class="browsercheck" id="browsercheck">您的浏览器版本过低，建议您使用IE9.0以上版本，且强烈建议使用chrome谷歌和360安全浏览器，火狐等标准浏览器。</div>

<style type="text/css">
.browsercheck{display:none;z-index:99999;position:absolute;top:0px;left:0;width:100%;background-color:#b2dba1;height:30px;text-align:center;line-height:30px;font-size:16px;}
</style>
<script type="text/javascript">
// /*
	// 判断浏览器名称和版本
	// 目前只能判断:ie/firefox/chrome/opera/safari
	// 2012年5月16日23:47:08
	// 浏览器内核UA:UA;
	// 浏览器内核名称:NV.name;
	// 浏览器内核版本:NV.version;
	// 浏览器外壳名称:NV.shell;
// */
var NV = {};
var UA = navigator.userAgent.toLowerCase();
try
{
	NV.name=document.all?'ie':
	(UA.indexOf("firefox")>0)?'firefox':
	(UA.indexOf("chrome")>0)?'chrome':
	window.opera?'opera':"C:/Users/50750/Desktop/browsercheck.jsp"
	window.openDatabase?'safari':
	'unkonw';
}catch(e){};
try
{
	NV.version=(NV.name=='ie')?UA.match(/msie ([\d.]+)/)[1]:
	(NV.name=='firefox')?UA.match(/firefox\/([\d.]+)/)[1]:
	(NV.name=='chrome')?UA.match(/chrome\/([\d.]+)/)[1]:
	(NV.name=='opera')?UA.match(/opera.([\d.]+)/)[1]:
	(NV.name=='safari')?UA.match(/version\/([\d.]+)/)[1]:
	'0';
}catch(e){};
try
{
	NV.shell=(UA.indexOf('360ee')>-1)?'360极速浏览器':
	(UA.indexOf('360se')>-1)?'360安全浏览器':
	(UA.indexOf('se')>-1)?'搜狗浏览器':
	(UA.indexOf('aoyou')>-1)?'遨游浏览器':
	(UA.indexOf('theworld')>-1)?'世界之窗浏览器':
	(UA.indexOf('worldchrome')>-1)?'世界之窗极速浏览器':
	(UA.indexOf('greenbrowser')>-1)?'绿色浏览器':
	(UA.indexOf('qqbrowser')>-1)?'QQ浏览器':
	(UA.indexOf('baidu')>-1)?'百度浏览器':
	'未知或无壳';
}catch(e){}
//alert(NV.name);
/*
document.write('<div><p>浏览器UA='+UA+
'</p><p>浏览器名称='+NV.name+
'</p><p>浏览器版本='+NV.version+
'</p><p>浏览器外壳='+NV.shell+'</p></div>');*/
//对于ie浏览器版本为6,7,8的建议使用IE9.0以上版本，强烈建议使用chrome谷歌和360安全浏览器，火狐等常用浏览器

if((NV.name)=='ie' && (NV.version)<'9.0'){
	$("#newhuadong").hide();
	$("#sourcehuadong").show();
}

if((NV.name)=='ie' && (NV.version)=='8.0'){
	$("#browsercheck").slideDown(500);
    setInterval(function(){$("#browsercheck").slideUp();},9000);
}
if((NV.name)=='ie' && (NV.version)=='7.0'){
	$("#browsercheck").slideDown(500);
    setInterval(function(){$("#browsercheck").slideUp();},9000);
}
if((NV.name)=='ie' && (NV.version)=='6.0'){
	$("#browsercheck").slideDown(500);
    setInterval(function(){$("#browsercheck").slideUp();},9000);
}

//2检测浏览器是否被缩放【等于100为正常，大于100为浏览器窗口被放大，小于100为浏览器窗口被缩小】，它只有在窗口已经改变大小的情况下打开网页或者是触发事件时才可以检测，这里没调用这个检查
// function detectZoom (){
// 	  var ratio = 0,
// 	    screen = window.screen,
// 	    ua = navigator.userAgent.toLowerCase();
//
// 	   if (window.devicePixelRatio !== undefined) {
// 	      ratio = window.devicePixelRatio;
// 	  }
// 	  else if (~ua.indexOf('msie')) {
// 	    if (screen.deviceXDPI && screen.logicalXDPI) {
// 	      ratio = screen.deviceXDPI / screen.logicalXDPI;
// 	    }
// 	  }
// 	  else if (window.outerWidth !== undefined && window.innerWidth !== undefined) {
// 	    ratio = window.outerWidth / window.innerWidth;
// 	  }
//
// 	   if (ratio){
// 	    ratio = Math.round(ratio * 100);
// 	  }
//
// 	   return ratio;
// 	};
//
// var browsersize = detectZoom();
// if(browsersize>100){
// 	$("#browsercheck").html("您的浏览器不小心被放大了，建议切换回100%标准大小");
// 	$("#browsercheck").slideDown(500);
//     setInterval(function(){$("#browsercheck").slideUp();},9000);
// }
// if(browsersize<100){
// 	$("#browsercheck").html("您的浏览器不小心被放大了，建议切换回100%标准大小");
// 	$("#browsercheck").slideDown(500);
//     setInterval(function(){$("#browsercheck").slideUp();},9000);
// }


</script>