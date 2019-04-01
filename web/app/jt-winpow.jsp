<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="盈创动力产品招募"/>
</jsp:include>
    <script src="${pageContext.request.contextPath}/app/js/check.js"></script>
<body class="jt-winpow">
    <div></div>
    <div class="banner"><img src="${pageContext.request.contextPath}/app/images/jtwin-banner2.jpg" alt=""></div>
    <div class="main">
        <div class="preface">
            <h2>前言</h2>
            <p>为缓解中小企业融资难、融资贵问题，经多年的运营发展，盈创动力建立了债权融资服务、股权融资服务和增值服务三大服务体系，为科技型中小企业提供全方位“一站式”投融资服务。2016年，盈创动力入选“2016四川十大改革转型发展案例”、“四川省首批21条全面创新改革试验经验”；2017年，盈创动力“面向中小企业的一站式投融资信息服务”获国务院全国推广。</p>
            <p>截至2017年底，累计为5400余家科技型中小企业提供债权融资约430亿元，股权融资超过74亿元，19000余家次中小企业提供投融资增值服务，助推80余家中小企业改制上市。</p>
        </div>
        <div class="content">
            <h1 class="tc"><span>盈创动力APP</span></h1>
            <p>为进一步提升盈创动科技金融服务能力，按照国务院推广要求，盈创动力APP系统即将上线，打造“中小企业一站式投融资信息服务平台”，科技金融服务模式升级2.0版。盈创动力APP汇集政府、金融机构、第三方中介机构、信用信息等资源，架构了债权融资、股权融资、中介服务、培训活动、政策申报、企业帮、投资圈、园区服务、政务服务等多功能服务板块，为科技型中小企业提供一站式、标准化、专业化的投融资服务。</p>
            <div class="tc"><img src="images/jtwin-phone.png" alt=""></div>
            <h1 class="tc"><span>重点服务和产品招募介绍</span></h1>
            <h2>1.债权融资</h2>
            <p>为中小企业提供各类金融机构的信贷产品，包括政策性产品、商业化产品、企业主产品等，打通企业融资渠道，实现债权融资全覆盖。现招募各类银行、小贷等机构推出的特色中小企业贷款产品，中小企业融资一键解决。</p>
            <h2>2.股权融资和投资圈</h2>
            <p>为项目提供与知名投资机构和投资人对接交流平台和在线辅导平台，包括天使投资机构、VC/PE机构、知名投资人（包括各类行业专家），打通项目与资本对接渠道。现招募各类投资机构、投资人股权投资信息。</p>
            <h2>3.中介服务</h2>
            <p>为企业提供知识产权、财税、法律、人才、融资顾问等第三方中介服务，现招募各类中介服务机构产品和服务。</p>
            <h2>4.企业帮</h2>
            <p>为企业提供产品、技术、成果等对接和交流平台，并实现企业之间资源共享和整合。现招募中小企业有意向的各类产品、服务、设备、技术等供给信息。</p>
            <%--<div class="boxtxt">--%>
                <%--现面向广大企业、机构招募优质服务产品， 盈创动力在此邀您沟通与合作， 与您携手共赢！--%>
            <%--</div>--%>
            <div class="tc" style="margin:0.5rem 0;"><img src="images/jtwin-boxtxt.png" alt=""></div>
            <div class="message">
                <h2>产品招募信息填写</h2>
                <div class="mes-box">
                    <div class="mes">
                       <form action="${pageContext.request.contextPath}/app/productapply.action" method="post" name="productname" onsubmit="return check_message(this);">
                            <p class="one"><span>产品招募名称<b>&nbsp;*</b></span><input type="text" name="appProductApply.productname" maxlength="50"></p>
                            <p><span>姓 名<i></i></span><b>&nbsp;*</b><input type="text" name="appProductApply.linkman" maxlength="5"></p>
                            <p><span>联 系 手 机<i></i></span><b>&nbsp;*</b><input type="tel" name="appProductApply.cellphone" maxlength="11"></p>
                            <p><span>公 司 名 称<i></i></span><b>&nbsp;*</b><input type="text" name="appProductApply.companyname" maxlength="50"></p>
                            <p><span>职 务<i></i></span><b>&nbsp;*</b><input type="text" name="appProductApply.job" maxlength="50"></p>
                            <p><span>邮 箱<i></i></span><b>&nbsp;*</b><input type="email" name="appProductApply.email" maxlength="50"></p>
                            <div class="sub"><input type="submit"></div>
                        </form>
                    </div>
                </div>
                <p>*登记后盈创动力工作人员将在2个工作日内与您联系。</p>
            </div>

            <div class="contact">
                <h1 class="tc"><span>联系我们</span></h1>
                <div class="txt">
                    <p>- 成都高投盈创动力投资发展有限公司</p>
                    <p>- 联系人：邹&emsp;涛 <a href="tel:02885337000">028-85337000</a> </p>
                    <p>- 联系人：杨兰馨 <a href="tel:02883159999">028-83159999</a> </p>
                </div>
            </div>
        </div>
    </div>
