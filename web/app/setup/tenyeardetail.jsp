<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="盈创动力十周年，免费请你看电影！">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="盈创动力十周年"/>
</jsp:include>
<body class="tenyeardetail">
<div class="ticketbox">
    <div class="box">
        <div class="ticket">
            <em>活动1：下载APP，人人拿好礼</em>
            <s:if test="#request.tendate.geted=='10001'">
                <div class="tc ticketimg">
                    <h2>恭喜！获得电影票一张</h2>
                    <img src="${pageContext.request.contextPath}/app/images/tenyear/ticket.png" alt="" style="width: 4.36rem;">
                </div>
                <p>*恭喜您已经获得电影票1张，系统会将电影券号码短信发送到您${tendate.cellphone}的手机，请注意查收。</p>
            </s:if>
            <s:else>
                <div class="tc ticketimg">
                  <h2>真棒！电影票马上就到手啦</h2>
                  <img src="${pageContext.request.contextPath}/app/images/tenyear/ticketgray.png" alt="" style="width: 4.36rem;">
                </div>
                <p>*以下条件全部满足后，系统将在第二个工作日发放电影票。</p>
            </s:else>
            <ul class="step">
                <s:if test="#request.tendate.register=='10001'">
                    <li class="yes">是否注册登录并绑定手机</li>
                </s:if>
                <s:else>
                    <li>是否注册登录并绑定手机<button onclick="ticket(1,this)">立即前往</button></li>
                </s:else>

                <s:if test="#request.tendate.releqiye=='10001'">
                    <li class="yes">是否关联企业</li>
                </s:if>
                <s:else>
                    <li>是否关联企业<button onclick="ticket(2,this)">立即关联</button></li>
                </s:else>
                <s:if test="#request.tendate.nametype=='10001'">
                    <li class="yes">是否填写姓名职位</li>
                </s:if>
                <s:else>
                    <li>是否填写姓名职位<button onclick="ticket(3,this)">立即填写</button></li>
                </s:else>
                <s:if test="#request.tendate.license=='10001'">
                    <li class="yes">是否上传营业执照</li>
                </s:if>
                <s:else>
                    <li>是否上传营业执照<button onclick="ticket(4,this)">立即上传</button>
                        <p class="one">*请等待主账号上传！</p>
                        <p class="two">*请先关联企业！</p>
                    </li>
                </s:else>
                <s:if test="#request.tendate.mainuser=='10001'">
                    <li class="yes">是否通过主账号审核</li>
                </s:if>
                <s:else>
                    <li>是否通过主账号审核<button onclick="ticket(5,this)">立即查看</button>
                        <p class="one">*请等待主账号审核！</p>
                    </li>
                </s:else>
            </ul>
        </div>
        <img src="${pageContext.request.contextPath}/app/images/tenyear/fenge.png" alt="">
        <div class="ticket">
            <em>活动2：分享APP，额外送惊喜</em>

            <s:if test="#request.tendate.shareusers.size()==0">
                <div class="tc ticketimg">
                    <h2>您还未邀请任何好友</h2>
                </div>
                <p>*每三位好友完成活动1，您可额外获赠一张电影票，我们将于活动结束后统一短信发放。</p>
                <br>
                <img src="${pageContext.request.contextPath}/app/images/tenyear/sharestep.png" alt="">
            </s:if>
            <s:else>
                <div class="tc ticketimg">
                    <h2>快看！这是您的好友邀请情况</h2>
                </div>
                <p>*每三位好友完成活动1，您可额外获赠一张电影票，我们将于活动结束后统一短信发放。</p>
                <ul class="friend tc">
                    <li>
                        <ol>
                            <li>手机号</li>
                            <li>姓名</li>
                            <li>关联企业</li>
                            <li>营业执照</li>
                            <li>主账号审核</li>
                        </ol>
                    </li>
                    <c:forEach items="${tendate.shareusers}" var="data">
                        <li>
                            <ol>
                                <li>${data.cellphone}</li>
                                <li>${data.username}</li>
                                <c:if test="${data.releqiye=='10001'}">
                                    <li class="yes"></li>
                                </c:if>
                                <c:if test="${data.releqiye=='10002'}">
                                    <li></li>
                                </c:if>

                                <c:if test="${data.license=='10001'}">
                                    <li class="yes"></li>
                                </c:if>
                                <c:if test="${data.license=='10002'}">
                                    <li></li>
                                </c:if>

                                <c:if test="${data.mainuser=='10001'}">
                                    <li class="yes"></li>
                                </c:if>
                                <c:if test="${data.mainuser=='10002'}">
                                    <li></li>
                                </c:if>
                            </ol>
                        </li>
                    </c:forEach>
                    <li><h4>目前您获得电影票数量为：${tendate.tickets}张</h4></li>
                </ul>
            </s:else>
        </div>
    </div>
</div>
<script>
    window.onload=function (ev) {
        if('${tendate.register}'!='10001'){
            $('.ticketbox .ticket .step>li:first-child~li button').attr('disabled','true');
        }
        if('${tendate.releqiye}'!='10001'){
            $('.ticketbox .ticket .step>li:nth-child(3) button,.ticketbox .ticket .step>li:nth-child(4) button').attr('disabled','true');
        }
    };
    function ticket(type,obj) {
        //type 代表要处理的事项
        // 1   注册并登录
        // 2   关联企业
        // 3   填写姓名职位
        // 4   上传营业执照
        // 5   主账号审核
        if (type == 4) {
            if ('${tendate.releqiye}' != '10001') {
                $(obj).siblings('p.two').show();
            } else if ('${tendate.ismainuser}' != '10001') {
                $(obj).siblings('p.one').show();
            } else {
                if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
                    window.webkit.messageHandlers.ticketComplete.postMessage(type);
                } else {
                    ticketComplete.ticketComplete(type);
                }
            }
        } else if (type == 5) {
            if ('${tendate.ismainuser}' != '10001') {
                $(obj).siblings('p.one').show();
            } else {
                if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
                    window.webkit.messageHandlers.ticketComplete.postMessage(type);
                } else {
                    ticketComplete.ticketComplete(type);
                }
            }
        } else {
            if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
                window.webkit.messageHandlers.ticketComplete.postMessage(type);
            } else {
                ticketComplete.ticketComplete(type);
            }
        }
    }
    function refresh(userid){
        window.location.href="${pageContext.request.contextPath}/app/tenyeardetail.action?userid="+userid;
    }
</script>
</body>
</html>