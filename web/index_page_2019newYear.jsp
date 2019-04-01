<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>
<%@page import="java.math.BigDecimal"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.oscache.Dynamic"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.news.bean.News"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.services.manage.guquan.bean.Guquan"%>
<%@page import="com.winpow.services.manage.product.bean.Product"%>
<%@page import="com.winpow.services.manage.incre.bean.Incre"%>
<%@page import="com.winpow.services.manage.jigou.bean.Jigou"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<%@page import="com.winpow.core.util.DateTimeUtil"%>
<%@page import="com.winpow.core.FrontContainer"%>
<%@page import="com.winpow.services.common.HtmlUtil"%>
<%@ page import="com.winpow.services.manage.guquanfinancing.bean.GuquanFinancing" %>
<%@ page import="java.util.List" %>
<%@ page import="com.winpow.core.system.bean.Config" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=”http://www.w3.org/1999/xhtml”>
<head lang="en">
   <script>
	if (location.href.indexOf("substation") == -1 
		&& '${sessionsubcode}' != '510100' 
		&& '${sessionsubcode}' != '510199'
		&& '${sessionsubcode}' != '') {
		window.location.href = "/substation/index/510100.html"; 
	}
	</script>
   
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <meta name="keywords" content="企业贷款,贷款,盈创,盈创动力,盈创动力服务平台,高投创投,中小企业融资,科技企业融资,科技金融服务中心,风险投资,政府投融资平台,投融资金融服务平台,企业发展服务平台,知识产权服务平台,人才培训服务平台,共性技术支撑平台,债权融资,股权融资,上市融资,投融资服务,债权,股权,投资,融资,投融资,投资项目,项目,项目融资,统借统还,基金,天使基金,融资顾问,项目监理,金融服务,投融资综合服务提供商,路演中心,投资信息,数据库,企业发展咨询,知识产权,知识产权服务,人才培训,企业培训,技术支撑,同业工会,财富俱乐部,创业投资研究所,投资事件,IPO事件,并购事件,募资事件,贷款,担保,活动,培训" /><meta name="description" content="致力打造国内领先的科技金融服务门户网站,提供债权投资,股权投资,风险投资,担保,小贷等金融信息服务,为创业者,创业企业与机构搭建了沟通与信息交流的平台。" />
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/skitter.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.slideBox.css"/>
        <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>

    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index2.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.6.4.min.js" ></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.skitter.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/creditor.js"></script>

	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate-1.13.1.js"></script>

	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/fbrzxq.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/countUp.min.js"></script>

	<link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
</head>
<body style="overflow-x: hidden;">
	<!-- 在线申报系统关闭提示 -->
	<!-- <div id="shenbao"><%out.print(SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO));%></div>
	<script>
	var change=$.trim($('#shenbao').text());

	if(change==1){
		layer.alert('《成都高新区关于加快国际科技金融创新中心建设的若干政策》在线申报功能将于今天（2017年11月17日）下午18:00关闭，【未提交】和【驳回】状态的数据请及时提交，系统关闭后将不能新增、修改、提交数据。', {icon: 7, title : '提示'});
	}


</script> -->
<!--会员注册成功提示registerok-->
<!--	<input type="hidden" id="registerok" value="<s:property value="#request.registerok"/>">
	<input type="hidden" id="custmanage" value="<s:property value="#request.custmanage"/>">
	<div class="registerok_wk">
		<div class="registerok">
			
		</div>
	</div>-->
	
	<!--顶部广告-->
	<!-- <div id="top-guanggao-wk">
		<div class="top-guanggao">
			<a href="/news/bainian.jsp" id="top-guanggao-a"></a>
			<i id="topclose" class="fa fa-times"></i>
		</div>
	</div>
	 -->

