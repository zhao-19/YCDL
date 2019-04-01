<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${jigou.jigoumingcheng}"/>
</jsp:include>
<body class="tzq example">
<div class="banner bg">
    <div class="box ov">
        <div class="flex">
            <img src="${jigou.jigoulogo}" alt="" class="fl">
            <div class="fl info">
                <!--<h2>${result.username} <span>${result.profession}</span></h2>-->
                <h2>${jigou.jigoumingcheng}</h2>
            </div>
        </div>
        <ul class="ov">
            <c:forEach var="e" items="${hangyestr}" varStatus="status">
                <li>${e}</li>
            </c:forEach>
        </ul>
    </div>

    <div class="oper ov">
        <span>${jigou.readtimes }浏览</span>
    </div>
</div>

<div class="tzq-bot">
    <div class="tzq-nav">
        <a class="active">机构详情</a>
        <a class="go-download">留言(${commentcount})</a>
    </div>
    <div class="tzq-cont">
        <!--<h2>详细信息：</h2>-->
        <h3>${jigou.jigoujianjie}</h3>
        <div class="tzq-text clearfix">
            <p><span>注册资本：</span>${not  empty  jigou.zhuceziben?jigou.zhuceziben:0} 万元</p>
            <p><span>工商注册地：</span>${not empty jigou.zhucediid?jigou.zhucediid:"暂无工商注册地"}</p>
            <%-- <p><span>机构服务内容：</span>${not empty jigou.fuwuneirong?jigou.fuwuneirong:"暂无机构服务内容"}</p>
            <p><span>机构服务案例：</span>${not empty jigou.fuwuanli?jigou.fuwuanli:"暂无机构服务案例"}</p> --%>
            <p><span>办公地址：</span>${not empty jigou.bangongdizhi?jigou.bangongdizhi:"暂无办公地址"}</p>
            <%-- <p><span>网址：</span>${not empty jigou.wangzhi?jigou.wangzhi:"暂无网址"}</p> --%>
            <p><span>管理资本金：</span>${not empty jigou.tz_glzbj?jigou.tz_glzbj:0}万元</p>
            <p><span>投资行业：</span>${empty jigou.tz_touzihangye?"暂无投资行业":jigou.tz_touzihangye}</p>
            <p><span>投资阶段：</span>${empty jigou.tz_touzijieduanid?"暂无投资阶段":jigou.tz_touzijieduanid}</p>
            <p><span>投资额度：</span>${empty jigou.tz_touziedu?"暂无投资额度":jigou.tz_touziedu}万元</p>
            <p><span>联系人姓名：</span>${empty jigou.xingming?"暂无联系人姓名":jigou.xingming}</p>
            <p><span>职务：</span>${empty jigou.bumenzhiwu?"暂无职务":jigou.bumenzhiwu}</p>
        </div>
        <!--<a class="tzq-link">我要留言</a>-->
    </div>
</div>
    <div id="modal"><a class="download-link">下载盈创动力APP</a></div>


</body>
<script>
    $(function () {
        $('.go-download').click(function () {
            $('#modal').show();
        });
        $('#modal').click(function () {
            $(this).hide();
        });
//        if ("${info}" == "0") {
//            $('.banner').addClass('bg');
//        }
    })

</script>
</html>