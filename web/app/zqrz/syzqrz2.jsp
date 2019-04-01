<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="债权项目"/>
</jsp:include>
<body class='zqintro'>
    <p><img src="${pageContext.request.contextPath}/app/images/ycdl2.jpg" style="display:block;"></p>
    <div class="txt">
    	<h2>科技金融 探索与创新</h2>
	    <p>
	    	成都高新区作为首批促进科技与金融结合试点地区，不断加强科技金融创新，由管委会下属国有独资公司成都高新投资集团投资打造了盈创动力科技金融服务平台。
	    </p>
    </div>	
    <div class="marginLine"></div>
    <div class="txt">
    	<h2>物理载体</h2>
	    <p>
	    	盈创动力目前已建立起以盈创动力大厦为代表，总计超过60000平方米的金融资源聚集物理空间，吸引了人民银行、交通银行、成都银行、农业银行、川藏股权交易中心、成都生产力促进中心、美国凯雷投资、美国VIVO基金、韩国KTB基金等50余家金融机构和投融资资服务机构入驻，注册资本超过100亿元（人民币），聚集资金市场规模超过200亿元（人民币）。盈创动力周边已聚集3家省级分行、2家一级支行和3家二级支行。
	    </p>
	    <br/>
	    <img src="${pageContext.request.contextPath}/app/images/ycgm.png" id="pinch-small" class="btn4">
	     <p class="lookbigpic">点击图片查看大图</p>
	     <br/>
	     
	     <div class="pinch-zoom-container">
        <div class="pinch-zoom">
            <img src="${pageContext.request.contextPath}/app/images/ycgm2.png">
        </div>
  		  </div>
	    
    </div>	
     <div class="marginLine"></div>
 <script type="text/javascript">

        $(function () {
            $('#pinch-small').click(function(){
                $('.pinch-zoom-container').fadeIn(300);
                $('.pinch-zoom').fadeIn(300).css('transform','scale(1)');
//                $('.pinch-zoom img').addClass('popFade');
            });
            $('div.pinch-zoom').each(function () {
                new RTP.PinchZoom($(this), {});
            });
            $('.pinch-zoom-container').click(function(){
                $(this).fadeOut(300);
                $('.pinch-zoom').fadeOut(300).css('transform','scale(1)');
//                $('.pinch-zoom img').removeClass('popFade');
            })

        })
    </script>
</body>
</html>