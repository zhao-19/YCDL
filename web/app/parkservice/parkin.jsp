<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="园区入驻">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="园区入驻"/>
</jsp:include>
<body class="example parkin">
<div class="topnav">
    <div class="flex" style="align-items: center;">
        <span class="fl" id="dsback">园区入驻</span>
        <span class="tr">
            <img src="${pageContext.request.contextPath}/app/images/rzds/share.png" alt="" class="fr" id="dsshare">
        </span>
    </div>
</div>
<div class="banner">
    <img src="${pageContext.request.contextPath}/app/images/park/parkinbg.png" alt=""/>
    <div class="txt">
        <p>我们提供园区周到便捷的增值服务，帮助园区提升管理效率，实现园区招商引资和运营发展的目标，现已吸引众多优质产业园区加入。</p>
        <img src="${pageContext.request.contextPath}/app/images/park/parkinimgs.png" alt="">
        <p>截止2017年，盈创动力科技金融服务平台为19000余家（次）中小企业提供各类平台金融服务，我们通过业务线上办理，打破服务的地域限制，成功推动了千余家企业发展，奠定了良好的客户资源基础。</p>
        <span>点击下方立即入驻，使更多企业看到您！</span>
    </div>
</div>
<script type="text/javascript">
    window.onload=function () {
        var h = $('.banner>img').height();
        $(window).scroll(function(){
            var top = $(document).scrollTop();
            var opc=top/h;
            if(opc>1){
                opc=1;
            }else if(opc<0){
                opc=0;
            }
            $('.topnav').css({
                'background':'rgba(85,132,210,'+opc+')'
            })
        });
    }
    $(function(){
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            $('.topnav').css({
                'height':'1.28rem',
                'paddingTop':'0.4rem'
            });
            $('.topnav>.flex').css({
                'height':'0.88rem'
            })
        } else {
            $('.topnav').css({
                'height':'1.53rem',
                'paddingTop':'0.53rem'
            });
            $('.topnav>.flex').css({
                'height':'1rem'
            })
        }
    });
    if ("${info}" == "0") {
        $('.yzds .topnav').hide();
    }
    var dsid='123';
    $('#dsback').click(function(){
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            window.webkit.messageHandlers.dsback.postMessage(dsid);
        } else {
            dsback.dsback(dsid);
        }
    });
    $('#dsshare').click(function(){
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            window.webkit.messageHandlers.dsshare.postMessage(dsid);
        } else {
            dsshare.dsshare(dsid);
        }
    });

</script>
</body>
</html>