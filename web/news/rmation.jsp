<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
<head>
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
   <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>


<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/box/rm_bg1.jpg" alt="背景图">
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>盈创资讯</li>
		</div>
		<div class="data_info_search fr">
			<input id="queryx" type="text" onkeypress="if (event.keyCode == 13)  doquery()" value="请输入搜索名称" onfocus="if(value=='请输入搜索名称'){value=''}" onblur="if(value==''){value='请输入搜索名称'}">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>


<!-- 资讯列表 -->
<div class="rmation widthbox">
    <div class="lanren">
        <div class="hidden">
        
        
        <s:iterator value="pager.list">
        
        		
			<div class="outside_bor">
				<div class="img fl"  >
				 <img  style="width: 207px;height: 138px;" alt="<s:property value="title" />" src="<s:property value="cover" />">
				
				</div>
				<div class="info fr">
					<div class="title"><a href="/newsdetail/<s:property value="id"/>.html"><s:property value="cataid"/> <s:property value="title"/></a></div>
					<div class="datatime">
						<li class="time fl"><s:property value="sendtime"  /></li>
						<div class="source fl">来源：<s:property value="source"/></div>
					</div>
					<div class="center">  <s:property value="show"/> <a href="/newsdetail/<s:property value="id"/>.html">[更多+]</a></div>
				</div>
			</div>


		</s:iterator>

            </div>
                <ul class="listjz widthbox"></ul>
                <div class="dianji" onClick="lanren.loadMore();"><div class="morejz widthbox" id="loadmoreword">加载更多 </div></div>
             </div>
</div>

   


<script>
	var pagesize = 20;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".lanren .hidden .outside_bor");
            $(".lanren ul.listjz").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".lanren ul.listjz");
            }
            $(".lanren ul.listjz .outside_bor").each(function(){
                $(this).attr('.outside_bor',$(this).attr('.outside_bor'));
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
      var mLis = $(".lanren ul.listjz .outside_bor").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              if(!target){
                  $('#loadmoreword').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
                  return false;
              }
              $(".lanren ul.listjz").append(target);
              $(".lanren ul.listjz .outside_bor").eq(mLis+i).each(function(){
                  $(this).attr('.outside_bor',$(this).attr('.outside_bor'));
              });
           }
           $('#loadmoreword').html("加载更多");
     }
    function queryData(){
   		queryDataCount = queryDataCount+1;
    	var _url = "/news/toList2.html?page="+queryDataCount;
//	alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
			  }
			  for(var i=0;i<data.length;i++ ){  
  			    _content.push(
			    	"<div class=\"outside_bor\">"+
					"<div class=\"img fl\">"+
					"<img  style=\"width: 207px;height: 138px;\"   src=\""+data[i].cover+"\" alt=\"\">"+
					"</div>"+
					"<div class=\"info fr\">"+
					"<div class=\"title\"><a href=\"/newsdetail/"+data[i].id+".html\">"+data[i].title+"</a></div>"+
					"<div class=\"datatime\">"+
						"<li class=\"time fl\">"+data[i].sendtime+"</li>"+
						"<div class=\"source fl\">来源：<a href=\"\">"+data[i].source+"</a></div>"+
					"</div>"+
						"<div class=\"center\">"+data[i].show+"<a href=\"/newsdetail/"+data[i].id+".html\">[更多+]</a></div>"+
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
    /*var query = $('#query').val();
    alert(query);
 	if(query=='') {
		
	}else {
		var url = '/news/toList.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
	
	*/
	 var query2 = $('#queryx').val();
 	if(query2=='') {
		
	}else {
		var url = '/news/toList.html?t=q&q='+query2;
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
 menu_init("news");
</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>
</body>
</html>
