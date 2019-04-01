<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.winpow.core.oscache.FrontCache"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="java.net.URL"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
FrontCache frontCache = (FrontCache) app.getBean("frontCache");

String method = request.getParameter("method");
out.println("method="+method);
 

%>
