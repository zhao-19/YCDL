<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="description" content="${prodetail.productdetail}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${prodetail.prodname}"/>
</jsp:include>
<body class="zqrz">
<div class="zqrz-top">
    <div class="zqrz-name">
        <div class="zqrz-logo fl"><img src="${pageContext.request.contextPath}${prodetail.picurl}"></div>
        <div class="zqrz-name-wrap">
            <h2>${prodetail.prodname}</h2>
            <h3>${prodetail.applyPerNo}<!-- /30天放贷 --></h3>
            <div class="zqrz-tips clearfix">

                <c:forEach items="${prodetail.returntypeArr}" var="ent" varStatus="entStatus">
                    <c:choose>
                        <c:when test="${entStatus.index%2==0}">
                            <span class="tip-b">${ent}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="tip-g">${ent}</span>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            <%--<c:forEach items="${prodetail.loangurArr}" var="ent" varStatus="entStatus">--%>
                <%--<c:choose>--%>
                    <%--<c:when test="${entStatus.index%2==0}">--%>
                        <%--<span class="tip-b">${ent}</span>--%>
                    <%--</c:when>--%>
                    <%--<c:otherwise>--%>
                        <%--<span class="tip-g">${ent}</span>--%>
                    <%--</c:otherwise>--%>
                <%--</c:choose>--%>
                <%--</c:forEach>--%>
            </div>
        </div>
    </div>
    <div class="zqrz-num">
        <div class="zqrz-num-box">
            <h4>贷款金额</h4>
            	<h5 style="color: #f66719;display: none;" id="money1" m1="${prodetail.loanamt}"  m2="${prodetail.loanamtmax}">¥<strong>${prodetail.loanamt}</strong>万</h5>
				<h5 style="color: #f66719;" id="money2">¥<strong>${prodetail.loanamt}</strong>万~¥<strong>${prodetail.loanamtmax}</strong>万</h5>
        </div>
        <div class="zqrz-num-box">
            <h4>年利率</h4>
            <h5 style="color: #198cff"><strong>${prodetail.loanrate}</strong>%</h5>
        </div>
        <div class="zqrz-num-box">
            <h4>贷款期限</h4>
            <h5 style="color: #6dc05e"><strong>${prodetail.loanterm}</strong>个月</h5>
        </div>
        <div class="zqrz-num-box">
            <h4>担保费</h4>
            <h5 style="color: #ed0905"><strong>${prodetail.guaranteefee}</strong>%</h5>
        </div>
        <div class="zqrz-num-box">
            <h4>平台服务费</h4>
            <h5 style="color: #F400FC"><strong>${prodetail.servicecharge}</strong>%</h5>
        </div>
        <div class="zqrz-num-box">
            <h4>综合成本</h4>
            <h5 style="color: #8610FC"><strong>${prodetail.totalcost}</strong>%</h5>
        </div>
    </div>
</div>
<div class="zqrz-wrap">
    <div class="tzq-nav zqrz-nav">
        <a class="active">产品详情</a>
        <a class="go-download">用户评论</a>
    </div>
    <div class="tzq-cont zqrz-cont">
        <h2>申请流程：</h2>
        <div class="zqrz-pic"><img src="${pageContext.request.contextPath}${prodetail.banliliuc}"></div>
    </div>
    <%request.setAttribute("vEnter", "\n");%>
    <div class="tzq-cont zqrz-cont">
        <h2>产品特点：</h2>
        <div class="zqrz-text">
            ${fn:replace(prodetail.productdetail, vEnter, "</br>")} 
        </div>
    </div>
    <div class="tzq-cont zqrz-cont">
        <h2>申请条件：</h2>
        <div class="zqrz-text">
           ${fn:replace(prodetail.loancondition, vEnter, "</br>")}
        </div>
    </div>
</div>
<%-- <div class="zqrz-btn">
    <a class="zqrz-calc"><i><img src="${pageContext.request.contextPath}/app/images/calc.png"></i><p>计算器</p></a>
    <a class="zqrz-apply">立即申请贷款</a>
</div> --%>
<div id="modal"><a class="download-link">下载盈创动力APP</a></div>
  <script>
    $(function () {
        $('.go-download').click(function () {
            $('#modal').show();
        })

        $('#modal').click(function () {
            $(this).hide();
        });
        if (parseFloat($("#money1").attr("m1")) == parseFloat($("#money1").attr("m2"))) {
        	$("#money2").hide();
        	$("#money1").show();
        }
    })
</script>  
</body>
</html>