<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="面向开具增值税发票的企业客户，只要与平安银行认可的优质企业合作稳定，或与企业自身下游交易对手合作稳定，交易频繁，即可申请平安银行“发票贷”。">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="平安银行KYB发票贷"/>
</jsp:include>
<body>
    <div class="pinganbank">
        <img src="${pageContext.request.contextPath}/app/images/pinganbank.jpg" alt="" style="display:block;">
        <a href="https://f.orangebank.com.cn/nscf/H5/index.html#/A01_infor2?inputChId=gtyccdfh&custMaId=WUWANLI568&channelUser=01&spread=w&from=click" id="apply"></a>
        <span id="call"></span>
    </div>

    <script>
        $('#call').click(function () {
            if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
                window.webkit.messageHandlers.callPhone.postMessage('18908222430');
            } else {
            	callPhone.callPhone('18908222430');
            }
        })
    </script>
</body>
</html>