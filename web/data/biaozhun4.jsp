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
<style type="text/css">
	#datable{border-collapse: collapse;font-size:14px;}
	
	#datable tr td:first{text-align: left;}
	#datable tr td{border-color:#EBEBEB;padding:20px;}
	#datable tbody tr td{height:65px;}
	#datable tbody tr:hover{background:#F5F5F5;}
	#datable thead tr{background:#F5F5F5;height:61px;}
	#loadmorewordh{font-size:14px;}
	
</style>
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
			<li>党建增信数据库</li>
		</div>
		<div class="data_info_search fr">
			<input id="contentquery" type="text" placeholder="请输入企业名称"  onkeypress="if (event.keyCode == 13)  queryData(0)">
			<a href="javascript:queryData(0)"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>
<div class="bl">

<table id="datable"   style="width: 100%;padding: 5px;text-align: center;">
	<thead>
      	<tr>
           <td>企业名称</td>
           <td>党员人数</td>
           <td>法人代表是否党员</td>
           <td>高管人数</td>
           <td>高管党员人数</td>
           <td>是否设立当支部</td>
           <td>党支部设立时间</td>
       </tr>
       </thead>
       <tbody id="datebody">
        <s:iterator value="pager.list">
        	<tr>
	        	<td>${QIYEMINGCHENG }</td>
	        	<td>${party_num }</td>
	        	<td><s:if test="is_party=='10001'">是</s:if><s:elseif test="is_party=='10002'">否</s:elseif></td>
	        	<td>${lead_num }</td>
	        	<td>${lead_party_num }</td>
	        	<td><s:if test="is_party_branch=='10001'">是</s:if><s:elseif test="is_party_branch=='10002'">否</s:elseif></td>
	        	<td>${party_branch_time }</td>
        	</tr>
		</s:iterator>
       </tbody>
</table>
<div id="loadmorewordh" onclick="queryData(1);" style="margin-top:15px;width: 100%">查看更多</div>
 </div>
 <script type="text/javascript">
 	var page = 0;
 	function queryData(num) {
 		if (num == 1) {
 			page ++ ;
 		}
 		var _url = "/data/toBiaozhun4List.html";
 		$.ajax({
 			type : 'POST',
 			url : _url,
 			data : {
 				"ajax" : "ajax",
 				"name" : $("#contentquery").val(),
 				"page" : page
 			},
 			dataType : "json",
 			beforeSend : function() {
 				$("#loadmorewordh").html("数据加载中...");
 			},
 			success : function(data) {
 				var len = data.length;
 				var html = "";
 				for (var i = 0; i < len; i++) {
 					html += "<tr><td>" + gw(data[i].QIYEMINGCHENG) + "</td><td>" + gw(data[i].party_num) + "</td><td>" + cw(data[i].is_party) + "</td><td>" + gw(data[i].lead_num) + "</td><td>" + gw(data[i].lead_party_num) + "</td><td>" + cw(data[i].is_party_branch) + "</td><td>" + gw(data[i].party_branch_time) + "</td></tr>";
 				}
 				if (num == 1) {
 					$("#datebody").append(html);
 				} else {
 					$("#datebody").html(html);
 				}
 				$("#loadmorewordh").html("查看更多")
 				if (len < 20) {
 					$("#loadmorewordh").html("没有数据可以加载了！").removeAttr("onclick");
 				}
 			}
 		});
 	}
 
 	function gw(a) {
    	return typeof(a) == "undefined" ? "" : a;
    }
    
    function cw(a) {
    	a = gw(a);
    	if (a != "") {
    		a = a == "10001" ? "是" : "否";
    	}
    	return a;
    }
    
	menu_init("data");
</script>
	<%@ include file="../footer.jsp"%>
</body>
</html>