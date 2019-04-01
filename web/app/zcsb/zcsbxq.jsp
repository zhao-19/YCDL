<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="description" content="政策申报">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${result.title}"/>
</jsp:include>
<body class="zcsbxq">
    <div class="cont">
        <h2>${result.title}</h2>
        <div class="ov tip">
            <ul class="fl">
                <li class="addr">${result.location}</li>
                <li>${result.applynum}申请</li>
                <li>${result.visitfrequency}浏览</li>
            </ul>
            <p class="fr">${fn:substring(result.publishtime, 0, 11)}</p>
        </div>
        <p class="label">
            <span>${result.infotype}</span>
        </p>
        <div class="txt">
            <div>
                ${result.content}
            </div>
        </div>
        <p class="from">来源：<span>${result.info_source}</span></p>
    </div>
    <s:if test="#request.result.applyed == 10002 && (info==null || info != 0)">
        <p class="btn apply">我要咨询</p>
    </s:if>
    <s:elseif test="#request.result.applyed == 10001 && (info==null || info !=0)">
        <p class="btn">已咨询</p>
    </s:elseif>

<script type="text/javascript">
	$('.apply').click(function() {
		var para = new Object();
		para.pkid = '${result.pkid}';
		para.title = '${result.title}';
		if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
   			window.webkit.messageHandlers.zcsbxq.postMessage(para);
    	} else {
    		zcsbxq.zcsbxq(JSON.stringify(para));
    	}
	});
	$(function() {
		$(".txt *").css({
			'font-size' : '0.26rem',
			'font-family' : '微软雅黑',
			'color' : '#333',
			'line-height':"0.5rem",
            'max-width':'100%',
            'padding':0,
            'white-space': 'normal'

		});
        $(".txt table").css({
            'width':'100%',
            'border':'0'
        })
		$(".txt img").each(function() {
			$(this).css({
				"width" : $(".txt").width(),
				"height" : 'auto'
			});
		});
		$(".txt p").each(function(i, v) {
			if (parseInt($(this).css('text-indent')) > 30) {
				$(this).css({
					'text-indent':'0.6rem'
				});	
			}
		});
		$(".txt *").each(function(i, v) {
			  var reg=/&nbsp;/ig  
				if($(this).html().match(reg)) {
					$(this).html($(this).html().replace(reg,""))
				}
		});
		
		
		
	});
</script>
</body>
</html>