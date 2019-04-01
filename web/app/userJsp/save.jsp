<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="保存成功"/>
</jsp:include>
<body>
    <div class="save">
        <img src="${pageContext.request.contextPath}/app/images/saveOk.png" alt="">
        <p>
            ${message }
        </p>
    </div>
</body>
</html>