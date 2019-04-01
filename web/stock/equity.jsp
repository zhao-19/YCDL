<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!doctype html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/equity.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/about.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>
<style>
.equity_cj_menu_box ul li {
    height: 48px;
    line-height: 44px;
    margin-right:0px;
}
	.attentionBox2 div{float: left;}
	.attentionStar2{width:80px;margin-top:4px;}
	.attentionStar2 b{float: left;font-weight: normal;}
	.attentionStar2 span{width:16px;float: left;height:16px;margin-top:-2px;background: url("../image/stars.png") no-repeat 0px 0;;}
	.attentionStar2 span.full-star{background-position: -21px 0;}
	.attentionStar2 span.half-star{background-position: -42px 0;}
	.item_cj_right_price{padding-top:0px;padding-bottom: 0px;}
	.item_cj_right_price_1{margin-bottom: 0px;}
</style>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 内容部分 -->

<div class="ycdata_bgimg">
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/box/equity_banner1.jpg"/>
</div>

<div class="equity_cj_menu_box">
    <div class="cj_container">
        <!--股权融资菜单start-->
        <div class="equity_cj_menu_nav_bar">
            <%--<div class="equity_cj_menu_nav_left">
                 <ul>
                     <li>
                         <a href="">股权融资</a>
                     </li>
                    <!--  <li>
                         <a href="">全部</a>
                     </li>
                     <li>
                         <a href="">融资中</a>
                     </li>
                     <li>
                         <a href="">约咖中</a>
                     </li>
                     <li>
                         <a href="">融资成功</a>
                     </li>
                      -->
                 </ul>
            </div>
            
            --%><div class="woshichuangyezhe woshi"><a href="/user/login.html?bzf=c">我是创业者</a></div>
            <div class="woshitouzizhe woshi"><a href="/user/login.html?bzf=t">我是投资者</a></div>

            <div class="equity_cj_menu_nav_right">
                 <input type="text" id="contentquery" onkeypress="if (event.keyCode == 13)  doquery()"
                  placeholder="请输入关键词名称" placeholder="请输入关键词名称" 
                 onfocus="if(placeholder=='请输入关键词名称'){placeholder=''}" onblur="if(placeholder==''){placeholder='请输入关键词名称'}"/>
                 <a href="javascript:doquery()"><span class="glyphicon_search"></span></a>
            </div>
            

        </div>
        <!--股权融资菜单end-->
    </div>
</div>

<!-- 项目/机构服务流程 -->
<div class="xmjgfwlc_wk">
	<div class="xmjgfwlc">
		<p class="t">融资流程</p>	
		<ul>
			<li>
				<h2><span class="s1">1</span>网上申请<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;登陆平台，注册账号，填写信息。</span></p>
			</li>
			<li>
				<h2><span class="s2">2</span>平台辅导<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;1周内，帮助梳理融资信息，进行融资宣传。<br/>&nbsp;&nbsp;&nbsp;&nbsp;2周内，开展项目约谈，并签订服务协议。</span></p>
			</li>
			<li>
				<h2><span class="s3">3</span>项目推送<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;每月向机构短信告知平台上线企业。<br/>&nbsp;&nbsp;&nbsp;&nbsp;不定期开展融资对接会。<br/>&nbsp;&nbsp;&nbsp;&nbsp;促成优质项目与机构约谈。</span></p>
			</li>
			<li>
				<h2><span class="s4">4</span>融资服务<span class="jt">&raquo;</span></h2>
				<p class="d"><span>&nbsp;&nbsp;&nbsp;&nbsp;提供融资咨询服务。不限于解决融资有关的法律、财务、企业经营等问题。<br/>&nbsp;&nbsp;&nbsp;&nbsp;提供融资培训服务。融资专业导师授课，破译融资难点痛点。<br/>&nbsp;&nbsp;&nbsp;&nbsp;提供融资谈判辅助服务。专业财务顾问，辅助融资谈判，降低融资成本，防范融资风险。</span></p>
			</li>
						
			<div class="clear"></div>
			
			
			
		</ul>
		
		
	</div>
	<style>
	.xmjgfwlc li {
   		 max-width: 240px;
	}
	</style>


