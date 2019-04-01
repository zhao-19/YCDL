<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="${result.introduce}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${result.username}"/>
</jsp:include>

<body class="example yzds">
<div class="topnav">
    <div class="flex" style="align-items: center;">
        <span class="fl" id="dsback">导师详情</span>
        <span class="tr">
            <img src="${pageContext.request.contextPath}/app/images/rzds/share.png" alt="" class="fr" id="dsshare">
        </span>
    </div>
</div>
    <div class="banner">
        <div class="box ov">
            <img src="${result.headimg}" alt="" class="fl">
            <div class="fl info">
                <!--<h2>${result.username} <span>${result.profession}</span></h2>-->
                <h2>${result.username}
                    <c:if test="${sift eq '10001'}">
                        <span>明星导师</span>
                    </c:if>
                    <b class="zan" onclick="tolike();"></b></h2>
                <ul class="ov">
                    <c:forEach var="e" items="${label}" varStatus="status">
                        <li>${e}</li>
                    </c:forEach>
                </ul>
                <p>${result.introduce}</p>
            </div>
        </div>
        <div class="oper ov">
            <!--<span class="zan" onclick="tolike();">${result.likenum }</span>-->
            <!--点赞后的样式-->
            <!--<span class="zan on">258</span>-->
            <!--<span class="plun" onclick="comment();">${commentcount }</span>-->
            <span>${result.readtimes }浏览</span>
            <span>${result.likenum }赞</span>

        </div>
    </div>
    <div class="detail">
        <h2>详细介绍</h2>
        <div>
           ${not empty result.investment?result.investment:"没有详细介绍"}
        </div>
    </div>
<script type="text/javascript">



    window.onload=function () {
        var h = $('.box').height();
        $(window).scroll(function(){
            var top = $(document).scrollTop();
            var opc=top/h;
            if(opc>1){
                opc=1;
            }else if(opc<0){
                opc=0;
            }
            $('.topnav').css({
                'background':'rgba(250,132,60,'+opc+')'
            })
        });
    }
    $(function(){
        $(".detail>div *").css({
            "fontSize": "0.26rem",
            "line-height":"0.5rem"
        });
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            $('.yzds .topnav').css({
                'height':'1.28rem',
                'paddingTop':'0.4rem'
            })
            $('.yzds .topnav>.flex').css({
                'height':'0.88rem'
            })
            $('.yzds .banner').css({
                'paddingTop':'1.28rem'
            })

        } else {
            $('.yzds .topnav').css({
                'height':'1.53rem',
                'paddingTop':'0.53rem'
            })
            $('.yzds .topnav>.flex').css({
                'height':'1rem'
            })
            $('.yzds .banner').css({
                'paddingTop':'1.53rem'
            })
        }
    });

	function comment() {
		if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
   			window.webkit.messageHandlers.tocomment.postMessage('${result.id}');
    	} else {
    		tocomment.tocomment('${result.id}');
    	}
	}
	
	function tolike(){
		if (!$(".zan").hasClass("con")) {
			$(".zan").addClass("con");
			if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
    			window.webkit.messageHandlers.perlike.postMessage('${result.id}');
	    	} else {
	    		perlike.perlike('${result.id}');
	    	}
		}
	}
	
	function toperlike() {
		$(".zan").addClass("on");
	}

	if ("${info}" == "0") {
//		$('.banner').addClass('bg');
        $('.yzds .topnav').hide();
	}
	
	var para = new Object();
	para.id = '${result.id}';
	para.iscollect = '${iscollect}';
	if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
  		window.webkit.messageHandlers.likeds.postMessage(para);
   	} else {
   		likeds.likeds(JSON.stringify(para));
   	}
   	var dsid='${result.id}';
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