<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="com.winpow.core.front.SystemManager" %>
<%@page import="com.winpow.services.manage.news.bean.News" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/creditor.js"></script>
    <script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate-1.13.1.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/fbrzxq.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>
</head>
<body>

<style>
    .error {
        border: none;
        background: none;
    }

    #err {
        color: #F67653;
    }

    #err2 {
        color: #F67653;
    }

    label.error {
        /*  border: 1px solid #F67653!important; */
        background: none;
        color: #F67653;
        padding: 0 2px;
        display: inline-block;
    }
</style>
<!--我要参加弹出框 start-->
<div id="ldksq">
    <div id="ldksq_c">
        <form name="fbrzxq" id="fbrzxq" action="" method="post">
            <div id="ldksq_lose"></div>
            <input type="hidden" name="guquanfinancingtype" id="guquanfinancingtype" value="<s:property value="e.name"/>">
            <div class="t"><span class="btn" onclick="window.location='/user/login.html'">我已注册</span><span>发布融资需求</span><span
                    class="xiaozi">无需注册、快速审核</span></div>
            <div class="rad">
                <div class="leixing">类型：<span style="color:red">*</span></div>
                <div class="l grad gr"><label><input type="radio" id="leixing" name="leixing" value="股权融资">发布股权融资</label></div>
               
                <div class="l grad gs"><label><input type="radio" name="leixing" name="leixing" value="债权融资">发布债权融资</label></div>
            </div>
            <div class="con">
                <p class="fir1"><span class="pt t1">企业名称：<span style="color:red">*</span></span><span class="pc"><input
                        style="width: 360px;" type="text" id="mingcheng" name="mingcheng"></span></p>
                <p class="fir1">
                    <span class="pt t1">姓名：<span style="color:red">*</span></span><span class="pc"><input type="text"
                                                                                                          id="xingming"
                                                                                                          name="xingming"></span>
                    <span class="pt t2">手机：<span style="color:red">*</span></span><span class="pc"><input type="text"
                                                                                                          id="dianhuan"
                                                                                                          name="dianhuan"></span>
                </p>
                <p class="fir1">
                    <span class="pt t1" style="margin-left: 0;width: 99px;">金额(万元)：<span
                            style="color:red">*</span></span><span class="pc"><input type="text" id="jine" name="jine"></span>
                    <span class="pt t2">成立日期：<span style="color:red">*</span></span><span class="pc"><input
                        id="chegnliriqi" class=" laydate-icon" type="text" name="chegnliriqi"></span>
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
                    <span class="pt t1">联系地址：<span style="color:red">*</span></span><span class="pc"><input
                        style="    width: 182px;" type="text" id="address" name="address"></span>
                    <span class="errorts" id="err"></span><span style="margin-left: 8px;" id="err2"></span>
                </p>
                <p class="fir1"><span class="pt t1">验证码：<span style="color:red">*</span></span><span class="pc"><input
                        type="text" id="txyzm" name="txyzm"></span><span class="pc"><img id="JD_Verification1"
                                                                                         Ver_ColorOfNoisePoint="#888888"
                                                                                         src="/ValidateImage.do"
                                                                                         onClick="reloadImg2()" alt=""
                                                                                         style="cursor:pointer;width:100px;height:26px;margin-left: 10px;margin-bottom: -6px"/></span>
                </p>
            </div>
            <div class="tjdiv"><input type="reset" class="res tj" value="取消"/><input id="rztjan" type="submit"
                                                                                     class="sure tj" value="提交"/></div>
        </form>
    </div>
</div>
<!--我要参加弹出框 end-->
<script type="text/javascript">
    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#chegnliriqi'});//绑定元素
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
        choose: function (datas) {
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
        choose: function (datas) {
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
        choose: function (datas) { //选择日期完毕的回调
            alert('得到：' + datas);
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
	<%@ include file="../header.jsp"%>

<!-- 背景图片 -->
<div class="ycdata_bgimg">
    <img src="../image/box/rm_bg.png" alt="背景图">
</div>

<!-- 资讯列表 -->
<div class="bgcolor">
    <div class="rmations widthbox">
        <div class="rmations_right fr" style="width: 100%">
            <div class="title"><s:property value="e.title"/><s:property value="e.name"/></div>
            <div class="tzjjcontent" style="padding: 24px;">${e.content}</div>
            <div class="publish publish2" id="addcreditor" style="margin-top: 20px;">
                <div class="fixed_img">
                    <a href="#"><img src="../image/index/publish.png" alt=""></a>
                </div>
                <div class="fixed_test">发融资需求</div>
            </div>
        </div>
    </div>
</div>

<script>
    menu_init("stock");
</script>
<%@ include file="../footer.jsp" %>
 

