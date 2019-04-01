<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="加快金融支持成都高新自贸试验区建设，助力辖内中小微外向型企业发展。">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="自贸通"/>
</jsp:include>
<body class="zimaotong">
    <div class="boxs">
        <div class="box" style="text-indent: 0.6rem;">
            为贯彻落实党中央、国务院关于自由贸易试验区的决策部署，进一步统筹推进双向开放、支持企业扩大进出口，成都高新自由贸易试验区联合成都银行针对外向型中小微企业推出由<b>"自贸贷"</b>、<b>"自贸惠"</b>和<b>"自贸易"</b>构成的<b>"自贸通金融服务"</b>，旨在通过整合各类政策资源和金融资源，切实为企业提供优质、高效、低成本的全方位金融服务，进一步解决中小微企业融资难、融资贵、成本高的问题。
        </div>
        <div class="box">
            <h2>自贸贷</h2>
            <p>在符合国家产业政策和银行信贷管理要求的条件下，成都银行在"成长贷"等系列银政融资产品框架内为企业提供融资服务。</p>
            <h3>产品特点（以成长贷为例）</h3>
            <dl>
                <dt>成本低</dt>
                <dd>针对中小微企业，贷款成本较低，贷款利率上浮最高不超过人民银行当期公布的基准贷款利率的20%。</dd>
                <dt>担保灵活</dt>
                <dd>针对中小企微企业的特点，减少了对反担保物的要求，反担保主要采取个人连带责任、订单、公司股权、知识产权、国家或行业标准等形式，实物资产少于全部担保责任额的50%。</dd>
                <dt>补贴高</dt>
                <dd>享受区级银行基准利息60%，担保费60%补贴。</dd>
            </dl>
        </div>
        <div class="box">
            <h2>自贸惠</h2>
            <p>企业办理国际结算过程中，可以申请减免国际结算手续费，降低企业费用成本。</p>
        </div>
        <div class="box">
            <h2>自贸易</h2>
            <p>成都银行为企业提供服务的过程中，利用自身优势，联合境内外相关机构，为企业提供特殊便利化服务，主要包括"绿色通道服务"、"资信调查服务"以及"境外金融服务"。</p>
            <dl>
                <dt>绿色通道服务</dt>
                <dd>成都银行为企业开辟业务办理绿色通道。在优先办理企业的开户、本外币结算、授信等业务的同时，充分利用成都银行遍布全球的代理行清算网络，办理外汇及跨境人民币业务，全面提升业务办理效率。</dd>
                <dt>资信调查服务</dt>
                <dd>由成都银行联合相关机构免费为企业提供针对其境外交易对手的资信调查。帮助企业了解交易对手的资信情况，增强企业签订跨国合同、承接跨国订单的信心，促进企业涉外业务的发展和整体业务规模的扩大。</dd>
                <dt>金融咨询服务</dt>
                <dd>由成都银行免费为企业提供综合金融咨询服务，帮助企业充分利用各类金融产品及优惠政策。</dd>
                <dt>境外金融服务</dt>
                <dd>由成都银行协调战略投资者马来西亚丰隆银行，充分发挥丰隆银行在马来西亚、新加坡、柬埔寨、越南、香港的网点优势，为企业提供"一带一路"沿线境外投资、跨境融资、业务渠道拓展等全方位金融服务，帮助企业"走出去"。</dd>
            </dl>
        </div>
        <div class="box">
            <h2>联系我们</h2>
            <dl class="phone">
                <dt><span>陈竹</span><b><i>02886160806</i></b></dt>
                <dd><span>李启鸣</span><b><i>02886160930</i></b></dd>
                <dt><span>孙宇翔</span><b><i>02886160930</i></b></dt>
                <dd><span>解恒</span><b><i>02886160930</i></b></dd>
            </dl>
            <p style="font-size: 0.26rem;">*请在工作时间：上午9:00至12:00，下午14:00至17:30内联系工作人员。</p>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/app/tradeapply.action" class="zmtapply" style="display: block !important;">立即申请服务</a>
    <script>
        //打电话交互
        $('.phone i').each(function (i,v) {
           $(this).click(function () {
               var phonenum=$(this).text();
               if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
                   window.webkit.messageHandlers.callPhone.postMessage(phonenum);
               } else {
                   callPhone.callPhone(phonenum);
               }
           })
        })

    </script>
</body>
</html>