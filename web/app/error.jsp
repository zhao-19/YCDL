<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="访问出错了"/>
</jsp:include>
<style>
    .error{background:#eee;}
    .error .errorContent{width:100%;position:absolute;top:45%;left:0;transform:translateY(-50%)}
    .error .errorContent img{max-width:100%;}
    .error .errorContent p,.error .errorContent a{font-size:0.3rem;}
    .error .errorContent p{margin:0.8rem 0;color: #666;font-size: 0.34rem;}
    .error .errorContent a{color:#fff;padding:0.1rem 0.3rem;background:#f66719;border-radius:0.1rem;}
</style>
<body class="error">
<div class="errorContent tc">
    <img src="${pageContext.request.contextPath}/app/images/404.png">
    <p>${not empty h5errorMsg?h5errorMsg:"访问出错了，请返回！"}</p>
</div>
</body>
</html>