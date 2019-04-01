<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="精选专业机构 汇集品质服务">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="盈创动力十周年 中介服务超值优惠"/>
</jsp:include>
<style>
    .zjshare{background: linear-gradient(#5d0ca9,#3a018f)}
    .zjshare .zjtxt{color: #fff;font-size: 0.24rem;margin-top:0.3rem;}
    .zjshare .downappbtn{top:50%;transform: translateY(-16%);bottom:auto;}
</style>
<body class="appshare zjshare">
    <img src="${pageContext.request.contextPath}/app/images/appintro/zjshare.png" alt="" style="display: block;">
    <div class="downappbtn">
        <img src="${pageContext.request.contextPath}/app/images/appintro/zjlist.png" alt="">
        <p class="zjtxt">*前往盈创动力官网 www.winpow.com，了解更多活动详情。</p>
    </div>
</body>
</html>