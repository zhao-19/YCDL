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
</head>
<body>
<style>
.ycdata_bgimg img {float: left;}
.ycdata_info {margin-top:0;border-bottom:none;}
.ycdata_info_inlist{height:68px;background-color: #f6f3f3;}
.data_info_gzs{margin-top:34px;}

.tx_wktwo {margin-bottom: 30px;border-left: 1px solid #eeeeee;border-right: 1px solid #eeeeee;border-bottom: 1px solid #eeeeee;border-top: 1px solid #eeeeee;border:none;}
.tx_titlewk{display:none;}
.tx_content table {width: auto;margin-bottom: 0px;border:1px solid #efefef;}
.bth{background-color: #f8fafa;}
<!--奇数行-->
.bjs{background-color: #fffaf7;}
<!--偶数行-->
.bos{background-color: #fff;}
.tx_content table tr th {font-size:16px;color:#666;padding: 27px 18px;border:none;text-align: center;max-height:98px;overflow:hidden;}
.tx_content table tr td {height: 48px;font-size:16px;color:#666;padding: 25px 18px;border:none;text-align: center;max-height:98px;overflow:hidden;}

.tx_content table tr th, td a{color:#666;}
.tx_content table tr th{color:#666;font-size:20px;font-weight:normal;}
.thwidth{width:406px;}
.thlwidth{width:120px;}
.tx_content table tr:hover{background-color: #e7faf9!important;}
.tx_content table tr .guide {background: url("../image/ico_guide.png") no-repeat center;}
.tx_content table tr .guide:hover {background: url("../image/ico_guide2.png") no-repeat center;}
.tx_content table tr .word {background: url("../image/ico_word.png") no-repeat center;}
.tx_content table tr .word:hover {background: url("../image/ico_word2.png") no-repeat center;}
.tx_content table tr .alink {background: none;color: #fc8179;padding: 5px 10px;border:1px solid #fc8179;float:left;}
.tx_content table tr .awlink {background: #e7e7e7;color: #666;padding: 5px 19px;border:none;}
.tx_content table tr .alink:hover{background: #fc8179;} 
.tx_content table tr .awlink:hover{background: #e7e7e7;}
.ycdata_center_inlist {padding: 25px 0;} 
.qttishitd{position:relative;}
.qttishi{display:none;position:absolute;width:396px;left:327px;top:140px;color:#fff;}
.qttishinei{padding:25px;background:#949292;} 
.qttishi p{background:url('../image/xsj.png') no-repeat 328px bottom;}
.sbts{color: #f00;font-weight: bold;display: block;line-height: 18px;font-size: 14px;}


</style>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>



<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/data/zcsbbanner_03.png" alt="背景图">
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
	<%--<div class="ycdata_title widthbox widthbox_inlist">
		<div class="intrestlistwk">
			<div class="blockwk">
				<div class="li" style="background:url('../img/img_02.png') no-repeat center;">
					<a href="/interestapp/selectList.html">
						<p class="t">贴息申报入口</p>
						<p><span class="w"><span class="st">进入</span><span class="sjx">&nbsp;&nbsp;&nbsp;</span></span></p>
						<div class="yy"></div>
					</a>
					
				</div>
				<div class="jj" style="font-size:12px">成都高新区利息补贴和担保补贴在此申报（申报截止日为2016-10-31）</div>
			</div>
			
		</div>
	</div>
	--%>
		<div style="margin-top: 30px;margin-bottom: 40px;height:187px;background:url('../image/data/zzsb.png') no-repeat center;"></div>
		<div style="position: relative;text-align: center;height:42px;"><s:if test="#request.isUser == 1"><a href="/declare_base/selectAllBT.html?type=allbt&init=y" style="color: red;">当前您已经提交的申报：<s:property value="#request.committed"/>条&nbsp;&nbsp;&nbsp;&nbsp;未提交的：<s:property value="#request.uncommitted"/>条&nbsp;&nbsp;&nbsp;&nbsp;审核通过的：<s:property value="#request.passed"/>条&nbsp;&nbsp;&nbsp;&nbsp;驳回的的：<s:property value="#request.backed"/>条</a><br><br></s:if></div>
		<div class="tx_wk">
		<div class="tx_wktwo tx_wktwo1">
			<div class="tx_titlewk"><div class="tx_title"><span class='first'>政策申报</span></div></div>
			<div class="tx_content">
			<div class='tx_table'>
				<table class="qttishitd">
					<tr class="bth">
						<th class="thlwidth">政策条款</th>
						<th style="width:130px;">申报时间</th>
						<th class="thwidth">适用群体</th>
						<th style="width:132px;">政策核心内容</th>
						<th style="width:88px;">操作指南</th>
						<th style="width:190px;">操作</th>
					</tr>
					
					
          
          
         	<s:iterator value="#request.list">
			
	         		 <tr class="indexId">
						<td><a href='/interestapp!zaixianshenbaoDetail?e.id=<s:property value="id"/>'>  <s:property value="mingcheng"/> </a> </td>
						<td><a href='/interestapp!zaixianshenbaoDetail?e.id=<s:property value="id"/>'><s:property value="time"/></a></td>
						<td class="tstd"><a href='/interestapp!zaixianshenbaoDetail?e.id=<s:property value="id"/>'><s:property value="shiyingqunti.substring(0, 21)+ '...'"/></a><br/>
						
							<div class="qttishi">
								<p>&nbsp;</p>
								<div class="qttishinei">
									<s:property value="shiyingqunti"/>
								</div>
							</div>
						
						</td>						
						<td class='guide'><div style="display:none;"><s:property value="hexinneirong"/> 
						</div><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
						<td class='word'><a href='/download.action?number=3&id=<s:property value="id"/>'><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></a></td>
						
						<%  
							if(SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO).equals("1")){
						%>
							<td><a class="alink" href='<s:property value="shenbaolujing"/>'>进入申报</a></td>						
						<%
						} else {
							%>
							<td><a class="alink awlink"  href='javascript:alert("未到申报开放期，暂不能申报")'>未开放</a></td>
							<%						
						}%>
					 
					 
					</tr>

            
			</s:iterator>
					
				 
				</table>
				</div>
				
			</div>
		</div>
		
	</div>
	
	
</div>
<!--我要参加弹出框 start-->
<style>
#ldksq #ldksq_c {width: 720px;max-height: 420px;}
#ldksq_c #ldksq_content {padding: 10px;text-align: justify;overflow-y: scroll;/*height:365px;*/margin-top:15px;line-height:34px;text-shadow:1px 1px 1px #F2ECEC;}
</style>
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <div id="ldksq_content"></div>
        
    </div>
</div>
<!--我要参加弹出框 end-->

 
 
 <script>
 //页面加载完时重新定位.qttishi的top值，每个为第一个的值加上个数*每行tr的高度
 function resetTishi(){
 	var firsttop = $(".qttishi").eq(0).css('top');
 		firsttop = firsttop.substr(0, firsttop.length - 2);;
 	var nowtop
 	$(".qttishi").each(function(i,v){
 		nowtop = (firsttop*1+(i*98));
 		$(this).css("top",nowtop);
 		
 	});
 	
 	
 	$(".tstd").hover(function(){
 		$(this).children(".qttishi").stop().fadeIn();
 	},function(){
 		$(this).children(".qttishi").stop().fadeOut();
 	});
 	
 	
 	 $('.qttishitd').find('.indexId').each(function (i) {

		 if ((i + 2) % 2  == 0) {
			 $(this).addClass('bjs').css("background-color","#fffaf7");
		 } else {
			  $(this).addClass('bos').css("background-color","#fff");
		 }
	 });
 	
 }
 
 $(document).ready(function(){
 	
 	resetTishi();

	
 });
 
 
 
 
 
 
 
 
 
 
 
 
 
 
//贴息切换
 var tx_title_span1 = $('span','.tx_wktwo1 .tx_title');
 var tx_content_tx_table1 = $('.tx_table','.tx_wktwo1 .tx_content');
 tx_title_span1.eq(0).addClass('active');
 tx_content_tx_table1.eq(0).fadeIn('slow');
 tx_title_span1.click(function(){
	 $(this).addClass('active').siblings().removeClass('active');
	 spanindex1 = $(this).index();	 

	 var flag = tx_content_tx_table1.eq(spanindex1).css("display");
     if (flag == "none") {
    	 tx_content_tx_table1.eq(spanindex1).fadeIn('slow').siblings().hide();
     }

     else {
    	 tx_content_tx_table1.eq(spanindex1).hide();
     }
	 //tx_content_tx_table1.eq(spanindex1).fadeIn('slow').siblings().hide();
	 
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
			 resetTishi();
			
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

 