<%--<div class="xmjgfwlc">
		<p class="t">机构服务流程</p>	
		<ul>
			<li>
				<h2><span class="s1">1</span>签订协议<span class="jt">&raquo;</span></h2>
				<p class="d"><span>如有意愿与平台合作，双方可签订合作协议</span><a href="/newsdetail/16612.html">详情</a></p>
			</li>
			<li>
				<h2><span class="s2">2</span>融资咨询<span class="jt">&raquo;</span></h2>
				<p class="d"><span>项目BP包装，融资及企业发展，政策问题等咨询服务</span><a href="/newsdetail/16612.html">详情</a></p>
			</li>
			<li>
				<h2><span class="s3">3</span>项目推递<span class="jt">&raquo;</span></h2>
				<p class="d"><span>向意向合作方推送项目</span><a href="/newsdetail/16612.html">详情</a></p>
			</li>
			<li>
				<h2><span class="s4">4</span>对接洽谈<span class="jt">&raquo;</span></h2>
				<p class="d"><span>安排项目洽谈</span><a href="/newsdetail/16612.html">详情</a></p>
			</li>
			<li>
				<h2><span class="s5">5</span>谈判辅助<span class="jt">&raquo;</span></h2>
				<p class="d"><span>由专业投资人在线介绍项目情况</span><a href="/newsdetail/16612.html">详情</a></p>
			</li>
			<li>
				<h2><span class="s6">6</span>获取融资<span class="jt">&raquo;</span></h2>
				<p class="d"><span>项目在获取融资后支付平台服务费用</span><a href="/newsdetail/16612.html">详情</a></p>
			</li>
			<div class="clear"></div>
			
			
			
		</ul>
		<p class="t">项目服务流程</p>
		<ul>
				<li>
					<h2><span class="s1">1</span>网上申报<span class="jt">&raquo;</span></h2>
					<p class="d"><span>项目按要求填写完整才可以上传</span><a href="/newsdetail/16612.html">详情</a></p>
				</li>
				<li>
					<h2><span class="s2">2</span>资料审核<span class="jt">&raquo;</span></h2>
					<p class="d"><span>5个工作日的时间之内会收到反馈结果</span><a href="/newsdetail/16612.html">详情</a></p>
				</li>
				<li>
					<h2><span class="s3">3</span>平台约谈<span class="jt">&raquo;</span></h2>
					<p class="d"><span>平台工作人员线下与项目负责人详细了解情况</span><a href="/newsdetail/16612.html">详情</a></p>
				</li>
				<div class="clear"></div>
			</ul>
	</div>
--%></div>
<!-- 资讯列表 -->
<div class="rmation widthbox">
    <div class="lanren">
        <div class="hidden">
        <s:iterator value="pager.list">
   		<div class="equity_cj_content_item">
               <div class="item_cj_left">
                	<!--style="width: 840px;height: 349px;"-->
                    <img title="<s:property value="MINGCHENG" />"  src="<s:property value="TUIJIANPIC" />" style="width: 100%;height:100%;">
                   <div class="equity_cj_state">
                          <s:property value="BIAOQIAN"/>  
                   </div>
               </div>
               <div class="item_cj_right">
                 <div class="item_cj_right_title">
                      <s:property value="MINGCHENG"/>
                 </div>
                 <div class="item_cj_right_intro">
                      <h3>融资简介：</h3>
                      <p>    <s:property value="JIANJIE"/>
                       </p>
                 </div>
                 <div class="item_cj_right_price">
                      <div class="item_cj_right_price_1">
                          出让股权比例：<span><s:property value="CRGQBL"/> %</span>
                      </div>
                      <div class="item_cj_right_price_1">
                          融资金额（万元）：<span><s:property value="RONGZIEDU"/> 万</span>
                      </div>
                      <div class="item_cj_right_price_1">
                          	推荐机构数：<span><s:property value="emailcount"/>家</span>
                      </div>
                      <div class="item_cj_right_price_1">
							<div class='attentionBox2'>
								<div>关注度：</div>
								<div class='attentionStar2' name="<s:property value='BROWSECOUNT'/>">
									<span></span><span></span><span></span><span></span><span></span>
								</div>
							</div>
                      </div>
                      <div class="zqrzjdt"></div>
                 </div>
                 <a href="/stockdetail/<s:property value="ID"/>.html" target='_black'>
                 	<div class="item_cj_right_bottom">详细信息</div>
                 </a>
              </div>
        </div>
		</s:iterator>
         </div>
                <ul class="listjz widthbox"></ul>
                <div class="dianji" onClick="lanren.loadMore();"><div class="morejz widthbox" id="loadmoreword">加载更多 </div></div>
           </div>
