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
			<li>股权投资项目</li>
		</div>
		<div class="data_info_search fr" >
			<input id="contentquery" type="text"  value="请输入关键词名称"  onkeypress="if (event.keyCode == 13)  doquery()" onfocus="if(value=='请输入关键词名称'){value=''}" onblur="if(value==''){value='请输入关键词名称'}">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>

<div class="ycdata_center">
	<div class="ycdata_title widthbox">
	
	<%--改用table和新的ajax加载更多，只为兼容一台px系统 --%>
	<table class="newtable" id="newtable">
         <tr class="first">
             <th>项目名称</th>
             <th>融资额度</th>
             <th>出让比例</th>
             <th>融资类别</th>
         </tr>
         
         <s:iterator value="pager.list">
			<tr>
	             <td><a href="javascript:void(0);"><s:property value="mingcheng"/></a></td>
	             <td class="status"><s:property value="rongziedu"/>万元</td>
	             <td class="status"><s:property value="crgqbl"/>%</td>
	             <td class="status">股权融资</td>
            
            </tr>
		</s:iterator>
         
     </table>
			
		
		<!-- 工作室列表 -->
		<div class="ycdata_box1">  <!-- 列表x -->
	  	
		<li id="loadmorewordh" name="2" style="margin-top:15px;">查看更多</li>

		</div>	

</div>


<script>

//点击加载更多
var bzf = 0;
 $("#loadmorewordh").click(function(){
	 if(bzf==1){
		return;
	 }
 	//page是点击加载更多时传递的页码，count是每页显示条数
 	var page = $(this).attr("name")*1;
 	
 	$.ajax({
 		url : '/data/toGuquanList2.html?page='+page,
 		type : 'POST',
 		data : {
 		'page' : page,
 		'count' : 20
 	},
 		beforeSend : function () {
 			$("#loadmorewordh").text("数据加载中...");
 			
 		},
 		success : function (data, response, status) {
 			if(!data){
 			  $("#loadmorewordh").text("没有更多内容了").css("color","#888");
 			  bzf = 1;
 			}else{

 				$("#loadmorewordh").attr("name",parseInt(page+1));
 			    $("#loadmorewordh").text("查看更多");
 			 	var item;  
 			 	
                 $.each(data,function(i,result){

 					item ="<tr><td><a href='#'>"+result['mingcheng']+"</a></td><td class='status'>"+result['rongziedu']+"万元</td><td class='status'>"+result['crgqbl']+"%</td><td class='status'>股权融资</td></tr>";

                     $("#newtable").append(item);  
                  });
 			};
 				      			 
 		}
 	});
 });
  






	
</script>



<script>
function doquery(){
    var query = $('#contentquery').val();
 	if(query=='') {
		
	}else {
		var url = '/data/toGuquanList.html?t=q&q='+query;
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
#loadmorewordh{width:1200px;}
.widthbox {width: 1200px;}
.ycdata_list1:hover{background-color: #F5F5F5;border-top:0px solid #F5F5F5;border-bottom:1px solid #000;}
.ycdata_title .data_title_head {border-top: 1px solid #000;border-bottom: 1px solid #000;}
.ycdata_list1 .data_list_name1 li {line-height: normal;}
.ycdata_list1 {height: auto;width: 1200px;border-bottom: 1px solid #000;border-top: 0px solid #fff;}

.ycdata_title .data_title_head .name {width: 355px;border-left: 1px solid #000;}
.ycdata_title .data_title_head .scale {width: 30%;border-left: 1px solid #000;}
.ycdata_title .data_title_head .profession {border-left: 1px solid #000;}
.ycdata_title .data_title_head .school {border-left: 1px solid #000;border-right: 1px solid #000;float: left;}

.ycdata_list1 .data_list_name1 {width: 355px;border-left: 1px solid #000;height:auto;padding: 15px 0px;}
.ycdata_list1 .data_list_name1 .data_list_name_info1 {margin-top: 0px;}
.ycdata_list1 .data_list_name1 li {margin-bottom: 0px;margin-left: 16px;float:left;}
.ycdata_list1 .data_list_scale1 {width: 30%;line-height: normal;;border-left: 1px solid #000;height:auto;padding: 15px 0px;}
.ycdata_list1 .data_list_profession1 {border-left: 1px solid #000; line-height: normal;height:auto;padding: 15px 0px;}
.ycdata_list1 .data_list_profession2 {padding: 15px 0px;line-height: normal;height: auto;border: 0px solid #000;color: #E84C3D;width: 20%;border-left: 1px solid #000;border-right: 1px solid #000;}

</style>

<script>
 menu_init("data");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>


