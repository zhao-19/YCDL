<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="盈创动力通过创新党建工作方式，构建科技金融党员E家，用新的互联网思维全面提升党建工作效率，充分发挥党组织对科技金融工作的统领作用，以党建促进业务发展，进一步推动科技金融结合和产业发展。">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="科技金融党员E家"/>
</jsp:include>
<body class="fwxq zxdyzn" style="background: #fff;">
<div class="fwxq-cont" style="margin-bottom: 0;border-top:0;background: linear-gradient(30deg,#dd606a,#e70012)">
    <!--<h2>党员e家</h2>-->
    <dl style="padding-bottom: 0;padding:0.62rem 0 0.3rem;">
        <dt class="tc" style="color: #f7e728;font-size: 0.38rem;font-weight: bold;">科技金融党员E家</dt>
        <dd>
            <ul>
                <li style="text-indent: 0.56rem;color: #f7e728;line-height: 0.55rem;padding:0.1rem 0.1rem 0;">
                    盈创动力通过创新党建工作方式，构建科技金融党员E家，用新的互联网思维全面提升党建工作效率，充分发挥党组织对科技金融工作的统领作用，以党建促进业务发展，进一步推动科技金融结合和产业发展。
                </li>
            </ul>
        </dd>
    </dl>
</div>
<div class="dyBtn tc" style="border-top: 0;">
    <ul>
        <li>
            <a href="">
                <img src="${pageContext.request.contextPath}/app/images/dyicon1.png" alt="">
                <p>交纳党费</p>
            </a>
        </li>
        <li>
            <a href="">
                <img src="${pageContext.request.contextPath}/app/images/dyicon2.png" alt="">
                <p>在线学习</p>
            </a>
        </li>
        <li>
            <a href="">
                <img src="${pageContext.request.contextPath}/app/images/dyicon3.png" alt="">
                <p>组织生活</p>
            </a>
        </li>
        <li>
            <a href="">
                <img src="${pageContext.request.contextPath}/app/images/dyicon4.png" alt="">
                <p>支委联动</p>
            </a>
        </li>
        <li>
            <a href="">
                <img src="${pageContext.request.contextPath}/app/images/dyicon5.png" alt="">
                <p>志愿者服务</p>
            </a>
        </li>
        <li>
            <a href="">
                <img src="${pageContext.request.contextPath}/app/images/dyicon6.png" alt="">
                <p>党员困难申请</p>
            </a>
        </li>
    </ul>

    <br>
    <br>
    <br>
</div>
<div class="mytip">
    该功能暂未开放
</div>
<script>
    $('.dyBtn a').click(function(e){
        e.preventDefault();
        $('.mytip').fadeIn(300,function(){
            setTimeout("$('.mytip').fadeOut(300);",2000);
        })});
</script>
</body>
</html>