<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.winpow.core.system.bean.User"%>
<%@page import="java.util.Map"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="background: #eff4f8;">
<head >
    <title>${sessionsubstation}科技金融服务平台管理系统</title>
</head>
<%
	Map<String,Object> map = ActionContext.getContext().getSession();
	User u = (User)map.get(ManageContainer.manage_session_user_info);
	if (u == null) {
		response.sendRedirect("/usermanage/loginout.html");
	}
%>
<frameset rows="50,*" frameborder="no" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true">
	<frame src="/common/usermanage/system/head.jsp">
	<frameset cols="210,*" frameborder="no">
		<frame src="/common/usermanage/system/left.jsp" name="leftFrame" noresize="noresize"/>
		<frame src="/common/usermanage/system/wfList.jsp" allowfullscreen="true" webkitallowfullscreen="true"
			   mozallowfullscreen="true" name="rightFrame" style="padding:20px;background: #eff4f8;"/>
	</frameset>
</frameset>
</html>
