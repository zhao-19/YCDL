<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="邀请函"/>
</jsp:include>
<body>
    <!-- <div class="save"> -->
        <%-- <img src="${pageContext.request.contextPath}/app/images/onlyVIP.png" alt=""> --%>
        <p>
            <img style="width: 100%" src="/app/invitationimg.action?userid=${userid }&acid=${acid}"/>
        </p>
    <!-- </div> -->
</body>
</html>