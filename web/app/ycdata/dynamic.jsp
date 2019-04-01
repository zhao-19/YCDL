<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="提示"/>
</jsp:include>
<body>
    <div class="save">
        <img src="${pageContext.request.contextPath}/app/images/onlyVIP.png" alt="">
        <p>
            该功能暂未开放！
        </p>
    </div>
</body>
</html>