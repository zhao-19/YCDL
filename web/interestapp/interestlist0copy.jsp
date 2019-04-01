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
    
    <style>
    	.intrestlistwk .li p.t {color:#369CCC;font-size: 26px;margin-top: 66px;text-shadow: 2px 2px 2px #ddd;}
    	.intrestlistwk .li p span.w {background-color:#ddd;}
    	.intrestlistwk .li {border: 1px solid #dcdcdc;    width: 578px;}
    	.intrestlistwk .li .yy {background: url('../img/yy2.png') 10px -6px repeat;}
    	    
    </style>
    
      <style>
        .zcBox{width:1240px;margin:50px auto;overflow: hidden;color:#fff;}
        .zcBox li{box-sizing: border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;position:relative;overflow:hidden;float:left;padding:40px 10px 0 18px;width:297px;height:176px;margin-right:17px;background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/img/zcsb.png");background-repeat: no-repeat;}
        .zcBox li:nth-child(1){background-position:0 0; }
        .zcBox li:nth-child(2){background-position:-305px 0; }
        .zcBox li:nth-child(3){background-position:-610px 0; }
        .zcBox li:last-child{margin:0;background-position:-915px 0;}
        i.zcIcons{float:left;display:inline-block;margin-top:10px;width:47px;height:47px;background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/img/zcsb.png");background-repeat: no-repeat;}
        .zcBox li:nth-child(1) i{background-position:0 -195px; }
        .zcBox li:nth-child(2) i{background-position:-305px -195px; }
        .zcBox li:nth-child(3) i{background-position:-610px -195px; }
        .zcBox li:nth-child(4) i{background-position:-915px -195px; }
        .zcText{float:left;width:214px;margin-left:8px;}
        .zcText h2{display:inline-block;font-size:19px;text-shadow: 5px 5px 5px rgba(0,0,0,0.2);border-radius:10px;font-weight: normal;padding:5px 7px;background: rgba(255,255,255,0.2)}
        .zcText h2 a{color:#fff;}
        .zcText h2:hover{text-shadow: 5px 5px 5px rgba(0,0,0,0.4);}
        .zcText p{font-size:14px;margin-top:15px;}
        .light{ cursor:pointer; position: absolute; left: -297px; top: 0; width: 100%; height: 100%;
            background-image: -moz-linear-gradient(0deg,rgba(255,255,255,0),rgba(255,255,255,0.5),rgba(255,255,255,0));
            background-image: -webkit-linear-gradient(0deg,rgba(255,255,255,0),rgba(255,255,255,0.5),rgba(255,255,255,0));
            transform: skewx(-25deg);
            -o-transform: skewx(-25deg);
            -moz-transform: skewx(-25deg);
            -webkit-transform: skewx(-25deg);

        }
        .zcBox li:hover .light{ left:297px; -moz-transition:0.6s; -o-transition:0.6s; -webkit-transition:0.6s; transition:0.6s;}
		#interul li{cursor: pointer;}
		
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
	<img src="../image/data/zcsbbanner_02.png" alt="背景图">
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
	<!-- <div class="ycdata_title widthbox widthbox_inlist">
		<div class="intrestlistwk">
			<div class="blockwk">
				<div class="li" style="background:url('../img/img_02x.png') no-repeat center;">
					<a href="/interestapp/zaixianshenbaoList.html">
						<p class="t">政策申报</p>
						<div class="yy"></div>
					</a>
					
				</div>
				<div class="jj" style="font-size:12px">&nbsp;</div>
			</div>
			<div class="blockwk">
				<div class="li" style="background:url('../img/img_03x.png') no-repeat center;">
					<a href="/interestapp/fuchizhichengList.html?pageSize=20">
						<p class="t">扶持政策</p>
						<div class="yy"></div>
					</a>
					
				</div>
				<div class="jj" style="font-size:12px">&nbsp;</div>
			</div>
			
		</div>
	</div> -->
	
	<div class="zcBox">
    <ul id="interul">
        <li>
            <div>
                <i class="zcIcons"></i>
                <div class="zcText">
                    <h2><a href="/interestapp/zaixianshenbaoList.html">政策申报入口>></a></h2>
                    <p>成都高新区“三次创业”产业扶持政策在线申报</p>
                </div>
            </div>
            <s class="light"></s>
        </li>
        <li>
            <div>
                <i class="zcIcons"></i>
                <div class="zcText">
                    <h2><a href="/interestapp/fuchizhichengList.html?pageSize=20">政策扶持入口>></a></h2>
                    <p>成都高新区“三次创业”产业扶持申报政策条款</p>
                </div>
            </div>
            <s class="light"></s>
        </li>
        <li>
            <div>
                <i class="zcIcons"></i>
                <div class="zcText">
                    <h2><a href="/userextend/getjrmain.html" class="ifLogin">统计指标入口>></a></h2>
                    <p>成都高新区金融机构统计指标在线填报
                    </p>
                </div>
            </div>
            <s class="light"></s>
        </li>
        <li>
            <div>
                <i class="zcIcons"></i>
                <div class="zcText">
                    <h2><a href="/usercenter/getNewEco.html?t=v" class="ifLogin">新经济企业申报入口>></a></h2>
                    <p>成都高新区新经济企业数据填报</p>
                </div>
            </div>
            <s class="light"></s>
        </li>
    </ul>
</div>
	<div class="loginBg">
		<div class="loginWindow">
			<span id="loginClose">&times;</span>
			<iframe src="/user/loginAjax.jsp" width="368" height="400" scrolling="no" id="loginAjaxIframe"></iframe> 
		</div>
	</div>
</div>

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
	if ('${user_info}' == "") {
		$('.ifLogin').click(function(e){
		 e.preventDefault();
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

 
