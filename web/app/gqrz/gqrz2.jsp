<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="${guquan.jianjie}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${guquan.mingcheng}"/>
</jsp:include>
<body class="gqrz">
<div class="gqrz-banner">
    <div class="gqrz-banner-pic"><img src="${pageContext.request.contextPath}${gqdetail.detailpic}"></div>
    <div class="gqrz-top">
        <div>
            <span>融资金额</span>
            <p>¥<strong>${gqdetail.rongziedu}</strong>万</p>
        </div>
        <div>
            <span>出让股份</span>
            <p><strong>${gqdetail.crgqbl}</strong>%</p>
        </div>
    </div>
    <div class="gqrz-bot clearfix">
    	<div>项目阶段：${gqdetail.xiangmuzhuangtaiStr}</div>
        <div>融资轮次：${gqdetail.rongzhijieduan}</div>
        <div>关注度：
            <c:choose>
                <c:when test="${gqdetail.attention%2!=0}">
                <c:forEach begin="1" end="${gqdetail.attention/2}" var="d"><i class="star"></i></c:forEach>
                    <i class="half-star"></i>
                </c:when>
                <c:when test="${gqdetail.attention%2==0}">
                    <c:forEach begin="1" end="${gqdetail.attention/2}" var="d"><i class="star"></i></c:forEach>
                </c:when>
            </c:choose>
            <c:forEach begin="1" end="${(10-(gqdetail.attention))/2}" var="d"><i></i></c:forEach>
         </div>
        <div>已推荐机构：${not empty gqdetail.recmpno?gqdetail.recmpno:0}家</div>
    </div>
</div>
<div class="qyq-comment">
    <div class="comment-totle">专家点评（${gqdetail.excocount}）<a><!-- 发表评论 --></a></div>
    <div class="comment-cont">
        <c:forEach items="${gqdetail.expertcomment}" var="ent">
        <div class="user-pic"><a><img src="${pageContext.request.contextPath}${ent.headimg}"></a></div>
        <div class="comment-text">
            <h2><a>${ent.userid}</a><span>${ent.qiyename}</span></h2>
            <h3><span>${ent.address}</span><span>${ent.device}</span></h3>
            <p>${ent.content}</p>
            <div class="comment-time">
                <span>${ent.create_time}</span>
            </div>
        </div>
    </div>
    </c:forEach>
    <!-- <a class="comment-all">查看全部评论</a> -->
</div>
</div>
<div class="gqrz-intro">
    <div class="intro-nav">
        <a class="active">项目介绍</a>
        <a>项目动态</a>
        <a>评论</a>
    </div>
    <ul class="intro-cont">
        <li>

            <div class="gqrz-cont">
    <dl>
    <dt>项目产品介绍：</dt>
    <dd>${gqdetail.jianjie}</dd>
    </dl>
    <dl>
    <dt>产品图片：</dt>
    <dd><img src="${pageContext.request.contextPath}${gqdetail.detailpic}"></dd>
    </dl>
    <dl class="gqrz-team">
    <dt>明星团队：</dt>
    <dd class="clearfix">
    <div class="gqrz-wrap" style="width: 17rem;">
    <c:forEach items="${gqmemberList}" var="ent">
        <div class="team-item">
        <div class="team-pic"><img src="${pageContext.request.contextPath}${ent.tupian}"></div>
        <h2>${ent.xingming}</h2>
        <p>${ent.jianjie.length()>30?ent.jianjie.substring(0,30):ent.jianjie}</p>
        </div>
    </c:forEach>
    </div>
    </dd>
    </dl>
    <dl>
    <dt>目标用户：</dt>
    <dd>${not empty gqdetail.mubiaoyonghu?gqdetail.mubiaoyonghu:"暂无"}</dd>
    </dl>
    <dl>
    <dt>市场及用户情况：</dt>
    <dd>${not empty gqdetail.shichangfenxi?gqdetail.shichangfenxi:"暂无"}</dd>
    </dl>
    <dl>
    <dt>行业分析：</dt>
    <dd>${not empty gqdetail.hangyejingzheng?gqdetail.hangyejingzheng:"暂无"}</dd>
    </dl>
    <dl>
    <dt>发展计划：</dt>
    <dd>${not empty gqdetail.weilaifazhanjihua?gqdetail.weilaifazhanjihua:"暂无"}</dd>
    </dl>
    <dl>
    <dt>其他信息：</dt>
    <dd>${not empty gqdetail.qitaxinxi?gqdetail.qitaxinxi:"暂无"}</dd>
    </dl>
    </div>
        </li>
        <li>


    <div class="gqrz-xmdt">
    <ol>
    <c:forEach items="${gqjclist}" var="ent">

        <li>
        <h3>${ent.riqi}</h3>
        <h2>${company.qiyemingcheng}</h2>
        <p>${ent.shijian}</p>


    </c:forEach>

    </ol>
    </div>
        </li>

    </ul>
</div>






<%-- <div class="fwxq-btn">
    <a class="fwxq-calc"><i><img src="${pageContext.request.contextPath}/app/images/collection.png"></i><p>关注</p></a>
    <a class="fwxq-apply">立即约谈</a>
</div> --%>
<div id="modal"><a class="download-link">下载盈创动力APP</a></div>
<script>
    $(function () {
        $('.gqrz-wrap').css('width',$('.team-item').length*3.4+'rem');
        $('.intro-nav a').click(function () {
            if($(this).index()==2){
                var modal='<div id=modal></div>';
                $('#modal').show();
                return;
            }
            $(this).addClass('active').siblings().removeClass('active');
            $('.intro-cont').find('li').eq($(this).index()).show().siblings().hide();
        });

        $('#modal').click(function () {
            $(this).hide();
        });

    })
</script>
</body>
</html>