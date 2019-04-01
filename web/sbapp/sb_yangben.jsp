<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.winpow.services.manage.activities.bean.Activities" %>
<%@page import="com.winpow.core.util.StringUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>

    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/jquery-1.11.3.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_yangben.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>

  
</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
    <div class="show fl">
        <%@ include file="../usercenter/leftnav.jsp" %>
    </div>


    <div class="list fr">
        <div class="rightbox">

            <!-- 债权信息修改    用户为企业时显示    -->
            <div id="zaiquanxinxi-update" class="vipinfo">

                <form id="form1" name="sb_yangben" action="/declare_base/saveBase.html" namespace="/" method="post">

                    <div class="title">
                        <li><span class="t">申报上传文件样本参考</span></li>
                    </div>

                    <div class="img_yangben">
                    	<div class="img_yangbenl">
                    		<a href="javascript:void(0);">
	                    		<img src="../image/yangben.png"/>
	                    		<p>团部协议文件样本</p>
                    		</a>
                    	
                    	</div>
                    	<div class="img_yangbenl">
                    		<a href="javascript:void(0);">
	                    		<img src="../image/yb2.png"/>
	                    		<p>团部协议文件样本</p>
                    		</a>
                    	
                    	</div>
                    	<div class="img_yangbenl">
                    		<a href="javascript:void(0);">
	                    		<img src="../image/yb3.jpg"/>
	                    		<p>团部协议文件样本</p>
                    		</a>
                    	
                    	</div>
                    	<div class="img_yangbenl">
                    		<a href="javascript:void(0);">
	                    		<img src="../image/yb2.png"/>
	                    		<p>团部协议文件样本</p>
                    		</a>
                    	
                    	</div>
                    	<div class="img_yangbenl">
                    		<a href="javascript:void(0);">
	                    		<img src="../image/yb4.jpg"/>
	                    		<p>团部协议文件样本</p>
                    		</a>
                    	
                    	</div>
                    </div>

                    


                </form>
            </div>

        </div>

    </div>

</div>


<script type="text/javascript">

    

</script>

<%@ include file="../footer.jsp" %>
<script type="text/javascript">
    leftnav_init("qysqjbxx");
</script>
<%@ include file="tanchu.jsp" %>
</body>
</html>
 