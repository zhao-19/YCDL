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
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
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
				<div class="title"><li><span class="t">常用报名人员信息</span><%-- <span id="CreateTBpxhd" class="update">培训活动报名</span> --%></li></div>
				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT">
 						<td  >用户编号</td>
 						<td >名字</td>
						<td  >电话</td>
						<td >岗位</td>
						<td  >录入日期</td>
						<td >操作</td>
					</tr>
				
					<s:iterator value="#request.list">
						
						<tr>
							<td><s:property value="userid"/></td>
							<td><input class="textinput"  type="text"  name="attendname"  value="<s:property value="attendname"/>"  readonly="readonly"/></td>
							<td><input class="textinput"  type="text"  name="attendcell"  value="<s:property value="attendcell"/>"  readonly="readonly"></td>
							<td><input class="textinput"  type="text"  name="attendduty"  value="<s:property value="attendduty"/>"  readonly="readonly"></td>
							<td><s:property value="lurushijian.substring(0,10)"/></td>
							<td><input  class="an op  opl"  lang="<s:property value="id"/>"    type="button" value="修改" class="pxhdjs"></td>
						</tr>
					</s:iterator>
				</table>
			 
				<script type="text/javascript">
				
				var opls = $("#ycacti .opl");
				opls.click(function(){
					
					
					if($(this).val()=="修改"){					
					var stationinput= $(this).parent().prev().prev().children("input");
					var telinput= $(this).parent().prev().prev().prev().children("input");
					var nameinput= $(this).parent().prev().prev().prev().prev().children("input");
					  	
						stationinput.addClass("operinput").removeAttr("readonly");
						telinput.addClass("operinput").removeAttr("readonly");
						nameinput.addClass("operinput").removeAttr("readonly");
						//.attr("readOnly",true);
						$(this).removeClass("opl").addClass("oplsave");
						$(this).val("保存");
						$(this).addClass("ophover");
						
						
					}else{
						var id=$(this).attr("lang");
						var attendduty= $(this).parent().prev().prev().children("input").val();
						var attendcell= $(this).parent().prev().prev().prev().children("input").val();
						var nameinput= $(this).parent().prev().prev().prev().prev().children("input").val();
						location.href="/usercenter/updateActivitieslinkuser.html?attendname="+nameinput+"&attendcell="+attendcell+"&attendduty="+attendduty+"&id="+id+"";
					}
					
					
				});
				
				
				var oprs = $("#ycacti .opr");
				oprs.click(function(){
					var id=$(this).attr("lang");
					location.href="/usercenter/updateActivitiesinfo.html?id="+id+"";
				});
				
					


				</script>
			</div>
			</div>
			</div>





</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("comregiinfo");
 </script>
</body>
</html>
 