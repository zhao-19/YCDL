<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@page import="com.winpow.services.manage.activities.bean.Activities" %>
<%@page import="com.winpow.core.util.StringUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    <script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
    <!--<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>-->
    <!--<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>-->
    <!--<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jigouappinfo.js"></script>-->
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>


    <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css"/>
    <script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/drag/dragImg.js"></script>
    <script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/drag/yydragImg.js"></script>



</head>
<body>

<div id="ggts2"></div>
<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
<input type="hidden" id="t" value="<s:property value="jigou.t"/>">

<script>
    $(window).load(function () {
        var backnotice = $("#backnotice").val();
        if (backnotice.length > 1) {

            var a = document.getElementById("ggts2");//获取div块对象
            var Height = document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
            var Width = document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
            var gao1 = a.offsetHeight;//获取div块的高度值
            var gao2 = a.offsetWidth;//获取div块的宽度值
            var Sgao1 = (Height - gao1) / 2 - 110 + "px";
            var Sgao2 = (Width - gao2) / 2 + "px";
            a.style.top = Sgao1;
            a.style.left = Sgao2;
            // $("#ggts2").show();
            ggts2(backnotice);
        }
    });




    //如果填写之前有error错误提示，则用日期或时间插件完成时，若框框有值了，需要手动移除这个错误提示。框框本身不能手写。
    function removError(val) {
        $('#' + val).next().remove();
        var thisclass = $('#' + val).attr("class");
        var endIndex = thisclass.indexOf("error");
        var nowClass = thisclass.substring(0, endIndex);
        if (nowClass) {
            $('#' + val).attr("class", nowClass);
            //然后动态关闭jQuery.validate验证
            $('#' + val).rules("remove");
        }
    }

</script>
<script>
    if($('#topic_content>img').attr('src')){
        $('.imgbox>#bigimg').show();
        $('#topic_content').css('background','none');
    }
    if($('#yytopic_content>img').attr('src')){
        $('.yyimgbox>#yybigimg').show();
        $('#yytopic_content').css('background','none');
    }
    $(window).load(function () {
        var backnotice = $("#backnotice").val();
        if (backnotice.length > 1) {
            var a = document.getElementById("ggts2");//获取div块对象
            var Height = document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
            var Width = document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
            var gao1 = a.offsetHeight;//获取div块的高度值
            var gao2 = a.offsetWidth;//获取div块的宽度值
            var Sgao1 = (Height - gao1) / 2 - 110 + "px";
            var Sgao2 = (Width - gao2) / 2 + "px";
            a.style.top = Sgao1;
            a.style.left = Sgao2;
            // $("#ggts2").show();
            ggts2(backnotice);
        }
    });

    //如果填写之前有error错误提示，则用日期或时间插件完成时，若框框有值了，需要手动移除这个错误提示。框框本身不能手写。
    function removError(val) {
        $('#' + val).next().remove();
        var thisclass = $('#' + val).attr("class");
        var endIndex = thisclass.indexOf("error");
        var nowClass = thisclass.substring(0, endIndex);
        if (nowClass) {
            $('#' + val).attr("class", nowClass);
            //然后动态关闭jQuery.validate验证
            $('#' + val).rules("remove");
        }
    }

</script>

