<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="${guquan.jianjie}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${guquan.mingcheng}"/>
</jsp:include>
<body class="gqrz example">

<div class="banner bg">
    <div class="box ov">
        <div>
           <dl>
               <dt>融资金额</dt>
               <dd><strong>¥${guquan.rongziedu}</strong>万</dd>
           </dl>
            <dl>
                <dt>出让股份</dt>
                <dd><strong>${guquan.crgqbl}</strong>%</dd>
            </dl>
        </div>
        <div>
           <p><span>融资轮次</span>${guquan.rongzhijieduan}</p>
           <p><span>项目阶段</span>${guquan.xiangmuzhuangtai}</p>
           <p><span>已推荐机构</span><i class="recmpno"><b>${not empty recmpno?recmpno:0}</b>家</i></p>


        </div>
    </div>
    <div class="oper ov">
        <span class="fl">${guquan.lurushijian }</span>
        <span>${not empty guquan.browsecount?guquan.browsecount:0}浏览</span>

    </div>
</div>


<div class="gqrz-intro">
    <div class="intro-nav">
        <a class="active">项目介绍</a>
        <a>评论(${commentcount})</a>
    </div>
    <ul class="intro-cont">
        <li>
            <div class="gqrz-cont">
                <dl>
                    <dt>项目产品介绍：</dt>
                    <dd>${guquan.jianjie}</dd>
                </dl>
                <dl>
                    <dt>商业计划书：</dt>
                    <c:if test="${fn:length(picdeatil) == 0}">
                    <dd>
                       无
                    </dd>
                    </c:if>
                    <c:if test="${fn:length(picdeatil) != 0}">
                        <c:forEach var="e" items="${picdeatil}" varStatus="status">
                         <dd>
                             <img src="${pageContext.request.contextPath}${e}"/>
                          </dd>
                        </c:forEach>
                    </c:if>
                </dl>
            </div>
        </li>
    </ul>
</div>
<div id="modal"><a class="download-link">下载盈创动力APP</a></div>
<div id="modal2">
    <div>
        <ul>
            <c:if test="${fn:length(recmpnolist) == 0}">
                <li>暂无推荐机构</li>

            </c:if>
            <c:if test="${fn:length(recmpnolist) != 0}">
                <c:forEach var="e" items="${recmpnolist}" varStatus="status">
                <li>${e}</li>
                </c:forEach>
            </c:if>
        </ul>
    </div>

</div>
<script>
    $(function () {
        $('.gqrz-wrap').css('width',$('.team-item').length*3.4+'rem');
        $('.intro-nav a').click(function () {
            if($(this).index()==1){
                var modal='<div id=modal></div>';
                $('#modal').show();
                return;
            }
            $(this).addClass('active').siblings().removeClass('active');
            $('.intro-cont').find('li').eq($(this).index()).show().siblings().hide();
        });
        $('.recmpno').click(function () {
            $('#modal2').show();
        });

        $('#modal,#modal2').click(function (){
            $(this).hide();
        });


    })
</script>
</body>
</html>