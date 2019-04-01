<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<%@page import="com.winpow.services.app.appvisitqiye.bean.Appvisitqiye"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
	<jsp:param name="title" value="外出拜访企业详情"/>
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
	.pubrz .inputrow .fr>span{  display: inline-block;  padding: 0.32rem 0;line-height: 0.5rem;font-family: "微软雅黑"; color: #999;}
	.pubrz .inputrow>span{width: 33%;padding: 0.32rem 0;line-height: 0.5rem;height:auto;}
	.pubrz .inputrow>div.fr{width: 67%;}
	.tuichu.pubrz .inputrow>span{width: 55%;}
	.tuichu.pubrz .inputrow>div.fr{width: 45%;}
	.pubzmt{padding-bottom: 0.2rem;}
	.pubrz .writecode{width:50%;}
	.pubrz .inputrow .fr>span.getcode{height:0.55rem;line-height:0.55rem;background:#ffb307;color:#fff;border-radius:0.06rem;text-align:center;font-size:0.26rem;    width: 1.1rem;  display: inline-block;}
	.takephoto{padding:0.2rem 0 2rem;-webkit-tap-highlight-color: rgba(0,0,0,0);}
	.takephoto>li{width: 2.2rem;height: 2.2rem;float: left;overflow: hidden;position: relative;margin: 0.05rem;box-sizing: border-box;}
	.takephoto>li span{display: block;padding: 0.15rem; height: 2.05rem;overflow: hidden;}
	.takephoto>li img{display: block; width: 100%;}
	.takephoto>li>i{position: absolute;right:0;top:0;width:0.4rem;height: 0.4rem;
		background: url("${pageContext.request.contextPath}/app/images/remove.png") no-repeat;
		background-size: cover;z-index: 10;
	}
	.pubrz #getcode{padding: 0;}
	#address{width: 73%;}
	.text9{color: #999 !important;}

.zmtapply{z-index: 100;}
</style>
<form action="" id="visit" class="visit">
	<input type="text" name="userid" value="${userid}" id="userid" class="opc0">
	<input type="text" name="pkid" value="${visit.pkid}" id="pkid" class="opc0">
	<div class="stephead tc" >
		<h2>外出拜访企业</h2>
	</div>
	<div class="pubzmt">
		<div class="pubrz">
			<div class="inputrow ov">
				<span>拜访企业名称</span>
				<div class="fr">
					<input type="text" name="qiyename" value="${visit.qiyename}">
				</div>
			</div>
			<div class="inputrow ov">
				<span>外出日期</span>
				<div class="fr">
					<input type="datetime-local" name=""  id="maxDate" class="datepicker" value=""  onchange="showplace(this);">
					<input type="text" name="visitdate"  id="dateplace"  value="${fn:substring(visit.visitdate, 0, 19)}">
				</div>
			</div>
			<div class="inputrow ov">
				<span>企业地址</span>
				<div class="fr">
					<input type="text" name="address" value="${visit.address}">
				</div>
			</div>
			<div class="inputrow ov">
				<span>主营业务</span>
				<div class="fr">
					<input type="text" name="mainbusiness" value="${visit.mainbusiness}">
				</div>
			</div>
			<div class="inputrow ov">
				<span>收入(万元)</span>
				<div class="fr">
					<input type="number" name="income" value="${visit.income}">
				</div>
			</div>
			<div class="inputrow ov">
				<span>净利润(万元)</span>
				<div class="fr">
					<input type="number" name="netprofit" value="${visit.netprofit}">
				</div>
			</div>
			<div class="inputrow ov">
				<span>员工规模(个)</span>
				<div class="fr">
					<input type="number" name="staffsize" value="${visit.staffsize}">
				</div>
			</div>

			<div class="inputrow ov">
				<span>融资需求</span>
				<div class="fr">
					<s:select class="selbtn" onchange="sel(this)" list="%{#application.dic.findemand.childs}" headerKey="" headerValue="" theme="simple"
							   listKey="id" listValue="name" id="findemand" name="findemand"  value="%{#request.visit.findemand}"/>
					<input type="text" name="" value='<% out.print(AppUtil.getCodeName(((Appvisitqiye)request.getAttribute("visit")).getFindemand()));%>' class="seltext">
				</div>
			</div>
			<div class="inputrow ov">
				<span>APP服务需求</span>
				<div class="fr leixing" >
					<s:checkboxlist theme="simple" name="servedemand" list="%{#application.dic.servedemand.childs}"
									id="rid" value="%{#request.servedemands}" listKey="id" listValue="name"></s:checkboxlist>
				</div>
			</div>
			<div class="inputrow ov">
				<span>企业联系人</span>
				<div class="fr">
					<input type="text" name="linkman" value="${visit.linkman}">
				</div>
			</div>
			<div class="inputrow ov">
				<span>联系电话</span>
				<div class="fr">
					<input type="number" name="linktel" value="${visit.linktel}">
				</div>
			</div>

			<div class="inputrow ov">
				<span>备注</span>
				<div class="fr">
					<textarea name="remark" id="" cols="30" rows="10" style="border: 0; text-align: right;padding:0;padding-top: .32rem;">${visit.remark}</textarea>
					<!--<input type="text" name="remark" value="${visit.remark}">-->
				</div>
			</div>
			<div class="inputrow ov">
				<span class="text9">客户经理</span>
				<div class="fr">
					<span>${visit.username}</span>
				</div>
			</div>
			<div class="inputrow ov">
				<span class="text9">录入人</span>
				<div class="fr">
					<span>${visit.inputuser}</span>
					<!--<input type="text" name="inputuser" value="${visit.inputuser}">-->
				</div>
			</div>
			<div class="inputrow ov">
				<span class="text9">录入时间</span>
				<div class="fr">
					<span>${fn:substring(visit.lurushijian , 0, 19)}</span>
					<!--<input type="text" name="lurushijian" value="${fn:substring(visit.lurushijian , 0, 19)}">-->
				</div>
			</div>
			<div class="inputrow ov">
				<span class="text9">修改时间</span>
				<div class="fr">
					<span>${fn:substring(visit.lastchgtime , 0, 19)}</span>
					<!--<input type="text" name="lastchgtime" value="${fn:substring(visit.lastchgtime , 0, 19)}">-->
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
					<input type="hidden" value="${visit.pictures }" id="imgsback">
					<li>
						<span><img src="${pageContext.request.contextPath}/app/images/takephoto.png" alt="" id="takephoto"></span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</form>
<input id="tijiao"  class="zmtapply" type="button" onclick="checkvisit($('#visit')[0])" value="保存信息"/>
<div class="pinch-zoom-container">
	<div class="pinch-zoom">
		<span><img src="${pageContext.request.contextPath}/app/images/takephoto.png"></span>
	</div>
</div>
<script type="text/javascript">
	window.onload = function (ev) {
        var myDate = new Date();
        myDate.getYear();        // 获取当前年份(2位)
        myDate.getFullYear();    // 获取完整的年份(4位,1970-????)
        myDate.getMonth();       // 获取当前月份(0-11,0代表1月)
        myDate.getDate();        // 获取当前日(1-31)
        myDate.getDay();         // 获取当前星期X(0-6,0代表星期天)
        myDate.getTime();        // 获取当前时间(从1970.1.1开始的毫秒数)
        myDate.getHours();       // 获取当前小时数(0-23)
        myDate.getMinutes();     // 获取当前分钟数(0-59)
        myDate.getSeconds();     // 获取当前秒数(0-59)
        myDate.getMilliseconds();    // 获取当前毫秒数(0-999)
        myDate.toLocaleDateString();     // 获取当前日期
        var mytime=myDate.toLocaleTimeString();     // 获取当前时间
        myDate.toLocaleString( );        // 获取日期与时间
        Date.prototype.Format = function (fmt) { // author: meizz
            var o = {
                "M+": this.getMonth() + 1, // 月份
                "d+": this.getDate(), // 日
                "h+": this.getHours(), // 小时
                "m+": this.getMinutes(), // 分
                "s+": this.getSeconds(), // 秒
                "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
                "S": this.getMilliseconds() // 毫秒
            };
            if (/(y+)/.test(fmt))
                fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
        var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss");
        if($('#dateplace').val()==""){
            $('#dateplace').val(time2)
		}

        if ($('.testbasics').length == 0) {
            $('.testhead').hide();
        }
        if($('#imgsback').val()!=""){
            var imgarr= $('#imgsback').val().split(',');
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
        $('.leixing>input').each(function () {
            if($(this).is(':checked')){
                $(this).next('label').addClass('on')
            }
        })
        $('.leixing>label').each(function () {
            $(this).after('<br/>')
        })
        $('.leixing>label').click(function(){
            $(this).toggleClass('on');
        })
    }
    function showplace(dateinput){
        if($('#maxDate').val()==""){
            $('#dateplace').val('');
        }else{
            var val=$('#maxDate').val().replace("T"," ").substr(0,16);
            var val2=val+":00";
            $('#dateplace').val(val2);
        }
    }
    function sel(sel){
        if($(sel).val()==""){
            $($(sel)[0]).next('.selval').val('');
            $($(sel)[0]).siblings('.seltext').val('');
        }else{
            $($(sel)[0]).siblings('.selval').val($($(sel)[0]).val());
            $($(sel)[0]).siblings('.seltext').val($($(sel)[0]).find('option:selected').text());
        }
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

    $('#takephoto').click(function(){//拍照
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            window.webkit.messageHandlers.getphoto.postMessage('visit');
        } else {
            getphoto.getphoto('visit');
        }
    });
    function backphoto(photo){//app调用方法名
		$('.takephoto').append('<li><i></i><span><img src="'+photo+'" class="pinch-small"></span></li>')
    }

</script>
</body>
</html>