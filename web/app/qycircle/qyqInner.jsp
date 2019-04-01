<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="${order.bewrite}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${order.title}"/>
</jsp:include>
<link href="${pageContext.request.contextPath}/app/css/swiper.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/app/js/swiper.js"></script>
<body class="qyq-inner">
<c:if test="${info==0}">
<div class="qyq-top">
    <div class="swiper-container">
        <div class="swiper-wrapper">
			<s:iterator value="#request.imgurl" var="s" status="status">
				<div class="swiper-slide"><img src="${s}"></div>
			</s:iterator> 
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <h2>${order.title}</h2>
    <h3>${order.bewrite}</h3>
    <div class="qyq-num clearfix">
        <div class="qyq-price fl">￥<strong>${order.price}</strong>元起</div>
        <div class="fr">
            <div class="qyq-sold fl">销量：${sellcount}</div>
            <div class="qyq-sold fl">评论：${commentcount}</div>
        </div>
    </div>
    <div class="qyq-supply"><i><img src="${pageContext.request.contextPath}/app/images/qyq-gys.png"></i>供应商：${user.qiyename}</div>
</div>
<div class="qyq-comment">
    <div class="comment-totle">评论（${commentcount}）</div>
    <div class="comment-cont" style="display:none;">
        <c:forEach items="${comments}" var="ent">
        <div class="user-pic"><a><img src="${pageContext.request.contextPath}/app/images/person3.jpg"></a></div>
        <div class="comment-text">
            <h2><a>${ent.userid}</a><span>***</span></h2>
            <h3><span>${ent.address}</span><span>${ent.device}</span></h3>
            <p>${ent.content}</p>
            <div class="comment-time">
                <span>${ent.create_time}</span>
                <a><img src="${pageContext.request.contextPath}/app/images/comment.png"></a>
            </div>

        </div>
        </c:forEach>
    </div>
    <a class="comment-all">查看全部评论</a>
</div>
</c:if>
<div class="qyq-cont">
    <h2>产品详情介绍</h2>
    <div class="qyq-inner-cont">
        ${order.content}
    </div>
</div>
<c:if test="${isShare}">
<div class="fwxq-btn">
    <a class="fwxq-calc"><i><img src="${pageContext.request.contextPath}/app/images/collection.png"></i><p>收藏</p></a>
    <a class="fwxq-apply">立即预约</a>
</div>
</c:if>
<div id="modal"><a class="download-link">下载盈创动力APP</a></div>
<script>
    $(function () {
        var mySwiper = new Swiper('.swiper-container', {
            pagination : '.swiper-pagination',
            loop:true
        })
        $('.comment-all').click(function () {
            $('#modal').show();
        });
        $('#modal').click(function () {
            $(this).hide();
        });
    })
</script>
</body>
</html>