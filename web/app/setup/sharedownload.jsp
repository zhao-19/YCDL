<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="盈企汇APP（Android版/IOS版）是成都高投盈创动力投资发展有限公司为中小微企业和个人推出的满足其生产经营和消费中遇到各种问题的手机软件。具体功能有债权融资、股权融资、中介服务、培训活动、政策申报、信用查询、园区服务、企业帮等。盈创动力APP成为中小微企业科技金融服务的APP。">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="下载盈企汇APP"/>
</jsp:include>
<body>
<div class="save" style="top:53%;display: none;">
    <img src="${pageContext.request.contextPath}/app/images/sharedownload_step.png" alt="" style="width: 66%;">
</div>
<script type="text/javascript">
    if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
		window.location.href="https://itunes.apple.com/cn/app//id1451278255?mt=8";
	} else {
		var agent = navigator.userAgent.toLowerCase();
	    if (agent.match(/MicroMessenger/i) == "micromessenger") {
	        $('.save').show();
	    } else {
	    	window.location.href="/attached/app/winpow.apk";
	    }
	}

</script>
</body>
</html>