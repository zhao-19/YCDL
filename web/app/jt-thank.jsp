<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="感谢"/>
</jsp:include>
<body>

<div class="thank">
    <img src='${pageContext.request.contextPath}/app/images/jt-logo.png'/>
    <div class="thankWord">
    感谢 <b>${name}</b> 的支持，我们会在两个工作日之内联系您商榷细节，盈创动力祝新年快乐 生意兴隆。
    </div>
</div>
</body>
</html>