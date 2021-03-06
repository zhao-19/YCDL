<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head >
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css" type="text/css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.dialogBox.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog.js"></script>
</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			
			<!--培训活动   所有用户显示    -->
			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">已申请的债权融资</span><a href="/usercenter/toAppProductappinfo.html?productapp.t=a"><span id="CreateTBpxhd" class="update">债权融资申请</span></a></li></div>

				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT">
 						<td  >申请人</td>
 						<td >产品名称</td>
						<td  >申请金额</td>
						<td  >状态</td>
						<td  >申请日期</td>
						<td >操作</td>
					</tr>
				
					<s:iterator value="#request.list">
					<tr>
						<td><s:property value="userid"/></td>
						<td><s:property value="prodname"/></td>
						<td><s:property value="loanamt"/> 万元 </td>
						<td><label><s:property value="status_trans"/></label><span class='showhspan'><s:property value='memo'/><span></td>
						<td><s:property value="lurushijian.substring(0,10)"/> </td>
						<td><input  class="op  opl"  lang="<s:property value="id"/>"    type="button" value="修改" class="pxhdjs"><input class="op opr"  type="button" value="查看"   lang="<s:property value="id"/>"  ></td>
					</tr>
					</s:iterator>
					
					

					
					
					  
				</table>
			 
				<script type="text/javascript">
				
				var opls = $("#ycacti .opl");
				var oprs = $("#ycacti .opr");
				opls.each(function(){
					var stateinput= $(this).parent().prev().prev().children("label").html();
					if(stateinput=="审批中" || stateinput=="审批通过"){
						$(this).attr("disabled","false");
						$(this).removeClass("op").addClass("padd");
						//$(this).next().attr("disabled","false");
						//$(this).next().removeClass("op");
					}
					if(stateinput=="驳回"){
						$(this).parent().prev().prev().addClass("showh");
					}
					
				});
				$(".showh").hover(function(){
					$(this).children("span").show();
				},function(){
					$(this).children("span").hide();
				});
				
				//修改
				opls.click(function(){

						var id=$(this).attr("lang");
						location.href="/usercenter/getProductappinfo.html?productapp.id="+id+"&productapp.t=u";
				});
				oprs.click(function(){

					var id=$(this).attr("lang");
					location.href="/usercenter/getProductappinfo.html?productapp.id="+id+"&productapp.t=v";
			});
				
			 	</script>
			</div>
			</div>
			</div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("debtsinfo");
 </script>
</body>
</html>
 