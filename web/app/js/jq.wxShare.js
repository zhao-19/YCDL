
 var $wx_account = wxdata.wx_account,
 $wx_share = wxdata.wx_share;
console.log($wx_share);
//配置微信信息
wx.config ({
    debug : false,
    appId : $wx_account[0],
    timestamp : $wx_account[1],
    nonceStr : $wx_account[2],
    signature : $wx_account[3],
    jsApiList : [
        // 所有要调用的 API 都要加到这个列表中
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo'
    ]
});
wx.ready (function () {
    // 微信分享的数据
    var shareData = {
        "imgUrl" : $wx_share[0],
        // "imgUrl" : 'https://apps.winpow.com/app/images/appintro/fxicon.png',
        "link" : $wx_share[1],
        "desc" : $wx_share[2],
        // "desc" : '盈创动力APP是成都高投盈创动力投资发展有限公司为中小微企业和个人推出的满足其生产经营和消费中遇到各种问题的手机软件。具体功能有债权融资、股权融资、中介服务、培训活动、政策申报、信用查询、园区服务、企业帮、投资圈等。盈创动力APP成为中小微企业科技金融服务的APP',
        "title" : $wx_share[3],
        success : function () {  
        	// 分享成功可以做相应的数据处理
        }
    };
    wx.onMenuShareTimeline (shareData);
    wx.onMenuShareAppMessage (shareData);
    wx.onMenuShareQQ (shareData);
    wx.onMenuShareWeibo (shareData);
});
