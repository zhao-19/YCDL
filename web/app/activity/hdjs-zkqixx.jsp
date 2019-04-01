<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="${activities.activities_address}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${activities.activities_name}"/>
</jsp:include>
<body class="hdjs">
    <div id="modal" style="display: none;"></div>
    <div class="hdjs-cont hdjs-cont-xq" id="">
        <h2>${activities.activities_name}</h2>
         <div class="hdjs-cont-xq-top">
            <dl>
                <dt>主办方：</dt>
                <dd>${activities.agenciesname}</dd>
            </dl>
            <dl>
                <dt>主讲嘉宾：</dt>
                <dd><span>${activities.activities_guests}</span></dd>
            </dl>
            <dl>
                <dt>适用人群：</dt>
                <dd>${activities.adtypeStr}</dd>
            </dl>
            <dl>
                <dt>限制人数：</dt>
                <dd>${activities.maxattend}人</dd>
            </dl>
        </div>
        <div class="hdjs-cont-xq-bot">
            <h3>活动详情介绍</h3>
            <div id='detail' style="overflow-x: hidden;">${activities.activities_detail}</div>
        </div>
    </div>
    <c:if test="${isShare}">
        <a class="bottom-btn join-btn">我要参加</a>
    </c:if>

<script>
    $(function(){
        $("#detail *").css({
            "fontSize": "0.24rem",
            'line-height':'0.45rem'
        });
        $("#detail img").each(function(){
            $(this).css({
                "max-width" : '92%',
                "height" : 'auto'
            });
        });

        $("#detail p").each(function(i, v) {
            if (parseInt($(this).css('text-indent')) > 30) {
                $(this).css({
                    'text-indent':'0.48rem'
                });
            }
        });
    });

    $(function () {
//        $('.join-btn').click(function () {
//            $('#modal').show();
//            $('.alert-wrap').addClass('show');
//            $('.submit-btn').removeClass('hide');
//        });
//
//        $('#modal').click(function () {
//            $(this).hide();
//            $('.alert-wrap').removeClass('show');
//            $('.submit-btn').addClass('hide');
//        })
//
//        $('.alert-wrap ul').delegate('li','click',function () {
//            $(this).click(function () {
//                $(this).find('.check-box').toggleClass('checked');
//            })
//        })
    })

</script>
</body>
</html>