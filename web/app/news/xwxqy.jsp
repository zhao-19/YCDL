<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="${preface}">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${news.title}"/>
</jsp:include>
<body>
<div class="xwxqy">
    <div class="body-wrap">
        <h2>${news.title}</h2>
        <h3>${news.sendtime} ${news.source}<span style="float:right;">浏览：${news.hits}次</span></h3>
        <div class="xwxqy-preface">${preface}</div>
        <div id='font'>字号 <span><i id='big'>大</i><i class="active" id='middle'>中</i><i id='small'>小</i></span></div>
        <div class="xwxqy-cont" id="detail">
            ${news.contents}
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
		$("#detail *").css("fontSize", "0.28rem");
		$("#detail img").each(function(){
			$(this).css("width", $("#detail").width());
			$(this).css("height", 'auto');
		});

		$('#font i').click(function(e){
			e.preventDefault();
			$(this).addClass('active').siblings('.active').removeClass('active');
		})
	});
	$('#big').click(function(e){$("#detail *").css("fontSize", "0.4rem");})
	$('#middle').click(function(){$("#detail *").css("fontSize", "0.28rem");})
	$('#small').click(function(){$("#detail *").css("fontSize", "0.24rem");})
	
</script>
</body>
</html>