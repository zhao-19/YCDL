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
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/data/data_img.png" alt="背景图">
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>工作室</li>
		</div>
		<div class="data_info_search fr">
			<input id="contentquery" type="text" value="请输入关键词名称"  onkeypress="if (event.keyCode == 13)  doquery()" onfocus="if(value=='请输入关键词名称'){value=''}" onblur="if(value==''){value='请输入关键词名称'}">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>

 

<div class="ycdata_center">
	<div class="ycdata_title widthbox">
		<div class="data_title_head">
			<div class="name fl">
				<li>工作室名称</li>
			</div>
			<div class="scale fl">
				<li>学历</li>
			 
			</div>
			<div class="profession fl">
				<li>专业</li>
			 
			</div>
			<div class="school fr">
				<li>毕业学院</li>
			 
			</div>
		</div>
		
	 <div class="ycdata_box">  <!-- 列表x -->
		<div class="hidden">
			 <s:iterator value="pager.list">
				
				<div class="ycdata_list widthbox fl">
					<div class="data_list_name fl">
						<a href=''><img class="fl" src="../image/data/listimg.jpg" alt="list图片">
						<li class="data_list_name_info fl">  <s:property value="username"/>  </li></a>
					</div>
					<div class="data_list_scale fl">
						<li><s:property value="education"/> </li>
					</div>
					<div class="data_list_profession fl">
						<li><s:property value="subject"/></li>
					</div>
					<div class="data_list_school fl">
						<li><s:property value="graduate"/></li>
					</div>
				</div>
				
			</s:iterator>
			
		
		</div>	
			<ul class="morebox"></ul>
			<li id="loadmorewordh" onClick="lanren.loadMore();" style="margin-top:15px;">查看更多</li>
		
	 </div>	
	</div>
</div>





<script>
	var dataNum;
	var pagesize = 8;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".hidden .ycdata_list");
            $(".morebox").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".morebox");
            }
            $(".morebox .ycdata_list").each(function(){
                $(this).attr('.ycdata_list',$(this).attr('.ycdata_list'));
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
      var mLis = $(".morebox .ycdata_list").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              
            
              if($('.ycdata_list').length>=dataNum-1){
                  $('#loadmorewordh').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
                  return false;
              }
              $(".morebox").append(target);
              $(".morebox .ycdata_list").eq(mLis+i).each(function(){
                  $(this).attr('.ycdata_list',$(this).attr('.ycdata_list'));
              });
           }
           $('#loadmorewordh').html("加载更多");
     }
    function queryData(){
   		queryDataCount = queryDataCount+1;
    	var _url = "/news/toList2.html?page="+queryDataCount;
//	alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  beforeSend : function () {
              $("#loadmorewordh").html("数据拼命加载中...");
          },
		  success: function(data){
			  console.log(data[1]);
			  dataNum=data.length;
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
			  }
			  for(var i=0;i<data.length;i++ ){  
			  	var aaa = data[i];	
			  	
 			    _content.push(
			    	"<div class=\"ycdata_list widthbox fl\">"+
					"<div class=\"data_list_name fl\">"+
						"<a href ='#'><img class='fl' src='../image/data/listimg.jpg' alt='list图片'>"+
 						"<li class=\"data_list_name_info fl\"> "+data[i].username+" </li></a>"+
					"</div>"+
					"<div class=\"data_list_scale fl\">"+
						"<li>"+data[i].education+"</li>"+
					"</div>"+
					"<div class=\"data_list_profession fl\">"+
						"<li>"+data[i].subject+"</li>"+
					"</div>"+
					"<div class=\"data_list_scale fl\">"+
						"<li>成绩</li>"+
					"</div>"+
				"</div>"
				);
		  } 
			  console.log(_content.length);
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
		var url = '/data/toPersonList.html?t=q&q='+query;
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
 menu_init("data");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>

