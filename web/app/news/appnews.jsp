<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--<meta name="description" content="${dynamic[0].title}">-->
<meta name="description" content="盈创动力每日资讯">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="盈创资讯"/>
</jsp:include>
<body class="zixun">
    <img src="${pageContext.request.contextPath}/app/images/appnewsbanner.png" alt="">
    <div class="section">
        <div class="info">
            <div class="time">
                <b class="bor">${appnews.label }</b>
            </div>
            <div class="other">
                <i></i>
                <p><b>日期</b><span>${appnews.newstime}</span></p>
                <p><b>阅读</b><span>${appnews.times }</span></p>
            </div>
        </div>
    </div>
        <div class="marginLine"></div>
    <div class="section">
        <div class="news">
            <ul>
            	<s:iterator value="#request.dynamic">
					<li>
	                    <h3><b class="bor local">${tag}</b>${title}</h3>
	                    <p class='shou active'>
                            <i>${intro}</i>
                            <span class='looktxt'><b class="elli">...</b>查看全文</span>
                        </p>
	                    <p class='zhan'>${fn:replace(intro, vEnter, '<br/>&#12288;&#12288;')}
	                    	<!--<span class="ov">-->
                            	<!--<s:if test="dauthor != '' and dauthor != null"><span>作者：${dauthor }</span></s:if>-->
                                <!--<s:if test="dsource != '' and dsource !=null"><span>来源：${dsource }</span></s:if>-->
	                    	<!--</span>-->
                            <b class='looktxt'>收起</b>
                        </p>
	                </li>
				</s:iterator>
            </ul>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/app/shdo.action" id="down"><img src="${pageContext.request.contextPath}/app/images/appnewsdown.png" alt=""></a>
	<script type="text/javascript">
        window.onload=function () {
            var docfont=parseInt(document.documentElement.style.fontSize);
            $('.shou').each(function(i,v){
                var a=$(this).find('i').height();
                if(a<=(1.44*docfont)){
                    $(this).find('.looktxt').hide();
                }
            })
        }
		$('.looktxt').click(function() {
			var a = $(this).parent().parent().prevAll('li').find('p.active.zhan').height()
			var b;
			if (a && a > 0) {
				b = a - (1.44 * parseInt(document.documentElement.style.fontSize))
			} else {
				b = 0;
			}
			$('.zixun .news>ul>li>p.active.zhan').hide().removeClass('active');
			$('.zixun .news>ul>li>p.shou').show().addClass('active');
			$(this).parent('p').hide().removeClass('active');
			$(this).parent('p').siblings('p').show().addClass('active');
			var x = $(window).scrollTop() - b;
			$(window).scrollTop(x)
		})
	</script>


	<script type="text/javascript">
	 	function notdown() {	//app内点击无效 不需跳转下载页面
	 		$('#down').click(function(e){
	   			e.preventDefault()
	   		});
	 	}
   </script>
</body>
</html>