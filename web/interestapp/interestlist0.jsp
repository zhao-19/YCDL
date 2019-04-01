<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/tiexizhinan.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
    
    <style>
    	.intrestlistwk .li p.t {color:#369CCC;font-size: 26px;margin-top: 66px;text-shadow: 2px 2px 2px #ddd;}
    	.intrestlistwk .li p span.w {background-color:#ddd;}
    	.intrestlistwk .li {border: 1px solid #dcdcdc;    width: 578px;}
    	.intrestlistwk .li .yy {background: url('../img/yy2.png') 10px -6px repeat;}
    	    
    </style>
    
      <style>
       .zcKind *,.zcInRight *{margin:0;padding:0;border:0;outline:0;list-style: none;box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;}
       .zcKind li,.zcInRight li{float:left;}
		.zcKind{width:420px;color:#fff;  margin-top: 7px;}
        .zcKind>li,.zcInRight>li{position:relative;width: 100%;height:283px;margin-bottom:45px;}
        .zcKind>li,.zcInRight>li>ul>li{position:relative;background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/img/zcbgs.png");background-repeat: no-repeat;}
        .zcKind li:nth-child(1){background-position: 0 0;}
        .zcKind li:nth-child(2){background-position: 0 -310px;}
        .zcKind li:nth-child(3){background-position: 0 -621px;}
        .zcKind li:nth-child(4){background-position: 0 -932px;margin-bottom:0;}
        .zcKind .zcTitle{width:270px;height:62px;padding:0 18px 0 23px;position:absolute;top:100px;right:0;}
        .zcKind .zcTitle h2{font-size:30px;margin-top:10px;}
        .zcKind .zcTitle span{font-size:20px;margin-top:23px;opacity: 0.9;}
        .zcInRight{width:725px;}
        .zcInRight *{color:#fff;}
        .zcInRight ul,.zcInRight ul>li{height:100%;padding-top:7px;}

        .right1>li, .right4>li{width:340px;}
        
        .right1>li:first-child,.right4>li:first-child{margin-right:45px;}
        .right1>li:nth-child(1){background-position: -464px 0;}
        .right1>li:nth-child(2){background-position: -855px 0;}
        .right4>li:nth-child(1){background-position: -464px -1243px;}
        .right4>li:nth-child(2){background-position: -855px -1243px;}
        .right2>li{/*width:216px;*/width:100%;margin-right:38.5px;}
        .right2>li:nth-child(1){background-position: -464px -311px;}
        .right2>li:nth-child(2){background-position: -726px -315px;}
        .right2>li:nth-child(3){background-position: -984px -315px;margin-right:0;}
        .right3>li{width:100%;background-position: -464px -621px;}
        .zcInRight ul *{transition: 0.5s;  -webkit-transition: 0.5s;  -moz-transition: 0.5s;  -o-transition: 0.5s;}
        .zcInRight ul>li>.zcMask{width:100%;height:100%;position: absolute;top:0;left:0;background:#fff;opacity: 0;}
        .zcInRight ul>li:hover,.zcInRight ul>li:hover>.zcMask{border-radius: 50px 0 50px 0;}
        .zcInRight ul>li:hover>.zcMask{opacity: 0.15;}
        .zcInRight ul>li>.zcMask2{background:#aeaeae;}
        .zcInRight ul>li:hover>.zcMask2{opacity: 1;}
        .comingSoon{position: absolute;top:0;right:0;font-size:20px;padding:5px 10px;background:rgba(0,0,0,0.3);}
        .zcInRight ul>li i{transition:0s;display: inline-block;width:112px;height:124px;background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/img/zc-icon2.png");background-repeat: no-repeat;background-position: center;}
        .zcInRight ul>li:hover i{background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/img/zc_icon_on.png");}
        .zcInRight ul>li i{margin-left:10px;}
        .zcInRight .right1>li:nth-child(1) i{background-position: 0 0;}
        .zcInRight .right1>li:nth-child(2) i{background-position: -139px 0;}
        .zcInRight .right2>li:nth-child(1) i{background-position: -275px 0;}
        .zcInRight .right2>li:nth-child(2) i{background-position:-415px 0;}
        .zcInRight .right2>li:nth-child(3) i{background-position:-555px 0;}
        .zcInRight .right3>li:nth-child(1) i{background-position:-694px 0;}
        .zcInRight .right4>li:nth-child(1) i{background-position:-834px 0;}
        .zcInRight .right4>li:nth-child(2) i{background-position:-977px 0;}
        /*.zcInRight ul>li:hover i{background-position-x: -1px;}*/

        .zcTxt{display:block;width:100%;height:100%;padding:50px 10px 20px;text-align: center;position: absolute;top:0;left:0;z-index: 1000;}
        .zcTxt h2{font-size:23px;font-weight: normal;line-height: 32px;margin-top:10px;}

        .zcInRight ul>li:hover h2,.zcInRight ul>li:hover p{text-shadow: 5px 5px 4px rgba(0,0,0,0.4);}
        .hotImg{position: absolute;top:0;right:0;display: none;}
        .hot .hotImg{display: block;}
        .hotImg img{margin-top:-6px;width:45px;}
        
		.loginBg{display:none;width:100%;height:100%;position:fixed;top:0;left:0;z-index:10000;background:rgba(0,0,0,0.4);}
		.loginWindow{position:absolute;top:50%;left:50%;margin:-212px 0 0 -184px;}
		.loginWindow iframe{border:0;border-radius:4px;}
		#loginClose{position:absolute;top:10px;right:10px;font-size:18px;cursor: pointer;}
		
		
    </style>
    
</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>
<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/data/zcsbbanner_02.png" alt="背景图" style="height:200px;">
</div>

<div class="ycdata_info ycdata_info_inlist">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>政策申报</li>
		</div>
		<div class="data_info_search fr " style="border:none;">
		</div>
	</div>
</div>

<div class="ycdata_center ycdata_center_inlist" style='background:none;'>
	


<div class="bl ov" style="padding-bottom:60px;">
    <ul class="zcKind fl">
        <li style="display:none;">
            <div class="zcTitle">
                <h2 class="fl">企业入库</h2>
                <span class="fr">STORAGE</span>
            </div>
        </li>
        <li>
            <div class="zcTitle">
                <h2 class="fl">政策申报</h2>
                <span class="fr">DECLARE</span>
            </div>
        </li>
        <li style="display:none;">
            <div class="zcTitle">
                <h2 class="fl">数据报送</h2>
                <span class="fr">SUBMIT</span>
            </div>
        </li>
        <li>
            <div class="zcTitle">
                <h2 class="fl">政策查询</h2>
                <span class="fr">SEARCH</span>
            </div>
        </li>

    </ul>
    <ol class="zcInRight fr ov">
        <li style="display: none;">
            <ul class="right1">
                <li>

                    <div class="zcMask"></div>
                    <!--加上hot 的为热门效果-->
                    <a href="/usercenter/getNewEco.html?t=v" class="zcTxt hot ifLogin" lang="1">
                        <i></i>
                        <h2>新经济入库</h2>
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>
                <li>
                    <!--加上zcMask2 的为暂未开放的功能界面效果-->
                    <div class="zcMask  zcMask2"></div>
                    <a href="" class="zcTxt">
                        <i></i>
                        <h2>企业征信入库</h2>
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <ul class="right2">
            
            <%String shenbao = SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO);if ("1".equals(shenbao)){%>
				<li>
                    <div class="zcMask"></div>
                    <a href="/usercenter/usercenter.html" class="zcTxt hot ifLogin" lang="2">
                        <i></i>
                        <h2>成都高新区关于加快国际科技金融创新中心建设的若干政策2018年</h2>
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>
			<%}else{%>
				<li>
                    <div class="zcMask zcMask2"></div>
                    <a href="" class="zcTxt">
                        <i></i>
                        <h2>成都高新区关于加快国际科技金融创新中心建设的若干政策2018年</h2>
                    </a>
                </li>
			<%}%>
            
                <!--<li>
                    <div class="zcMask"></div>
                    <a href="/usercenter/usercenter.html" class="zcTxt ifLogin">
                        <i></i>
                        <h2>提升金融产业能级<br>政策申报</h2>
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>
                <li>
                    <div class="zcMask"></div>
                    <a href="/usercenter/usercenter.html" class="zcTxt ifLogin">
                        <i></i>
                        <h2>构建金融生态圈<br>政策申报</h2>
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>  -->
            </ul>
        </li>
        <li style="display: none;">
            <ul class="right3">
                <li>
                    <div class="zcMask"></div>
                    <a href="/userextend/getjrmain.html" class="zcTxt">
                        <i></i>
                        <h2>高新区统计指标数据报送</h2>
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <ul class="right4">
                <li>
                    <div class="zcMask"></div>
                    <a href="interestapp/interestgxsearch.html" class="zcTxt">
                        <i></i>
                        <h2>输入关键字查询</h2>
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>
                <li>
                    <div class="zcMask"></div>
                    <a id="hideA" href="http://winpower.cloud4magic.com/todeclare" style="display: none;" target="_blank"></a>
                    <a href="javascript:void(0);" onclick="openpage();" class="zcTxt" target="_blank">
                        <i></i>
                        <h2>政策匹配查询</h2>
                        <p style="font-size:16px;margin-top: 3px;">（该功能由第三方软件公司开发）</p>
                        
                        <b class="hotImg"><img src="/icon/hot-tip.png" alt=""></b>
                    </a>
                </li>
            </ul>
        </li>
    </ol>
</div>


	<div class="loginBg">
		<div class="loginWindow">
			<span id="loginClose">&times;</span>
			<iframe src="/user/loginAjax.jsp" width="368" height="400" scrolling="no" name="iframe_name" id="loginAjaxIframe"></iframe> 
		</div>
	</div>
</div>

<script>
	function openpage() {
		layer.confirm('您将跳出盈创动力科技金融服务平台，点击“确认”跳转，点击“取消”留在本网站。', 
			{icon: 7, title : '提示', btn : [ '确定', '取消' ]}, 
		function(index) {
            layer.close(index);
            $("#hideA")[0].click();
        }); 
	}

    $('.zcMask2').next(".zcTxt").click(function(e){
        e.preventDefault();
    });
    $('.zcMask2').each(function(i,v){
        var span='<span class="comingSoon">未开放</span>';
        if(!$(this).children().is('.comingSoon')){
            $(this).append(span);
        }
    });

</script>

 <script> 
 	$("#interul li").click(function(){
		$(this).find('a')[0].click();
	});
	var pagesize = 20;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".hidden .ycdata_list1");
            $(".morebox").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".morebox");
            }
            $(".morebox .ycdata_list1").each(function(){
                $(this).attr('.ycdata_list1',$(this).attr('.ycdata_list1'));
            })
            for(var i=lanren._default;i<lis.length;i++){
                _content.push(lis.eq(i));
            }
            $(".hidden").html("");
        },
        
        loadMore:function(){
        	//alert($('#loadmorewordh').html());
        	//$('#loadmorewordh').html("<p>玩命加载中，请稍后...</p>");
        	
        	document.getElementById("loadmorewordh").innerHTML="玩命加载中，请稍后...";
        	var test = document.getElementById("loadmorewordh").innerHTML;
        	
        	//alert($('#loadmoreword').html());
        	//如果 _content.length 小于每次显示的页数，则需要再次做异步请了。   
        	/*if(_content.length<pagesize){
        		queryData();
        	}else {
        		loadData();
        	}*/
        	queryData();
        	
        }
    }
    
    lanren.init();
    
    function loadData(){
      var mLis = $(".morebox .ycdata_list1").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              if(!target){
                  $('#loadmorewordh').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
                  return false;
              }
              $(".morebox").append(target);
              $(".morebox .ycdata_list1").eq(mLis+i).each(function(){
                  $(this).attr('.ycdata_list1',$(this).attr('.ycdata_list1'));
              });
           }
           $('#loadmorewordh').html("加载更多");
     }
    function queryData(){
   		queryDataCount = queryDataCount+1;
    	var _url = "/data/toQiyeList2.html?page="+queryDataCount;
//	alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  beforeSend : function () {
              $("#loadmorewordh").html("数据拼命加载中...");
          },
		  success: function(data){
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
			  }
			  for(var i=0;i<data.length;i++ ){  
			  	
 			    _content.push(
			    	"<div class=\"ycdata_list1 widthbox fl\">"+
					"<div class=\"data_list_name1 fl\">"+
						"<li class=\"data_list_name_info1 fl\">"+data[i].qiyemingcheng+"<br><div class=\"xiamian1 fl\"> </div></li>"+
					"</div>"+
					"<div class=\"data_list_scale1 fl\">"+
						"<li>"+data[i].gszcd_city+" "+data[i].gszcd_county+"</li>"+
					"</div>"+
					"<div class=\"data_list_profession1 fl\">"+
						"<li>"+data[i].zhuceziben+"万元</li>"+
					"</div>"+
					"<div class=\"data_list_scale1 fl\">"+
						"<li>"+data[i].chengliriqi+"</li>"+
					"</div>"+
				"</div>"
				);
		  } 
			 loadData();
			
		  },
		  error:function(){
			  //console.log("加载数据失败，请联系管理员。");
			//  alert("加载数据失败，请联系管理员。");
			 // jQuery.unblockUI();
			return null;
		  }
		});
		return false;
    }
    
</script>
 

 <script>
function doquery(){
    var query = $('#contentquery').val();
 	if(query=='') {
		
	}else {
		var url = '/data/toQiyeList.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
 }

/*弹出登录框*/
$(function(){

	 if ('${user_info}' == "") {
			$('.ifLogin').click(function(e){
			 e.preventDefault();
			 	if($(this).attr('lang')){
			 		$("#loginAjaxIframe").contents().find("#loginAjax").val($(this).attr('lang'));
			 	}
			 $('.loginBg').fadeIn(300);
			})
			
			$('#loginClose').click(function(){
			 $('.loginBg').fadeOut(300);
			})
			
			$('.loginBg').click(function(){
			     $(this).fadeOut(300);
			});
			
			$(".loginWindow").click(function(event) {
			       event.stopPropagation();
			});
		}
	 
	 
})



/*弹出登录框结束*/

</script>
 
 <div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;height:82px;}
</style>
<script>
 menu_init("interestapp");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>

 
