<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<%@page import="com.winpow.services.app.appfundmanager.bean.Appfundmanager"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
	<jsp:param name="title" value="基金管理详情"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/skin/layer.css">
<script src="${pageContext.request.contextPath}/app/js/layer.js"></script>
<script src="${pageContext.request.contextPath}/app/js/check.js"></script>
<body class="zmtdetail siz zcsbbank" style="height: 667px;">
<style>
.layui-layer-title,.layui-layer-setwin .layui-layer-close1{display: none}
.layui-layer-btn a{padding: 0.12rem 0.2rem;height: auto;line-height: 0.3rem;background: #ff991d;margin: 0.2rem 0.3rem 0.35rem}
.layui-layer-btn .layui-layer-btn1{background: #ddd;}
.layui-layer-dialog .layui-layer-content>p{padding:0.1rem 1rem 0 0.4rem;font-size: 0.3rem;    margin-left: -0.4rem;}
.layui-layer{border-radius: 0.1rem;}
/*.layui-layer-dialog{width: 60% !important;}*/
.layui-layer-msg{border:0;}
.layui-layer-dialog .layui-layer-content .layui-layer-ico{position: static;}
.layui-layer-msg .layui-layer-content .layui-layer-ico{    margin-top: -10px;margin-right: 10px; margin-left: -1rem;}
.layui-layer-btn{padding:0;}
	.pubrz .inputrow{height:auto;line-height: 0.5rem;}
	.error{font-size: 0.24rem;color: red;display: none;}
	.pubrz .inputrow>span{line-height:1.15rem;}
	.pubrz .inputrow input[type='text'], .pubrz .inputrow input[type='number'], .pubrz .inputrow input[type='date']{height:1.15rem;margin:0;}
	.pubrz .inputrow .fr>span{  display: inline-block;  padding: 0.32rem 0;line-height: 0.5rem;font-family: "微软雅黑";}
	.pubrz .inputrow>span{width: 33%;padding: 0.32rem 0;line-height: 0.5rem;height:auto;}
	.pubrz .inputrow>div.fr{width: 67%;}
	.tuichu.pubrz .inputrow>span{width: 55%;}
	.tuichu.pubrz .inputrow>div.fr{width: 45%;}
	.pubzmt{padding-bottom: 0.2rem;}
	.pubrz .writecode{width:50%;}
	.pubrz .inputrow .fr>span.getcode{height:0.55rem;line-height:0.55rem;background:#ffb307;color:#fff;border-radius:0.06rem;text-align:center;font-size:0.26rem;    width: 1.1rem;  display: inline-block;}
	.takephoto{padding:0.2rem 0 2rem;-webkit-tap-highlight-color: rgba(0,0,0,0);}
	.takephoto>li{width: 2.2rem;height: 2.2rem;float: left;overflow: hidden;position: relative;margin: 0.05rem;box-sizing: border-box;}
	.takephoto>li span{display: block;padding: 0.15rem;height:2.05rem;overflow: hidden;}
	.takephoto>li img{display: block; width: 100%;}
	.takephoto>li>i{position: absolute;right:0;top:0;width:0.4rem;height: 0.4rem;
		background: url("${pageContext.request.contextPath}/app/images/remove.png") no-repeat;
		background-size: cover;z-index: 10;
	}
	.pubrz #getcode{padding: 0;}
	#address{width: 73%;}

.zmtapply{z-index: 100;}
</style>
<form action="" id="fund">
	<input type="hidden" value="${userid}" id="userid">
	<input type="hidden" value="${fund.pkid}" id="pkid">
	<div class="stephead tc" >
		<h2>基金管理人基本情况</h2>
	</div>
	<div class="pubzmt">
		<div class="pubrz">
			<div class="inputrow ov">
				<span>公司名称</span>
				<div class="fr">
					<span>${fund.qiyename}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>统一信用代码</span>
				<div class="fr">
					<span>${fund.creditid}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>法定代表人</span>
				<div class="fr">
					<span>${fund.corp}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>成立日期</span>
				<div class="fr">
					<span>${fund.regdate}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>经营期限</span>
				<div class="fr">
					<span>${fund.operatetime}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>公司类型</span>
				<div class="fr">
					<span><%out.print(AppUtil.getCodeName(((Appfundmanager)request.getAttribute("fund")).getQiyetype()));%></span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>注册资本(万元)</span>
				<div class="fr">
					<span>${fund.regfunds}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>公司性质</span>
				<div class="fr">
					<span><%out.print(AppUtil.getCodeName(((Appfundmanager)request.getAttribute("fund")).getQiyequality()));%></span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>备案类型</span>
				<div class="fr">
					<span><%out.print(AppUtil.getCodeName(((Appfundmanager)request.getAttribute("fund")).getFiletype()));%></span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>公司状态</span>
				<div class="fr">
					<span><%out.print(AppUtil.getCodeName(((Appfundmanager)request.getAttribute("fund")).getQiyestatus()));%></span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>公司地址</span>
				<div class="fr">
					<span>${fund.address}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>办公面积(平方米)</span>
				<div class="fr">
					<span>${fund.acreage}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>联系人</span>
				<div class="fr">
					<span>${fund.linkman}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>联系电话</span>
				<div class="fr">
					<span>${fund.linktel}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<!--此处要循环-->
			<c:forEach items="${fund.shareholderObject}" var="datas">
				<div class="inputrow ov">
					<span>股东名</span>
					<div class="fr">
						<span>${datas.sharename}</span>
						<input type="hidden" name="" value="">
					</div>
				</div>
				<div class="inputrow ov">
					<span>金额</span>
					<div class="fr">
						<span>${datas.sharemoney}</span>
						<input type="hidden" name="" value="">
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="stephead tc" >
		<h2>投资项目情况表</h2>
	</div>
	<div class="pubzmt">
		<div class="pubrz tuichu">
			<div class="inputrow ov">
				<span>总投资金额(万元)</span>
				<div class="fr">
					<span>${fund.inamount}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>高新区投资金额(万元)</span>
				<div class="fr">
					<span>${fund.techinamount}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>被投企业总数(个)</span>
				<div class="fr">
					<span>${fund.qiyenum}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>高新区被投企业数(个)</span>
				<div class="fr">
					<span>${fund.techqiyenum}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>退出比例(%)</span>
				<div class="fr">
					<span>${fund.exitrate}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>高新区被投企业退出数(个)</span>
				<div class="fr">
					<span>${fund.techexitnum}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
		</div>
	</div>
	<div class="stephead tc testhead" >
		<h2>基金基本情况</h2>
	</div>
	<!--此处循环-->
	<c:forEach items="${basics}" var="datas" varStatus="status">
		<div class="pubzmt testbasics">
			<div class="pubrz">
				<div class="inputrow ov">
					<span>基金名称</span>
					<div class="fr">
						<span>${datas.fundname}</span>
						<input type="hidden" name="" value="">
					</div>
				</div>
				<div class="inputrow ov">
					<span>成立日期</span>
					<div class="fr">
						<span>${datas.regdate}</span>
						<input type="hidden" name="" value="">
					</div>
				</div>
				<div class="inputrow ov">
					<span>经营期限</span>
					<div class="fr">
						<span>${datas.operatetime}</span>
						<input type="hidden" name="" value="">
					</div>
				</div>
				<div class="inputrow ov">
					<span>基金备案号</span>
					<div class="fr">
						<span>${datas.fundnum}</span>
						<input type="hidden" name="" value="">
					</div>
				</div>
				<c:forEach items="${datas.shareholderObject}" var="data">
					<div class="inputrow ov">
						<span>股东名</span>
						<div class="fr">
							<span>${data.holdname}</span>
							<input type="hidden" name="" value="">
						</div>
					</div>
					<div class="inputrow ov">
						<span>金额</span>
						<div class="fr">
							<span>${data.holdmoney}</span>
							<input type="hidden" name="" value="">
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</c:forEach>
	<div class="stephead tc" >
		<h2>其他信息填写</h2>
	</div>
	<!--此处循环-->
	<div class="pubzmt">
		<div class="pubrz">
			<div class="inputrow ov">
				<span>审核状态</span>
				<div class="fr">
					<span><%out.print(AppUtil.getCodeName(((Appfundmanager)request.getAttribute("fund")).getChstatus()));%></span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>审核人</span>
				<div class="fr">
					<span>${fund.checkid}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>审核时间</span>
				<div class="fr">
					<span>${fn:substring(fund.checkdate, 0, 19)}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>创建时间</span>
				<div class="fr">
					<span>${fn:substring(fund.lurushijian, 0, 19)}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>修改时间</span>
				<div class="fr">
					<span>${fn:substring(fund.lastchgtime, 0, 19)}</span>
					<input type="hidden" name="" value="">
				</div>
			</div>
			<div class="inputrow ov">
				<span>审核备注</span>
				<div class="fr">
					<input type="text" name="checkremark" value="${fund.checkremark}" placeholder="请输入审核备注（选填）" id="checkremark">
				</div>
			</div>
			<div class="inputrow ov">
				<span style="width: 10%;">位置</span>
				<div class="fr" style="width: 90%;">
					<input type="text" name="lnglatname" value="${fund.lnglatname}" placeholder="请获取位置和经纬度" id='address' class="writecode">
					<span class="getcode" id="getcode">一键获取</span>
				</div>
			</div>
			<div class="inputrow ov">
				<span>经纬度</span>
				<div class="fr">
					<input type="text" name="lnglat" value="${fund.lnglat}" placeholder="请获取位置和经纬度"  id='long' class="writecode">
				</div>
			</div>
			<div class="inputrow ov">
				<span>现场照片</span>
				<div class="fr">
					<!--<input  type="hidden" name="scenepic" value="" placeholder="请上传现场照片" id="scenepic">-->
				</div>
			</div>
			<div>
				<ul class="takephoto ov">
					<input type="hidden" value="${fund.scenepic}" id="imgsback">
					<li>
						<span>
							<img src="${pageContext.request.contextPath}/app/images/takephoto.png" alt="" id="takephoto">
						</span>
					</li>
					<!--<li>-->
						<!--<i></i>-->
						<!--<img src="${pageContext.request.contextPath}/app/images/takephoto.png" class=" pinch-small" alt="">-->
					<!--</li>-->
				</ul>
			</div>

		</div>
	</div>
</form>
<input id="tijiao"  class="zmtapply" type="button" onclick="checkfund($('#fund')[0])" value="保存信息"/>
<div class="pinch-zoom-container">
	<div class="pinch-zoom">
		<span><img src="${pageContext.request.contextPath}/app/images/takephoto.png"></span>
	</div>
</div>
<script type="text/javascript">
    window.onload = function (ev) {
        if ($('.testbasics').length == 0) {
            $('.testhead').hide();
        }
        if($('#imgsback').val()!=""){
            var imgarr= $('#imgsback').val().split(',');
            console.log(imgarr);
            $.each(imgarr,function (i,v) {
                $('.takephoto').append('<li><i></i><span><img src="'+v+'" class="pinch-small"></span></li>')
            });
		}
		$('.takephoto').delegate('li>i','click',function(){
            var p=$(this).parent('li');
            layer.confirm('<p>确定删除此照片？</p>', {
                btn: ['确定','取消'] //按钮
            }, function(){
                p.remove();
                layer.msg('照片已删除', {icon: 1});
            }, function(){

            });

		})
    }
	$(function () {
	    $('.takephoto').delegate('.pinch-small','click',function(){
            $('.pinch-zoom-container .pinch-zoom img').attr('src',$(this).attr('src'));
            $('.pinch-zoom-container').fadeIn(300);
            $('.pinch-zoom-container .pinch-zoom').fadeIn(300).css('transform','scale(1)');
        });
        $('div.pinch-zoom').each(function () {
            new RTP.PinchZoom($(this), {});
        });
        $('.pinch-zoom-container').click(function(){
            $(this).fadeOut(300);
            $('.pinch-zoom').fadeOut(300).css('transform','scale(1)');
        })

    });
    $('#getcode').click(function(){//获取经纬度
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            window.webkit.messageHandlers.getaddress.postMessage('123');
        } else {
            getaddress.getaddress('123');
        }
    });
    function backaddress(address,long){//app调用方法名
        // alert(address,long);
		$('#address').val(address);
		$('#long').val(long);
    }
    $('#takephoto').click(function(){//拍照
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            window.webkit.messageHandlers.getphoto.postMessage('fund');
        } else {
            getphoto.getphoto('fund');
        }
    });
    function backphoto(photo){//app调用方法名
		// alert(photo);
		$('.takephoto').append('<li><i></i><span><img src="'+photo+'" class="pinch-small"></span></li>')
    }

</script>
</body>
</html>