</div>
<script type="text/javascript">
function star(){
	function getCount(count) {
		var num = 0;
		if (count <= 100) {
			num = 2;
		} else if(count <= 200) {
			num = 3;
		} else if(count <= 250) {
			num = 3.5;
		} else if(count <= 300) {
			num = 4;
		} else if(count <= 600) {
			num = 4.5;
		} else if(count > 600) {
			num = 5;
		}
		return num;
	}
	$(".attentionStar2").each(function(){
		var count = getCount($(this).attr("name"));
        var countInt=parseInt(count);
        $(this).children('span:lt('+countInt+')').addClass('full-star');
      	if(countInt!=count){
          $(this).children('span:nth-child('+(countInt+1)+')').addClass('half-star');
      	}
	});
}
star();
</script>
 <!--股权融资进度条-->
<script type="text/javascript">
/*
	$(document).ready(function(){
		var leftval = 30;
		var rightval = 100-leftval;
		$(".zqrzjdt_left").css("width",leftval+"%");
		$(".zqrzjdt_right").css("width",rightval+"%");
	});
*/
</script>
<script>
	var pagesize = 20;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".lanren .hidden .equity_cj_content_item");
            $(".lanren ul.listjz").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".lanren ul.listjz");
            }
            $(".lanren ul.listjz .equity_cj_content_item").each(function(){
                $(this).attr('.equity_cj_content_item',$(this).attr('.equity_cj_content_item'));
            })
            for(var i=lanren._default;i<lis.length;i++){
                _content.push(lis.eq(i));
            }
            $(".lanren .hidden").html("");
        },
        
        loadMore:function(){
        	//alert($('#loadmoreword').html());
        	//$('#loadmoreword').html("<p>玩命加载中，请稍后...</p>");
        	
        	document.getElementById("loadmoreword").innerHTML="玩命加载中，请稍后...";
        	var test = document.getElementById("loadmoreword").innerHTML;
        	
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
      var mLis = $(".lanren ul.listjz .equity_cj_content_item").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              if(!target){
                  //$('#loadmoreword').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
                  //return false;
              }
              $(".lanren ul.listjz").append(target);
              $(".lanren ul.listjz .equity_cj_content_item").eq(mLis+i).each(function(){
                  $(this).attr('.equity_cj_content_item',$(this).attr('.equity_cj_content_item'));
              });
           }
           //$('#loadmoreword').html("加载更多");
     }
    function queryData(){
   		queryDataCount = queryDataCount+1;
    	var _url = "/stock/toList2.html?page="+queryDataCount;
//	alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  dataType:"json",
		  async:false,
		  success: function(data){
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
			  }
			  for(var i=0;i<data.length;i++ ){  
			  	var aaa = data[i];
 			    _content.push(
			    	"<div class=\"equity_cj_content_item\">"+
               "<div class=\"item_cj_left\">"+
                   " <img title=\""+data[i].MINGCHENG+"\" src="+data[i].TUIJIANPIC+" />"+
                  " <div class=\"equity_cj_state\">"+data[i].BIAOQIAN+"</div>"+
              " </div>"+
               "<div class=\"item_cj_right\">"+
                       "<div class=\"item_cj_right_title\">"+data[i].MINGCHENG+"</div>"+
                       "<div class=\"item_cj_right_intro\">"+
                            "<h3>融资简介：</h3>"+
                            "<p>  "+data[i].JIANJIE+"</p>"+
                       "</div>"+
                       "<div class=\"item_cj_right_price\">"+
                            "<div class=\"item_cj_right_price_1\">"+
                              "  出让股权比例：<span>"+data[i].CRGQBL+"%</span>"+
                            "</div>"+
                           " <div class=\"item_cj_right_price_1\">"+
                             "   融资金额（万元）：<span>"+data[i].RONGZIEDU+"万</span>"+
                           " </div>"+
							"<div class=\"item_cj_right_price_1\">"+
                    			"推荐机构数：<span>"+data[i].emailcount+"家</span>"+
                      		"</div>"+

                    "<div class=\"item_cj_right_price_1\">"+
                    "<div class='attentionBox2'>"+
                    "<div>关注度：</div>"+
                    "<div class='attentionStar2' name="+data[i].BROWSECOUNT+">"+
                    "<span></span><span></span><span></span><span></span><span></span>"+
                    "</div>"+
                    "</div>"+
                    "</div>"+
                    "<div class=\"zqrzjdt\"></div>"+
                       "</div>"+
                   " <a href=\"/stockdetail/"+data[i].ID+".html\" target='_black'>  <div class=\"item_cj_right_bottom\">"+
                         "详细信息"+
                      "</div></a>"+
              "</div>"+
       " </div>"
				);
		  } 
		  if (data.length > 0 ) {
		  	$('#loadmoreword').html("加载更多");
		  } else {
		  	$('#loadmoreword').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
		  }
		  
			 loadData();
              star();
			
		  },
		  error:function(){
			return null;
		  }
		});

