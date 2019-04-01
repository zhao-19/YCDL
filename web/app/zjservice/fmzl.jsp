<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="description" content="${incDetail.incredescrip}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${incDetail.increname}"/>
</jsp:include>
<style>
    .example{background: #fff; margin-bottom: 0.2rem; padding-bottom: 0;}
    .price{ margin-top: 0.25rem;font-family: "微软雅黑";}
    .price>h3{font-size:0.24rem; color: #ff432e;}
    .price>h3>strong{font-size:0.36rem;}
    .price>span{font-size: 0.24rem;}
    .oper>p{font-size: 0.22rem;padding-left: 0.3rem;font-family: "微软雅黑";
        background: url("${pageContext.request.contextPath}/app/images/time.png") no-repeat 0 center;
        background-size: 0.22rem 0.22rem;
    }
    .fwxq-cont{font:.24rem/.45rem '微软雅黑';color:#666;padding:3% 3% 0.88rem;}
    .fwxq-cont .zjbox{width:106%;margin:-3% 0 0 -3%;background: #eee;}
    .fwxq-cont .zjbox>h2{background: #fff;}
    .tzq-cont{margin-bottom:0.2rem;background: #fff;}
    .tzq-cont .tzq-text>p{padding:0.1rem 0;}
    .tzq-cont .tzq-text>p:first-child>span{color:#6185d6;}
    .tzq-cont .tzq-text>p>span{width: 20%;white-space: normal;padding:0 0.2rem;color:#666;box-sizing: border-box;}
    .tzq-cont .tzq-text>p>span:nth-child(2){width: 80%;}
    .tzq-cont .tzq-text2>p>span:nth-child(2){width: 60%;}
    .tzq-cont .tzq-text>p:nth-child(even){background-color: #fff ;}
    .tzq-cont .tzq-text>p:nth-child(odd){background-color: #eef2fb;}
    .tzq-cont .tzq-text>p{background: url("${pageContext.request.contextPath}/app/images/linepoint.png") repeat-y 20% 0;  }
    .tzq-cont .tzq-text2>p{background-image: url("${pageContext.request.contextPath}/app/images/linepoint.png"),url("${pageContext.request.contextPath}/app/images/linepoint.png");
        background-repeat: repeat-y;
        background-position: 20% 0,80% 0;
    }
    .tzq-cont .tzq-text{margin:0.1rem 0;}
    .tzq-cont h4{margin:0.3rem 0 0.2rem;}
    .zizhi{overflow: hidden;}
    .zizhi>img{width: 49%;float:left;margin-right: 2%;}
    .zizhi>img:nth-child(even){margin-right: 0;}
</style>
<body class="fwxq">
<c:if test="${info==0}">
<div class="tzq example">
<div class="banner bg">
    <div class="box ov">
        <div class="flex">
            <img src="${incDetail.picture}" alt="" class="fl">
            <div class="fl info">
                <h2>${incDetail.increname}</h2>
            </div>
        </div>
        <div class="ov price">
            <h3 class="fl"><strong>￥${incDetail.increprice}</strong>起</h3>
            <span class="fr">销量：${not empty incDetail.sellcount?incDetail.sellcount:0}
            </span>
        </div>
    </div>
    <div class="oper ov">
        <p class="fl">${fn:substring(incDetail.lastchgtime, 0, 11)}</p>
        <span>${collectno}关注</span>
        <span>${incDetail.browsecount}浏览</span>
    </div>
</div>
</div>
</c:if>
<div class="fwxq-cont">
    ${incDetail.increcontenttext}
</div>
    <c:if test="${isShare}">
        <div class="fwxq-btn">
            <a class="fwxq-calc"><i><img src="${pageContext.request.contextPath}/app/images/collection.png"></i><p>收藏</p></a>
            <a class="fwxq-apply">立即预约</a>
        </div>
    </c:if>
    <script type="text/javascript">
        //给电话号码加上A标签可以呼出
//       var str = $("#repfm").html();
//	   var reg = /1(\d{10})/g;
//	   str = str.replace(reg,"<a href=\"javascript:volid(0);\" onclick=\"invokecall('1$1');\">1$1</a><br/>");
//	   var reg1=/(\d{3}-\d{8}|\d{4}-\d{7})/g
//	   str = str.replace(reg1,"<a href=\"javascript:volid(0);\" onclick=\"invokecall('$1');\">$1</a><br/>");
//	   $("#repfm").html(str);
	   
	   function invokecall (phone) {
	   		if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
    			window.webkit.messageHandlers.invokecall.postMessage(phone);
	    	} else {
	    		callPhone.callPhone(phone);
	    	}
    	}
    </script>
</body>
</html>