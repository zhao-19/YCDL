<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/index.css"/>
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/index.js"></script>
</head>
<body>


<!-- 网站头部 -->
<div class="nav widthbox">
    <div class="logo fl"><img src="../image/index/logo.jpg" alt="logo"></div>
    <div class="nav_right fr">
               <%@ include file="../userinfo.jsp"%>

    <%@ include file="../menu.jsp"%>

    </div>
</div>

<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/box/dl_bg.png" alt="背景图">
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>资料下载</li>
		</div>
		<div class="data_info_search fr" >
			<input id="querycontent" type="text" value="请输入搜索关键字" onfocus="if(value=='请输入搜索关键字'){value=''}" onblur="if(value==''){value='请输入搜索关键字'}">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>


<div class="download widthbox">   
 		<div class="hidden">
	   		<s:iterator value="pager.list" >
	        
		        <div class="border fl">
					<div class="title_img">
						<div class="fk"> <s:property value="id" /></div><br/>
						<div class="title fl"> <s:property value="title" /> </div>
					</div>
					<div class="type">
						<img class="type1 fl" src="../icon/<s:property value="extfilename" />.png" alt="资料文件类型图标">
						<li class="type2 fl"> 资料 </li>
					</div>
					<div class="content">
						<li><s:property value="contents" /></li>
					</div>
					<div class="button"><a href="/download.action?number=2&id=<s:property value="id" />" target="_blank">点击下载</a></div>
				</div>
	  
		
			</s:iterator>
		</div>
		
		<ul class="morebox"></ul>

		<li id="loadmorewordh" onClick="lanren.loadMore();" >查看更多</li>
		

</div>









<script>
	var pagesize = 8;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".hidden .border");
            $(".morebox").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".morebox");
            }
            $(".morebox .border").each(function(){
                $(this).attr('.border',$(this).attr('.border'));
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
      var mLis = $(".morebox .border").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              if(!target){
                  $('#loadmorewordh').html("<p>亲，没有数据可以加载了！！！</p>");
                  break;
              }
              $(".morebox").append(target);
              $(".morebox .border").eq(mLis+i).each(function(){
                  $(this).attr('.border',$(this).attr('.border'));
              });
           }
           $('#loadmorewordh').html("加载更多");
     }
    function queryData(){
   		queryDataCount = queryDataCount+1;
    	var _url = "/files/toList2.html?page="+queryDataCount;
//	alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  //dataType:"json",
		  //async:false,
	
	      beforeSend : function () {
              $("#loadmorewordh").html("数据拼命加载中...");
          },
		  success: function(data){
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
				  $("#loadmorewordh").html("没有更多数据了");
			  }
			  for(var i=0;i<data.length;i++ ){
 			    _content.push(
			    	"<div class=\"border fl\">"+
						"<div class=\"title_img\">"+
							"<div class=\"fk\"> "+data[i].id+"</div><br/>"+
							"<div class=\"title fl\"> "+data[i].title+" </div>"+
						"</div>"+
						"<div class=\"type\">"+
							"<img class=\"type1 fl\" src=\"../icon/\""+data[i].extfilename+".png\" alt=\"资料文件类型图标\"/>"+
							"<li class=\"type2 fl\"> 资料 </li>"+
						"</div>"+
						"<div class=\"content\">"+
							"<li>"+data[i].contents+"</li>"+
						"</div>"+
						"<div class=\"button\"><a href=\"/download.action?number=2&id=\""+data[i].id+"\" target=\"_blank\">点击下载</a></div>"+
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
    var query = $('#querycontent').val();
 	if(query=='') {
		
	}else {
		var url = '/files/toList.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
	
	 
     
 }
     
</script>


<script>
 menu_init("files");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>
