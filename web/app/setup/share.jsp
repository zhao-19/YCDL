<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="盈创动力APP（Android版/IOS版）是成都高投盈创动力投资发展有限公司为中小微企业和个人推出的满足其生产经营和消费中遇到各种问题的手机软件。具体功能有债权融资、股权融资、中介服务、培训活动、政策申报、信用查询、园区服务、企业帮等。盈创动力APP成为中小微企业科技金融服务的APP。">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="盈创动力APP"/>
</jsp:include>
<body class="appshare">
    <img src="${pageContext.request.contextPath}/app/images/appintro/appintro.png" alt="" style="display: block;">
    <a href="${pageContext.request.contextPath}/app/shdo.action" class="downappbtn">
        <img src="${pageContext.request.contextPath}/app/images/appintro/downappbtn.png" alt="" style="display: block;">
    </a>
	<script type="text/javascript">
		function notdown() { //app内不显示下载按钮
			$(function() {
				$('.downappbtn').hide();
			});
		}
    </script>

</body>
</html>