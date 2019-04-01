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
<div class="nav widthbox">
    <div class="logo fl"><img src="../image/index/logo.jpg" alt="logo"></div>
    <div class="nav_right fr">
    
    <%@ include file="../userinfo.jsp"%>

    <%@ include file="../menu.jsp"%>
    </div>
</div>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="../usercenter/leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			
			<!--培训活动   所有用户显示    -->
			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">复审基本信息列表</span> </li></div>
				<div style="color: #444;padding:2px;margin-bottom: 8px; border: 1px dashed;text-indent: 14px;">*友情提示： 如果不能导出成功请将本站加入受信任站点方法为：工具->internet(选项..)->安全->受信任的站点->站点</div>
				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT">
 						<td  >申请人</td>
 						<td >产品名称</td>
						<td  >申请金额</td>
						<td  >状态</td>
						<td  >申请日期</td>
						<td >操作</td>
					</tr>
	 
				<s:iterator value="pager.list">
					<tr>
						<td><s:property value="userid"/></td>
						<td><s:property value="daikuanpingz"/></td>
						<td><s:property value="shenqingjine"/> 万</td>
						<td><label><s:property value="status_trans"/></label><span class='showhspan'><s:property value='memo'/><span></td>
						<td><s:property value="lurushijian"/></td>
						<td><input  class="op  opl"  lang="<s:property value="id"/>"    type="button" value="修改" class="pxhdjs"><input class="op opr"  type="button" value="查看"   lang="<s:property value="id"/>"  >  <input class="op ope"  type="button" value="导出"   lang="<s:property value="id"/>"  > </td>
					</tr>
					</s:iterator>
					
					

					
					
					  

				</table>
			 
				<script type="text/javascript">
				
				var opls = $("#ycacti .opl");
				var oprs = $("#ycacti .opr");
				var opre = $("#ycacti .ope");
				
				opls.each(function(){
					
					var stateinput= $(this).parent().prev().prev().children("label").html();
					if(!(stateinput=="未提交" || stateinput=="驳回")){
						$(this).attr("disabled","false");
						$(this).removeClass("op").addClass("padd");
						//$(this).next().attr("disabled","false");
						//$(this).next().removeClass("op");
					}
					if(stateinput=="驳回"){
						$(this).parent().prev().prev().addClass("showh");
					}
					if(stateinput=="未提交" || stateinput=="驳回" || stateinput=="初审通过"){
						$(this).next().next().attr("disabled","false");
						$(this).next().next().removeClass("op").addClass("padd");
					}
					
					
				});
				$(".showh").hover(function(){
					$(this).children("span").show();
				},function(){
					$(this).children("span").hide();
				});
				
				
				
				opls.click(function(){
						var id=$(this).attr("lang");
						location.href="/productczdbase/tostep1.html?e.id="+id+"&e.t=u";
				});
				oprs.click(function(){
					var id=$(this).attr("lang");
					location.href="/productczdbase/tostep1.html?e.id="+id+"&e.t=v";
			});
			
			opre.click(function(){
					var id=$(this).attr("lang");
					location.href="/manage/czddownloadword.action?id="+id;
			});
			
			opre.click(function(){
					var id=$(this).attr("lang");
					location.href="/manage/czddownloadword.action?id="+id;
			});				
			 	</script>
			</div>
			</div>
			</div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("redebtsinfo");
 </script>
</body>
</html>
 