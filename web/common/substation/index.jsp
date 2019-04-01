<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@page import="com.winpow.core.front.SystemManager"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<s:if test="#session.sessionsubcode=='510117'">
		<!--郫都区-->
		<title>${sessionsubstation}综合金融服务平台</title>
		<meta name="keywords" content="${sessionsubstation}综合金融服务平台" />
		<meta name="description" content="${sessionsubstation}综合金融服务平台" />
	</s:if>
	<s:else>
		<title>${sessionsubstation}科技金融服务平台</title>
		<meta name="keywords" content="${sessionsubstation}科技金融服务平台" />
		<meta name="description" content="${sessionsubstation}科技金融服务平台" />
	</s:else>
	<link rel="stylesheet" href="/css/skitter.css?${sysversion}"/>
    <link rel="stylesheet" href="/css/common.css?${sysversion}"/>
    <link rel="stylesheet" href="/css/index.css?${sysversion}"/>
    <script type="text/javascript" src="/resource/js/jquery-1.9.1.min.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/index3.js?${sysversion}"></script>

	<script type="text/javascript" src="/js/jquery-1.6.4.min.js?${sysversion}" ></script>
	<script type="text/javascript" src="/js/jquery.easing.1.3.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/jquery.skitter.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/creditor.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/fbrzxq.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/jquery.validate-1.13.1.js?${sysversion}"></script>
	<script type="text/javascript" src="/js/laydate.js"></script>
	<script type="text/javascript" src="/js/countUp.min.js?${sysversion}"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.slideBox.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.SuperSlide.js"></script>