<script type="text/javascript">
    $(document).ready(function () {
        var t = $("#t").val();//v 查看   u 修改  a 新增
        //alert(t);
        if (t == 'v') {
            //表示查询
            $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
            $(".shenqingdkt").attr("disabled", false);
            $(".shenqingdkthide").hide();
            $("#zqxxxgbtn").hide();

            $("#form1 input,radio,textarea,checkbox").each(function(){
                $(this).parent("span").html($(this).val());
                $('.gszcddiv .rightinfo').css('width', 'auto')
            });
            $("#form1 select").each(function(){
                var text = $(this).find("option:selected").text();
                $(this).parent("span").html(text == "请选择" ? "" : text);
            });
            if (!$('#topic_content>img').attr('src')) {
                $('.imgbox').hide();
            }else{
                $('#topic_content').css('background','none');
            }
            if (!$('#yytopic_content>img').attr('src')) {
                $('.yyimgbox').hide();
            }else{
                $('#yytopic_content').css('background','none');
            }

        }
        else if (t == 'a') {
            //表示新增（在返回没有数据的情况可以新增）
            $(".shenqingdkt").hide();
            $(".shenqingdkthide").show();
            $('#form1 input,radio,select,textarea,checkbox').css('border', '1px solid #E0E0E0');
            $('#form1 #bcard,#form1 #yybcard').css('border','0');
            $('.shenqingdkt').css('border',0)
            $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
            $('.imgbox').css('marginTop', '40px')
            $('.yyimgbox').css('marginTop', '40px')

        } else if (t == 'u') {
            //表示修改
            $("#form1").attr("action","/usercenter/saveJigouinfo.html");
            $('#form1 input,radio,select,textarea,checkbox').css('border', '1px solid #E0E0E0');
            $('#form1 #bcard,#form1 #yybcard').css('border','0');
            $('.shenqingdkt').css('border',0)
            $('.creditor .vipinfo .inputtest .rightinfo.bcard').show();
            $('.imgbox').css('marginTop', '40px')
            $('.yyimgbox').css('marginTop', '40px')
        } else if(t=='o'){ //只读

			$(".jigouSave").remove();

            $("#form1 input,radio,select,textarea,checkbox").not(".qiyeExcept").attr('disabled',true);
//            $(".qiyeSave").remove();
            $(".finamsg").show();
            $("#form1 input,radio,textarea,checkbox").each(function () {
                $(this).parent("span").html($(this).val());
            });
            $('.gszcddiv .rightinfo').css('width', 'auto');
            $("#form1 select").each(function () {
                var text = $(this).find("option:selected").text();
                $(this).parent("span").html(text == "请选择" ? "" : text);
            });
            if (!$('#topic_content>img').attr('src')) {
                $('.imgbox').hide();
                $('.yyimgbox').hide();
            }
		}

//        $(".upback").click(function () {
//            location.href = "/usercenter/getJigouinfo.html?jigou.t=v";
//        });
        //暂存,不验证isNotNull
        $('.jigouZc').click(function () {
            $("#iscomplete").val('10002');
            if (DataCheck.isZcNotNull()) {
                if (DataCheck.isLength()) {
                    if (DataCheck.isInt()) {

                        if (DataCheck.isFint()) {

                            if (DataCheck.isZint()) {

                                if (DataCheck.isZuzhi()) {

                                    if (DataCheck.isPhone()) {

                                        if (DataCheck.isEmail()) {
                                            if (DataCheck.isBankZint()) {
                                                if (DataCheck.isBankZZint()) {
                                                    if (DataCheck.isZZint()) {
                                                        if (DataCheck.idCard()) {
                                                            //检测如果没填小框框内容，则把inputdname去掉，避免传到后台。
                                                            //alert("可以保存!");
                                                            //判断上传文件
                                                            //alert(checkfilehidden(true))
                                                            //return;
                                                            buttonDefaultValue = $(this).val();
                                                            countDown(this, 5);
                                                            nativeNum("isBankZint"); //还原为数字
                                                            // nativeNum("isBankZZint"); //还原为数字
                                                            $("#form1").submit(); //改变链接并提交
                                                        } else {
                                                            alert("不可以保存!");
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });
        //    保存,sb_base.jsp页面只有一个按钮，是当成提交处理。
        $('.jigouBc').click(function () {
            $("#iscomplete").val('10001');
            $('#notsave').val('0');
            //点击保存提交对其它融资方式的判断，判断是否显示，且判断其值是否符合要求
            var qtrzfsinput = $(".qtrzfs .rightinfo input");
            if (DataCheck.isNotNull()) {

                if (DataCheck.isLength()) {

                    if (DataCheck.isInt()) {

                        if (DataCheck.isFint()) {

                            if (DataCheck.isZint()) {

                                if (DataCheck.isZuzhi()) {

                                    if (DataCheck.isPhone()) {

                                        if (DataCheck.isEmail()) {

                                            if (DataCheck.isBankZint()) {
                                                if (DataCheck.isBankZZint()) {
                                                    if (DataCheck.isZZint()) {

                                                        if (DataCheck.idCard()) {
                                                            //alert("可以提交!");
                                                            if (!checkEachNeedDate("form1")) {
                                                                return;
                                                            }
                                                            //判断上传文件
                                                            if (checkfilehidden(true)) {
                                                                buttonDefaultValue = $(this).val();
                                                                countDown(this, 5);
                                                                nativeNum("isBankZint"); //还原为数字
                                                                //nativeNum("isBankZZint"); //还原为数字
                                                                $("#form1").submit(); //改变链接并提交
                                                            } else {
                                                                //alert("提交失败!");
                                                                return;
                                                            }
                                                        } else {
                                                            alert("不可以提交!");
                                                        }
                                                    }

                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });
        //点击保存按钮时检查每个文件框是否都已经传值
        function checkfilehidden() {
            var picimgupspan = $(".upspan");
            var ifreturn = 0;
            var tolength = picimgupspan.length;
            picimgupspan.each(function(i, v) {
                var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
                var ifqsc = $(this).children(".qsc").attr("class"); //提示未上传的情况再提交不能再加提示了
                var picval = picimgss.attr("class");

                //if((i+1)<tolength && (i+1) != 2 && (i+1) != 3 && (i+1) != 4){
                if ((i + 1) <= tolength) {
                    if (!picval) {
                        if (!ifqsc) {
                            $(this).append("<div class='qsc'>请上传文件！</div>");
                        }
                        ifreturn = 1;
                    }
                }

            });
            if (ifreturn) {
                return false;
            } else {
                return true;
            }
        }

    });


</script>
<style>
    .error {
        border: none;
        background: none;
    }

    label.error {
        border: 1px solid #f5694b !important;
        background: none;
        color: #f5694b;
        padding: 0 2px;
        display: inline-block;
        height: 20px;
        line-height: 20px;
    }
</style>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
    <div class="show fl">
        <%@ include file="leftnav.jsp" %>
    </div>


    <div class="list fr">
        <div class="rightbox">

            <!-- 债权信息修改    用户为企业时显示    -->
            <div id="zaiquanxinxi-update" class="vipinfo">

                <form id="form1" action="/usercenter/saveJigouinfo.html" method="post">

                    <div class="title">
                        <li><span class="t">机构信息查看</span><a href="/usercenter/getJigouinfo.html?jigou.t=u" class="jigouSave"><span
                                id="CreateTBpxhd" class="update">机构信息修改</span></a></li>
                    </div>
                    <input type="hidden" name="jigou.id" value="<s:property value='jigou.id'/>"/>
                    <input type="hidden" name="jigou.iscomplete" id="iscomplete"/>
                    
                    <div class="row">
                        <div class="inputtest inputtestl">
                            <span class="leftname leftnamel">机构名称：<span style="color:red">*</span></span>
                            <span class="rightinfo"><input class="input" isNotNull="" isZcNotNull="机构名称" auto-complete auto-complete-data="autoCompleteData"  id="jigouname"
                                                           name="jigou.jigoumingcheng" type="text"  onblur="jigouCheckCreditId();"
                                                           value="<s:property value='jigou.jigoumingcheng'/>"/></span>
                        </div>
                        <div class="inputtest inputtestl">
                            <span class="leftname leftnamel">统一社会信用代码：<span style="color:red">*</span></span>
                            <span class="rightinfo"><input isNotNull="" isZcNotNull="统一社会信用代码"   isZuzhi="统一社会信用代码"  id="zzjgdm" class="input" onblur="jigouCheckCreditId();" name="jigou.zzjgdm" type="text"
                                                           value="<s:property value='jigou.zzjgdm'/>"/></span>
                        </div>
                    </div>
                    <!-- <div class="inputtest inputtestl">
					<span class="leftname leftnamel">机构类型：</span>
					<span class="rightinfo"><input class="input" name="jigou.jigouleixingid" type="text"  value="<s:property value='jigou.jigouleixingid'/>"/></span>
				</div>
				 -->
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">注册时间：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" readonly="readonly" class="input laydate-icon"
                                                       rel="input laydate-icon" name="jigou.zhuceshijian"
                                                       id="zhuceshijian" type="text"
                                                       value="<s:property value='jigou.zhuceshijian'/>"/></span>
                    </div>

                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">注册资本(万元)：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull=""  isBankZZint="isBankZZint"  onchange="this.value=formatNum(this.value)" class="input" name="jigou.zhuceziben" type="text"
                                                       value="<s:property value='jigou.zhuceziben'/>"/></span>
                    </div>
                    </div>

                    <div class="gszcddiv">
                        <span class="leftname leftnamel">工商注册地：<span style="color:red">*</span></span>
                        <span class="rightinfo" id="gszcdspan" style="display: inline-block;margin-right:6px; width:152px;">
							 <select isNotNull="省份" class="ssx" id="gszcd_province" name="jigou.gszcd_province" style="width:100%;"><s:property value="jigou.gszcd_province"/></select>
						 </span>
                        <span class="rightinfo" id="gszcdspan" style=" display: inline-block;margin-right:6px; width:152px;">
							 <select isNotNull="市级" class="ssx" id="gszcd_city" name="jigou.gszcd_city"  style="width:100%;"><s:property value="jigou.gszcd_city"/></select>
						 </span>
                        <span class="rightinfo" id="gszcdspan" style="display: inline-block;margin-right:6px;width:152px;">
							 <select isNotNull="区县" class="ssx" id="gszcd_county" name="jigou.gszcd_county"  style=" width:100%;"><s:property value="jigou.gszcd_county"/></select>
						 </span>

                        <input type="hidden" id="province" value='<s:property value="jigou.gszcd_province"/>'/>
                        <input type="hidden" id="city" value='<s:property value="jigou.gszcd_city"/>'/>
                        <input type="hidden" id="county" value='<s:property value="jigou.gszcd_county"/>'/>
                        <input type="hidden" id="custtype" value='productczdfirst'/>

                        <script type="text/javascript">var custtype = 'productczdfirst';</script>
                        <script src="../resource/js/area.js"></script>
                        <script type="text/javascript">
                            //var custtype = '<s:property value="userType"/>';
                            _init_area();
                        </script>
                    </div>
                    <%--
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">机构服务内容：<span style="color:red">*</span></span>
                        <span class="rightinfo"><textarea isNotNull="" class="input" name="jigou.fuwuneirong" type="text"  ><s:property value='jigou.fuwuneirong'/></textarea></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">机构服务案例：<span style="color:red">*</span></span>
                        <span class="rightinfo"><textarea isNotNull="" class="input" name="jigou.fuwuanli" type="text"   ><s:property value='jigou.fuwuanli'/></textarea></span>
                    </div>

                    --%>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">机构简介：<span style="color:red">*</span></span>
                        <span class="rightinfo"><textarea isNotNull="" class="input" name="jigou.jigoujianjie"
                                                          type="text"><s:property
                                value='jigou.jigoujianjie'/></textarea></span>
                    </div>
                    <div class="inputtest inputtestl ">
                        <span class="leftname leftnamel">办公地址：<span style="color:red">*</span></span>
                        <span class="rightinfo"><textarea isNotNull="" class="input" name="jigou.bangongdizhi"
                                                          type="text"><s:property
                                value='jigou.bangongdizhi'/></textarea></span>
                    </div>
                    </div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">网址：</span>
                        <span class="rightinfo"><input class="input" name="jigou.wangzhi" type="text"
                                                       value="<s:property value='jigou.wangzhi'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                    <span class="leftname leftnamel" style="width:147px;margin-right: 2px;">管理资本金（万元）：<span
                            style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull=""  isBankZZint="isBankZZint"  onchange="this.value=formatNum(this.value)" class="input" name="jigou.tz_glzbj" type="text"
                                                       value="<s:property value='jigou.tz_glzbj'/>"/></span>
                    </div>
                    </div>
                    <%--
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">基金性质：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" class="input" name="jigou.tz_jijinxingzhi" type="text"  value="<s:property value='jigou.tz_jijinxingzhi'/>"/></span>
                    </div>
                    --%>

                    <div class="inputtest inputtestl" style="width:100%;">
                        <span class="leftname leftnamel">投资行业： <span style="color:red">*</span></span>
                        <%--<span class="rightinfo"><input isNotNull="" class="input" name="jigou.tz_touzihangye" type="text"  value="<s:property value='jigou.tz_touzihangye'/>"/></span>
                        --%>
					<span class="rightinfo rightcheckbox" style="width:620px;">

					<%--<%if ((((com.winpow.services.manage.productczdqtxx.bean.Productczdqtxx) request.getAttribute("qtxx")).getQuanweirending1()).contains("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa260")){ out.print("checked=checked");} %>  value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa260"
					--%>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="物流行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("物流行业") != -1) { %>checked<% } %>>
                            物流行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="ＩＴ行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("ＩＴ行业") != -1) { %>checked<% } %>>
                            ＩＴ行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="汽车行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("汽车行业") != -1) { %>checked<% } %>>
                            汽车行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="旅游行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("旅游行业") != -1) { %>checked<% } %>>
                            旅游行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="能源行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("能源行业") != -1) { %>checked<% } %>>
                            能源行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="制造行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("制造行业") != -1) { %>checked<% } %>>
                            制造行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="医疗健康"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("医疗健康") != -1) { %>checked<% } %>>
                            医疗健康
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="化学工业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("化学工业") != -1) { %>checked<% } %>>
                            化学工业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="研究咨询"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("研究咨询") != -1) { %>checked<% } %>>
                            研究咨询
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="教育行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("教育行业") != -1) { %>checked<% } %>>
                            教育行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="传媒娱乐"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("传媒娱乐") != -1) { %>checked<% } %>>
                            传媒娱乐
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="农林牧渔"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("农林牧渔") != -1) { %>checked<% } %>>
                            农林牧渔
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="房地产业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("房地产业") != -1) { %>checked<% } %>>
                            房地产业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="电信及增值"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("电信及增值") != -1) { %>checked<% } %>>
                            电信及增值
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="互联网络"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("互联网络") != -1) { %>checked<% } %>>
                            互联网络
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="食品饮料"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("食品饮料") != -1) { %>checked<% } %>>
                            食品饮料
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="家居建材"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("家居建材") != -1) { %>checked<% } %>>
                            家居建材
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="金融行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("金融行业") != -1) { %>checked<% } %>>
                            金融行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="投资行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("投资行业") != -1) { %>checked<% } %>>
                            投资行业
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="连锁经营"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("连锁经营") != -1) { %>checked<% } %>>
                            连锁经营
                    </label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzihangye" value="其他行业"
                                  <% if(request.getAttribute("jigou.tz_touzihangye") != null && request.getAttribute("jigou.tz_touzihangye").toString().indexOf("其他行业") != -1) { %>checked<% } %>>
                            其他行业
                    </label>
					</span>
                    </div>
                    <div class="inputtest inputtestl" style="width:100%;">
                        <span class="leftname leftnamel">投资阶段：<span style="color:red">*</span></span>
                        <%--<span class="rightinfo"><input class="input" name="jigou.tz_touzijieduanid" type="text"  value="<s:property value='jigou.tz_touzijieduanid'/>"/></span>
                        --%>
					<span class="rightinfo rightcheckbox" style="width:620px;">
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzijieduanid" value="天使轮"
                                  <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("天使轮") != -1) { %>checked<% } %>/>	天使轮</label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzijieduanid" value="Pre-A轮"
                                  <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("Pre-A轮") != -1) { %>checked<% } %>/>	Pre-A轮</label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzijieduanid" value="A轮"
                                  <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("A轮") != -1) { %>checked<% } %>/>	A轮</label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzijieduanid" value="B轮"
                                  <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("B轮") != -1) { %>checked<% } %>/>	B轮</label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzijieduanid"value="C轮"
                                  <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("C轮") != -1) { %>checked<% } %>/>	C轮</label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzijieduanid" value="D轮"
                                  <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("D轮") != -1) { %>checked<% } %>/>	D轮</label>
					<label><input isNotNull="" type="checkbox" name="jigou.tz_touzijieduanid" value="E轮及以后"
                                  <% if(request.getAttribute("jigou.tz_touzijieduanid") != null && request.getAttribute("jigou.tz_touzijieduanid").toString().indexOf("E轮及以后") != -1) { %>checked<% } %>/>	E轮及以后</label>
					</span>
                    </div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">投资额度（万元）：</span>
                        <span class="rightinfo"><input  isBankZZint="isBankZZint"  onchange="this.value=formatNum(this.value)"  class="input" name="jigou.tz_touziedu" type="text"
                                                       value="<s:property value='jigou.tz_touziedu'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人姓名：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" class="input" name="jigou.xingming" type="text"
                                                       value="<s:property value='jigou.xingming'/>"/></span>
                    </div>
                    </div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">职务：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" class="input" name="jigou.bumenzhiwu" type="text"
                                                       value="<s:property value='jigou.bumenzhiwu'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">移动电话：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isPhone="移动电话" type="text" class="input" name="jigou.yidongdianhua"
                                                       value="<s:property value='jigou.yidongdianhua'/>"/></span>
                    </div>
                    </div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">固定电话： </span>
                        <span class="rightinfo"><input type="text" class="input" placeholder="028-88888888"
                                                       name="jigou.gudingdianhua"
                                                       value="<s:property value='jigou.gudingdianhua'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">Email：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isEmail="联系人Email"  type="text" class="input" name="jigou.email"
                                                       value="<s:property value='jigou.email'/>"/></span>
                    </div>
                    </div>
                    <script>
                        KindEditor.ready(function (K) {
                            var editor = K.editor({
                                allowFileManager: false
                            });
                            var val = "";
                            K('#bcard').click(function () {
                                val = $(this).attr("id");
                                editor.loadPlugin('image', function () {
                                    editor.plugin.imageDialog({
                                        showRemote : false,
                                        insertfile: K('#bcard').val(),
                                        clickFn: function (url, title) {
                                            K('#bcard').val(url);
                                            K('#bcard2').val(url);
                                            K('.imgbox>#bigimg').show();
                                            K('#topic_content>img').attr('src', url);
                                            K('#topic_content').css('background','none');
                                            editor.hideDialog();
                                            removError(val);
                                        }
                                    });
                                });
                            });
                            K('#yybcard').click(function () {
                                val = $(this).attr("id");
                                editor.loadPlugin('image', function () {
                                    editor.plugin.imageDialog({
                                        showRemote : false,
                                        insertfile: K('#yybcard').val(),
                                        clickFn: function (url, title) {
                                            K('#yybcard').val(url);
                                            K('#yybcard2').val(url);
                                            K('.yyimgbox>#yybigimg').show();
                                            K('#yytopic_content>img').attr('src', url);
                                            K('#yytopic_content').css('background','none');
                                            editor.hideDialog();
                                            removError(val);
                                        }
                                    });
                                });
                            });
                        });


                        //如果填写之前有error错误提示，则用日期或时间插件完成时，若框框有值了，需要手动移除这个错误提示。框框本身不能手写。
                        function removError(val) {
                            $('#' + val).next().remove();
                            var thisclass = $('#' + val).attr("class");
                            var endIndex = thisclass.indexOf("error");
                            var nowClass = thisclass.substring(0, endIndex);
                            if (nowClass) {
                                $('#' + val).attr("class", nowClass);
                                //然后动态关闭jQuery.validate验证
                                $('#' + val).rules("remove");
                            }
                        }
                    </script>

                    <div class="inputtest inputtestl showImg">
                        <span class="leftname leftnamel">机构Logo：<span style="color:red">*</span></span>
                        <span class="rightinfo bcard" >
                        <input type="button" class="input" isNotNull=""  id="yybcard" name="jigou.jigoulogo" value="<s:property value='jigou.jigoulogo'/>" />
                     </span>
                        <span class="rightinfo bcard">
                          <input readonly="readonly"  type="hidden" class="input"  id="yybcard2" name="jigou.jigoulogo" value="<s:property value='jigou.jigoulogo'/>"/>
                     </span>
                        <div class="yyimgbox">
                            <div id="yytopic_content">
                                <img src="${jigou.jigoulogo}">
                                <!--<s:if test="jigou.jigoulogo!=null||jigou.jigoulogo!=''"><img src="${jigou.jigoulogo}"></s:if>-->
                            </div>
                            <i style="font-style:normal;font-size:12px;color:#bbb;display:none;" id="yybigimg">点击图片查看大图</i>
                        </div>
                    </div>

                    <div class="inputtest inputtestl showImg">
                        <span class="leftname leftnamel">名片上传：<span style="color:red">*</span></span>
                        <span class="rightinfo bcard" >
                        <input type="button" class="input"  isNotNull=""  id="bcard" name="jigou.bcard" value="<s:property value='jigou.bcard'/>" />
                     </span>
                        <span class="rightinfo bcard">
                          <input readonly="readonly"  type="hidden" class="input"  id="bcard2" name="jigou.bcard" value="<s:property value='jigou.bcard'/>"/>
                     </span>
                        <div class="imgbox">
                            <div id="topic_content">
                                <img src="${jigou.bcard}">
                                <!--<s:if test="jigou.bcard!=null||jigou.bcard!=''"><img src="${jigou.bcard}"></s:if>-->
                            </div>
                            <i style="font-style:normal;font-size:12px;color:#bbb;display:none;" id="bigimg">点击图片查看大图</i>
                        </div>

                    </div>

                    <style>
                        .row{width: 100% !important;float:left;}
                        #form1 input,radio,select,textarea,checkbox{border:0;}
                        .creditor .vipinfo .inputtest .rightinfo.bcard{display:none;width: 240px;}
                        .creditor .vipinfo .inputtest .rightinfo.bcard .error{margin:4px 0 0 6px;}
                        /*营业执照按钮*/
                        #bcard,#yybcard{float:left;color:transparent;background:#FF5722 url(<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/upload.png) no-repeat 47% 7px;width: 152px; cursor:pointer;padding-left:31px;border-radius:2px;}
                        #bcard:hover,#yybcard:hover{opacity: 0.8;}
                        .showImg{position:relative; overflow:visible !important;cursor:pointer;}
                        .showImg div.none{width:80%;text-align:center;position:absolute;top:38px;left:50%;/*border:1px solid #ddd;*/background: #fff;
                            transform:translateX(-50%);-ms-transform:translateX(-50%); 	-moz-transform:translateX(-50%); -webkit-transform:translateX(-50%); -o-transform:translateX(-50%);
                            box-shadow: 1px 2px 6px rgba(0,0,0,0.2)
                        }
                        .showImg .rightinfo{text-overflow: ellipsis;overflow: hidden;}
                        /*缩略图*/
                        .imgbox,.yyimgbox{width:150px;height:150px;text-align:center;margin:6px 0 0 149px;}
                        .imgbox #topic_content,.yyimgbox #yytopic_content{width:100%;height:80%;border:1px solid #ddd;background: url("<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/sc-default.jpg") no-repeat 0 0;}
                        .imgbox #topic_content>img,.yyimgbox #yytopic_content>img{width:100%;height:100%;}
                        /*全屏放大图*/
                        #imglayer_bg,#yyimglayer_bg {position:fixed;top:0;left:0;width:100%;height:100%;background:#000 url(/image/imglayer_loading.gif) no-repeat center center;;opacity:0.7;filter:alpha(opacity=70);z-index:9995;display:none;}
                        #imglayer_border,#yyimglayer_border {max-width:60%;height:100%;position:fixed;top:0;left:0;z-index:9996;margin:20px;display:none;}
                        #imglayer_zoom,#yyimglayer_zoom {display:block;border:0;max-height: 100% !important;}
                        #imglayer_x,#yyimglayer_x {display:block;position:absolute;width:40px;height:40px;z-index:9997;outline:none;right:-20px;top:-20px;background:url(http://static.epaidai.com/images/bbs/topic/imglayer_ico.png) no-repeat;}
                        #imglayer_x:hover,#yyimglayer_x:hover {background-position:0 -40px;}
                        .rightinfo.rightcheckbox span.error{float:none;}
                    </style>
                    <!--<div class="inputtest inputtestl showImg">-->

                        <!--<span class="leftname leftnamel"><input type="button" name="filemanager" id="filemanager"-->
                                                                <!--value="机构Logo" class="btn btn-success"/></span>-->
                        <!--<span class="rightinfo"><input readonly="readonly" type="text" class="input" id="logo"-->
                                                       <!--name="jigou.jigoulogo"-->
                                                       <!--value="<s:property value='jigou.jigoulogo'/>"/> </span>-->

                        <!--<div  class="none"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>${jigou.jigoulogo}"/></div>-->

                    <!--</div>-->
                    <!--<div class="inputtest inputtestl showImg">-->
                        <!--<span class="leftname leftnamel">名片上传：<span style="color:red">*</span></span>-->
                        <!--<span class="rightinfo"><input readonly="readonly" type="text" class="input" id="bcard" name="jigou.bcard" value="<s:property value='jigou.bcard'/>"/></span>-->
    					<!--<div class="none"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>${jigou.bcard}"/></div>-->
    				<!--</div>-->

                    <p class="jiange">党建信息</p>
    				<div class="xkk djbox">
                    <div class="row">
    				<div class="inputtest inputtestl">
                        <span class="leftname leftnamel">公司人数：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isZZint="公司人数" class="input" name="jigou.yuangongshu" type="text" value="${jigou.yuangongshu }"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">党员人数：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isZZint="党员人数" class="input" name="jigou.party_num" type="text" value="${jigou.party_num }"/></span>
                    </div>
                    </div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">法人代表是否党员：<span style="color:red">*</span></span>
                        <span class="rightinfo"><s:select isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="is_party" theme="simple"
                                  listValue="name" name="jigou.is_party" label="法人代表是否党员" headerKey="" headerValue="" class="select"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">高管人数：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isZZint="高管人数" class="input" name="jigou.lead_num" type="text" value="${jigou.lead_num }"/></span>
                    </div>
                    </div>
                    <div class="row">
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel">去年党费总额(元)：<span style="color:red">*</span></span>
							<span class="rightinfo"><input isNotNull="" isBankZZint="上年度年党费收取总额（元）" class="input" name="jigou.last_party_cost" type="text"  value="${jigou.last_party_cost }"/></span>
						</div>
						<div class="inputtest inputtestl">
							<span class="leftname leftnamel" style="width: 146px;">是否愿意设立党支部：<span style="color:red">*</span></span>
							<span class="rightinfo"><s:select style="width: 214px;" isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="will_set_party" theme="simple"
									  listValue="name" name="jigou.will_set_party" label="是否愿意设立党支部" headerKey="" headerValue="" class="select"/></span>
						</div>
					</div>
                    <div class="row">
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">高管党员人数：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="" isZZint="高管党员人数" class="input" name="jigou.lead_party_num" type="text" value="${jigou.lead_party_num }"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">是否设立党支部：<span style="color:red">*</span></span>
                        <span class="rightinfo"><s:select isNotNull="" list="%{#application.dic.whether.childs}" listKey="id" id="is_party_branch" theme="simple" onchange="hidebranchtime();"
                                  listValue="name" name="jigou.is_party_branch" label="是否设立当支部" headerKey="" headerValue="" class="select"/></span>
                    </div>
                    </div>
                    <div class="inputtest inputtestl" id="branchtime">
                        <span class="leftname leftnamel">党支部设立时间：</span>
                        <span class="rightinfo"> <input readonly="readonly" class="input laydate-icon" rel="input laydate-icon" name="jigou.party_branch_time"
                        	id="party_branch_time" type="text" value="${jigou.party_branch_time }"/></span>
                    </div>
                    </div>
                    <div class="revise jigouSave" id="zqxxxgbtn">
                        <!--<input class="shenqingdkt upback" type="button" value="返回"/>&nbsp;&nbsp;-->
                        <input class="shenqingdkt shenqingdkthide jigouZc" type="button" value="暂存"/>
                        <input class="shenqingdkt shenqingdkthide jigouBc" type="button" value="保存"/>
                    </div>
                </form>
            </div>

        </div>

    </div>
    <input type="hidden" id="ifchange"/>
</div>
<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery-ui.min.css"/>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-ui.min.js"></script>
<script>
    $('#jigouname').autocomplete({
        source: function(request, response) {
            var key = $("#jigouname").val();
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
            if(ui.item.code){
                $('#zzjgdm').siblings(".error").html("").hide();
            }
            $('#zzjgdm').val(ui.item.code);
        },

        minLength: 2
    })
</script>
<div id="imglayer_bg"></div>
<div id="imglayer_border">
    <a href="javascript:;" id="imglayer_x" hidefocus="true"></a>
    <img id="imglayer_zoom" src="">
</div>
<div id="yyimglayer_bg"></div>
<div id="yyimglayer_border">
    <a href="javascript:;" id="yyimglayer_x" hidefocus="true"></a>
    <img id="yyimglayer_zoom" src="">
</div>
<%@ include file="../footer.jsp" %>
    <style>
    .showImg{position:relative; overflow:visible !important;cursor:pointer;}
    .showImg div.none{width:80%;text-align:center;position:absolute;top:38px;left:50%;/*border:1px solid #ddd;*/background: #fff;
    transform:translateX(-50%);-ms-transform:translateX(-50%); 	-moz-transform:translateX(-50%); -webkit-transform:translateX(-50%); -o-transform:translateX(-50%);
    box-shadow: 1px 2px 6px rgba(0,0,0,0.2)
    }
    .showImg .rightinfo{text-overflow: ellipsis;overflow: hidden;}
    </style>
    <script>
    if( $("#t").val()!='u'){
    $('.showImg').hover(function(){
    $(this).find('div.none').toggle();
    })
    }
    </script>
<script type="text/javascript">
    leftnav_init("qiyeinfo");
</script>

<script type="text/javascript">
    $("#ifchange").change(function () {
        if ($("#ifchange").val().length > 0) {
            var naowdate = "zhuceshijian";
            removError(naowdate);
        }
        ;
    });

    //动态调用日期插件
    var gdqkinputs_inamex = $("#form1 input[rel=input laydate-icon]");
    gdqkinputs_inamex.live('click', function () {
        var t = $("#t").val();
        if (t == 'v') {
            return;
        }
        var naowdate = $(this).attr("id");

        laydate({elem: '#' + naowdate});//绑定元素


    });


    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        //laydate({elem: '#jigou.zhuceshijian'});//绑定元素
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
    function jigouCheckCreditId() {
    	var zzjgdm = $("input[name='jigou.zzjgdm']").val();
    	if (zzjgdm == "") {
    		return;
    	}
		$.ajax({
			type: 'post',
			url: "/usercenter/checkCreditId.html",
			dataType: "json",
			data: {
				"id": zzjgdm
			},
			success: function(data) {
				if (data.relaSelf == 1) {
					var msg = data.name + "已经注册，点击确认按钮自动关联到该公司";
					if (confirm(msg)) { 
						$("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
						$(".shenqingdkthide,#zqxxxgbtn").hide();
						jigouRelation(data);
					}
				} else if (data.relaSelf == 2) {
					var msg = data.name + "的子账号数已经到达上限，不能再增加子账号。";
					alert(msg);
				} else if (data.id != "") {
					var msg = data.name + "已经注册，点击确认按钮系统将发送请求到主用户（电话号码" + data.phone + "），待主用户审核,审核通过后即可自动关联";
					if (confirm(msg)) { 
						$("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
						$(".shenqingdkthide,#zqxxxgbtn").hide();
						jigouRelation(data);
					}
				}
			}
		});
	}
	function jigouRelation(data) {
		$.ajax({
			type: 'post',
			url: "/usercenter/relation.html",
			dataType: "json",
			data: {
				"id"    : data.id,
				"relaId": data.relaId,
				"name"	: data.name,
				"relaSelf"	: data.relaSelf
			},
			success: function(data) {
				alert(data.msg);
				window.location.reload();				
			}
		});
	}
	function hidebranchtime() {
		if ($("select[id='is_party_branch']").val() == "10001") {
			$("#branchtime").show();
		} else {
			$("#branchtime").hide();
		}
	}
	hidebranchtime();
</script>
<script type="text/javascript">
    leftnav_init("jigouinfo");
</script>
</body>
</html>
 