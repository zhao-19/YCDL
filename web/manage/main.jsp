<%@page import="com.winpow.core.system.bean.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html style="background: #E6EAE9;">
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
</head>

<%
		Map<String,Object> map = ActionContext.getContext().getSession();
		User u = (User)map.get(ManageContainer.manage_session_user_info);
		if(u==null){
			out.println("u="+u);
			response.sendRedirect("user!loginOut.action");
			return;
		}
		//out.print(u.getNickname()+"("+u.getUsername()+")");
	%>
	


<frameset rows="50,*" frameborder="no"  allowfullscreen="true"  webkitallowfullscreen="true" mozallowfullscreen="true">
	<frame src="<%=request.getContextPath()%>/manage/system/head.jsp">
	<frameset cols="210,*" frameborder="no">
		<frame src="<%=request.getContextPath()%>/manage/system/left.jsp" name="leftFrame" noresize="noresize"/>
		<!--<frame src="<%=request.getContextPath()%>/manage/system/right.jsp" name="rightFrame" />-->
		<frame  allowfullscreen="true"  webkitallowfullscreen="true" mozallowfullscreen="true" src="<%=request.getContextPath()%>/manage/user!initManageIndex.action" name="rightFrame" />
	</frameset>
</frameset>
</html>