//		$(".zqrzjdt").hover(function(){
//			//alert($(this).prev().html());return;
//			$(this).prev().fadeIn();
//		},function(){
//			$(this).prev().hide();
//		});
		
		return false;
    }
    
</script>
<script>
function doquery(){
    var query = $('#contentquery').val();
 	if(query=='') {
		
	}else {
		var url = '/stock/toList.html?t=q&q='+query;
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
 menu_init("stock");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

<script>
    eval(function(p, a, c, k, e, d) {
        e = function(c) {
            return (c < a ? "": e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
        };
        if (!''.replace(/^/, String)) {
            while (c--) d[e(c)] = k[c] || e(c);
            k = [function(e) {
                return d[e]
            }];
            e = function() {
                return '\\w+'
            };
            c = 1;
        };
        while (c--) if (k[c]) p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c]);
        return p;
    } ('1M(17(p,a,c,k,e,r){e=17(c){18(c<a?\'\':e(1w(c/a)))+((c=c%a)>1s?1b.1r(c+1q):c.1v(1u))};19(!\'\'.1a(/^/,1b)){1c(c--)r[e(c)]=k[c]||e(c);k=[17(e){18 r[e]}];e=17(){18\'\\\\w+\'};c=1};1c(c--)19(k[c])p=p.1a(1t 1y(\'\\\\b\'+e(c)+\'\\\\b\',\'g\'),k[c]);18 p}(\'i h$=[\\\'\\\\E\\\\n\\\\x\\\\s\\\\j\\\',"\\\\l\\\\m\\\\v\\\\o","\\\\o\\\\j\\\\G\\\\p","\\\\r\\\\q\\\\H\\\\l\\\\I\\\\J\\\\K",\\\'\\\\M\\\',"\\\\m\\\\j\\\\j\\\\s",\\\'\\\\v\\\\p\\\\m\\\\k\\\\k\\\',"\\\\k\\\\n\\\\p\\\\r\\\\j","\\\\O","","\\\\p\\\\l\\\\q\\\\Q\\\\j\\\\o","\\\\n\\\\R\\\\k\\\\o",\\\'\\\\S\\\\T\\\\V\\\\z\\\\A\\\\B\\\\C\\\\D\\\\u\\\\F\\\',"\\\\n\\\\m\\\\s\\\\k\\\\l\\\\u\\\\q\\\\j","\\\\16\\\\x\\\\r\\\\q",\\\'\\\'];$(y(){$(h$[0])[h$[1]](y(){i a=$(t)[h$[2]]();L(a[h$[3]](h$[4])!=-w){N};i b=$(t)[h$[5]](h$[6]);P{b=(b[h$[7]](h$[8]))[w];i c=b[h$[7]](h$[9]);i d=c[h$[10]];i f=[];U(i g=W;g<d;g++){f[h$[11]](h$[12][h$[3]](c[g]))};$(t)[h$[2]](X[h$[13]](f[h$[14]](h$[15]))>>Y)}Z(e){}})})\',1A,1B,\'|||||||||||||||||1C|1x|1z|1p|1h|1i|1d|1e|1f|1m|1n|1o|1g|1k|1l|1j|1W|17|1X|1Y|1V|1S|1T|1U|1Z|23|25|24|20|21|19|22|18|1R|1H|1I|1J|1G|1D|1E|1F|1O|1P|1Q|1N|||||||1K\'.1L(\'|\'),0,{}))', 62, 130, '|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||function|return|if|replace|String|while|x70|x68|x6c|this|x65|x61|0x1|x49|x63|x6e|x69|x72|x73|29|fromCharCode|35|new|36|toString|parseInt|var|RegExp|x74|62|69|_|x42|for|x43|x41|try|x67|x75|x6a|split|eval|catch|0x0|window|0x3|x20|x47|x48|x2e|x46|x6f|x44|x45|x5a|x4f|x66|x2a|x6d|x78|x64'.split('|'), 0, {}))
</script>
</body>
</html>