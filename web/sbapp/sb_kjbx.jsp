<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@page import="com.winpow.services.manage.activities.bean.Activities" %>
<%@page import="com.winpow.core.util.StringUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sb/jquery.insuranceselect.js"></script>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/jquery-1.11.3.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>

    <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css"/>

    <script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

    <script>
    $(document).ready(function() {  
        $(".xkk").each(function(){
        	$(this).citySelect({  
                prov: $(this).find(".bxgs").val(),  
                city: $(this).find(".tbxz").val(),  
                nodata: "none"  
            });
        });
            
    });
        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: false
            });


            K('#filemanager').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#logo').val(),
                        clickFn: function (url, title) {
                            K('#logo').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });

            K('#logo').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#logo').val(),
                        clickFn: function (url, title) {
                            K('#logo').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
    </script>

</head>
<body>
<!--公共提示框-->
<!-- 
	<div class="ggts"></div> -->
<div id="ggts2"></div>


<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="${msg}">
<input type="hidden" id="backnoticebzf" value="${buttonType}">
<!-- <input type="hidden" id="t" value="<s:property value="t"/>"> -->
<input type="hidden" id="t" value="${t}"/>
<script type="text/javascript">

    $(window).load(function () {

        var backnotice = $("#backnotice").val();
        var backnoticebzf = $("#backnoticebzf").val();
        if (backnotice == 'success') {
            if (backnoticebzf == '1') {
                ggts2("数据保存成功！");
                setTimeout(function () {
                    window.location = "/declare_kjbx/selectAllList.html?type=kjbxbt&init=y";
                }, 1500);
            }
            if (backnoticebzf == '2') {
                ggts2("数据提交成功！");
                setTimeout(function () {
                    window.location = "/declare_kjbx/selectAllList.html?type=kjbxbt&init=y";
                }, 1500);
            }
        }
        if (backnotice == 'erro') {
            if (backnoticebzf == '1') {
                ggts2("数据保存失败！");
            }
            if (backnoticebzf == '2') {
                ggts2("数据提交失败！");
            }

        }

        var t = $("#t").val();//v 查看   u 修改  a 新增
        //alert(t);
        if (t == 'v') {
            //表示查询
            $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
            $('.shangyibu').attr('disabled', false);
            $('.xiaoyibu').attr('disabled', false);
            $(".baocun").hide();

        }
        else if (t == 'a') {
            //表示新增（在返回没有数据的情况可以新增）

            //qiyeappinfo();//调用验证
        } else if (t == 'u') {
            //表示修改
            //$("#qiyeappinfo").attr("action","/usercenter/updateQiyeinfo.html");

            //qiyeappinfo();//调用验证
        }


        //点击保存,不验证isNotNull
        $('.baocun').click(function () {
            $('#buttonType').val('1');
            if (DataCheck.isLength()) {

                if (DataCheck.isInt()) {

                    if (DataCheck.isFint()) {

                        if (DataCheck.isZint()) {

                            if (DataCheck.isZuzhi()) {

                                if (DataCheck.isPhone()) {

                                    if (DataCheck.isEmail()) {

                                        if (DataCheck.idCard()) {
                                            //alert("可以保存!");
                                            //判断上传文件
                                            //alert(checkfilehidden(true))
                                            //return;
                                            buttonDefaultValue = $(this).val();
                                            countDown(this, 5);
                                            nativeNum("isBankZint");//还原为数字
                                            $("#form1").submit();//改变链接并提交
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
        });


        //点击提交
        $('.tijiao').click(function () {
            $('#buttonType').val('2');
            if (DataCheck.isNotNull()) {

                if (DataCheck.isLength()) {

                    if (DataCheck.isInt()) {

                        if (DataCheck.isFint()) {

                            if (DataCheck.isZint()) {

                                if (DataCheck.isZuzhi()) {

                                    if (DataCheck.isPhone()) {

                                        if (DataCheck.isEmail()) {

                                            if (DataCheck.isBankZint()) {

                                                if (DataCheck.idCard()) {
                                                    //alert("可以提交!");
                                                    if (!checkEachNeedDate("form1")) {
                                                        return;
                                                    }
                                                    //判断上传文件
                                                    if (checkfilehidden(true)) {
                                                        buttonDefaultValue = $(this).val();
                                                        countDown(this, 5);
                                                        nativeNum("isBankZint");//还原为数字
                                                        $("#form1").submit();//改变链接并提交
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
        });


    });
</script>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
    <div class="show fl">
        <%@ include file="../usercenter/leftnav.jsp" %>
    </div>


    <div class="list fr">
        <div class="rightbox">

            <!-- 债权信息修改    用户为企业时显示    -->
            <div id="zaiquanxinxi-update" class="vipinfo">

                <form id="form1" action="/declare_kjbx/saveData.html" method="post">

                    <div class="title">
                        <li><span class="t">${policy_name }</span></li>
                    </div>
                    <input type="hidden" name="buttonType" id="buttonType">
                    <input type="hidden" value="${type}" name="type">
                    <input type="hidden" lang="ID" name="id" id="id" value="<s:property value='e.id'/>"/>
                    <input type="hidden" lang="企业基本情况表的id" name="rele_id" value="<s:property value='e.rele_id'/>"/>
                    <input type="hidden" lang="用户号" name="userid" value="<s:property value='e.userid'/>"/>
                    <input type="hidden" lang="删除图片时ajax提交的地址" id="url" value="/interestapp/deletepic.html"/>

                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业名称：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业名称" readonly isLength="[0,64]" class="input"
                                                       id="qiyemingcheng" name="qiyemingcheng" type="text"
                                                       value="<s:property value='e.qiyemingcheng'/>"/></span>
                    </div>

                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业申请金额：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业申请金额" isBankZint="isBankZint"
                                                       onchange="this.value=formatNum(this.value)" isLength="[0,18]"
                                                       class="input ibg" id="qysqje" name="qysqje" type="text"
                                                       value="<s:property value='e.qysqje'/>"/></span>
                    </div>

                    <p class="jiange">科技保险明细</p>

                    <div id="dkk">
                        <c:if test="${fn:length(e.declareKJBXCoreList) > 0}">
                            <c:forEach items="${e.declareKJBXCoreList}" var="datas" varStatus="status">
                                <input type="hidden" name="declareKJBXCoreList[${status.index}].id" value="${datas.id}">
                                <div class="xkk" lang="firsttr">

                                        <%--<input type="hidden" lang="关联的tb_sb_kjbx表ID" name="declareKJBXCoreList[${status.index}].rele_id"--%>
                                        <%--value="${datas.rele_id}"/>--%>
                                <input type="hidden" class="bxgs" value="${datas.baoxiangongsi}">
                                <input type="hidden" class="tbxz" value="${datas.toubaopinzhogn}">

                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">保险公司：<span style="color:red">*</span></span>
                                		<span class="rightinfo">
                                            <select class="select company prov"
                                                    id="declareKJBXCoreList[${status.index}].baoxiangongsi"
                                                    name="declareKJBXCoreList[${status.index}].baoxiangongsi"
                                                    value="declareKJBXCoreList[${status.index}].baoxiangongsi"
                                                    isNotNull="保险公司">
                                                </select>
                                            <%--<input isNotNull="保险公司" isLength="[0,64]" class="input inumber" id="declareKJBXCoreList[${status.index}].baoxiangongsi" name="declareKJBXCoreList[${status.index}].baoxiangongsi"--%>
                                                               <%--type="text"--%>
                                                               <%--value="${datas.baoxiangongsi}"/>--%>
                                        </span>
                                    </div>

                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">投保险种：<span style="color:red">*</span></span>
                                		<span class="rightinfo">
                                            <select class="select city"
                                                    id="declareKJBXCoreList[${status.index}].toubaopinzhogn"
                                                    name="declareKJBXCoreList[${status.index}].toubaopinzhogn" isNotNull="投保险种" ></select>
                                            <input class="input inumber" type="hidden" value="${datas.toubaopinzhogn}"/>
                                        </span>
                                    </div>

                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">缴纳保费：<span style="color:red">*</span></span>
                                		<span class="rightinfo"><input isNotNull="缴纳保费" isBankZint="isBankZint"
                                                                       onchange="this.value=formatNum(this.value)"
                                                                       isLength="[0,18]" class="input inumber ibg"
                                                                       id="declareKJBXCoreList[${status.index}].baofei"
                                                                       name="declareKJBXCoreList[${status.index}].baofei"
                                                                       type="text"
                                                                       value="${datas.baofei}"/></span>
                                    </div>

                                    <input type="hidden" lang="补贴金额" name="butiejine">

                                    <div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
                                        <input
                                                class="adddel" type="button" value="增加">&nbsp;<input
                                            class="addde2"
                                            type="button"
                                            value="删除" onclick="deleteCore(this, ${datas.id})"></div>

                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(e.declareKJBXCoreList) <= 0}">
                            <div class="xkk" lang="firsttr" id="city">

                                    <%--<input type="hidden" lang="关联的tb_sb_kjbx表ID" name="declareKJBXCoreList[${status.index}].rele_id"--%>
                                    <%--value="${datas.rele_id}"/>--%>


                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">保险公司：<span style="color:red">*</span></span>
                                		<span class="rightinfo">
                                            <select class="select company prov"
                                                    id="declareKJBXCoreList[0].baoxiangongsi"
                                                    name="declareKJBXCoreList[0].baoxiangongsi"
                                                    isNotNull="保险公司">
                                            </select>
                                        </span>
                                </div>

                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">投保险种：<span style="color:red">*</span></span>
                                		<span class="rightinfo">
                                            <select class="select city"
                                                    id="declareKJBXCoreList[0].toubaopinzhogn"
                                                    name="declareKJBXCoreList[0].toubaopinzhogn" isNotNull="投保险种"></select>
                                            <input class="input inumber" type="hidden" value=""/>
                                        </span>
                                </div>

                                <div class="inputtest inputtestl">
                                    <span class="leftname leftnamel">缴纳保费：<span style="color:red">*</span></span>
                                		<span class="rightinfo"><input isNotNull="缴纳保费" isBankZint="isBankZint"
                                                                       onchange="this.value=formatNum(this.value)"
                                                                       isLength="[0,18]" class="input inumber ibg"
                                                                       id="declareKJBXCoreList[0].baofei"
                                                                       name="declareKJBXCoreList[0].baofei"
                                                                       type="text"
                                                                       value=""/></span>
                                </div>

                                <input type="hidden" lang="补贴金额" name="butiejine">

                                <div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
                                    <input
                                            class="adddel" type="button" value="增加">&nbsp;<input
                                        class="addde2"
                                        type="button"
                                        value="删除" onclick="deleteCore(this, 0)"></div>

                            </div>
                        </c:if>
                    </div>


                    <p class="jiange">上传文件清单</p>
					<div class="baobiao">
                     <div class="box-img">
                        <s:iterator value="#request.li" status="index" var="material">
                         	<div class="upwk">
			                    <div class="ck-img upspan" lang="picnum${index.index + 1}"  id="upspan${index.index + 1}" 
			                    	accesskey="${material.key }" index="${index.index + 1}">
			                    	<div class="nrk">
			                    	<span class="n nums${index.index + 1}">0</span>
			                    	<div id="picnum${index.index + 1}" class="picimg upspan${index.index + 1}">
			               		        <s:iterator value="#request.list" var="files">
			                				<s:if test="leixing==#material.key">
				                				 <div class="div"><div class="img"><img accesskey="${files.picurl }" lang="${files.id }" src="/image/pdf.jpg"></div></div>
			                			 	</s:if>	
			                			</s:iterator>
			                        </div>
			                        <span class="delimg">编辑</span>
			                        </div>
			                        <div class="t">${material.value }</div>
			                    </div>
			                      <!-- 如果是贷款贴息则输出利息清单的下载地址 -->
			                    <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx406'==#material.key">
			                     <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                			 	</s:if>	
                			 	
                			 	 <!-- 如果是申请报告 -->
			                    <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx202'==#material.key">
			                     <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                			 	</s:if>	
                			 	
			                </div>
	                    </s:iterator>
                     </div>
                 	</div>

                    <div class="revise" id="zqxxxgbtn">
                        <input class="shenqingdkt baocun" lang="<s:property value='e.rele_id'/>" type="button"
                               value="保存"/>&nbsp;&nbsp;
                        <input class="shenqingdkt tijiao" type="button" value="提交"/>
                    </div>

                </form>
            </div>

        </div>

    </div>

</div>

<script type="text/javascript" src="../plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="../plupload/Public/js/sucaihuo.js"></script>
<script type="text/javascript">
    var t = $("#t").val();
    if (t != 'v') {
        $(".upspan").each(function(){
 	var index = $(this).attr('index'); 
 	$(this).find(".nums" + index).html($(this).find(".img").size());
	var path = "/goodaaa.action?uptarget=" + $(this).attr('id') + "&leixing=" + $(this).attr('accesskey')
			 + "&id=${e.id}" + "&table=${table_name}";
    var uploaderupspan = new plupload.Uploader({//创建实例的构造方法
        runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
        browse_button: 'upspan' + index, // 上传按钮
        multi_selection: true,
        url: path, //远程上传地址
        flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
        silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
        filters: {
            max_file_size: '100mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
            mime_types: [//允许文件上传类型
                {title: "files", extensions: "pdf"}
            ]
        },
        multi_selection: true, //true:ctrl多文件上传, false 单文件上传
        init: {
            FilesAdded: function(up, files) { //文件上传前
                if ($("#picnum" + index).children(".div").length > 10) {
                    alert("您上传的文件太多了！");
                    uploaderupspan.destroy();
                } else {
                    var li = '';
                    plupload.each(files, function(file) { //遍历文件
                        li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                    });
                    $("#picnum" + index).append(li);
                    eachimg("picnum" + index);
                    uploaderupspan.start();
                }
            },
            UploadProgress: function(up, file) { //上传中，显示进度条
         		var percent = file.percent;
                $("#" + file.id).find('.bar').css({"width": percent + "%"});
                $("#" + file.id).find(".percent").text(percent + "%");
            },
            FileUploaded: function(up, file, info) { //文件上传成功的时候触发
               var data = eval("(" + info.response + ")");
                var percent = file.percent;

                if (data.error != '0') {
                    alert(data.error);
                    $("#" + file.id + "").remove();
                } else {
                    if (data.type == 1) {
                        $("#" + file.id).html("<div class='img'><img accesskey='" + data.reducepath + "' lang='" + data.id + "' src='" + data.pic + "'/></div>");
                        $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                    } else {
                        $("#" + file.id).html("<div class='img'><img accesskey='" + data.pic + "' lang='" + data.id + "' src='" + data.reducepath + "'/></div>");
                        $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                    }
                    eachimg("picnum2");
                }
            },
            Error: function(up, err) { //上传出错的时候触发
                alert(err.message);
            }
        }
    });
    uploaderupspan.init();
 });

    }
    //每次上传完时调取这个排列图片的left的函数
    function eachimg(target) {
        var target = "#" + target;
        var left = 0;
        var picimgs = $(target + " .div");
        //去除先提交情况下的提示框
        var qsc = $(target).parent().parent().children('.qsc');
        if (qsc) {
            qsc.remove()
        }

        picimgs.each(function (i, v) {
            left = i * 8;
            picimgs.eq(i).attr("style", "left:" + left + "px");
            $(this).parent().prev("span").html(i + 1);
        });

    }

    //点击保存按钮时检查每个文件框是否都已经传值
    function checkfilehidden() {
        $('#buttonType').val('2');

        var picimgupspan = $(".upspan");
        var ifreturn = 0;
        var tolength = picimgupspan.length;
        picimgupspan.each(function (i, v) {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            var ifqsc = $(this).children(".qsc").attr("class");//提示未上传的情况再提交不能再加提示了
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


    //刷新时，如果有图片还是要把left位置从新固定一下
    $(document).ready(function () {

        var lefts = 0;
        var picimgupspan = $(".upspan");


        picimgupspan.each(function () {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            picimgss.each(function (i, v) {
                lefts = i * 8;
                picimgss.eq(i).attr("style", "left:" + lefts + "px");
                $(this).parent().prev("span").html(i + 1);
            });

        })

    })
</script>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">
    leftnav_init("allbt");
</script>

<%@ include file="tanchudel.jsp" %>

<script type="text/javascript">

    $(window).load(function () {

        var lastxkk_iname = $("#dkk").children(".xkk:last").children().find("input[class=input iname]");//为刚刚创建的元素里的class=input iname的input动态添加验证
        lastxkk_iname.each(function () {
            $(this).rules("add", {required: true, maxlength: 64, messages: {required: "请输入", maxlength: "64字符以内"}});
        });
        var lastxkk_inumbers = $("#dkk").children(".xkk:last").children().find("input[class=input inumber]");//为刚刚创建的元素里的class=input inumber的input动态添加验证
        lastxkk_inumbers.each(function () {
            $(this).rules("add", {
                required: true,
                number: true,
                maxlength: 18,
                messages: {required: "请输入", number: "请填写数字", maxlength: "18字符以内"}
            });
        });
        var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
        lastxkk_laydates.each(function () {
            $(this).rules("add", {required: true, isDate: true, messages: {required: "请输入", isDate: "请正确输入"}})
        });


//贷款银行到到期日期的8个元素的增加和删除
        $(".adddel").click(function () {
            var xkks = $("#dkk").children(".xkk");
            var nownum = xkks.length;//现在要添加的元素名称的序号
            var newElement = xkks.eq(0).clone(true).appendTo($("#dkk")).attr("lang", "");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
//		xkks.eq(0).clone(true).insertAfter($(this).parent().parent()).attr("lang","");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
            newElement.citySelect({  
                nodata: "none"  
            }); 
            newElement.find('input[type=text]').each(function () {
                $(this).val('');
            })
            newElement.find('select').each(function () {
                $(this).val('');
            })
            var lastxkk_inputs = $("#dkk").children(".xkk:last").children().find("input[type=text]");//找到大框框下的最后一个元素里面的所有input
//		var lastxkk_inputs = $(this).parent().parent().next().children().find("input");//找到大框框下的最后一个元素里面的所有input

            lastxkk_inputs.each(function () {
                //var reg=/^[^a-zA-Z0-9]$/g;//匹配字符串中的非字母【即中文和数字】
                //var thisnewstr=$(this).attr("name").replace(reg,"");//把匹配到的中文和数字替换为空
                var nameParentStrs = $(this).attr("name").split('.')[0];
                var nameStrs = $(this).attr("name").split('.')[1];

                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
                if ($(this).attr("value") == "增加" || $(this).attr("value") == "删除") {

                } else {
                    $(this).attr("value", "");
                }
            });

            var lastxkk_selects = $("#dkk").children(".xkk:last").children().find("select");

            lastxkk_selects.each(function () {
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if(nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }

                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
            });

            var lastxkk_iname = $("#dkk").children(".xkk:last").children().find("input[class=input iname]");//为刚刚创建的元素里的class=input iname的input动态添加验证
            lastxkk_iname.each(function () {
                $(this).rules("add", {required: true, maxlength: 64, messages: {required: "请输入", maxlength: "64字符以内"}});
            });
            var lastxkk_inumbers = $("#dkk").children(".xkk:last").children().find("input[class=input inumber]");//为刚刚创建的元素里的class=input inumber的input动态添加验证
            lastxkk_inumbers.each(function () {
                $(this).rules("add", {
                    required: true,
                    number: true,
                    maxlength: 18,
                    messages: {required: "请输入", number: "请填写数字", maxlength: "18字符以内"}
                });
            });
            var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
            lastxkk_laydates.each(function () {
                $(this).rules("add", {
                    required: true,
                    isDate: true,
                    messages: {required: "请输入", isDate: "日期格式如：2016-08-12"}
                })
            });


            //alert(xkks.length);
        });


        //给大框框下所有的日期input框动态添加日期事件
        var dkk_inamex = $("#dkk input[class='input stext laydate-icon needDate']");
        dkk_inamex.live('click', function () {
            var naowdate = $(this).attr("id");
            laydate({elem: '#' + naowdate});//绑定元素
        });

        //由于有validate验证，如何事先填写错误，就会加error样式，所以此时还需要动态调用一下date控件
        var dkk_inamex2 = $("#dkk input[class='input laydate-icon error']");
        dkk_inamex2.live('click', function () {
            var naowdate2 = $(this).attr("id");
            laydate({elem: '#' + naowdate2});//绑定元素
        });

    });


    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#gqjlwcsj'});//绑定元素
        //laydate({elem: '#jgbasj'});//绑定元素
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

    var objbl = '';
    var objid = '';
    function deleteCore(obj, id) {
        objbl = obj;
        objid = id;
        $("#delSure").show();
        $("#delSure h4").html("确定要删除此栏申报？");//显示，停留，隐藏
        $("#delSure .delsure").html('确定');
        $("#delSure .delcancel").html('取消');
    }


    $("#delSure .delsure").click(function () {
        $("#delSure").hide();
        var parent = $(objbl).parent().parent();
        var xkks = $("#dkk").children(".xkk");
        //alert(xkks.length+"**");
        if (id != 0 && xkks.length > 1) {
            //alert(objid+"&&");
            $.post('/declare_kjbx/deleteCore.html', {id: objid}, function (data) {

                if (data.msg == 'erro') {
                    alert("删除失败，请稍后再尝试！");
                } else {
                    //alert("删除成功！");
                    removeCore(objbl);
                    return false;
                }
            }, 'json');
        } else if (id != 0 && xkks.length == 1) {
            ggts2('至少留一栏！');
            return;

        } else if (id == 0 && xkks.length > 1) {
            removeCore(objbl);
            return false;

        } else if (id == 0 && xkks.length == 1) {
            ggts2('至少留一栏！');
            return false;
        }


    });
    $("#delSure .delcancel").click(function () {
        $("#delSure").hide();
        return false;
    });


    function removeCore(obj) {
        //alert(3);
        //2重新排序
        var parent = $(objbl).parent().parent();
        //1删除该栏
        parent.remove();
        var xkks = $("#dkk").children(".xkk");
        $("#dkk").children(".xkk").each(function (nownum) {
            var lastxkk_inputs = $(this).children().find("input");//找到大框框下的最后一个元素里面的所有input

            lastxkk_inputs.each(function () {

                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if (nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);
                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);
            });

            var lastxkk_selects = $(this).children().find("select");

            lastxkk_selects.each(function () {
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if (nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
            });
        })

        var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
        lastxkk_laydates.each(function () {
            $(this).rules("add", {
                required: true,
                isDate: true,
                messages: {required: "请输入", isDate: "日期格式如：2016-08-12"}
            })
        });
    }
</script>

</body>
</html>
 