<style>
     body {background: #f8f9fb;}
	.zmtform .error{font-size: 12px;color: red;}
	.error {border: none;background:none;}
    #err{color: #F67653;}
    #err2{color: #F67653;}
label.error {
   /*  border: 1px solid #F67653!important; */
    background:none;
	color: #F67653;
	padding: 0 2px;
	display:inline-block;
    }
	.attentionBox div{float: left;}
	.attentionStar{width:80px;margin-top:7px;}
	.attentionStar b{float: left;font-weight: normal;}
	.attentionStar span{width:16px;float: left;height:16px;background: url("image/stars.png") no-repeat 0px 0;;}
	.attentionStar span.full-star{background-position: -21px 0;}
	.attentionStar span.half-star{background-position: -42px 0;}

	#shenbao{display: none;}
	#ui-id-1{z-index: 1000;}
	/*a#poperwm{display: none !important;}*/
    .lxl-count ul{border-bottom: 1px solid #F0F0F1;}
    .bgf{background: #fff;}
     .boxsiz{box-sizing: border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
     #wrap, #wrap .d1, #wrap .d2,.picqh,.info_content .information .information_list .informationpic{width: 230px;height: 140px;}
	 .graymore {margin-right: 20px;}

</style>


<!--app上线提示弹窗开始 取消注释可用-->
	<a href="/park/tfrjy.jsp" target="_blank"  id="poperwm" style="width: 11%; top:72%;display: block;"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/tfrjy-small.png" alt="" ></a>

	<!--<div class="indexPop">
		<div id="popbanner"></div>
		<div id="popbannerimg">
			<span id="apppopclose" class="apppopclose">&times;</span>
			<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/popbanner.png" alt="">
			<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/poperwm2.png" alt="" id="poperwm2">
			<span id="waittime" class="apppopclose"><i>5</i>秒后自动关闭</span>
		</div>
		<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/poperwm.png" alt="" id="poperwm">
	</div>-->
	<!--中介活动弹窗-->
	<!-- <div class="indexPop">
		<div id="popbanner"></div>
		<div id="popbannerimg" style="width: 50%;">
			<span id="apppopclose" class="apppopclose">
				<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/popzjclose.png" alt="">
			</span>
			<a href="/incre/toacList.html" target="_blank"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/popzj.png" alt=""></a>
			<span id="waittime" class="apppopclose"><i>2</i>秒后自动关闭</span>
		</div>
		<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/popzjsmall.png" alt="" id="poperwm" style="width: 11%; top:72%;">
	</div>-->
	<!--app上线提示弹窗结束-->
	 <!--<script>
        $().ready(function(){
            var wait,timer;
            time();
            $('.apppopclose').click(function(){
                wait=0;
                $('#popbanner').fadeOut();
                $('#popbannerimg').fadeOut();
                $('img#poperwm').css('animation','erwm 0.5s').show();
            })
            $('img#poperwm').click(function(){
                wait=0;
                $('img#poperwm').css('animation','none').hide();
                $('#popbanner').fadeIn()
                $('#popbannerimg').fadeIn();
                $('#waittime>i').text("2");
                time();
            })
        })

        function time(){
            wait=2;
            timeOut();
            function timeOut(){
                if(wait==0){
                    $('#popbanner').fadeOut();
                    $('#popbannerimg').fadeOut();
                    $('img#poperwm').css('animation','erwm 0.5s').show();
                }else{
                   timer=setTimeout(function(){
                        wait--;
                        if(wait<0){wait=0;}
                        $('#waittime>i').text(wait);
                        timeOut();
                    },1000)
                }
            }
        }
	</script>-->

	<!--自贸通-->

	<div class="zimaotong modalbg">
		<div class="zmtformbox">
			<h2>申请<span></span>服务 <b class="zmtclose">&times;</b></h2>
			<form action="" id="form1" class="zmtform">
				<input type="text" name="loanname" value="" id="loanname" style="display: none;">
				<h1>一、基本情况</h1>
				<div class="inputrow inputrow2">
					<span>申请企业名称</span>
					<div>
						<input isNotNull="申请企业名称" type="text" name="qiyename" value="" auto-complete auto-complete-data="autoCompleteData" maxlength="32" id="qiyename" >
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>社会信用代码</span>
					<div>
						<input isNotNull="社会信用代码"  isZuzhi="社会信用代码" type="text" name="creditid" value="" id="zzjgdm">
					</div>
				</div>
				<div style="overflow: hidden; width: 100%;">
					<div class="inputrow">
						<span>成立日期</span>
						<div>
							<input isNotNull="成立日期" type="text" name=""  id="maxDate" class="laydate-icon"  value="" >
						</div>
					</div>
					<div class="inputrow jine">
						<span>注册资本(万元)</span>
						<div>
							<input isNotNull="注册资本" isBankZint="isBankZint" type="text" name="regfunds" value="">
						</div>
					</div>
				</div>
				<div style="overflow: hidden; width: 100%;">
					<div class="inputrow">
						<span>法定代表人</span>
						<div>
							<input isNotNull="法定代表人" type="text" name="corp" value="">
						</div>
					</div>
					<div class="inputrow">
						<span>联系人</span>
						<div>
							<input isNotNull="联系人" type="text" name="linkman" value="">
						</div>
					</div>
				</div>
				<div style="overflow: hidden; width: 100%;">
					<div class="inputrow">
						<span>联系电话</span>
						<div>
							<input isNotNull="联系电话" isPhone="联系电话"  type="text" name="linktel" value="" id="zmtdianhua">
						</div>
					</div>
					<div class="inputrow" id="msgcodebox">
						<span>验证码</span>
						<div>
							<input isNotNull="验证码" type="text" name="msgcode" value="" id="writecode">
							<b id="getcode">获取</b>
						</div>
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>注册地址</span>
					<div>
						<input isNotNull="注册地址" type="text" name="address" value="">
					</div>
				</div>
				<div class="kptbox1">
					<div class="kptStep">
						<div class="inputrow inputrow2">
							<span>所属行业</span>
							<div>
								<input isNotNull="所属行业" type="text" name="industry" value="">
							</div>
						</div>
						<div class="inputrow">
							<span style="font-size: 13px;">是否高新技术企业</span>
							<div>
								<input type="radio" name="istechqiye" value="是" id="istechqiye1" checked>
								<label for="istechqiye1">是</label>

								<input type="radio" name="istechqiye" value="否" id="istechqiye2">
								<label for="istechqiye2">否</label>
							</div>
						</div>
						<div class="inputrow">
							<span>获得发明专利件数</span>
							<div>
								<input isNotNull="获得发明专利件数" isZZint="isZZint" type="text" name="patents" value="">
							</div>
						</div>
						<div class="inputrow">
							<span>实用新型件数</span>
							<div>
								<input isNotNull="实用新型件数" isZZint="isZZint" type="text" name="utilitymodel" value="">
							</div>
						</div>
						<div class="inputrow">
							<span>软件著作权件数</span>
							<div>
								<input isNotNull="软件著作权件数" isZZint="isZZint" type="text" name="copyright" value="">
							</div>
						</div>
					</div>
				</div>
				<div class="inputrow inputrow2">
					<span>主营业务</span>
					<div>
						<textarea isNotNull="主营业务" name="mainbusiness" rows="3" cols="20"></textarea>
					</div>
				</div>
				<div class="zmtbox">
					<div class="zmtStep">
						<h1>二、业务情况（进出口量/年）</h1>
						<div class="inputrow">
							<span style="font-size: 13px;">货物贸易(万美元)</span>
							<div>
								<input isNotNull="货物贸易" isBankZint="isBankZint" type="text" name="goodstrade" value="">
							</div>
						</div>
						<div class="inputrow">
							<span style="font-size: 13px;">服务贸易(万美元)</span>
							<div>
								<input isNotNull="服务贸易" isBankZint="isBankZint" type="text" name="servetrade" value="">
							</div>
						</div>
						<h1>三、准入情况</h1>
						<h2>正面清单</h2>
						<div class="listbox">
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="z1001" id="z1001">
									<label for="z1001">注册地址和纳税关系都在成都高新区的中小微货物贸易、服务贸易企业</label>
								</div>
							</div>
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="z1002" id="z1002">
									<label for="z1002">企业具有持续经营能力，具备真实贸易背景，且上年度纳税正常</label>
								</div>
							</div>
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="z1003" id="z1003">
									<label for="z1003">企业生产经营合法、合规，无不良征信记录</label>
								</div>
							</div>
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="z1004" id="z1004">
									<label for="z1004">外汇局评定的A类企业（仅限货物贸易企业）</label>
								</div>
							</div>
						</div>
						<h2>负面清单</h2>
						<div class="listbox">
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="f1001" id="f1001">
									<label for="f1001">企业的法定代表人/负责人被判处刑罚，执行期满未逾三年</label>
								</div>
							</div>
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="f1002" id="f1002">
									<label for="f1002">企业受到成都市或成都高新区政府部门的重大行政处罚</label>
								</div>
							</div>
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="f1003" id="f1003">
									<label for="f1003">企业受到成都市或成都高新区政府部门的重大行政处罚</label>
								</div>
							</div>
							<div class="inputrow inputrow2">
								<div class="fr leixing">
									<input type="checkbox" name="accessis" value="f1004" id="f1004">
									<label for="f1004">企业列入异常经营名录</label>
								</div>
							</div>
						</div>
						<div class="notice fl">
							<p>1、企业在符合情况的选项"□"内打勾。</p>
							<p>2、同时满足"正面清单"四项条件的企业即可准入。</p>
							<p>3、有"负面清单"情形之一的企业不可准入。</p>
						</div>
						<div class="allow fl">
							<input type="checkbox" id="allow">
							<span>*我公司特向成都银行提出申请“自贸通”金融服务，并保证以上信息准确、属实。</span>
						</div>
					</div>
				</div>
				<div class="kptbox2">
					<div class="kptStep2">
						<h1>二、申请贴现情况</h1>
						<div class="inputrow inputrow2">
							<span style="font-size: 13px;">申请贴现期限(月)</span>
							<div>
								<input type="radio" name="stickticket" value="银行承兑汇票" id="stickticket1" checked>
								<label for="stickticket1">银行承兑汇票</label>

								<input type="radio" name="stickticket" value="商业承兑汇票" id="stickticket2">
								<label for="stickticket2">商业承兑汇票</label>
							</div>
						</div>
						<div class="inputrow">
							<span style="font-size: 13px;">申请贴现金额(万)</span>
							<div>
								<input isNotNull="申请贴现金额" isBankZint="isBankZint" type="text" name="appamount" value="">
							</div>
						</div>
						<div class="inputrow">
							<span style="font-size: 13px;">申请贴现期限(月)</span>
							<div>
								<input isNotNull="申请贴现期限" isZZint="isZZint" type="text" name="apptime" value="">
							</div>
						</div>

					</div>
				</div>
				<div class="zmtbtn">
					<span class="zmtclose">取消</span>
					<span class="zmttj gray">提交</span>
				</div>
			</form>
		</div>
	</div>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery-ui.min.css"/>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-ui.min.js"></script>
	<script>
        $('#qiyename').autocomplete({
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
        // $('body').delegate('.zmtlink','click',function (e) {
        //     e.preventDefault();
        //     if(!$('.zmttj').hasClass('gray')){
        //         $('.zmttj').addClass('gray');
			// }
			// $('#form1')[0].reset();
        //     $('.zmtform .error').html('')
			// $('#getcode').html('获取');
        //     $('.zimaotong').show();
        //     $('.zmtformbox').scrollTop(0);
        //
        // })

		function productApply(loanname) {
            if(!$('.zmttj').hasClass('gray')){
                $('.zmttj').addClass('gray');
            }
            $('#form1')[0].reset();
            $('#loanname').val(loanname)
			$('.zmtformbox>h2>span').html(loanname)
            $('.zmtform .error').html('')
            $('#getcode').html('获取');
            var kpt='<div class="kptStep">\n' +
                '<div class="inputrow inputrow2">\n' +
                '<span>所属行业</span>\n' +
                '<div>\n' +
                '<input isNotNull="所属行业" type="text" name="industry" value=""><span class="error"></span>\n' +
                '</div>\n' +
                '</div>\n' +
                '<div class="inputrow">\n' +
                '<span style="font-size: 13px;">是否高新技术企业</span>\n' +
                '<div>\n' +
                '<input type="radio" name="istechqiye" value="是" id="istechqiye1" checked>\n' +
                '<label for="istechqiye1">是</label>\n' +
                '<input type="radio" name="istechqiye" value="否" id="istechqiye2">\n' +
                '<label for="istechqiye2">否</label>\n' +
                '</div>\n' +
                '</div>\n' +
                '<div class="inputrow">\n' +
                '<span>获得发明专利件数</span>\n' +
                '<div>\n' +
                '<input isNotNull="获得发明专利件数" isZZint="isZZint" type="text" name="patents" value=""><span class="error"></span>\n' +
                '</div>\n' +
                '</div>\n' +
                '<div class="inputrow">\n' +
                '<span>实用新型件数</span>\n' +
                '<div>\n' +
                '<input isNotNull="实用新型件数" isZZint="isZZint" type="text" name="utilitymodel" value=""><span class="error"></span>\n' +
                '</div>\n' +
                '</div>\n' +
                '<div class="inputrow">\n' +
                '<span>软件著作权件数</span>\n' +
                '<div>\n' +
                '<input isNotNull="软件著作权件数" isZZint="isZZint" type="text" name="copyright" value=""><span class="error"></span>\n' +
                '</div>\n' +
                '</div>\n' +
                '</div>'
            var kpt2='<div class="kptStep2">\n' +
                '\t\t\t\t\t\t<h1>二、申请贴现情况</h1>\n' +
                '\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t<span style="font-size: 13px;">申请贴现期限(月)</span><span class="error"></span>\n' +
                '\t\t\t\t\t\t\t<div>\n' +
                '\t\t\t\t\t\t\t\t<input type="radio" name="stickticket" value="银行承兑汇票" id="stickticket1" checked>\n' +
                '\t\t\t\t\t\t\t\t<label for="stickticket1">银行承兑汇票</label>\n' +
                '\n' +
                '\t\t\t\t\t\t\t\t<input type="radio" name="stickticket" value="商业承兑汇票" id="stickticket2">\n' +
                '\t\t\t\t\t\t\t\t<label for="stickticket2">商业承兑汇票</label>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t<div class="inputrow">\n' +
                '\t\t\t\t\t\t\t<span style="font-size: 13px;">申请贴现金额(万)</span>\n' +
                '\t\t\t\t\t\t\t<div>\n' +
                '\t\t\t\t\t\t\t\t<input isNotNull="申请贴现金额" isBankZint="isBankZint" type="text" name="appamount" value=""><span class="error"></span>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t<div class="inputrow">\n' +
                '\t\t\t\t\t\t\t<span style="font-size: 13px;">申请贴现期限(月)</span>\n' +
                '\t\t\t\t\t\t\t<div>\n' +
                '\t\t\t\t\t\t\t\t<input isNotNull="申请贴现期限" isZZint="isZZint" type="text" name="apptime" value=""><span class="error"></span>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\n' +
                '\t\t\t\t\t</div>'
            var zmt='\t<div class="zmtStep">\n' +
                '\t\t\t\t\t\t<h1>二、业务情况（进出口量/年）</h1>\n' +
                '\t\t\t\t\t\t<div class="inputrow">\n' +
                '\t\t\t\t\t\t\t<span style="font-size: 13px;">货物贸易(万美元)</span>\n' +
                '\t\t\t\t\t\t\t<div>\n' +
                '\t\t\t\t\t\t\t\t<input isNotNull="货物贸易" isBankZint="isBankZint" type="text" name="goodstrade" value=""><span class="error"></span>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t<div class="inputrow">\n' +
                '\t\t\t\t\t\t\t<span style="font-size: 13px;">服务贸易(万美元)</span>\n' +
                '\t\t\t\t\t\t\t<div>\n' +
                '\t\t\t\t\t\t\t\t<input isNotNull="服务贸易" isBankZint="isBankZint" type="text" name="servetrade" value=""><span class="error"></span>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t<h1>三、准入情况</h1>\n' +
                '\t\t\t\t\t\t<h2>正面清单</h2>\n' +
                '\t\t\t\t\t\t<div class="listbox">\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="z1001" id="z1001">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="z1001">注册地址和纳税关系都在成都高新区的中小微货物贸易、服务贸易企业</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="z1002" id="z1002">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="z1002">企业具有持续经营能力，具备真实贸易背景，且上年度纳税正常</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="z1003" id="z1003">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="z1003">企业生产经营合法、合规，无不良征信记录</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="z1004" id="z1004">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="z1004">外汇局评定的A类企业（仅限货物贸易企业）</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t<h2>负面清单</h2>\n' +
                '\t\t\t\t\t\t<div class="listbox">\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="f1001" id="f1001">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="f1001">企业的法定代表人/负责人被判处刑罚，执行期满未逾三年</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="f1002" id="f1002">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="f1002">企业受到成都市或成都高新区政府部门的重大行政处罚</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="f1003" id="f1003">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="f1003">企业受到成都市或成都高新区政府部门的重大行政处罚</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t<div class="inputrow inputrow2">\n' +
                '\t\t\t\t\t\t\t\t<div class="fr leixing">\n' +
                '\t\t\t\t\t\t\t\t\t<input type="checkbox" name="accessis" value="f1004" id="f1004">\n' +
                '\t\t\t\t\t\t\t\t\t<label for="f1004">企业列入异常经营名录</label>\n' +
                '\t\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t<div class="notice fl">\n' +
                '\t\t\t\t\t\t\t<p>1、企业在符合情况的选项"□"内打勾。</p>\n' +
                '\t\t\t\t\t\t\t<p>2、同时满足"正面清单"四项条件的企业即可准入。</p>\n' +
                '\t\t\t\t\t\t\t<p>3、有"负面清单"情形之一的企业不可准入。</p>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t\t<div class="allow fl">\n' +
                '\t\t\t\t\t\t\t<input type="checkbox" id="allow">\n' +
                '\t\t\t\t\t\t\t<span>*我公司特向成都银行提出申请“自贸通”金融服务，并保证以上信息准确、属实。</span>\n' +
                '\t\t\t\t\t\t</div>\n' +
                '\t\t\t\t\t</div>'

            if(loanname=="自贸通"){
                $('.kptbox1,.kptbox2').html("");
               if($('.zmtbox').html()==""){
                   $('.zmtbox').append(zmt);
			   }
                $('.zmttj').addClass('gray')

			}else if(loanname=="科票通"){
                $('.zmtbox').html("");
                if($('.kptbox1').html()==""){
                    $('.kptbox1').append(kpt);
                }
                if($('.kptbox2').html()==""){
                    $('.kptbox2').append(kpt2);
                }
                $('.zmttj').removeClass('gray')
			}

            $('.zimaotong').show();
            $('.zmtformbox').scrollTop(0);

        }

        $('.zmtclose').click(function () {
            $('.zimaotong').hide();
            clearInterval(t);
            $("#getcode").removeClass('gray');
            $("#getcode").html("获取");
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
                                            $.ajax({
                                                type: "post",
                                                url: "/app/tradesubmit.action",
                                                dataType: "json",
                                                async: false,
                                                data: $('#form1').serialize(),
                                                beforeSend: function (data) {
													$('.zmttj').addClass('gray').html('正在提交...')
                                                },
                                                success: function (data) {
                                                    $('.zimaotong').hide();
                                                    layer.alert('提交成功！<br>客户经理将第二个工作日联系您', {icon: 1, title : '提示'});
                                                },
                                                error: function (data) {
                                                    alert(data.msg);
                                                    $('.zmttj').removeClass('gray').html('提交')
                                                }
                                            });
                                        }else{
                                            // $('.zimaotong').hide();
                                            clearInterval(t);
                                            $("#getcode").removeClass('gray');
                                            $("#getcode").html("获取");
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
        $("#getcode").click (function  () {
            codereg="";
            if(!$(this).hasClass("gray")){
                var dianhuan=$('#zmtdianhua').val();
                console.log(dianhuan)
                if(dianhuan==""||isPoneAvailable(dianhuan)==false){
                  $('#zmtdianhua').next('span.error').html('请输入有效电话！').show();
                    return false;
                }else{
                    $.ajax({
                        type: "GET",
                        url: "/app/sendMsgCode.action",
                        crossDomain: true,
                        xhrFields: {
                            withCredentials: true
                        },
                        data:{
                            'msgtype':'10001',
                            'mobile':dianhuan
                        },
                        dataType: "json",
                        success: function(data){

                        }
                    });
                }
                var time=60;
                var $code=$(this);
                if (validCode) {
                    $code.addClass('gray');
                    validCode=false;
                     t=setInterval(function  () {
                        time--;
                        $code.html(time+"S");
                        if (time==0) {
                            clearInterval(t);
                            $code.removeClass('gray');
                            $code.html("重新获取");
                            validCode=true;
                        }
                    },1000)
                }
            }
        })
	</script>

<!--我要参加弹出框 start-->
<div id="ldksq">
    <div id="ldksq_c">
    <form  name="fbrzxq" id="fbrzxq" action="" method="post">
        <div id="ldksq_lose"></div>
        <div class="t"><span class="btn" onclick="window.location='/user/login.html'">我已注册</span><span>发布融资需求</span><span class="xiaozi">无需注册、快速审核</span></div>
        <div class="rad">
        	<div class="leixing">类型：<span style="color:red">*</span></div>
        	<div class="l grad gr"><label><input type="radio" id="leixing" name="leixing" value="股权融资">发布股权融资</label></div>
               
                <div class="l grad gs"><label><input type="radio" name="leixing" name="leixing" value="债权融资">发布债权融资</label></div>
       	</div>
       	<div class="con">
       	 	<p class="fir1"><span class="pt t1">企业名称：<span style="color:red">*</span></span><span class="pc"><input style="width: 360px;" type="text" id="mingcheng" name="mingcheng"></span></p>
       		<p class="fir1">
	       		<span class="pt t1">姓名：<span style="color:red">*</span></span><span class="pc"><input type="text" id="xingming" name="xingming"></span>
	       		<span class="pt t2">手机：<span style="color:red">*</span></span><span class="pc"><input type="text" id="dianhuan" name="dianhuan"></span>
       		</p>
       		<p class="fir1">
	       		<span class="pt t1" style="margin-left: 0;width: 99px;">金额(万元)：<span style="color:red">*</span></span><span class="pc"><input type="text" id="jine" name="jine"></span>
	       		<span class="pt t2">成立日期：<span style="color:red">*</span></span><span class="pc"><input id="chegnliriqi" class=" laydate-icon" type="text" name="chegnliriqi"></span>
       		</p>
       		<div class="remark">
       			<p>企业情况：<span style="color:red;    display: inline;">*</span></p>
       			<div class="tex">
       				<textarea id="qiyeqingkuang" name="qiyeqingkuang"></textarea>
       			</div>
       		</div>
       		<div class="remark">
       			<p>融资用途：<span style="color:red;    display: inline;">*</span></p>
       			<div class="tex">
       				<textarea id="rongziyongtu" name="rongziyongtu"></textarea>
       			</div>
       		</div>
       		<p class="fir1">
	       		<span class="pt t1">联系地址：<span style="color:red">*</span></span><span class="pc"><input style="    width: 182px;" type="text" id="address" name="address"></span>
       			<span class="errorts" id="err"></span><span style= "margin-left: 8px;" id="err2"></span>
       		</p>
			<p class="fir1"><span class="pt t1">验证码：<span style="color:red">*</span></span><span class="pc"><input type="text" id="txyzm" name="txyzm"></span><span class="pc"><img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="/ValidateImage.do" onClick="reloadImg2()" alt="" style="cursor:pointer;width:100px;height:26px;margin-left: 10px;margin-bottom: -6px"/></span></p>
       	</div>
       	<div class="tjdiv"><input type="reset"  class="res tj"  value="取消"/><input id="rztjan"  type="submit"  class="sure tj" value="提交"/></div>
    </form>
    </div>
</div>
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

<!-- 十九大头部 -->
<!--<div class="nineteen">-->
    <!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/celebration/newyear-title.png" alt="" id="newyear-title">-->
    <!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/celebration/newyear-tile.png" alt="" id="newyear-tile">-->
    <!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/celebration/newyear-curtain-left.png" alt="" class="newyear-curtain curtain-left">-->
    <!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/celebration/newyear-curtain-right.png" alt="" class="newyear-curtain curtain-right">-->
	<!--<span id="nineteen-close"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/nineteen-close.png" alt="" ></span>-->
<!--</div>-->
<!--<div class="curtainSide sideLeft"></div>-->
<!--<div class="curtainSide sideRight"></div>-->
	<!--<script>-->
        <!--$('#nineteen-close').click(function(){-->
            <!--$('.nineteen').slideUp(500);-->
            <!--$('.curtainSide').fadeOut(500);-->
        <!--})-->
    <!--</script>-->
<!-- 网站头部 -->
	<%@ include file="header.jsp"%>
<div class="index_banner_box">
    <!--总首页导航-->
    <div class="categorysone">
	    <div class="index_nav_box categorys">
	        <dl class="all_nav">
	            <dd class="zen_icon">
	                <a href="/product/toList.html" target="_blank" class="big_nav">债权融资</a>
	                <a href="/productdetail/3.html" target="_blank">成长贷</a>
	                <a href="/productdetail/4.html" target="_blank">壮大贷</a>
	            </dd>
	            <dd class="gu_icon">
	                <a href="/stock/toList.html" target="_blank" class="big_nav">股权融资</a>
	                <a href="/stock/toList.html" target="_blank">股权项目</a>
	                <a href="/data/toJigouList.html" target="_blank">投资机构</a>
	         <!--        <a href="">发布项目</a> -->
	            </dd>
	            <dd class="zhai_icon">
	                <a href="/incre/toList.html" target="_blank" class="big_nav">增值服务</a>
	           
	                 <a href="/incredetail/16.html" target="_blank">商标注册</a> 
	                 <a href="/incredetail/17.html" target="_blank"> 发明专利</a> 
	            </dd>
	            <dd class="last">
	                <a href="/interestapp/taotallist.html" target="_blank" class="big_nav">政策申报</a>
	                <a href="/usercenter/getNewEco.html?t=v" target="_blank">企业入库</a>
	                <a href="/interestapp/taotallist.html" target="_blank">政策申报</a><br>
	                <a href="/interestapp/taotallist.html" target="_blank">数据报送</a>
	                <a href="/interestapp/interestapp/interestgxsearch.html" target="_blank">政策查询</a>
	            </dd>
	        </dl>
	        <div class="cate-content-list" style="display: none">
	            <div class="cate-mc fore1" style="display: none">
					<h2>
						<span>FINANC</span>
						债权融资
					</h2>
	                <p class="p1"><a href="/productdetail/1.html" target="_blank">开行统借统还</a></p>
	                <p class="p2"><a href="/productdetail/2.html" target="_blank">口行统借统还</a></p>
	                <p class="p3"><a href="/productdetail/3.html" target="_blank">成长贷</a></p>
	                <p class="p4"><a href="/productdetail/4.html" target="_blank">壮大贷</a></p>
	                <p class="p5"><a href="/productdetail/5.html" target="_blank">新创贷</a></p>
	            </div>
	            <div class="cate-mc fore2" style="display: none">
					<h2>
						<span>DEBT</span>
						股权融资
					</h2>
	               <p class="p1"><a href="/stock/toList.html" target="_blank">股权项目</a></p>
	                <p class="p2"><a href="/data/toJigouList.html" target="_blank">投资机构</a></p>
	            </div>
	            <div class="cate-mc fore3" style="display: none">
					<h2>
						<span> SERVICES</span>
						中介服务
					</h2>
	                <p class="p1"><a href="/incredetail/16.html" target="_blank">商标注册</a></p>
	                <p class="p2"><a href="/incredetail/17.html" target="_blank">发明专利</a></p>
	                <p class="p3"><a href="/incredetail/18.html" target="_blank">实用新型专利</a></p>
	                <p class="p4"><a href="/incredetail/20.html" target="_blank">股权融资服务</a></p>
	                <p class="p5"><a href="/incredetail/21.html" target="_blank">借款企业评级</a></p>
	            </div>
	            <div class="cate-mc fore4" style="display: none">
					<h2>
						<span>POLICY</span>
						政策申报
					</h2>
	                <p class="p1"><a href="/data!getJigouInfo.action?e.id=38f9616306b5435192757ef6731d3e3a" target="_blank">高投创业</a></p>
	                <p class="p2"><a href="/data!getJigouInfo.action?e.id=2a0e4cc023034af1ab2d6d2ea5f7647f" target="_blank">盈创兴科</a></p>
	                <p class="p3"><a href="/data!getJigouInfo.action?e.id=433f5da8a70349ffbef3032adf680398" target="_blank">盈创德弘</a></p>
	                <p class="p4"><a href="/data!getJigouInfo.action?e.id=c7df269cf84b4c699451f7acc741cd80" target="_blank">盈创泰富</a></p>
	            </div>
	
	        </div>
	        
	
	        
	        
	    </div>
    
	    <!-- 左边广告 -->
	    <!--<a id="left_small"><img src="image/guanggao/left_small.png"/></a>-->
	    <div id="left_big"><a href="/news/zhongchou.jsp"><img src="image/guanggao/left_big.jpg"/></a><i id="left_big_close" class="fa fa-times"></i></div>
    </div>

    <!--轮播内容-->
    <div class="focusBox">
        <ul class="pic">

			<li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/banner.png"></a></li>

		<!--新春注释掉-->
			<!--<li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/banner_zm.jpg"></a></li>-->
			<!--<li><a href="#" class="zmtlink" onclick="productApply('自贸通')"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/zmtbanner.jpg"></a></li>-->
			<!--<li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/pinganbank.jpg"></a></li>-->
			<!--<li><a href="/newsdetail/17073.html"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/banner_suzhou.jpg"></a></li>-->
			<!--<li><a href="#" target="_blank"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/40years.jpg"></a></li>-->
		<!--新春注释结束-->


			<!--<li><a href="/newsdetail/17046.html" target="_blank"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/banner-extension.jpg"></a></li>  -->
			<!-- 	<li><a href="http://www.winpow.com/newsdetail/16634.html" target="_blank" target="_blank"><img src="image/index/b_banjiang.jpg"></a></li> -->
			<!--<li><a href="spoilage.html" target="_blank" target="_blank"><img src="image/index/index_banner02.jpg"></a></li>-->
			<!--   <li><a href="#" target="_blank" target="_blank"><img src="image/index/index_banner1.jpg"></a></li> -->
			<!-- <li><a href="http://mp.weixin.qq.com/s?__biz=MzA3MjUwMTQwOQ==&mid=2650028531&idx=1&sn=c92f53399472cf8ebe7c18c277174509&chksm=871dc83db06a412b8ae1aa45f8f38b0ca052d27f158319dbb9b8b5ee68f190b30098ca80cbf7#rd" target="_blank" target="_blank"><img src="image/index/bangdan.jpg"></a></li>-->
			<!--<li><a href="spoilage.html" target="_blank"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/lansantuo.jpg"></a></li>-->

        </ul>
        <!-- <a class="prev" href="javascript:void(0)" style="opacity: 0.2; display: inline;"></a>
        <a class="next" href="javascript:void(0)" style="opacity: 0.2; display: inline;"></a> -->
        <ul class="hd">
	        <!--<li class="on"></li>-->
	        <!--<li class=" "></li>-->
	        <!--<li class=" "></li>-->
	        <!--<li class=" "></li>-->
	        <!--<li class=" "></li>-->
        </ul>
    </div>
    

    
    
</div>

<!--banner-->
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.SuperSlide.js"></script>
<script type="text/javascript">
    jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});
</script>


<!-- 内容显示 --><!-- 数据展示 -->
 <!--<div class="data_show widthbox">
    <ul>
        <div class="data_list">
            <li>服务企业数</li>
            <li class="data_num"><span class="timer count-title" id="count-number" data-to="<%=SystemManager.indexPage.getHisdata().getHistcomp() %>" data-speed="1500"></span><span class="jia">家</span></li>
        </div>
        <div class="data_list">
            <li>债权融资额</li>
            <li class="data_num"><span class="timer count-title" id="count-number2" data-to="<%=SystemManager.indexPage.getHisdata().getHistloanamt() %>" data-speed="1500"></span><span class="jia">万</span></li>
        </div>
        <div class="data_list">
            <li>债权融资数</li>
            <li class="data_num"><span class="timer count-title" id="count-number6" data-to="<%=SystemManager.indexPage.getHisdata().getHistloancount() %>" data-speed="1500"></span><span class="jia">笔</span></li>
        </div>
        <div class="data_list">
            <li>股权融资项目数</li>
            <li class="data_num"><span class="timer count-title" id="count-number3" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquancount() %>" data-speed="1500"></span><span class="jia">个</span></li>
        </div>     
        <div class="data_list">
            <li>股权融资金额</li>
            <li class="data_num"><span class="timer count-title" id="count-number4" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquanamt() %>" data-speed="1500"></span><span class="jia">万</span></li>
        </div>  
        <div class="data_list">
            <li>合作投资机构数</li>
            <li class="data_num"><span class="timer count-title" id="count-number5" data-to="<%=SystemManager.indexPage.getHisdata().getHistvccount() %>" data-speed="1500"></span><span class="jia">家</span></li>
        </div>
    </ul>
</div>--><!-- data_show结束 -->


<!-- 新数字样式2 -->

<!--<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/radialIndicator.js"></script>-->
<!-- 因新增盈创征信搜索框  改版界面后  注释了 6个canvas版本的统计 取消注释仍可使用-->
<!-- <div id="newhuadong" class="circlenum">
	<div class="bl ov">
	
	<div class="bl numwk">
		<input type="hidden" name="" id="spanv1"/>
		 <div class="prg-cont rad-prg" id="indicatorContainer1" accessKey="60000" lang="<%=SystemManager.indexPage.getHisdata().getHistcomp() %>">
		 	<p class="wen fuwqycj">
		 		<span>服务企业</span>
		 	</p>
		 </div>
		 <input type="hidden" name="" id="spanv2"/>
		 <div class="prg-cont rad-prg" id="indicatorContainer2" accessKey="6000000" lang="<%=SystemManager.indexPage.getHisdata().getHistloanamt() %>">
		 	<p class="wen zhaiqrzcw">
		 		<span>债权融资</span>
		 	</p>
		 </div>
		 <input type="hidden" name="" id="spanv3"/>
		 <div class="prg-cont rad-prg" id="indicatorContainer3" accessKey="60000" lang="<%=SystemManager.indexPage.getHisdata().getHistloancount() %>">
		 	<p class="wen zhaiqrzcb">
		 		<span>债权融资</span>
		 	</p>
		 </div>
		 <input type="hidden" name="" id="spanv4"/>
		 <div class="prg-cont rad-prg" id="indicatorContainer4" accessKey="6000" lang="<%=SystemManager.indexPage.getHisdata().getHistguquancount() %>">
		 	<p class="wen guqxmcg">
		 		<span>股权项目</span>
		 	</p>
		 </div>
		 <input type="hidden" name="" id="spanv5"/>
		 <div class="prg-cont rad-prg" id="indicatorContainer5" accessKey="6000000" lang="<%=SystemManager.indexPage.getHisdata().getHistguquanamt() %>">
		 	<p class="wen guqrzcw">
		 		<span>股权融资</span>
		 	</p>
		 </div>
		 <input type="hidden" name="" id="spanv6"/>
		 <div class="prg-cont rad-prg" id="indicatorContainer6" accessKey="6000" lang="<%=SystemManager.indexPage.getHisdata().getHistvccount() %>">
		 	<p class="wen hezjgcj">
		 		<span>合作机构</span>
		 	</p>
		 </div>
	</div>
</div>
	<script>
	menu_init("index");
/*
function radialObjNum(indid,num,mv,surev){
    //radial progress 1
    var radialObj1 = $('#'+indid+'').radialIndicator({
    radius: 76,
        minValue: 0,
        frameNum:300,//越小越快结束动画100 300 500
        //frameTime:100,//与frameNum效果差不多
        interpolate:false,//没什么用
        fontSize:26,
        fontFamily:'Microsoft YaHei',
        fontColor:'#3d97e6',
        fontWeight:'normal',
        textBaseline: 'top',
        barWidth:5,
        barColor:'#fd931d',
        barBgColor:'#3d97e6',
        maxValue: mv,
        roundCorner:false,//bar是否有圆角
        format: ' 万'//
}).data('radialIndicator');
//Using Instance
radialObj1.animate(surev,'spanv'+num+'');

var spanv1 = setInterval(function(){
    if($("#spanv"+num+"").val()==2){
        clearInterval(spanv1);
    radialObj1.animate(surev*0.8);
}
},1000);
}
*/
        //radialObjNum('indicatorContainer1',1,600000,7514);
        //radialObjNum('indicatorContainer2',2,6000000,751430);
        
        //radial progress 1
       var mv1 = $('#indicatorContainer1').attr("accessKey")*1;
       var surev1 = $('#indicatorContainer1').attr("lang")*1;
       var radialObj1 = $('#indicatorContainer1').radialIndicator({
            radius: 76,
            minValue: 0,
            frameNum:300,//越小越快结束动画100 300 500
            //frameTime:100,//与frameNum效果差不多
            interpolate:false,//没什么用
            fontSize:26,
            fontFamily:'Microsoft YaHei',
            fontColor:'#3d97e6',
            fontWeight:'normal',
            textBaseline: 'top',
            barWidth:5,
            barColor:'#fd931d',
            barBgColor:'#3d97e6',
            maxValue: mv1,
            roundCorner:false,//bar是否有圆角
            format: ' 家'//
        }).data('radialIndicator');
        //Using Instance
        radialObj1.animate(surev1+surev1*0.2,'spanv1');

        var spanv1 = setInterval(function(){
            if($("#spanv1").val()==2){
                clearInterval(spanv1);
                radialObj1.animate(surev1);
            }
        },1000);
        
        //radial progress 2
       var mv2 = $('#indicatorContainer2').attr("accessKey")*1;
       var surev2 = $('#indicatorContainer2').attr("lang")*1;
       var radialObj2 = $('#indicatorContainer2').radialIndicator({
            radius: 76,
            minValue: 0,
            frameNum:300,//越小越快结束动画100 300 500
            //frameTime:100,//与frameNum效果差不多
            interpolate:false,//没什么用
            fontSize:26,
            fontFamily:'Microsoft YaHei',
            fontColor:'#3d97e6',
            fontWeight:'normal',
            textBaseline: 'top',
            barWidth:5,
            barColor:'#fd931d',
            barBgColor:'#3d97e6',
            maxValue: mv2,
            roundCorner:false,//bar是否有圆角
            format: ' 万'//
        }).data('radialIndicator');
        //Using Instance
        radialObj2.animate(surev2+surev2*0.2,'spanv2');

        var spanv2 = setInterval(function(){
            if($("#spanv2").val()==2){
                clearInterval(spanv2);
                radialObj2.animate(surev2);
            }
        },1000);
        
        //radial progress 3
       var mv3 = $('#indicatorContainer3').attr("accessKey")*1;
       var surev3 = $('#indicatorContainer3').attr("lang")*1;
       var radialObj3 = $('#indicatorContainer3').radialIndicator({
            radius: 76,
            minValue: 0,
            frameNum:300,//越小越快结束动画100 300 500
            //frameTime:100,//与frameNum效果差不多
            interpolate:false,//没什么用
            fontSize:26,
            fontFamily:'Microsoft YaHei',
            fontColor:'#3d97e6',
            fontWeight:'normal',
            textBaseline: 'top',
            barWidth:5,
            barColor:'#fd931d',
            barBgColor:'#3d97e6',
            maxValue: mv3,
            roundCorner:false,//bar是否有圆角
            format: ' 笔'//
        }).data('radialIndicator');
        //Using Instance
        radialObj3.animate(surev3+surev3*0.2,'spanv3');

        var spanv3 = setInterval(function(){
            if($("#spanv3").val()==2){
                clearInterval(spanv3);
                radialObj3.animate(surev3);
            }
        },1000);
        
        //radial progress 4
       var mv4 = $('#indicatorContainer4').attr("accessKey")*1;
       var surev4 = $('#indicatorContainer4').attr("lang")*1;
       var radialObj4 = $('#indicatorContainer4').radialIndicator({
            radius: 76,
            minValue: 0,
            frameNum:300,//越小越快结束动画100 300 500
            //frameTime:100,//与frameNum效果差不多
            interpolate:false,//没什么用
            fontSize:26,
            fontFamily:'Microsoft YaHei',
            fontColor:'#3d97e6',
            fontWeight:'normal',
            textBaseline: 'top',
            barWidth:5,
            barColor:'#fd931d',
            barBgColor:'#3d97e6',
            maxValue: mv4,
            roundCorner:false,//bar是否有圆角
            format: ' 个'//
        }).data('radialIndicator');
        //Using Instance
        radialObj4.animate(surev4+surev4*0.2,'spanv4');

        var spanv4 = setInterval(function(){
            if($("#spanv4").val()==2){
                clearInterval(spanv4);
                radialObj4.animate(surev4);
            }
        },1000);
        
        //radial progress 5
       var mv5 = $('#indicatorContainer5').attr("accessKey")*1;
       var surev5 = $('#indicatorContainer5').attr("lang")*1;
       var radialObj5 = $('#indicatorContainer5').radialIndicator({
            radius: 76,
            minValue: 0,
            frameNum:300,//越小越快结束动画100 300 500
            //frameTime:100,//与frameNum效果差不多
            interpolate:false,//没什么用
            fontSize:26,
            fontFamily:'Microsoft YaHei',
            fontColor:'#3d97e6',
            fontWeight:'normal',
            textBaseline: 'top',
            barWidth:5,
            barColor:'#fd931d',
            barBgColor:'#3d97e6',
            maxValue: mv5,
            roundCorner:false,//bar是否有圆角
            format: ' 万'//
        }).data('radialIndicator');
        //Using Instance
        radialObj5.animate(surev5+surev5*0.2,'spanv5');

        var spanv5 = setInterval(function(){
            if($("#spanv5").val()==2){
                clearInterval(spanv5);
                radialObj5.animate(surev5);
            }
        },1000);
        
        //radial progress 6
       var mv6 = $('#indicatorContainer6').attr("accessKey")*1;
       var surev6 = $('#indicatorContainer6').attr("lang")*1;
       var radialObj6 = $('#indicatorContainer6').radialIndicator({
            radius: 76,
            minValue: 0,
            frameNum:300,//越小越快结束动画100 300 500
            //frameTime:100,//与frameNum效果差不多
            interpolate:false,//没什么用
            fontSize:26,
            fontFamily:'Microsoft YaHei',
            fontColor:'#3d97e6',
            fontWeight:'normal',
            textBaseline: 'top',
            barWidth:5,
            barColor:'#fd931d',
            barBgColor:'#3d97e6',
            maxValue: mv6,
            roundCorner:false,//bar是否有圆角
            format: ' 家'//
        }).data('radialIndicator');
        //Using Instance
        radialObj6.animate(surev6+surev6*0.2,'spanv6');

        var spanv6 = setInterval(function(){
            if($("#spanv6").val()==2){
                clearInterval(spanv6);
                radialObj6.animate(surev6);
            }
        },1000);
        
        

    </script>
</div> -->

	<style>
		.count_search_bg{background:url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/creditBg.png") no-repeat 0 center;background-size: 100% 100%;}
		.lxl-count,.credit-search{background: none;}
		.credit-search .searchbox{padding:17.5px 0;}
		.lxl-count{height: 50px;line-height: 50px;}
		.lxl-count ul {border-bottom: 1px solid #68abbe;}
		.lxl-count ul li{color: #ffd8a4;    height: 50px;line-height: 50px;padding:0 33px;
			background-image: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/count-line.png");
		}
		.lxl-count ul li span{color: #fdb02c;font-size:24px;}
		.credit-search #searchBtn{background: #ffae2e;}
		.credit-search #searchWord{color: #ffad30;}
		.credit-search #searchWord::-webkit-input-placeholder {color: #ffad30;}
		.credit-search #searchWord:-moz-placeholder {color: #ffad30;}
		.credit-search #searchWord::-moz-placeholder {color: #ffad30;}
		.credit-search #searchWord:-ms-input-placeholder {color: #ffad30;}
		.fixed{border:0;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/fixedBg.png") no-repeat 0 0;background-size: 100% 100%;
		color: #ffd7a3;padding: 35px 20px 15px;width: 93px;}
		.fixed *{color: #ffd7a3 !important;}
		.fixed .fixed_test{border-color: #ae0b26;}
		.home{margin-top:10px;}
		.fixed .home .fixed_img{background: none;}
		.all_nav{background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/keftNavBg.png") no-repeat 0 0; }
		.all_nav dd{background-color: transparent;}

		.zen_icon {
			background:url('<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/index_icon1.png') no-repeat 20px 27px;
		}
		.gu_icon {
			background:url('<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/index_icon2.png') no-repeat 20px 27px;
		}
		.zhai_icon {
			background:url('<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/index_icon3.png') no-repeat 20px 27px;
		}
		.last {
			background:url('<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/index_icon4.png') no-repeat 20px 27px;
		}
		.all_nav dd a.big_nav{color: #ffd6a6;}
		.all_nav dd a{color: #d28c94;}
		.news_mid_bg{
			padding:50px 0;
			background: url('<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/zxAllBg.png') no-repeat center;

		}
		.news_mid_bg .info_content{
			background: url('<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/zxBg.png') no-repeat 0 0;
			background-size: 100% 100%;
			border-radius: 20px;padding:50px 0 10px 10px;}
		.news_mid_bg .info_content>div{background: #fff;border-radius: 10px;margin-right: 10px;padding:30px 10px 10px;}
	</style>
<!-- 新增盈创征信后的6个统计 -->
	<div class="count_search_bg">
		<div class="lxl-count">
			<div class="bl ov">
				<ul>
					<li>服务企业 <span  id="CountUp1"><%=SystemManager.indexPage.getHisdata().getHistcomp() %></span> 家</li>
					<li>债权融资 <span  id="CountUp2"><%=SystemManager.indexPage.getHisdata().getHistloanamt() %></span> 万</li>
					<li>债权融资 <span  id="CountUp3"><%=SystemManager.indexPage.getHisdata().getHistloancount() %></span> 笔</li>
					<li>股权项目 <span  id="CountUp4"><%=SystemManager.indexPage.getHisdata().getHistguquancount() %></span> 个</li>
					<li>股权融资 <span  id="CountUp5"><%=SystemManager.indexPage.getHisdata().getHistguquanamt() %></span> 万</li>
					<li>合作机构 <span  id="CountUp6"><%=SystemManager.indexPage.getHisdata().getHistvccount() %></span> 家</li>
				</ul>
			</div>
		</div>
		<div class="credit-search">
			<div class="searchbox ov">
				<!--企业信用查询：-->
				<div class="search">
					<input type="text" placeholder="请输入查询企业名称" id="searchWord">
					<a href="http://credit.winpow.com/#/search/盈创动力/g/1?source=a" target="_blank" id="searchUrl"><input type="button" id="searchBtn" value="信用查询"></a>
				</div>
			</div>
		</div>
	</div>


<script>
    $(document).ready(function( $ ) {
    	var options = {
    		       useEasing : true,
    		       useGrouping : true,
    		       separator : '',
    		       decimal : '.',
    		       prefix : '',
    		       suffix : ''
    		   };
    		   var demo = new CountUp("CountUp1", 0, $.trim($('#CountUp1').text()), 0, 2, options);
    		   var demo2 = new CountUp("CountUp2", 0, $.trim($('#CountUp2').text()), 0, 2, options);
    		   var demo3 = new CountUp("CountUp3", 0, $.trim($('#CountUp3').text()), 0, 2, options);
    		   var demo4 = new CountUp("CountUp4", 0, $.trim($('#CountUp4').text()), 0, 2, options);
    		   var demo5 = new CountUp("CountUp5", 0, $.trim($('#CountUp5').text()), 0, 2, options);
    		   var demo6 = new CountUp("CountUp6", 0, $.trim($('#CountUp6').text()), 0, 2, options);
    		   demo.start();
    		   demo2.start();
    		   demo3.start();
    		   demo4.start();
    		   demo5.start();
    		   demo6.start();
    });

</script>



<script>
var http="http://credit.winpow.com/#/search/";
var com="/g/1?source=a";

$('#searchUrl').click(function(){
    var href=http+$('#searchWord').val()+com;
    $(this).attr("href",href);
});
</script>

<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/huadong.js"></script>
<div id="sourcehuadong" style="display: none;margin-top: 50px;margin-bottom: 58px;" class="show_data">
    <div class="wrap">
        <span><label class="odometer_name">服务<br/>企业</label> <span class="odometer" id="Span4"><%=SystemManager.indexPage.getHisdata().getHistcomp() %></span>  <label class="odometer_name" >家</label></span>
        <span><label class="odometer_name">债权<br/>融资</label><span class="odometer" id="Span5"><%=SystemManager.indexPage.getHisdata().getHistloanamt() %></span><label class="odometer_name" >万</label></span>
        <span><label class="odometer_name">债权<br/>融资</label><span class="odometer" id="Span6"><%=SystemManager.indexPage.getHisdata().getHistloancount() %></span><label class="odometer_name" >笔</label></span>
        <span><label class="odometer_name">股权<br/>项目</label><span class="odometer" id="Span7"><%=SystemManager.indexPage.getHisdata().getHistguquancount() %></span><label class="odometer_name" >个</label></span>
        <span><label class="odometer_name">股权<br/>融资</label><span class="odometer" id="Span8"><%=SystemManager.indexPage.getHisdata().getHistguquanamt() %></span><label class="odometer_name" >万</label></span>

        <span><label class="odometer_name">合作<br/>机构</label><span class="odometer" id="Span1"><%=SystemManager.indexPage.getHisdata().getHistvccount() %></span><label class="odometer_name" >家</label></span>
    </div>
</div>





<!-- 推荐和data数据start-->
<!-- 
<div class="rdata widthbox">
		<div class="divlwk">
			<div class="divl">
				<div class="divlist">
					<a target="_blank" href="/incredetail/22.html">
						<p class="ptitle"><span><img src="image/index/hot.gif" alt=""></span>&nbsp;政策补贴贷款贴息评级</p>
						<p class="pjj">联系电话 028-83222661</p>
						<p class="pimg"><img src="image/index/txpj.png" alt=""></p>
					</a>
        		</div>
        		<div class="divlist">
        			<a target="_blank" href="/incredetail/25.html">
						<p class="ptitle">企业信用信息服务</p>
						<p class="pjj">企业征信服务</p>
						<p class="pimg"><img src="image/index/xxfw.png" alt=""></p>
					</a>
        		</div>
        		<div class="divlist">
        			<a target="_blank" href="/incredetail/29.html">
						<p class="ptitle">专项审计报告</p>
						<p class="pjj">为企业出具专项审计报告</p>
						<p class="pimg"><img src="image/index/sjbg.png" alt=""></p>
					</a>
        		</div>
        	</div>
        </div>
        <div class="divrwk">
        	<div class="divr">
        		<ul>
        			<li>服务企业数<b><span class="timer count-title" id="count-number" data-to="<%=SystemManager.indexPage.getHisdata().getHistcomp() %>" data-speed="1500"></span></b>家</li>
        			<li>债权融资额<b><span class="timer count-title" id="count-number2" data-to="<%=SystemManager.indexPage.getHisdata().getHistloanamt() %>" data-speed="1500"></span></b>万</li>
        			<li>债权融资数<b><span class="timer count-title" id="count-number6" data-to="<%=SystemManager.indexPage.getHisdata().getHistloancount() %>" data-speed="1500"></span></b>笔</li>
        			
        		</ul>
        		<ul>
        			
        			<li>股权融资项目数<b><span class="timer count-title" id="count-number3" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquancount() %>" data-speed="1500"></span></b>个</li>
        			<li>股权融资金额<b><span class="timer count-title" id="count-number4" data-to="<%=SystemManager.indexPage.getHisdata().getHistguquanamt() %>" data-speed="1500"></span></b>万</li>
        			<li>合作投资机构数<b><span class="timer count-title" id="count-number5" data-to="<%=SystemManager.indexPage.getHisdata().getHistvccount() %>" data-speed="1500"></span></b>家</li>
        		</ul>
        		<div class="clear"></div>
        	</div>
        </div>
</div>-->
<!-- 推荐和data数据end-->

<div class="news_mid_bg">

<div class="info_content widthbox bgf boxsiz"><!-- 信息内容 -->
    

    <div class="information fl"><!-- 盈创资讯 -->
        <div class="dynamic_title"><!-- 盈创资讯标题 -->
            <!--<div class="dynamic_title_left fl"><img src="image/index/yczx.png" style="margin-top: 4px;"/></div>-->
            <div class="dynamic_title_right">
                <div class="dynamic_title_right_text fl"><a href="/news/toList.html" target="_blank" target="_blank">盈创资讯</a><span class="rzeglish"> NEWS</span></div>
                <!--<a href="/news/toList.html" target="_blank" target="_blank"><div class="dynamic_title_right_img fr"></div></a>-->
                <div class="dynamic_title_right_backgroundimg fr"></div>
            </div>
        </div>
        <div class="information_list"><!-- 盈创资讯列表 -->        
        			
				<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.slideBox.min.js" type="text/javascript"></script>
        		<div class="informationpic">
        			<div class="picqh">
                    	<div class="banner_left">
				            <div id="wrap">
				                <div id="fade_focus">
				                    <div class="loading" style="border:none!important"></div>
				                    <ul>
				                        <!--网站轮播图-->
				                            
				                            
				                            
				                            
  <% for (int i = 0;i<SystemManager.indexPage.getNewsList().size() && i<3;i++) {
  							News n = SystemManager.indexPage.getNewsList().get(i);
  							String cover = n.getCover();
						 String title = n.getTitle();
							 String newsid = n.getId();
  							if(cover!=null && !"".equals(cover)){
  							
  				                          out.print(" <li>");
			                              out.print(" <a target=\"_blank\" href=\"/newsdetail/"+newsid+".html\" target=\"_blank\">");
			                              out.print("     <img src="+cover+" width=\"230\" height=\"140\" />");
		                                  out.print("   <div class=\"newtt\"></div>");

			                              out.print("</a>");
				                          out.print("  </li>");
  							}
  
				 
 
				}%>
				                       
				                    </ul>
				                </div>
				            </div>
        				</div>
                	</div>
        		</div>
        		
        		
        		
        
      			  <% for (int i = 0;i<3;i++) {
					News n = SystemManager.indexPage.getNewsList().get(i);
					out.print("<ul>");
					out.print("<li>");
					if(n == null)
						break;
					if(i==0){
						 out.print("<div class=\"information_list_bor information_list_bor2\"><span class=\"new\">&nbsp;</span></div>");
					}else {
						 out.print("<div class=\"information_list_bor\"></div>");
					}
					 String title = n.getTitle();
					 String newsid = n.getId();
					 String cataid = n.getCataid();
					 if(i==0) {
 					 	out.print("<a href=\"/newsdetail/"+newsid+".html\" target=\"_blank\" title=\""+title+"\" class=\"information_list_info\"><span class=\"tsss\">["+SystemManager.treeNodeMap.get(cataid).getName()+"]</span>"+ title.substring(0,title.length()>11?10:title.length())+"...</a>");
					 }else {
					 	out.print("<a href=\"#\"  target=\"_blank\" title=\""+title+"\"  class=\"information_list_info\"><span class=\"tsss\">["+SystemManager.treeNodeMap.get(cataid).getName()+"]</span>"+title.substring(0,title.length()>13?12:title.length())+"...</a>");
					 }
					 
					out.print("</ul>");
					out.print("</li>");
							
 
				}%>
 
 
  
        </div>
	<a href="/news/toList.html" class="graymore fr">更多</a>
    </div>
    <div class="college fl"><!-- 盈创活动 -->
        <div class="dynamic_title"><!-- 盈创活动标题 -->
            <!--<div class="dynamic_title_left fl"><img src="image/index/ychd.png" style="margin-top: 4px;"/></div>-->
            <div class="dynamic_title_right">
             <div class="dynamic_title_right_text fl"><a href="/college/colleges.html" target="_blank" target="_blank">盈创活动</a><span class="rzeglish"> ACTIVITIES</span></div>
                <!--<a href="/college/colleges.html" target="_blank" target="_blank"> <div class="dynamic_title_right_img fr"></div></a>-->
               <div class="dynamic_title_right_backgroundimg fr"></div>
               
            </div>
        </div>
        <div class="college_info">
    
        	
        	
        	
  <% for (int i = 0;i<3;i++) {
        	  Activities a = SystemManager.indexPage.getActivitiesList().get(i);
             
             
             
             	//是否已经举办过
		String cutime = DateTimeUtil.getStringDate();
		String endtime  = a.getEndtime();

		
		
            	out.print("<ul class=\"information_list\"  >");
            	out.print("<li class=\"lef\"  >"+a.getLurushijian().substring(0,10)+"</li>");
        		out.print("<li>");
        		
        	if(i==0) {
             out.print("<a target=\"_blank\" href=\"collegedetail\\"+a.getId()+".html\"> <h3 class=\"cur\"  title=\""+a.getActivities_name()+"\" >"+AppUtil.substring(a.getActivities_name(), 28)+"<span class=\"new\">&nbsp;</span></h3></a>");

			}else {
				 out.print("<a target=\"_blank\" href=\"collegedetail\\"+a.getId()+".html\"> <h3 class=\"cur\"  title=\""+a.getActivities_name()+"\" >"+AppUtil.substring(a.getActivities_name(), 31)+"</h3></a>");
			}
		

              out.print("  </li>");
        	out.print("</ul>");
        	
        	 
				}
				%>
				
				 
               
        </div>
		<a href="/college/colleges.html" class="graymore fr" style="margin-right: 0;">更多</a>
    </div>
    <div class="dynamic fl"><!-- 融资交易 -->
        <div class="dynamic_title"><!-- 融资交易标题 -->
            <!--<div class="dynamic_title_left fl"><img src="image/index/rzjy.png" style="margin-top: 4px;"/></div>-->
            <div class="dynamic_title_right">
                <div class="dynamic_title_right_text fl"><a href="/data/getRzjyList.html" target="_blank">融资交易</a><span class="rzeglish"> TRANSACTIONS</span></div>
                <!--<a href="/data/getRzjyList.html" target="_blank"><div class="dynamic_title_right_img fr"></div></a>-->
                <div class="dynamic_title_right_backgroundimg fr"></div>
            </div>
        </div>



        <div class="dynamic_list" id="scrollDiv"><!-- 融资交易列表-->
        <a href="/data/getRzjyList.html" target="_blank">
             <ul>
             <!-- SystemManager.indexPage.getDynamicList().size() -->
             <% for (int i = 0;i<SystemManager.indexPage.getDynamicList().size();i++) {


					Dynamic d = SystemManager.indexPage.getDynamicList().get(i);

					//类型
					 String str = ""; 
					if(d.getDytype().equals("1")) {  //债权融资
						str = "申请"+d.getDytypedetail();
					}else if(d.getDytype().equals("2")) {//增值业务
						str ="订购增值业务"+d.getDytypedetail();
					}else if(d.getDytype().equals("3")) { //股权融资
						str ="约谈项目"+d.getDytypedetail();
					}else if(d.getDytype().equals("5")) { //基金申请
						str ="申请基金"+d.getDytypedetail();
					}else{  //发布融资
						str ="发布"+d.getDytypedetail();
					}
				 if(i%2==0){
					 out.print("<li style='background: #f9f9f9;'>");
				 }else{
					out.print("<li>");
				 }
				 //公司名称
				 out.print(" <div class=\"dynamic_list_info fl\" >"+d.getCompName()+str+"</div> ");
				//小图标
				out.print("<div class=\"dynamic_list_timeimg fl\"></div>");
				//状态
				out.print(" <span class=\"dynamic_list_condition fl\">"+AppUtil.getCodeName(d.getDystatus())+"</span>");
				//时间日期
				out.print("<span class=\"dynamic_list_date fr\">"+d.getDytime().substring(0,10)+"</span>");

				out.print("</li>");

				}%>
				
			  
              </ul>
              </a>
        </div>

	<a href="/data/getRzjyList.html" class="graymore fr">更多</a>

    </div><!-- dynamic -->


    
    
</div>

<!-- middle_add start-->
<div class="middle_addwk">
	<div class="middle_add">
		<!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/box/zmtmiddle.png"/>-->
		<ul class="midUl ov">
			<li class="trans3 zmtlink" onclick="productApply('自贸通')">
				<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/mid1.png" alt="">
				<div>
					<h3>自贸通</h3>
					<span class="midApply1">立即申请</span>
				</div>
			</li>
			<li class="trans3" onclick="productApply('科票通')">
				<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/mid2.png" alt="">
				<div>
					<h3>央行科票通</h3>
					<span class="midApply2">立即申请</span>
				</div>
			</li>
			<li class="trans3 publish">
				<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/mid3.png" alt="">
				<div>
					<h3>中小企业融资</h3>
					<span class="midApply3">立即申请</span>
				</div>
			</li>
		</ul>
	</div>
</div>

<!-- middle_add end -->
</div>
<!-- info_content -->
<div class="zqbg indexbg">
	<div class="debt_info widthbox middle_guanggao"><!-- 债权融资项目 -->
		<h3 class="indexTitle">债权融资 <span>DEBT FINANCING</span></h3>
		<div class="debt_info_img fl">
			<!--<p class="gqrzxmp">债权融资产品</p>-->
			<ul class="gqrzxmul">
				<p class='zq'><a href="/product/toList.html">统借统还产品</a></p>
				<!--<p><a href="/productdetail/1.html">开行统借统还贷款</a></p>-->
				<!--<p><a href="/productdetail/2.html">口行统借统还贷款</a></p>-->
				<p class='zq'><a href="/product/toList.html">政策性产品</a></p>
				<!--<p><a href="/productdetail/3.html">成长贷</a></p>-->
				<!--<p><a href="/productdetail/4.html">壮大贷</a></p>-->
				<!--<p><a href="/productdetail/5.html">新创贷</a></p>-->
				<!--<p><a href="/productdetail/6.html">国家专项建设基金</a></p>-->
				<!--<p><a href="/productdetail/7.html">园保贷</a></p>-->
				<p class='zq'><a href="/product/toList.html">商业化产品</a></p>
			</ul>
			<a href="/product/toList.html" target="_blank" class="leftLookMore lookRed trans3">查看更多</a>
		</div>
		<div class="debt_info_right fr mr_frbox">
		<!--<div class="mr_frBtnL prev"><img  src="image/mfrL.jpg" width="17" height="40" /></div>-->
			<div class="debt_info_right_bor ">
					<!--<a href="/product/toList.html" target="_blank" class="debt_info_right_gd fr">+更多</a><br/>-->
					<div class="debt_info_right_date mr_frUl"><ul>

				<% for (int i = 0;i<SystemManager.indexPage.getProductList().size();i++) {

				Product p = SystemManager.indexPage.getProductList().get(i);

				String biaoqian = p.getBiaoqian();

					out.print("<li class=\"debt_info_right_datea index_cj_flg fl \">");
					out.print("<div class=\"lineik\"><div class=\"binline\">");
							out.print("</div><div class=\"debt_info_right_datea_title\" style=\"margin-left:0px;\">"+p.getProdname()+"</div>");
							out.print("<div style=\"\">");
								out.print("<p class=\"debt_info_right_datea_info liw\"><i>合作银行：</i>");
								   out.print(" <span class=\"debt_info_right_datea_img\">");
											 String arrays[] = p.getBanks().split(",");
									 for(int j=0;j<arrays.length;j++){
										String array = arrays[j];
										if (array.contains("aaaaaaaaa")) {
											out.print("  <img src=\"image/index/" + arrays[j] + ".jpg\"/>");
										} else {
											out.print("  <img style=\"width: 30px;height: 30px;\" src=\"" + SystemManager.bankimg.get(arrays[j]) + "\"/>");
										}
									 }
								   out.print("</span>");
								out.print(" </p>");
							   out.print(" <p class=\"debt_info_right_datea_info\">还款方式：<span class=\"debt_info_right_datea_test\">"+p.getRetutype()+"</span></p>");
							  out.print("  <p class=\"debt_info_right_datea_info\">贷款额度：<span class=\"debt_info_right_datea_test\">"+p.getLoanamt()+"-"+p.getLoanamtmax()+"万</span></p>");

							  if(p.getLoanterm()==p.getLoantermmax() ) {
								  out.print("  <p class=\"debt_info_right_datea_info\">贷款期限：<span class=\"debt_info_right_datea_test\">"+p.getLoanterm()+"个月</span></p>");
							  }else {
								  out.print("  <p class=\"debt_info_right_datea_info\">贷款期限：<span class=\"debt_info_right_datea_test\">"+p.getLoanterm()+"-"+p.getLoantermmax()+"个月</span></p>");
							  }


							  out.print("  <p class=\"debt_info_right_datea_info\">利率(年)：<span class=\"debt_info_right_datea_test\">"+p.getLoanrate()+"</span></p>");
							  out.print("  <p class=\"debt_info_right_datea_info zqtips\">");

								if(biaoqian!=null && !"".equals(biaoqian)){
									String[] biaoqianArray = biaoqian.split(" ");
									for(int j=0;j<biaoqianArray.length;j++) {
										if(j==biaoqianArray.length-1){
											out.print(biaoqianArray[j]);
										}else{
											out.print(biaoqianArray[j]+" · ");
										}
									}
							}
						   out.print(" </p></div>");
						   out.print(" <div class=\"debt_info_right_datea_bot\"><a target=\"_blank\" href=\"/productdetail/"+p.getId()+".html\">立即申请</a></div>");
							out.print(" </div></li>");

					}%>


						</ul>
					</div>
				</div>
				<!--<div class="mr_frBtnR next" ><img src="image/mfrR.jpg" width="17" height="40" /></div>-->
			</div>


		 <!-- <div id="footer_big">

			<div class="footer_c">
				<a href="http://credit.winpow.com" target="_blank">
					<div class="credit-wordbox">
						<h1 id="credit-word">
							<img src="image/index/credit-word1.png" alt="">
						</h1>
					</div>

				</a>
				<i id="footerclose" class="fa fa-times"></i>
			</div>

		</div> -->
			<!--底部盈创征信广告动图-->
		 <!--<div id="popup">-->
			<!--<div class="wordbox">-->
				<!--<h1 id="credit-word">-->
					<!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/credit-word1.png" alt="" >-->
				<!--</h1>-->
				<!--<span id="wordClose">&times;</span>-->
			<!--</div>-->
		<!--</div>   -->

	</div><!-- debt_info结束 -->
</div>
<script>
	//底部盈创征信广告动图
//    var a='<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/credit-word1.png" alt="">';
//    var b='<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/credit-word2.png" alt="">';
//    var c=[a,b];
//    var h1=c.length;
//    var i=1;
//    setInterval(function(){
//
//        $('#credit-word').html(c[i]);
//        i++;
//        if(i>h1-1){
//            i=0;
//        }
//    },3000)
//
//    $('#wordClose').click(function(){
//        $('#popup').hide();
//    })

</script>

<!-- 债券融资产品右边切换 -->
<style>
.mr_frBtnL{float:left;width:20px;margin:180px 2px 0px 2px;cursor:pointer;display:inline;}
.mr_frBtnL img{display:none;}
.mr_frBtnR{float:right;width:19px;margin:180px 2px 0 2px;cursor:pointer;}
.mr_frBtnR img{display:none;}
.neikuang{width:221px;}
.prevStop img{display:none!important;}
.nextStop img{display:none!important;}
</style>
<script type="text/javascript">
$(".mr_frbox").hover(function(){
	$(".mr_frBtnL img").show().stop();
	$(".mr_frBtnR img").show().stop();
},function(){
	$(".mr_frBtnL img").hide().stop();
	$(".mr_frBtnR img").hide().stop();
}
);


jQuery(".mr_frbox").slide({titCell:"",mainCell:".mr_frUl ul",autoPage:true,autoPlay:true,effect:"left",vis:4,pnLoop:false,trigger:"click"});
/*
$(".mr_frbox").slide({
	titCell:"",
	
	easing:"swing",
	delayTime:700,
	mainCell:".mr_frUl ul",
	autoPage:true,
	effect:"leftLoop",
	autoPlay:true,
	pnLoop:false
	//vis:1

}); */

</script>
	<!-- 股权融资 -->
<div class="gqbg indexbg">
	<div class="thigh_info widthbox">
		<h3 class="indexTitle indexTitle2">股权融资 <span>EQUITY FINANCING</span></h3>
		<div class="thigh_info_left_img fl">
			<!--<p class="gqrzxmp">股权融资项目</p>-->
			<ul class="gqrzxmul gqrzxmul2" id="guquanFinancingHtmlId">
				<%--加载股权融资项目--%>
				<%
					List<GuquanFinancing> guquanFinancings = SystemManager.indexPage.getGuquanFinancings();

					for(GuquanFinancing gf : guquanFinancings) {
						out.print("<li><a href='guquan_financing!toEdit.action?e.id="+ gf.getId() +"'>"+ gf.getName() +"</a></li>");
					}
				%>
				<%--<li><a href="/news/guquanrongzidetail.jsp">天使投资基金</a></li>--%>
				<%--<li><a href="/news/guquanrongzidetail.jsp">创业投资基金</a></li>--%>
				<%--<li><a href="/news/guquanrongzidetail.jsp">私募投资基金</a></li>--%>
				<%--<li><a href="/news/guquanrongzidetail.jsp">产业投资基金</a></li>--%>
				<li><a href="/user/login.html?bzf=c">我是创业者</a></li>
			</ul>
			<a href="/stock/toList.html" target="_blank" class="leftLookMore lookBlue trans3">查看更多</a>
			<%--<div class="woshichuangyezhe woshi woshif"><a href="/user/login.html?bzf=c">我是创业者</a></div>--%>
		</div>
		<div class="thigh_info_right fr">
			<div class="thigh_info_right_bor">
				<!--<div class="thigh_info_right_gd fr"><a href="/stock/toList.html" target="_blank">+更多</a></div>-->
				<div class="thigh_info_right_center">







					  <% for (int i = 0;i<SystemManager.indexPage.getGuquanList().size();i++) {

							Guquan g = SystemManager.indexPage.getGuquanList().get(i);

							if(i%2==0) {
								 out.print(" <div class=\"thigh_info_right_center1 num"+(i+1)+" fl\">");
							}else {
								 out.print(" <div class=\"thigh_info_right_center2 num"+(i+1)+" fl\">");
							}


						 out.print(" <a target=\"_blank\" href=/stockdetail/"+g.getId()+".html><div class=\"thigh_info_right_center1_img fl\"><img style=\"width:240px;height:150px\" src=\""+g.getTuijianpic()+"\" alt=\"\">");
						/*  out.print(" <a target=\"_blank\" href=/stockdetail/"+g.getId()+".html><div class='thigh_info_right_center1_img fl'><img style='width:240px;height:150px' src='https://www.winpow.com/attached/uploadimg/20180726114534_347.png'>");*/

							 out.print("     <div class=\"thigh_info_right_center1_test_but\">");
							 out.print("        <li>"+g.getMingcheng()+"</li>");
							 out.print("     </div>");

							 out.print("</div>");


							 out.print("  <div class=\"thigh_info_right_center1_test fr\">");
					       /* out.print("    <div class=\"thigh_info_right_center1_test_title\">"+g.getMingcheng()+"</div>"); */
							 out.print("    <div class=\"thigh_info_right_center1_test_info\">");
							 out.print("<ul class='detailUl'>");
							  out.print("<div class=\"li\"><span>行业：</span>"+g.getHangye()+"</div>");
							  out.print("<div class=\"li\"><span>融资额度：</span>"+g.getRongziedu()+"万</div>");
							  out.print("<div class=\"li\"><span>出让股权比例：</span>"+g.getCrgqbl()+"%</div>");
							  out.print("<div class=\"li\"><span>推荐机构数：</span>" + g.getEmailcount() + "家</div>");
							  out.print("<div class=\"li\"><div class='attentionBox'><div><span>关注度：</span></div><div class='attentionStar' name='"+g.getBrowsecount()+"'><span></span><span></span><span></span><span></span><span></span></div></div></div>");

							  //BigDecimal bookamt = g.getBookamt();
							  //BigDecimal rongziedu = g.getRongziedu();
							  //out.print("  <div class=\"jdtyy\" style=\"bottom:-4px!important;left:inherit;right:0!important;display:block;\"><div class=\"zqrzjdt\" style=\"\";><div class=\"zqrzjdt_left\" style=\"width:"+((bookamt.divide(rongziedu,4,BigDecimal.ROUND_HALF_EVEN).movePointRight(2)))+"%\"></div><div class=\"zqrzjdt_right\" style=\"width:"+(100-((bookamt.divide(rongziedu,4,BigDecimal.ROUND_HALF_EVEN).movePointRight(2))).doubleValue())+"%\"></div></div>"+((bookamt.divide(rongziedu,4,BigDecimal.ROUND_HALF_EVEN).movePointRight(2)))+"%</div>");



							  out.print("   </ul>");
							  out.print("   </div>");
								out.print(" </div>");
							  out.print("  </a> </div>");



					}%>
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
</div>
	<!-- 股权融资结束 -->
<style>
.thigh_info .thigh_info_right .thigh_info_right_center .thigh_info_right_center1_test_info ul .li {
   /* margin-bottom: 15px;*/
}
</style>

	<!-- 中介服务 -->
<div class="zjbg  indexbg">
	<div class="serve_info widthbox">
		<h3 class="indexTitle">中介服务 <span>INTERMEDIARY SERVICES</span></h3>
		<div class="serve_info_left_img fl">
			<!--<p class="gqrzxmp">增值服务产品</p>-->
			<ul class="gqrzxmul">
				<li class='zz'><a href="#">创业辅导服务</a></li>
				<li class='zz'><a href="/incredetail/25.html">信用信息服务</a></li>
				<li class='zz'><a href="#">培训教育服务</a></li>
				<li class='zz'><a href="#">融资中介服务</a></li>
				<li class='zz'><a href="#">改制上市服务</a></li>
			</ul>
			<a href="/incre/toList.html" target="_blank" class="leftLookMore lookOrange trans3">查看更多</a>
		</div>
		<div class="serve_info_right fr">
			<div class="serve_info_right_bor">
				<!--<div class="serve_info_right_gd fr"><a href="/incre/toList.html" target="_blank">+更多</a></div><br/>-->
				<div class="serve_info_right_content">
					<div class="serve_info_right_content1"><!-- 水平左边整块二合一 -->



					<% for (int i = 0;i<SystemManager.indexPage.getIncreList().size();i++) {
						if(i>5){
							break;
						}

						Incre g = SystemManager.indexPage.getIncreList().get(i);

							out.print("<a target=\"_blank\" href=\"/incredetail/"+g.getId()+".html\">");
							out.print("<div class=\"serve_info_right_content2_bor_left trans3  fl\" > ");
							   out.print(" <div class=\"serve_info_right_content2_img\">");

									out.print("<img src=\"image/index/zjimg"+(i+1)+".png\" alt=\"\">");
							   out.print(" </div>");

							   out.print(" <div class=\"serve_info_right_content2_info\">");
								   out.print(" <ul>");

										out.print("<li class=\"serve_info_right_content2_info_title\">"+g.getIncrename()+"</li>");
									   out.print(" <li class=\"serve_info_right_content2_info_info\">"+g.getIncredescrip()+"</li>");

									out.print("</ul>");
							   out.print(" </div>");
						   out.print(" </div>");
						out.print("</a>");



					}%>

						<!-- 因为img已经循环生成，后期 要求添加hover效果，没有修改页面布局，直接修改的图片路径 -->
					 <!--<script>-->
						<!--$('.serve_info .serve_info_right .serve_info_right_content2_bor_left').hover(function(){-->
							<!--var src=$(this).find('img')[0].src;-->
							<!--var reg=src.match('.png');-->
							<!--var newSrc=src.replace(reg,"on.png")-->
							<!--$(this).find('img')[0].src=newSrc;-->

						<!--},function(){-->
						<!--var src=$(this).find('img')[0].src;-->
							<!--var reg=src.match('on.png');-->
							<!--var newSrc=src.replace(reg,".png")-->
							<!--$(this).find('img')[0].src=newSrc;-->
						<!--})-->
					 <!--</script>-->

				</div>

				<%--out.print(" <li class=\"serve_info_right_content2_info_vel\">￥<span>"+g.getIncreprice()+"</span>起</li>"); --%>


				</div>
			</div>
		</div>
	</div><!-- serve_info结束 -->
</div>

<div class="zcbg  indexbg">
	<div class="indexZc bl ov">
		<h3 class="indexTitle indexTitle2" indexTitle>政策申报 <span>POLICY DECLARATION</span></h3>
		<div class="zcLeft">
			<dl class="ov">
				<!--<dt>政策申报</dt>-->
				<dd><a href="/usercenter/getNewEco.html?t=v" target="_blank">企业入库</a></dd>
				<dd><a href="/interestapp/taotallist.html" target="_blank">数据报送</a></dd>
				<dd><a href="/interestapp/taotallist.html" target="_blank">政策申报</a></dd>
				<dd><a href="/interestapp/interestapp/interestgxsearch.html" target="_blank">政策查询</a></dd>
			</dl>
			<a href="/interestapp/taotallist.html" target="_blank" class="leftLookMore lookGreen trans3">查看更多</a>
		</div>
		<div class="zcRight">
		 <!--<a href="/interestapp/taotallist.html" class="zcmore" target="_blank">+更多</a>-->
			<ul>
				<li class="trans3">
					<a href="/usercenter/getNewEco.html?t=v" class="trans5" target="_blank">
						<!--<i class="trans5"></i>-->
						<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/zcimg1.png" alt="">
						<h2>企业入库</h2>
						<p>新经济企业入库<br>企业征信入库</p>
					</a>
				</li>
				<li class="trans3">
					<a href="/interestapp/taotallist.html"  class="trans5" target="_blank">
						<!--<i  class="trans5"></i>-->
						<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/zcimg2.png" alt="">
						<h2>数据报送</h2>
						<p>统计指标数据报送</p>
					</a>
				</li>
				<li class="trans3">
					<a href="/interestapp/taotallist.html"  class="trans5" target="_blank">
						<!--<i  class="trans5"></i>-->
						<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/zcimg3.png" alt="">
						<h2>政策申报</h2>
						<p>支持金融服务实体经济政策申报<br>支持提升金融产业能级政策申报<br>支持构建金融生态圈政策申报</p>
					</a>
				</li>

				<li class="trans3">
					<a href="/interestapp/interestapp/interestgxsearch.html" class="trans5" target="_blank">
						<!--<i  class="trans5"></i>-->
						<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/zcimg4.png" alt="">
						<h2>政策查询</h2>
						<p>根据查询条件查询政策<br>智能匹配政策</p>
					</a>
				</li>

			</ul>
		</div>

	</div>
</div>
<div class="bgf">
<div class="invest_info widthbox">
    <div class="invest_info_title">
        <ul>
            <li class="invest_info_titletest fl">投资机构</li>
            <!--<li class="invest_info_titlegd fr"><a href="/data/toJigouList.html" target="_blank">+更多</a></li>-->
        </ul>
    </div>
    <div class="invest_info_list">



				<% for (int i = 0;i<SystemManager.indexPage.getJigouList().size();i++) {
					Jigou j = SystemManager.indexPage.getJigouList().get(i);
			 
					
					 out.print("<div class=\"invest_info_list"+(i+1)+" fl\"><a target=\"_blank\" href=\"/data!getJigouInfo.action?e.id="+j.getId()+"\">");
            out.print("<div class=\"invest_info_list1_top\">");
	            String jigoulogo = j.getJigoulogo();
	            if(jigoulogo==null||"".equals(jigoulogo)) {
	            	out.print("<img src=\"image/index/tx.jpg\" alt=\"\">");
	            }else {
	            out.print("<img src=\""+jigoulogo+"\" alt=\"\">");
	            }
                
               out.print(" <div class=\"invest_info_list1_top_info fr\">");
                    out.print("<div class=\"invest_info_list1_top_info1\">"+StringUtil.subshow(j.getJigoumingcheng(),14)+"</div>");
                  out.print("  <div class=\"invest_info_list1_top_info1_name\">");
                   out.print("     <span class=\"namemain\">"+j.getXingming()+"</span>");
                   out.print(" </div>");
                out.print("</div>");
            out.print("</div>");

          out.print("  <div class=\"invest_info_list1_bottom"+(i+1)+"\">");     
             out.print("   <div class=\"invest_info_list1_bottom_test\">");
            out.print("    <span>简介："+StringUtil.subshow(j.getJigoujianjie(),45));
             out.print("   </span>");
             out.print("   </div>");
          out.print("  </div>");
      out.print(" </a> </div>");
         

				}%>

 
        
    </div>
</div>

<!--<hr/>-->

	<div class="partner widthbox">
		<div class="partner_title fl">合作机构</div>
		<div class="partner_type">
			<ul>
				<li>
					<img src="image/index/index_1.jpg"/>
				</li>
				<li>
					<img src="image/index/index_2.jpg"/>
				</li>
				<li>
					<img src="image/index/index_3.jpg"/>
				</li>
				<li>
					<img src="image/index/index_4.jpg"/>
				</li>
				<li>
					<img src="image/index/index_5.jpg"/>
				</li>
				<li>
					<img src="image/index/index_6.jpg"/>
				</li>
				<li>
					<img src="image/index/index_7.jpg"/>
				</li>
				<li>
					<img src="image/index/index_8.jpg"/>
				</li>
				<li>
					<img src="image/index/index_9.jpg"/>
				</li>
				<li>
					<img src="image/index/index_10.jpg"/>
				</li>
				<li>
					<img src="image/index/index_11.jpg"/>
				</li>
				<li>
					<img src="image/index/index_12.jpg"/>
				</li>
				<li>
					<img src="image/index/index_13.jpg"/>
				</li>
				<li>
					<img src="image/index/index_14.jpg"/>
				</li>
				<li>
					<img src="image/index/index_15.jpg"/>
				</li>
				<li>
					<img src="image/index/index_16.jpg"/>
				</li>
				<li>
					<img src="image/index/index_17.jpg"/>
				</li>
				<li>
					<img src="image/index/index_18.jpg"/>
				</li>

			</ul>

		</div>
	</div>
</div>



         <%@ include file="footer.jsp"%>

<div class="fixed" id="totop">
	<div class="investor">
		<div class="fixed_test">手机APP下载
			<br>
			<div class="fixed_img" style="margin-top:5px;">
				<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/rightDownCode.png" alt="">
			</div>
		</div>
	</div>
    <div class="publish" id="addcreditor">
        <!--<div class="fixed_img">-->
            <!--<a href="#" ><img src="image/index/publish.png" alt=""></a>-->
        <!--</div>-->
        <div class="fixed_test">发融资需求</div>
    </div>
    <div class="investor">
        <!--<div class="fixed_img">-->
            <!--<a href="/aboutus/yjfk.html" target="_blank"><img src="image/index/investor.png" alt=""></a>-->
        <!--</div>-->
		<div class="fixed_test fixed_test2"><a href="/aboutus/yjfk.html" target="_blank">意见反馈</a></div>
    </div>
    <div class="investor">
        <!--<div class="fixed_img fixed_img1">-->
            <!--<a href="javascript:void(0)" target="_blank"><img src="image/index/tel.png" alt=""></a>-->
            <!--<p>85139195</p>-->
        <!--</div>-->
        <div class="fixed_test" style="padding:6px 0;">服务热线
		<p><b>83159999</b></p>
		</div>
    </div>
    <div class="investor">
        <!--<div class="fixed_img fixed_img2">-->
            <!--<a href="javascript:void(0)" target="_blank"><img src="image/index/tianping.png" alt=""></a>-->
            <!--<p>83159999</p>-->
        <!--</div>-->
        <div class="fixed_test" style="padding:6px 0;">廉洁监察
			<p><b>85139195</b></p>
		</div>
    </div>
    <!--<div class="code">-->
        <!--<div class="fixed_img">-->
            <!--<img src="image/index/code.jpg" alt="">-->
        <!--</div>-->
        <!--<div class="fixed_test">二维码</div>-->
    <!--</div>-->
    <div class="home">
        <div class="fixed_img tc">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/index/newYear/2019/toTop.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>

<!--数字动画-->
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/digital.js"></script>
<%@ include file="browsercheck.jsp"%>

<%
    String c = SystemManager.CONFIGS.get(Config.GUANGGAO_KEY);
    int index = 0;

    try {

        if (c != null) {
            index = Integer.parseInt(c.trim());
        }
    } catch (Exception e1) {
        e1.printStackTrace();
    }

    if (index == 1) {
%>
<!--首页特别推荐广告【800*494px】，加载完时弹出5秒【左下角有立即关闭按钮，右下角有5秒倒计时】后浮动到左边，再次点击左边时又弹出显示5秒后浮动到左边-->
<div id="topad_wk">
	<div id="topad">
		<div id="topad_img"><img src="image/box/2016120801.jpg" /></div>
		<div id="topad_bottom">
			
			<div id="topad_countdown"><span id="toptime">5</span>秒后关闭</div>
			<div id="topad_close"><span>&times;</span>关闭广告</div>
		</div>
		
	</div>
</div>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.cookie.js"></script>
<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/topad.js"></script>
<% } %>
</body>
</html>