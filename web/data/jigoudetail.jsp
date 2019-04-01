<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.jigou.bean.Jigou"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>



<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/data/zcsbbanner_02.png" alt="背景图">
</div>

<%--<div class="ycdata_info ycdata_info_inlist">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>政策申报</li>
		</div>
		<div class="data_info_search fr " style="border:none;">
		</div>
	</div>
</div>

--%>
<div class="ycdata_center ycdata_center_inlist jigoudetail">
	<div class="ycdata_title widthbox widthbox_inlist jigoudetailwk">
		<div class="jigoudetailwk_left">
			<div class="top">
				<p class="title"><span>点击排行</span></p>
				
				
				<% for (int i = 0;i<SystemManager.indexPage.getJigouList().size();i++) {
					Jigou j = SystemManager.indexPage.getJigouList().get(i);
			 
					String name = j.getJigoumingcheng();					
					String gszcd_province = j.getGszcd_province();
					String id = j.getId();
					if(gszcd_province==null)
						gszcd_province = "";
				 out.print("<div class=\"list list"+(i+1)+"\">");
					 out.print("<a href=\"/data!getJigouInfo.action?e.id="+id+"\">");
						 out.print("<p class=\"ejtitle\">"+name+"</p></a>");
						 out.print("<p class=\"ejjj\">"+gszcd_province+"</p>");
				 out.print("</div>");

				}%>
				
				 
			</div>
		 
		</div>
		<div class="jigoudetailwk_right">
			<p class="title"><span>机构介绍</span></p>
			<div class="con">
				<div class="content">
				<!-- 	<div class="left" style="background: #fafafa url('../img/toux.png') no-repeat 0px;"></div> -->
					<div class="right">
						<p class="ejtitle"><s:property value="jigou.jigoumingcheng"/></p>
						<div class="jj">  
 						</div>
 					</div>
				</div>
			</div>
			<div class="detail">
				<p class="title xxtitle"><span>详细信息</span></p>
				<ul>
				<!-- 	<li style="    width: 100%;"><span class="t">机构LOGO:</span><span class="jj"><img src="../img/jglogo.png"/></span></li> -->		
 				<!-- 	<li><span class="t">机构类型:</span><span class="jj">天使投资</span></li>
					<li><span class="t">组织机构代码:</span><span class="jj">组织机构代码</span></li>
					<li><span class="t">注册时间:</span><span class="jj">2016年8月16日</span></li> -->
					<li><span class="t">注册资本:</span><span class="jj"> <s:property value="jigou.zhuceziben"/> 万元</span></li>
			 	<!-- <li><span class="t">工商注册地:</span><span class="jj"><s:property value="jigou.gszcd_province"/>  <s:property value="jigou.gszcd_city"/>  <s:property value="jigou.gszcd_county"/> </span></li> -->
			 		<li><span class="t">工商注册地:</span><span class="jj"><s:property value="jigou.zhucediid"/>  
					<li><span class="t">机构服务内容:</span><span class="jj"><s:property value="jigou.fuwuneirong"/></span></li>
				    <li><span class="t">机构服务案例:</span><span class="jj"><s:property value="jigou.fuwuanli"/></span></li>
			<!-- 
					 -->
					<li><span class="t">办公地址:</span><span class="jj"><s:property value='jigou.bangongdizhi'/></span></li>				
					<li><span class="t">网址:</span><span class="jj"><s:property value='jigou.wangzhi'/></span></li>				
					<li><span class="t">管理资本金:</span><span class="jj"><s:property value='jigou.tz_glzbj'/> 万元</span></li>
									
				<!--	<li><span class="t">基金性质:</span><span class="jj">天使投资</span></li>				
					 -->
					<li><span class="t">投资行业:</span><span class="jj"><s:property value='jigou.tz_touzihangye'/></span></li>				
					<li><span class="t">投资阶段:</span><span class="jj"><s:property value='jigou.tz_touzijieduanid'/></span></li>				
					<li><span class="t">投资额度:</span><span class="jj"><s:property value='jigou.tz_touziedu'/></span></li>		
							
					<li><span class="t">联系人姓名:</span><span class="jj"><s:property value='jigou.xingming'/></span></li>				
					<li><span class="t">职务:</span><span class="jj"><s:property value='jigou.bumenzhiwu'/></span></li>				
					<li><span class="t">移动电话:</span><span class="jj">****</span></li>				
					<li><span class="t">固定电话:</span><span class="jj"><s:property value='jigou.gudingdianhua'/></span></li>				
				</ul>
			</div>
		
		</div>
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
                  $('#loadmorewordh').html("<p>亲，没有数据可以加载了！！！</p>");
                  break;
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
</script>
 
 
<script>
 menu_init("data");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>

 
