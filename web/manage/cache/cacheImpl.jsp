<%@page import="com.winpow.core.oscache.FrontCache"%>
<%@page import="com.winpow.core.oscache.ManageCache"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.core.system.bean.Config"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<div style="font-size: 13px;font-family: monospace">
${service_ip }
<%
WebApplicationContext app = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
FrontCache frontCache = (FrontCache) app.getBean("frontCache");
ManageCache manageCache = (ManageCache) app.getBean("manageCache");
frontCache.loadAllCache();
manageCache.loadAllCache();
application.setAttribute("dic", SystemManager.treeNodeMap);				//字典项
application.setAttribute("dicmap", SystemManager.codeMap);
application.setAttribute("diccode", SystemManager.dicmap);
application.setAttribute("areasubstmap", SystemManager.areasubstmap);	//分站
application.setAttribute("sysversion", SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)); 	//版本号
out.println("缓存加载成功！");
%>
</div>