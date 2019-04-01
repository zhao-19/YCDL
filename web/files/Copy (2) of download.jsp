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
	queryDataCount = queryDataCount+1;
var url = "/files/toList2.html?page="+queryDataCount;
$(function(){
	//ajax首次加载数据
		$.ajax({
			url : url,
			type : 'POST',
			data : {
			'pageNow' : pageNow,
            'nownavid' : nownavid,
			'pageSize' : pageSize
		},
			beforeSend : function () {

			},
			success : function (data, response, status) {
					if(data==null){
					   item="<div id='dat'>暂无数据</div>";
                        $('#jpzsdiv').html(item);//在dl中增加节点【把返回回来的内容加在里面】
                       return false;
				    }else{
						$.each(data,function(i,result){
                           
                                item+="<div class=\"border fl\">"+
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
    					"</div>";

							
						});
                        $('#jpzsdiv').html(item);
                        //要用js操作上面动态生成的元素时需在这里写js
                    }


			},
            complete:function(){
            }
        });

		  //点击筛选条件
	    $(".caleft span.a").click(function(){
	    	 $.ajax({
	             url : ThinkPHP['MODULE'] + '/Cpnews/category/',
	             type : 'POST',
	             data : {
	                 'pageNow' : 1,
	                 'pageSize' : pageSize
	             },
	             beforeSend : function () {
	             },
	             success : function (data, response, status) {

	                 if(data==null){
	                     item="<div id='dat'>暂无数据</div>";
	                     $('#jpzsdiv').html(item); //在dl中增加节点【把返回回来的内容加在里面】
	                     return;

	                 }else{
	                	 $.each(data,function(i,result){
	                           
                             item+="<div class=\"border fl\">"+
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
 					"</div>";

							
						});
                     $('#jpzsdiv').html(item);
                     //要用js操作上面动态生成的元素时需在这里写js


	                 }
	    });

        

   }); 
	
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