<div class="footer"><img src="images/jtwin-footer.png" alt=""></div>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script>
    window.onload = function () { //进入页面就执行ajax，目的为了传送当前页面url#前的完整url

       function wxyz(isrefresh){
            var token;
            var url;
             $.ajax({
             url: '/app/wechat/gettoken',
             data: {
                    isRefresh:isrefresh
                },
             type: "POST",
             dataType: "json",
             success: function (data) {
                   token= data.access_token;
                var ajaxurl = '/app/wechat/getticket';
                var query = new Object();
                url = location.href.split('#')[0]; //页面url#前的完整url,可alert弹出查看
                query.url = $.trim(url);
                query.access_token = token;
                $.ajax({
                    url: ajaxurl,
                    data: query,
                    type: "POST",
                    dataType: "json",
                    success: function (res) { //成功则执行JS-SDK
                        //执行JS_SDK
                        if(res.errcode&&res.errcode!=0){wxyz(true);}
                        wx.config({
                            debug: false,
                            appId: res.appid, // 必填，公众号的唯一标识
                            timestamp: res.timestamp, // 必填，生成签名的时间戳
                            nonceStr:  res.nonceStr, // 必填，生成签名的随机串
                            signature: res.signature,// 必填，签名
                            jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage','onMenuShareQQ','onMenuShareQZone']
                        });
                        wx.ready(function(){
                        // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
                             wx.onMenuShareTimeline({//朋友圈
                                 title: '盈创动力产品招募', // 分享标题
                                 link: url, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
                                 imgUrl: 'http://test2.tunnel.qydev.com/app/images/jtwin-banner2.jpg', // 分享图标
                                 success: function () {
                                     alert("分享成功")
                                  },cancel: function () {
                             }
                         });
                             wx.onMenuShareAppMessage({//微信好友
                                title: '盈创动力产品招募', // 分享标题
                                desc: '盈创动力科技金融服务2.0APP即将上线，现面向广大企业、机构招募优质服务产品期待与您的合作！', // 分享描述
                                link: url, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
                                imgUrl: 'http://test2.tunnel.qydev.com/app/images/jtwin-banner2.jpg', // 分享图标
                                type: '', // 分享类型,music、video或link，不填默认为link
                                dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                                success: function () {
                                },
                                cancel: function () {
                                }
                                });
                             wx.onMenuShareQQ({//qq好友
                                title: '盈创动力产品招募', // 分享标题
                                desc: '盈创动力科技金融服务2.0APP即将上线，现面向广大企业、机构招募优质服务产品期待与您的合作', // 分享描述
                                link: url, // 分享链接
                                imgUrl: 'http://test2.tunnel.qydev.com/app/images/jtwin-banner2.jpg', // 分享图标
                                success: function () {
                                },
                                cancel: function () {
                                }
                                });
                             wx.onMenuShareQZone({//qq空间
                                title: '盈创动力产品招募', // 分享标题
                                desc: '盈创动力科技金融服务2.0APP即将上线，现面向广大企业、机构招募优质服务产品期待与您的合作', // 分享描述
                                link: url, // 分享链接
                                imgUrl: 'http://test2.tunnel.qydev.com/app/images/jtwin-banner2.jpg', // 分享图标
                                success: function () {
                                },
                                cancel: function () {
                                }
                                });

                        });
                            wx.error(function(res){
                                // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
                                <%--console.log(res);--%>
                            });

                         },
                        error: function () {
                            console.log("通信失败");
                        }
                 });
             }
         })
        }
    wxyz(false);
    }

</script>
</body>
</html>