</head>
<div style="overflow-x: hidden;">
<style>
	.boxsiz{box-sizing: border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
	body{background: #f8f9fb;}
	.bgf{background: #fff;}
    .focusBox,.focusBox .pic img{height: 340px;}
     .dynamic_title,.dynamic_title{background: none !important;}
    .mr_frBtnL{float:left;width:20px;margin:180px 2px 0px 2px;cursor:pointer;display:inline;}
    .mr_frBtnL img{display:none;}
    .mr_frBtnR{float:right;width:19px;margin:180px 2px 0 2px;cursor:pointer;}
    .mr_frBtnR img{display:none;}
    .neikuang{width:221px;}
    .prevStop img{display:none!important;}
    .nextStop img{display:none!important;}


	.dynamic_listbox{padding:20px;}
	.info_content,.info_content .dynamic,.serve_info{height:auto;}
    .info_content .information,.info_content .dynamic{width:50%;}
    .info_content{padding:0;}

	.info_content .dynamic .dynamic_title,.picqh{width: 100% !important;}
    #scrollDiv li{width: 100%;text-overflow: ellipsis ;white-space: nowrap;overflow: hidden;}
    .dynamic_list_date{margin-right: 0 !important;}
    .dynamic_list_money{width: 150px;  text-overflow: ellipsis;}
    .dynamic_list_condition{width: 130px;    text-overflow: ellipsis;}
	.information_list{padding:20px;}

	.info_content .information .information_list .information_list_bor{width:0;margin:0; }
    .info_content .information .information_list ul{height:auto;margin-bottom: 20px;}
    .info_content .information .information_list ul:last-child{margin-bottom: 0;}
    .banner_right{width: 100%;margin-left: 0;}
    .info_content .information .information_list .information_list_info{float:right;width:320px;font-size:16px;display: block;overflow: hidden;color: #000;margin-top: 2px}
	.info_content .information .information_list .information_list_info p{color:#808080;font-size: 14px;margin-top:10px;line-height:22px;}
	.info_content .information .information_list .information_list_info b {
		display: inline-block;position: absolute;
		width: 240px;
		font-weight: normal;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.info_content .information .information_list .information_list_date{width:70px;border:1px solid #ff5e4c;color:#ff5e4c;text-align: center;border-radius: 5px; line-height: 22px;margin-top:8px;}
	.info_content .information .information_list .information_list_date .day{background: #ff5e4c;color: #fff;font-weight: bold;}
	.dynamic_title_right{width: 100% !important; }
    .dynamic_title_right.blue{ background: url("/image/fenzhan/Tblue.png?${sysversion}") no-repeat 0 0;}
    .dynamic_title_right.red{ background: url("/image/fenzhan/Tred.png?${sysversion}") no-repeat 0 0;}
    .dynamic_title_right.yellow{ background: url("/image/fenzhan/Tyellow.png?${sysversion}") no-repeat 0 0;}

   .dynamic_title_right_text{ font-family: "微软雅黑";font-size: 23px;clear: both;padding-left:18px;line-height: 60px;height: 60px;
	   /*background: url("/image/fenzhan/kindLine.png?${sysversion}") no-repeat 0 center;*/
   }
   .rzeglish,.dynamic_title_right_text a{color: #fff;}
	.rzeglish{font-size: 14px;}
    .tempWrap{margin:0 auto;}

    /*中介*/
    .serve_info .serve_info_right .serve_info_right_content{background: none;}
    .serve_info .serve_info_right .serve_info_right_content,.serve_info .serve_info_right .serve_info_right_bor{width: 100%;}
    .serve_info .serve_info_right .serve_info_right_content2_bor_left{border:1px solid #ddd;width: 285px;margin-right: 17px; }
    .serve_info_right_content1>a:nth-child(4n)>.serve_info_right_content2_bor_left{margin-right: 0!important;}
    .serve_info .serve_info_right .serve_info_right_content2_bor_left:hover{ background-size: cover;}
    .serve_info .serve_info_right .serve_info_right_content2_bor_left:hover:hover{border:1px solid #feb14c; }

    /*股权*/
    .thigh_info .thigh_info_right .thigh_info_right_center,.thigh_info .thigh_info_right .thigh_info_right_bor{width: 100%;}
    .thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1, .thigh_info_right_center2{width: 300px;margin:20px 0;padding:0;height:auto;border:0;border-right:1px solid #e7e6e6!important;}
    .thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test,.info_content .information{height: auto;}
    /*.thigh_info .thigh_info_right .thigh_info_right_center .num2{border:1px solid #e7e6e6!important;}*/
    .info_content {margin-top:44px;background: #fff;padding:10px 0;}
	.info_content .dynamic_title_right_text{margin-left: 20px;}
    .info_content .information{border:0;}
    .info_content .dynamic{padding-left: 0;}
    .thigh_info .thigh_info_right .thigh_info_right_center .num4{margin-right: 0;border-right:0 !important;}
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_title{font-size: 18px;  height:auto;  padding:15px 0 0 13px;color: #000;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;}
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_info ul .li{height:30px;line-height: 30px;background: none;}
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test{margin:0 auto;width: 220px;}
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_info{margin-bottom:0;padding-top:10px;}

	.attentionBox div{float: left;}
	.attentionStar{width:80px;margin-top:7px;}
	.attentionStar b{float: left;font-weight: normal;}
	.attentionStar span{width:16px;float: left;height:16px;background: url("/image/stars.png") no-repeat 0px 0;;}
	.attentionStar span.full-star{background-position: -21px 0;}
	.attentionStar span.half-star{background-position: -42px 0;}
	.lxl-count ul li{width: 25%; }

	/*融资交易轮播*/
	.scrollTit{background: #f9f9f9;padding-left:15px;}
	.scrollTit>li{width: 345px;line-height: 50px;color: #666;float:left;}
	.scrollTit>li:last-child{width: 110px;}
	#scrollDiv{height: 300px;}
	#scrollDiv li{height:50px;padding-left:15px;}
	.info_content .dynamic .dynamic_list .dynamic_list_info,.dynamic_list_money,.info_content .dynamic .dynamic_list .dynamic_list_condition{line-height: 50px;height: 50px;width:150px;margin:0;}
	.info_content .dynamic .dynamic_list .dynamic_list_info{color: #333;padding:0;}
	.info_content .dynamic .dynamic_list .dynamic_list_date{line-height: 50px;height: 50px;width: 110px;color: #333;}

	/*资讯*/
	#wrap,#wrap .d1,#wrap .d2{width: 230px;height: 140px;}

	/*债券*/
	.debt_info,.thigh_info{height:auto;}
	.debt_info .debt_info_right .debt_info_right_bor,.debt_info .debt_info_right .debt_info_right_date{width: 1200px;}
	.debt_info .debt_info_right .debt_info_right_date .debt_info_right_datea{width: 303px;height:auto;margin:0;margin-top:20px;border:0;border-right: 1px solid #e7e6e6;box-sizing: border-box;}
	.debt_info_right_date .index_cj_flg .lineik{border:0;padding:0;}
	.debt_info_right_date .index_cj_flg{padding-top:0;}
	.debt_info_right_date .index_cj_flg .lineik .debt_info_right_datea_title{margin-top:0 !important;}




	.debt_info .debt_info_img,.thigh_info .thigh_info_left_img,.serve_info .serve_info_left_img{width: 200px;height:360px;}
	.debt_info .debt_info_right,.thigh_info .thigh_info_right,.serve_info .serve_info_right{width: 1200px;border:0 !important;height:360px;}
	.thigh_info .thigh_info_right,.thigh_info .thigh_info_left_img{height:450px;}
	.thigh_info .thigh_info_left_img{background: url("/image/fenzhan/kindRed.png?${sysversion}") no-repeat 0 0;}
	.debt_info .debt_info_img{background: url("/image/fenzhan/kindBlue.png?${sysversion}") no-repeat 0 0;}
	.serve_info .serve_info_left_img{background: url("/image/fenzhan/kindOrange.png?${sysversion}") no-repeat 0 0;}
	.gqrzxmul{margin-top:30px;}
	.gqrzxmul li,.gqrzxmul li:hover,.gqrzxmul li.zz:hover,.gqrzxmul .zq,.gqrzxmul .zq:hover{background: none;margin-bottom: 10px;}
	.gqrzxmul li a,.gqrzxmul p a{ display:block;margin:0 auto;width: 130px; border: 1px solid #fff;border-radius: 3px;line-height: 25px;font-weight: normal;color: #fff;padding: 0 10px;}
	.gqrzxmul li a:hover{background: #FF232A;}
	.gqrzxmul li.zz a:hover{background: #eb8804;}
	.gqrzxmul p a:hover{background: #008DD0;}
	.zqtips{color:#ff6701; width: 220px;margin-left: 25px;margin-top:25px;text-overflow: ellipsis ;white-space: nowrap;overflow: hidden;}
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_but li,.debt_info .debt_info_right .debt_info_right_date .debt_info_right_datea .debt_info_right_datea_bot{width: 200px;line-height: 33px;border:1px solid #fc5b5b;;color: #fc5b5b;  padding: 0; border-radius: 5px;}
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_but li:hover,.debt_info .debt_info_right .debt_info_right_date .debt_info_right_datea .debt_info_right_datea_bot:hover{border-color: #ffab1a; }
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_but li{margin:20px auto 0;background: #fff;border-radius: 5px;}
	.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_but{position: static;}
	.debt_info .debt_info_right .debt_info_right_date .debt_info_right_datea .debt_info_right_datea_bot:hover a,.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_but li:hover{background:#ffab1a;color: #fff;}
	.debt_info_right_datea_bot a{color:#ff6600; }
    .info_content .information .information_list ul li{width:100%;}

	.zqtxt{padding-left:30px;}

	.graymore2{width: 140px;height: 34px;line-height:34px;border-radius: 20px;color: #fff;text-align: center;padding:0;margin:13px 18px 0 0;}
	.graymore2:hover{color: #fff;}
	.moreBlue{background:#188ef8; box-shadow:0 4px 8px rgba(24,142,248,0.4) }
	.moreBlue:hover{background:#1184ec; }

	.moreRed{background:#ff3131; box-shadow:0 4px 8px rgba(255,49,49,0.4)}
	.moreRed:hover{background:#ee2727; }

	.moreYellow{background:#ff811b;box-shadow:0 4px 8px rgba(255,129,27,0.4) }
	.moreYellow:hover{background:#ef7411; }

	.moreGreen{margin:17px 20px 0 0;}

	.middle_add{width:1200px;}
	.debt_info{margin-top:44px;}

</style>

<!--我要参加弹出框 end-->
<script type="text/javascript">
    var gdqkinputs_inamex = $(" input.laydate-icon");
    gdqkinputs_inamex.live('click', function () {
        var naowdate = $(this).attr("id");
        laydate({elem: '#' + naowdate});//绑定元素
    });
    !function(){
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        // laydate({elem: '#chegnliriqi'});//绑定元素
        //laydate({elem: '#fksj'});//绑定元素
        //laydate({elem: '#dqsj'});//绑定元素
    }();

    //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function(datas){
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);

    //自定义日期格式
    laydate({
        elem: '#test1',
        format: 'YYYY年MM月DD日',
        festival: true, //显示节日
        choose: function(datas){ //选择日期完毕的回调
            alert('得到：'+datas);
        }
    });

    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });
</script>
<!-- 网站头部 -->
<%@ include file="../../header.jsp"%>
<!--轮播-->
<div class="index_banner_box" style="height: 340px">
	<div class="focusBox">
		<ul class="pic">
			<li><a href="${indextopimg.url }" target="_black"><img id="indextopimg" src="${indextopimg.image }"></a></li>
		</ul>
		<ul class="hd"></ul>
	</div>
</div>

<div class="info_content widthbox">
	<!--盈创资讯-->
	<div class="information fl">
		<div class="dynamic_title">
			<div class="dynamic_title_right fr">
				<div class="dynamic_title_right_text fl"><a href="/substation/news/${sessionsubcode}.html" target="_blank" target="_blank" style="color: #333;">资讯与活动</a><span class="rzeglish">  NEWS&ACTIVITY</span></div>
				<a href="/substation/news/${sessionsubcode}.html" target="_blank" target="_blank" class="fr graymore moreGreen">更多</a>
			</div>
		</div>
		<div class="information_list bgf boxsiz">
			<div class="informationpic">
				<div class="picqh">
					<div class="banner_right fl">
						<s:iterator value="#request.newslist" var="news" status="dex">
							<s:if test="#dex.index < 2">
								<ul>
									<li>
										<img src="${news.cover }" width="230" height="140" class="fl"/>
										<div class="information_list_bor"></div>
										<a href="/<s:if test='#news.cataid != \"活动\"'>newsdetail</s:if><s:else>collegedetail</s:else>/${news.id }.html" target="_blank" title="${news.title }" class="information_list_info">
							<s:if test="#dex.first"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/new_bb9f513.gif" alt=""></s:if>

							<span class="tsss">[${news.cataid }]</span><b>${news.title }</b>
							<p>${fn:substring(news.lurushijian, 0, 10)}</p>
							<p>${fn:substring(news.contents, 0, 70)}...</p>
							</a>
							</li>
							</ul>
							</s:if>
						</s:iterator>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--融资交易-->
	<div class="dynamic fl">
		<div class="dynamic_title">
			<div class="dynamic_title_right fr">
				<div class="dynamic_title_right_text fl"><a href="/data/getRzjyList.html" target="_blank" style="color: #333;">融资交易</a><span class="rzeglish">  TRANSACTIONS</span></div>
				<a href="/data/getRzjyList.html" target="_blank" class="fr graymore moreGreen">更多</a>
			</div>
		</div>
		<div class="dynamic_listbox boxsiz bgf">
			<div class="dynamic_list" id="scrollDiv">
				<a href="/data/getRzjyList.html" target="_blank">
					<ul>
						<s:iterator value="#request.dynamiclist" var="dy"  status="s">
							<s:if test="#s.odd">
								<li style="background: #f9f9f9;">
							</s:if>
							<s:else>
								<li>
							</s:else>
							<div class="dynamic_list_info fl">${dy.compName}</div>
							<div class="dynamic_list_money  fl">${dy.dytype }${dy.dytypedetail }</div>
							<span class="dynamic_list_condition fl">${dy.dystatus }</span>
							<span class="dynamic_list_date fl">${fn:substring(dy.dytime, 0, 10)}</span>
							</li>
						</s:iterator>
					</ul>
				</a>
			</div>
		</div>
	</div>
</div>

<!--中间banner-->
<div class="middle_addwk">
	<div class="middle_add">
		<a href="${indexbottomimg.url }" target="_black"><img id="indexbottomimg" src="${indexbottomimg.image }"/></a>
	</div>
</div>
<script>
	$('#indextopimg').error(function(){
        $(this).attr('src', "/image/fenzhan/banner/banner${sessionsubcode}.png?${sysversion}");
        $(this).parent().attr('href', "javascript:void(0);");
    });
	$('#indexbottomimg').error(function(){
        $(this).attr('src', "/image/fenzhan/middle/middle${sessionsubcode}.png?${sysversion}");
        $(this).parent().attr('href', "javascript:void(0);");
    });
</script>
<!--债券-->
<div class="debt_info widthbox middle_guanggao ov ">
	<div class="dynamic_title_right blue ov">
		<div class="dynamic_title_right_text fl"><a href="/substation/product/${sessionsubcode}.html" target="_blank">债权融资</a><span class="rzeglish">  DEBT FINANCING</span></div>
		<a href="/substation/product/${sessionsubcode}.html" target="_blank" class="fr graymore graymore2 moreBlue">查看更多</a>
	</div>
	<div class="debt_info_right fr mr_frbox bgf boxsiz">
		<div class="debt_info_right_bor ">
			<div class="debt_info_right_date mr_frUl"><ul>
				<s:iterator value="#request.productlist" var="dy">
					<li class="debt_info_right_datea index_cj_flg fl">
						<div class="lineik">
							<div class="debt_info_right_datea_title" style="margin-left:0px;">${dy.prodname }</div>
							<div class="zqtxt">
								<p class="debt_info_right_datea_info liw"><i>合作银行：</i>
									<span class="debt_info_right_datea_img"><img src="${dy.banks }" style="width: 30px;height: 30px;"/></span>
								</p>
								<p class="debt_info_right_datea_info">还款方式：<span class="debt_info_right_datea_test">${dy.retutype }</span></p>
								<p class="debt_info_right_datea_info">贷款额度：<span class="debt_info_right_datea_test">${dy.loanamt }-${dy.loanamtmax }万</span></p>
								<p class="debt_info_right_datea_info">贷款期限：<span class="debt_info_right_datea_test">${dy.loanterm }<s:if test="#dy.loanterm!=#dy.loantermmax">-${dy.loantermmax }</s:if>个月</span></p>
								<p class="debt_info_right_datea_info">利率(年)：<span class="debt_info_right_datea_test">${dy.loanrate }</span></p>
								<div class="zqtips">
									<s:iterator value="#dy.biaoqians" var="bq"  status="s">
										<s:if test="#s.last">${bq} </s:if>
										<s:else>${bq} · </s:else>
									</s:iterator>
								</div>
							</div>
							<div class="debt_info_right_datea_bot"><a target="_blank" href="/productdetail/${dy.id }.html">立即申请</a></div>
						</div>
					</li>
				</s:iterator>
			</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});
    jQuery(".mr_frbox").slide({titCell:"",mainCell:".mr_frUl ul",autoPage:true,autoPlay:true,effect:"left",vis:4,pnLoop:false,trigger:"click"});
</script>

<!-- 股权融资 -->
<div class="thigh_info widthbox ov ">
	<div class="dynamic_title_right red ov">
		<div class="dynamic_title_right_text fl"><a href="/substation/guquan/${sessionsubcode}.html" target="_blank">股权融资</a><span class="rzeglish">  EQUITY FINANCING</span></div>
		<a href="/substation/guquan/${sessionsubcode}.html" target="_blank" class="fr graymore graymore2 moreRed">查看更多</a>
	</div>
	<div class="thigh_info_right fr bgf boxsiz">
		<div class="thigh_info_right_bor">
			<div class="thigh_info_right_center">
				<s:iterator value="#request.guquanlist" var="dy" status="dex">
					<s:if test="#dex.index==0 || #dex.index==2">
						<div class="thigh_info_right_center1 num${dex.index + 1 } fl boxsiz">
					</s:if>
					<s:else>
						<div class="thigh_info_right_center2 num${dex.index + 1 } fl boxsiz">
					</s:else>
					<div class="thigh_info_right_center1_test">
						<img style="width:220px;height:120px" src="${dy.tuijianpic }"/>
						<div class="thigh_info_right_center1_test_title">${dy.mingcheng }</div>
						<div class="thigh_info_right_center1_test_info">
							<ul class='detailUl'>
								<div class="li">行业：${dy.hangye }</div>
								<div class="li">融资额度：${dy.rongziedu }万</div>
								<div class="li">出让股权比例：${dy.crgqbl }%</div>
								<div class="li">推荐机构数：${dy.emailcount }家</div>
								<div class="li"><div class='attentionBox'><div>关注度：</div><div class='attentionStar' name='${dy.browsecount }'><span></span><span></span><span></span><span></span><span></span></div></div></div>
								<a target="_blank" href="/stockdetail/${dy.id }.html">
									<div class="thigh_info_right_center1_test_but"><li>查看详情</li></div>
								</a>
							</ul>
						</div>
					</div>
			</div>
			</s:iterator>
			<script type="text/javascript">

                $(function(){
                    function getCount(count) {
                        var num = 0;
                        if (count <= 100) {
                            num = 2;
                        } else if(count <= 200) {
                            num = 3;
                        } else if(count <= 250) {
                            num = 3.5;
                        } else if(count <= 300) {
                            num = 4;
                        } else if(count <= 600) {
                            num = 4.5;
                        } else if(count > 600) {
                            num = 5;
                        }
                        return num;
                    }
                    $(".attentionStar").each(function(){
                        var count = getCount($(this).attr("name"));
                        var countInt=parseInt(count);
                        $(this).children('span:lt('+countInt+')').addClass('full-star');
                        if(countInt!=count){
                            $(this).children('span:nth-child('+(countInt+1)+')').addClass('half-star');
                        }
                    });
                });

			</script>
		</div>
	</div>
</div>
</div>

<!--中介-->
<div class="serve_info widthbox ov ">
	<div class="dynamic_title_right yellow ov">
		<div class="dynamic_title_right_text fl"><a href="/substation/incre/${sessionsubcode}.html" target="_blank">中介服务</a><span class="rzeglish">  INTERMEDIARY SERVICES</span></div>
		<a href="/substation/incre/${sessionsubcode}.html" target="_blank" class="fr graymore graymore2 moreYellow">查看更多</a>
	</div>
	<div class="serve_info_right fr bgf boxsiz">

		<style>
			.zjbox,.zjbox *{box-sizing: border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
			.zjbox{padding:25px;}
			.zjbox>li{width: 25%;height:155px;float:left;border-right: 1px solid  #e7e6e6;position: relative;}
			.zjbox>li:nth-child(-n+4){ border-bottom:1px solid  #e7e6e6;padding-top:0;}
			.zjbox>li:nth-child(4n){ border-right:0;}
			.zjbox>li>a{display: block;width: 100%;height: 100%;padding:25px;}
			.zjbox>li:nth-child(4n+1)>a{ padding-left:0;}
			.zjbox>li img{position: absolute;right: 20px;bottom: 0;transition: 0.3s;
				-moz-transition:  0.3s;
				-webkit-transition:  0.3s;
				-o-transition:  0.3s;}
			.zjbox>li:hover img{right: 25px;}
			.zjbox>li:nth-child(-n+4) img{ bottom:20px;}
			.zjbox>li h2{font-size: 16px;font-weight: normal;margin-bottom: 5px;}
			.zimaotong .require{display: inline-block;font-style: normal;font-size: 12px;color: red;margin-left: 3px;}
			.zmtform .inputrow>span{padding-right: 7px;}
			.ui-front{z-index: 1000000 !important;}
			.zmtform .error{font-size: 12px !important;color: red;}
			.error {border: none;background:none;}
			#err{color: #F67653;}
			#err2{color: #F67653;}
		</style>
		<ul class="zjbox ov">
			<s:iterator value="#request.increlist" var="dy" status="dex">
				<li >
					<a target="_blank" href="/incredetail/${dy.id}.html">
						<h2>${dy.increname }</h2>
						<p>${dy.incredescrip }</p>
						<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/fenzhan/zjicon${dex.index+1}.png" alt="">
					</a>
				</li>
			</s:iterator>
		</ul>
	</div>
</div>

<!--合作机构-->
<div class="partner" >
	<div class="widthbox">
		<div class="partner_title">合作机构</div>
		<div class="partner_type">
			<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/fenzhan/bank/bank${sessionsubcode}.png"/>
		</div>
	</div>
</div>
<div id="sessionsubcode" style="display: none;">${sessionsubcode}</div>

<%@ include file="footer.jsp"%>

<div class="fixed" id="totop" >
	<div class="investor">
		<div class="fixed_test">手机APP下载

			<div class="fixed_img" style="margin-top:5px;">
			<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/rightDownCode.png" alt="">
			</div>
		</div>
	</div>
	<div id="addcreditor"  onclick="productApply(2,'中小企业融资')">
		<!--<div class="fixed_img">-->
			<!--<a href="#" ><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/publish.png" alt=""></a>-->
		<!--</div>-->
		<div class="fixed_test">发融资需求</div>
	</div>
	<div class="investor">
		<!--<div class="fixed_img">-->
			<!--<a href="/common/substation/feedback.jsp" target="_blank"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/investor.png" alt=""></a>-->
		<!--</div>-->
		<div class="fixed_test fixed_test2"><a href="/common/substation/feedback.jsp" target="_blank">意见反馈</a></div>
	</div>
	<div class="investor">
		<!--<div class="fixed_img fixed_img1">-->
			<!--<a href="javascript:void(0)" target="_blank"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/tel.png" alt=""></a>-->
			<!--<p>85139195</p>-->
		<!--</div>-->
		<div class="fixed_test">服务热线
			<p style="margin-top: 5px;">
				<b id="rightphone">028-27697897</b>
				<!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/fenzhan/rightphone/${sessionsubcode}.png" alt="二维码">-->
			</p>
		</div>
	</div>
	<!--<div class="investor">-->
		<!--<div class="fixed_img fixed_img2">-->
			<!--<a href="javascript:void(0)" target="_blank"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/tianping.png" alt=""></a>-->
			<!--<p>83159999</p>-->
		<!--</div>-->
		<!--<div class="fixed_test">廉洁监察</div>-->
	<!--</div>-->
	<!--<div class="code">-->
		<!--<div class="fixed_img">-->
			<!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/code.jpg" alt="">-->
		<!--</div>-->
		<!--<div class="fixed_test">二维码</div>-->
	<!--</div>-->
	<div class="home">
		<div class="fixed_img tc">
			<a href="javascript:$('body,html').animate({scrollTop:0},500)">
				<a id="backtop" href="javascript:void(0)"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/home.png" alt="返回顶部"></a>
			</a>
		</div>
	</div>
</div>



<!--自贸通-->
<div class="zimaotong modalbg">
	<div class="zmtformbox">
		<h2>申请<span>中小企业融资</span>服务 <b class="zmtclose">&times;</b></h2>
		<form action="" id="form1" class="zmtform">
			<div class="xuqiu">
				<input type="text" name="substation" value="${sessionsubcode}" id="substation" style="display: none;">
				<div class="inputrow inputrow2">
					<span style="font-size: 13px;">类型<i class="require">*</i></span>
					<div>
						<input type="radio" name="leixing" value="债权融资" id="xuqiu2" checked>
						<label for="xuqiu2">发布债权融资</label>
						<input type="radio" name="leixing" value="股权融资" id="xuqiu1">
						<label for="xuqiu1">发布股权融资</label>
                        <input type="radio" name="leixing" value="融资担保" id="xuqiu3">
						<label for="xuqiu3">发布融资担保</label>
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>企业名称<i class="require">*</i></span>
					<div>
						<input isNotNull="企业名称" type="text" name="studio" value="" auto-complete auto-complete-data="autoCompleteData" maxlength="32" id="qiyename" >
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>姓名<i class="require">*</i></span>
					<div>
						<input isNotNull="姓名" type="text" name="xingming" value="" maxlength="32" >
					</div>
				</div>
				<div style="overflow: hidden; width: 100%;">
					<div class="inputrow">
						<span>联系电话<i class="require">*</i></span>
						<div>
							<input isNotNull="联系电话" isPhone="联系电话"  type="text" name="dianhuan" value="" id="zmtdianhua">
						</div>
					</div>
					<div class="inputrow" id="msgcodebox">
						<span>验证码<i class="require">*</i></span>
						<div>
							<input isNotNull="验证码" type="text" name="msgcode" value="" id="writecode">
							<b id="getcode">获取</b>
						</div>
					</div>
				</div>
				<div style="overflow: hidden; width: 100%;">
					<div class="inputrow jine">
						<span>金额(万元)<i class="require">*</i></span>
						<div>
							<input isNotNull="金额" isBankZint="isBankZint" type="text" name="jine" value="">
						</div>
					</div>
					<div class="inputrow">
						<span>成立日期<i class="require">*</i></span>
						<div>
							<input isNotNull="成立日期" type="text" name="chegnliriqi"  id="maxDate" class="laydate-icon"  value="" >
						</div>
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>企业情况<i class="require">*</i></span>
					<div>
						<textarea isNotNull="企业情况" name="qiyeqingkuang" rows="3" cols="20"></textarea>
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>融资用途<i class="require">*</i></span>
					<div>
						<textarea isNotNull="融资用途" name="rongziyongtu" rows="3" cols="20"></textarea>
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>联系地址<i class="require">*</i></span>
					<div>
						<textarea isNotNull="联系地址" name="address" rows="3" cols="20"></textarea>
					</div>
				</div>
			</div>
			<div class="zmtbtn">
				<span class="zmtclose">取消</span>
				<span class="zmttj">提交</span>
			</div>
		</form>
	</div>
</div>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery-ui.min.css"/>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-ui.min.js"></script>
<script>
    $('body').delegate('#qiyename','click',function () {
        $(this).autocomplete({
            source: function(request, response) {
                var key = $("#qiyename").val();
                if ($.trim(key) == "") {
                    return;
                }
                $.ajax({
                    type: 'post',
                    url: "/userextend/creditsearch.html",
                    dataType: "json",
                    data: {
                        "key": key
                    },
                    success: function(data) {
                        var reg = /<span style='color:red'>|<\/span>/ig;
                        $.each(data.data,
                            function(i, v) {
                                v.company_name = v.company_name.replace(reg, '')
                            })
                        response($.map(data.data,
                            function(item) {
                                return {
                                    label: item.company_name,
                                    value: item.company_name,
                                    code: item.credit_code
                                }
                            }));
                    }
                });
            },
            select: function(event, ui) {
                $('#zzjgdm').val(ui.item.code);
            },

            minLength: 2
        })
    })
    function productApply(type,loanname) {
        $('.zmttj').removeAttr("disabled");
        $('#form1')[0].reset();
        $('.zmtform .error').html('');
        $('.zimaotong #getcode').html('获取');
        $('.zimaotong').show();
        $('.zmtformbox').scrollTop(0);
    }
    $('.zmtclose').click(function () {
        $('.zimaotong').hide();
        clearInterval(t);
        $(".zimaotong #getcode").removeClass('gray');
        $(".zimaotong #getcode").html("获取");
        validCode=true;

    })
    $('body').delegate('.zimaotong .allow','click', function () {
        if($(this).hasClass('on')){
            console.log(1)
            $(this).removeClass('on');
            $('.zmttj').addClass('gray');
            $(this).find('input').removeAttr('checked')
        }else{
            console.log(2)
            $(this).addClass('on');
            $('.zmttj').removeClass('gray');
            $(this).find('input').prop('checked','checked')
        }
    })
    $('.zmttj').click(function () {
        var that=this;
        if($(this).hasClass('gray')){
            return;
        }else{
            if (DataCheck.isNotNull()) {
                if (DataCheck.isZuzhi()) {
                    if (DataCheck.isPhone()) {
                        if (DataCheck.isBankZint()) {
                            if (DataCheck.isZZint()) {
                                $.ajax({
                                    type: "post",
                                    url: "/app/checkMsgCode.action",
                                    dataType: "json",
                                    async : false,
                                    crossDomain: true,
                                    xhrFields: {
                                        withCredentials: true
                                    },
                                    data:{
                                        'msgtype':'10001',
                                        'mobile':$('#zmtdianhua').val(),
                                        'msgcode':$('#writecode').val()
                                    },
                                    success: function(data){
                                        if(data.code==100){
                                            $(that).attr('disabled','true');
                                            var loadingLayer;
                                            $.ajax({
                                                type: "post",
                                                url: '/indexapp!insert.action',
                                                dataType: "json",
                                                async: false,
                                                data: $('#form1').serialize(),
                                                beforeSend: function (data) {
                                                    loadingLayer = layer.load(3, {
                                                        shade: [0.1,'#fff']
                                                    });
                                                },
                                                success: function (data) {
                                                    layer.close(loadingLayer);
                                                    $(that).removeAttr("disabled");
                                                    $('.zimaotong').hide();
                                                    layer.alert('提交成功！<br>客户经理将第二个工作日联系您', {icon: 1, title : '提示'});
                                                },
                                                error: function (data) {
                                                    layer.close(loadingLayer);
                                                    $(that).removeAttr("disabled");
                                                    alert(data.msg);
                                                }
                                            });
                                        }else{
                                            // $('.zimaotong').hide();
                                            clearInterval(t);
                                            $(".zimaotong #getcode").removeClass('gray');
                                            $(".zimaotong #getcode").html("获取");
                                            validCode=true;
                                            alert(data.msg)
                                            $('.zmttj').removeClass('gray').html('提交')
                                            return false;
                                        }
                                    },
                                    error: function (data) {
                                        layer.alert(data.msg)
                                    }
                                });
                            } else {
                                //alert("提交失败!");
                                return;
                            }
                        }
                    }

                }
            }
        }

    })
    function isPoneAvailable(str) {
        var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test(str)) {
            return false;
        } else {
            return true;
        }
    }
    var validCode=true;
    var t;
    $('body').delegate('#getcode','click',function () {
        codereg = "";
        if (!$(this).hasClass("gray")) {
            var dianhuan = $('#zmtdianhua').val();
            if (dianhuan == "" || isPoneAvailable(dianhuan) == false) {
                $('#zmtdianhua').next('span.error').html('请输入有效电话！').show();
                return false;
            } else {
                $.ajax({
                    type: "GET",
                    url: "/app/sendMsgCode.action",
                    crossDomain: true,
                    xhrFields: {
                        withCredentials: true
                    },
                    data: {
                        'msgtype': '10001',
                        'mobile': dianhuan
                    },
                    dataType: "json",
                    success: function (data) {

                    }
                });
            }
            var time = 60;
            var $code = $(this);
            if (validCode) {
                $code.addClass('gray');
                validCode = false;
                t = setInterval(function () {
                    time--;
                    $code.html(time + "S");
                    if (time == 0) {
                        clearInterval(t);
                        $code.removeClass('gray');
                        $code.html("重新获取");
                        validCode = true;
                    }
                }, 1000)
            }
        }
    })
</script>

</body>
</html>