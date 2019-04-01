<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.winpow.core.system.bean.Config"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<meta name="description" content="盈创动力APP（Android版/IOS版）是成都高投盈创动力投资发展有限公司为中小微企业和个人推出的满足其生产经营和消费中遇到各种问题的手机软件。具体功能有债权融资、股权融资、中介服务、培训活动、政策申报、信用查询、园区服务、企业帮等。盈创动力APP成为中小微企业科技金融服务的APP。">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="下载盈创动力APP"/>
</jsp:include>
<body>
<style>

    .footbg{position: fixed;width: 100%;left:0;bottom: 0;}
    .box{display: block;width: 100%;overflow: hidden; margin: 0.8rem 0;}
    .box>span{width: 50%;float: left;}
    .box>span img{margin:0 0.2rem;}
    .box>span:nth-child(1) img{width: 2.3rem;}
    .box>span:nth-child(2) img{width: 2.39rem;margin-top: 0.8rem;}

</style>
<div class="save" style="top:46%;background: #fff;">
    <img src="${pageContext.request.contextPath}/app/images/appintro/choice1.png" alt="" style="width:80%;">
    <div class="box">
        <span class="tr">
            <!--下图为苹果二维码-->
            <img src="<%out.print(SystemManager.CONFIGS.get(Config.ADMINQR));%>" alt="">
        </span>
        <span class="tl">
            <!--下图为安卓二维码-->
            <img src="${pageContext.request.contextPath}/app/images/appintro/iphonedown.png" alt="">
        </span>
    </div>
     <a class="box" href="https://www.winpow.com/attached/app/winpowAdmin.apk">
        <span class="tr">
           <img src="${pageContext.request.contextPath}/app/images/appintro/androider.png" alt="">
        </span>
        <span class="tl">
            <img src="${pageContext.request.contextPath}/app/images/appintro/android.png" alt="">
        </span>
    </a>
</div>
<img src="${pageContext.request.contextPath}/app/images/appintro/choice4.png" alt="" class="footbg">

<!-- iso二维码路径 -->
<%-- <%out.print(SystemManager.CONFIGS.get(Config.ADMINQR));%> --%>

<script type="text/javascript">
//    if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
//		window.location.href="https://itunes.apple.com/cn/app/%E7%9B%88%E5%88%9B%E5%8A%A8%E5%8A%9Bapp/id1371973364?mt=8";
//	} else {
//
//		var agent = navigator.userAgent.toLowerCase();
//	    if (agent.match(/MicroMessenger/i) == "micromessenger") {
//	        $('.save').show();
//	    } else {
//	    	window.location.href="/attached/app/winpow.apk";
//	    }
//	}

</script>
</body>
</html>