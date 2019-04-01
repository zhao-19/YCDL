<%@page import="com.winpow.core.system.bean.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
    <script type="text/javascript">
    	//注销
    	function a(){
    		window.parent.location.href = "../user!loginOut.action?type=out";
    	}
    	//function b(){
    		//window.parent.location.href = "../../index!q.action?id=-1";
    	//}
    	//$(function(){
    		//$("#suggest1").focus().autocomplete(cities);
    	//});
    </script>
	<style>
		body{font-size: 12px; background:#374754 !important;padding:0 20px;
			margin: 0;overflow: hidden;color: #fff;font-family: "微软雅黑"}
		#userDiv{line-height: 50px; color: #fff;  text-align: right;}
		#userDiv a{color: #fff;text-decoration: none;height: 50px;
			display: inline-block;
			padding: 0 10px;}
		#userDiv a:hover{background: #26343f;}
		.logo{float:left; line-height: 50px;font-size: 16px;padding-left:90px;cursor:pointer;
			background: url("<%=request.getContextPath()%>/resource/zTree3.1/css/zTreeStyle/img/logo.png") no-repeat 0 center;
		}
	</style>
</head>
<%
Object colors = session.getAttribute("manageColor");
String color = colors == null ? "" : colors.toString();
 %>
<body style="background-color: <%out.print(color);%> !important;">
<span class="logo">
	盈创动力后台管理系统
</span>
<div id="userDiv">
	<a href="/manage/user!statistics.action" target="_black">
	<span title="${service_ip}">
	<%
		Map<String,Object> map = ActionContext.getContext().getSession();
		User u = (User)map.get(ManageContainer.manage_session_user_info);
		if(u==null){
			out.println("u="+u);
			response.sendRedirect("user!loginOut.action");
			return;
		}
		out.print(u.getNickname()+"("+u.getUsername()+")");
	%>
	</span>
	</a>
	<a id="treeDemo_2_a" class="level0 curSelectedNode" treenode_a="" onclick="" href="../user!toChangePwd.action" target="rightFrame"  title="修改密码">
		<span id="treeDemo_2_span">修改密码</span></a>

	<a href="#" onclick="a()">注销</a>

</div>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	$("span.logo").click(function(){
	 	var rgb = $("body").css("background-color");
	 	var color = rgb != "rgb(55, 71, 84)" ? "%23374754" : "%23ff4500";    
		$.ajax({
			type: 'post',
			url: "/manage/cust!setColor.action?color=" + color,
			success: function(data){
				parent.location.reload();
			}
		});
	});
</script>s
</body>
</html>
