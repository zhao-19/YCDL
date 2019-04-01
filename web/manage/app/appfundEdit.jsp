<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.winpow.services.common.TreeNode" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <%@ include file="/resource/common_html_meat.jsp"%>
    <%@ include file="/manage/system/common.jsp"%>
    <%@ include file="/resource/common_html_validator.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.qrcode.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/newlayer/layer.js"></script>
    <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/resource/drag/dragImg.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/script.js"></script>
    <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/sbapp/DataCheck.js"></script>
    <style>
        .td_right {text-align: right;width: 130px;}
        select {height: auto;width: 184px;}
        .table_title {text-align: left;font-weight: bold;font-size: 16px;background-color: #dff0d8;}
        .intro {width: 100%;}
        .addrow,.removerow{display:inline-block;cursor:pointer;margin-left: 5px;width: 25px;height: 25px;background-repeat:  no-repeat ;background-position: 0 center;background-size: 22px auto}
        .addrow{background-image: url('<%=request.getContextPath()%>/image/usercenter/jjgl_add1.png')}
        .addrow:hover{background-image: url('<%=request.getContextPath()%>/image/usercenter/jjgl_add2.png')}
        .removerow{background-image: url('<%=request.getContextPath()%>/image/usercenter/jjgl_remove1.png')}
        .removerow:hover{background-image: url('<%=request.getContextPath()%>/image/usercenter/jjgl_remove2.png')}
        .groupbox .table-bordered{border-top: 0;}
        .groupbtn{text-align: right; margin: 20px 40px;}
        .table-bordered tbody:first-child tr:first-child td{border-top: 1px solid #ddd;}
        .error{color: red;}
        .smallpic{margin-right: 5px;}
    </style>
</head>
<body>
<!--绝对定位元素放在最前-->
<div id="uploadbg">
    <div id="uploadbox"></div>
</div>
<s:form action="/manage/appCommon!savefund.action" id="form1" theme="simple" method="post">
    <input type="hidden" name="fundmanager.pkid" value="${fundmanager.pkid }"/>
    <input type="hidden" name="fundmanager.releid" value="${fundmanager.releid }"/>
    <input type="hidden" name="fundmanager.shareholder" value="${fundmanager.shareholder }"/>
    <table class="table table-bordered first">
        <tr>
            <td colspan="4" class="table_title">基金管理人基本情况表
            </td>
        </tr>
        <tr>
            <td class="td_right">企业名</td>
            <td style="text-align: left;">
                <s:textfield theme="simple" isNotNull="" name="fundmanager.qiyename" id="qiyename"/>
            </td>
            <td class="td_right">成立日期</td>
            <td style="text-align: left;">
                <s:textfield theme="simple"  isNotNull="" name="fundmanager.regdate" id="regdate" class="Wdate search-query input-small"  onFocus="WdatePicker()"/>
            </td>
        </tr>
        <tr>
            <td>经营期限：<span style="color:red">*</span></td>
            <td><input isNotNull=""  name="fundmanager.operatetime" value="${fundmanager.operatetime }" type="text"/></td>
            <td>公司类型：<span style="color:red">*</span></td>
            <td>
                <s:select  isNotNull="" list="%{#application.dic.qiyetype.childs}" headerKey="" headerValue="" theme="simple"
                          listKey="id" listValue="name" id="fundmanager.qiyetype" name="fundmanager.qiyetype"/>
            </td>
        </tr>
        <tr>
            <td>注册资本(万元)：<span style="color:red">*</span></td>
            <td>
                <input  isNotNull="" name="fundmanager.regfunds" value="${fundmanager.regfunds }" type="text"/>
            </td>
            <td>公司性质：<span style="color:red">*</span></td>
            <td>
                <s:select  isNotNull="" list="%{#application.dic.qiyequality.childs}" headerKey="" headerValue="" theme="simple"
                          listKey="id" listValue="name" id="fundmanager.qiyequality" name="fundmanager.qiyequality"/>
            </td>
        </tr>
        <tr>
            <td>备案类型：<span style="color:red">*</span></td>
            <td>
                <s:select isNotNull="" list="%{#application.dic.recordtype.childs}" headerKey="" headerValue="" theme="simple"
                          listKey="id" listValue="name" id="fundmanager.filetype" name="fundmanager.filetype"/>
            </td>
            <td>公司状态：<span style="color:red">*</span></td>
            <td>
                <s:select  isNotNull="" list="%{#application.dic.qiyestatus.childs}" headerKey="" headerValue="" theme="simple"
                          listKey="id" listValue="name" id="fundmanager.qiyestatus" name="fundmanager.qiyestatus"/>
            </td>
        </tr>
        <tr>
            <td>公司地址：<span style="color:red">*</span></td>
            <td><input  isNotNull="" name="fundmanager.address" value="${fundmanager.address }" type="text"/></td>
            <td>办公面积(平方米)：<span style="color:red">*</span></td>
            <td><input isNotNull=""  name="fundmanager.acreage" value="${fundmanager.acreage }" type="text"/></td>
        </tr>
        <tr>
            <td>联系人：<span style="color:red">*</span></td>
            <td><input  isNotNull="" name="fundmanager.linkman" value="${fundmanager.linkman }" type="text"/></td>
            <td>联系电话：<span style="color:red">*</span></td>
            <td><input  isNotNull="" name="fundmanager.linktel" value="${fundmanager.linktel }" type="text"/></td>
        </tr>
        <tr>
            <td>统一信用代码：<span style="color:red">*</span></td>
            <td><input  isNotNull="" name="fundmanager.creditid" value="${fundmanager.creditid }" type="text"/></td>
            <td>法定代表人：<span style="color:red">*</span></td>
            <td><input  isNotNull="" name="fundmanager.corp" value="${fundmanager.corp }" type="text"/></td>
        </tr>
        <c:forEach items="${fundmanager.shareholderObject}" var="data">
            <tr class='clonerow'>
                <td>股东名：</td>
                <td><input  isNotNull="" class="sharename" type='text' value="${data.sharename}"/></td>
                <td>金额：</td>
                <td>
                    <input isNotNull=""  class="sharemoney" type='text' value="${data.sharemoney}"/><i class="addrow" title="增加一行"></i><i class="removerow" title="删除一行"></i>
                </td>
            </tr>
        </c:forEach>
    </table>
    <table class="table table-bordered">
        <tr>
            <td colspan="4" class="table_title">投资项目情况表</td>
        </tr>
        <tr>
            <td class="td_right">总投资金额(万元)</td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.inamount"/>
            </td>
            <td class="td_right">高新区投资金额(万元)</td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.techinamount"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">被投企业总数(个)</td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.qiyenum"/>
            </td>
            <td class="td_right">高新区被投企业数(个)</td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.techqiyenum"/>
            </td>
        </tr>
        <tr>
            <td class="td_right">退出比例(%)</td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.exitrate"/>
            </td>
            <td class="td_right">高新区被投企业退出数(个)</td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.techexitnum"/>
            </td>
        </tr>
    </table>
    <table class="table table-bordered jbqk">
        <tr>
            <td colspan="4" class="table_title">基金基本情况表
            </td>
        </tr>
    </table>
    <div class="groupbox">
        <c:forEach items="${fundmanager.fundbasicList}" var="datas">
            <div class="basiclist">
                <input type='hidden' index='pkid' value='${datas.pkid}'>
                <input type='hidden' index='fundscale' value='${datas.fundscale}'>
                <input type='hidden' index='shareholder' value='${datas.shareholder}'>
                <table class="table table-bordered">
                    <tr>
                        <td>基金名称：</td>
                        <td><input index='fundname' isNotNull="" type='text' value="${datas.fundname}"/></td>
                        <td>成立日期：</td>
                        <td><input index='regdate' isNotNull="" class='Wdate search-query input-small' type='text'
                                   value="${datas.regdate}"
                                   onFocus="WdatePicker()"/></td>
                    </tr>
                    <tr>
                        <td>经营期限：</td>
                        <td><input index='operatetime' isNotNull="" type='text' value="${datas.operatetime}"/></td>
                        <td>基金备案号：</td>
                        <td><input index='fundnum' isNotNull="" type='text' value="${datas.fundnum}"/></td>
                    </tr>
                    <c:forEach items="${datas.shareholderObject}" var="data">
                        <tr class="clonerow">
                            <td>股东名：</td>
                            <td><input isNotNull="" class="holdname" type='text' value="${data.holdname}"/></td>
                            <td>金额：</td>
                            <td>
                                <input isNotNull="" class="holdmoney" type='text' value="${data.holdmoney}"/><i class="addrow" title="增加一行"></i><i class="removerow" title="删除一行"></i>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="groupbtn">
                    <input class='clonegroup btn btn-info' type='button' value='增加一组'>
                    <input class='removegroup btn btn-danger' type='button' value='删除一组'>
                </div>
            </div>
        </c:forEach>
    </div>
    <table class="table table-bordered">
        <tr>
            <td colspan="4" class="table_title">其他信息</td>

        </tr>
        <tr>
            <td class="td_right"><a href="http://api.map.baidu.com/lbsapi/getpoint/index.html" target="_black" style="color: blue;">经纬度(点击获取)</a></td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.lnglat" id="lnglat" />
            </td>
            <td class="td_right">位置名称</td>
            <td style="text-align: left;">
                <s:textfield  isNotNull="" theme="simple" name="fundmanager.lnglatname" id="lnglatname" />
            </td>
        </tr>
        <tr>

            <td class="td_right">审核状态</td>
            <td style="text-align: left;">
                <s:select  isNotNull="" list="%{#application.dic.wfstatus.childs}" headerKey="" headerValue="" theme="simple"
                           listKey="id" listValue="name" id="chstatus" name="fundmanager.chstatus"/>
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="td_right"><span class="uploadbtn btn btn-success" reg="image" num="multiple" type="image">上传图片</span><br>现场照片（多张）</td>
            <td style="text-align: left;" colspan="3">
                <s:textfield isNotNull=""  theme="simple" name="fundmanager.scenepic" class="file1" id="scenepic"  style="width:99%;"/>
            </td>

        </tr>
        <tr>
            <td class="td_right">审核备注</td>
            <td style="text-align: left;" colspan="3">
                <s:textarea  isNotNull="" theme="simple" name="fundmanager.checkremark" id="checkremark" style="width:99%;"></s:textarea>
            </td>
        </tr>
        <tr>
            <td class="td_right">审核人</td>
            <td style="text-align: left;">${fundmanager.checkid}</td>
            <td class="td_right">审核时间</td>
            <td style="text-align: left;">${fundmanager.checkdate }</td>
        </tr>
        <tr>
            <td class="td_right">创建时间</td>
            <td style="text-align: left;">${fn:substring(fundmanager.lurushijian, 0, 19)}</td>
            <td class="td_right">修改时间</td>
            <td style="text-align: left;">${fn:substring(fundmanager.lastchgtime, 0, 19)}</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <span onclick="submit(this)" class="btn btn-success baocun"><i class="icon-ok icon-white"></i>保存</span>
                <span onclick="submit(this)" class="btn btn-success tongguo"><i class="icon-ok icon-white"></i>通过</span>
            </td>
        </tr>
    </table>
</s:form>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/easyUpload/easy-upload.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/easyUpload/easyUpload.js"></script>
<script type="text/javascript">
    var row='<tr class="clonerow">' +
                '<td>股东名：</td>' +
                '<td><input isNotNull="" class="sharename" type=\'text\' value=""/><span class=\'error\'></span></td>' +
                '<td>金额：</td>' +
                '<td>' +
                    '<input  isNotNull="" class="sharemoney" type=\'text\' value=""/><span class=\'error\'></span>' +
                    '<i class="addrow" title="增加一行"></i>' +
                    '<i class="removerow" title="删除一行"></i>' +
                '</td>' +
              '</tr>';
    var row2='<tr class="clonerow">' +
                '<td>股东名：</td>' +
                '<td><input isNotNull="" class="holdname" type=\'text\' value=""/><span class=\'error\'></span></td>' +
                '<td>金额：</td>' +
                '<td>' +
                    '<input  isNotNull="" class="holdmoney" type=\'text\' value=""/><span class=\'error\'></span>' +
                    '<i class="addrow" title="增加一行"></i>' +
                    '<i class="removerow" title="删除一行"></i>' +
                '</td>' +
              '</tr>';

    var group='<div class="basiclist">' +
                '<input type=\'hidden\' index=\'pkid\' value=\'${datas.pkid}\'>' +
                '<input type=\'hidden\' index=\'fundscale\' value=\'${datas.fundscale}\'>' +
                '<input type=\'hidden\' index=\'shareholder\' value=\'${datas.shareholder}\'>' +
                '<table class="table table-bordered" >' +
                    '<tr>' +
                        '<td>基金名称：</td>' +
                        '<td><input isNotNull="" type=\'text\' value=""/><span class=\'error\'></span></td>' +
                        '<td>成立日期：</td>' +
                        '<td><input isNotNull="" class=\'Wdate search-query input-small\' type=\'text\' value="" onFocus="WdatePicker()"/><span class=\'error\'></span></td>' +
                    '</tr>' +
                    '<tr>' +
                        '<td>经营期限：</td>' +
                        '<td><input  isNotNull="" type=\'text\' value=""/><span class=\'error\'></span></td>' +
                        '<td>基金备案号：</td>' +
                        '<td><input  isNotNull="" type=\'text\' value=""/><span class=\'error\'></span></td>' +
                    '</tr>' +
                    '<tr class="clonerow">' +
                        '<td>股东名：</td>' +
                        '<td><input isNotNull="" class="holdname" type=\'text\' value=""/><span class=\'error\'></span></td>' +
                        '<td>金额：</td>' +
                        '<td>' +
                            '<input isNotNull="" class="holdmoney" type=\'text\' value=""/><span class=\'error\'></span>' +
                            '<i class="addrow" title="增加一行"></i>' +
                            '<i class="removerow" title="删除一行"></i>' +
                        '</td>' +
                    '</tr>' +
                  '</table>'+
                    '<div class="groupbtn">' +
                            '<input class=\'clonegroup btn btn-info\' type=\'button\' value=\'增加一组\'>' +
                            '<input class=\'removegroup btn btn-danger\' type=\'button\' value=\'删除一组\'>' +
                    '</div>' +
                  '</div>';

    //行
    $('.first').delegate('.addrow','click',function () {
        $(this).parents('.table').append(row);
    });
    $('.groupbox').delegate('.addrow','click',function () {
        $(this).parents('.table').append(row2);
    });
    $('body').delegate('.removerow','click',function () {
       if($(this).parents('.table').find('.clonerow').length<2){
           alert('至少保留一行！');
           return;
        }
        $(this).parents('tr').remove();
    });

    //组
    $('.groupbox').delegate('.clonegroup','click',function () {
        $(this).parents('.groupbox').append(group);
    });
    $('.groupbox').delegate('.removegroup','click',function () {
        if($(this).parents('.groupbox').find('.groupbtn').length<2){
            alert('至少保留一组！');
            return;
        }
        $(this).parents('.groupbtn').prev('.table').remove()
        $(this).parents('.groupbtn').remove();
    });
    function checkfilehidden() {
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
                        $(this).append("<div class='qsc'>请上传图片！</div>");
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
    function submit(me){
        var basics = ["pkid", "fundscale", "shareholder", "fundname", "regdate", "operatetime", "fundnum"];
        for (var i = 0;i < basics.length; i++) {
            $("input[index='" + basics[i] + "']").each(function(j){
                $(this).attr("name", "fundmanager.fundbasicList[" + j + "]." + basics[i]);
            });
        }
        $(".basiclist").each(function(){
            var allholdmoney = 0;
            var holdarr = new Array();
            var hnum = 0;
            // console.log($(this).find(".clonerow").length)
            $(this).find(".clonerow").each(function(){
                var holdname = $(this).find(".holdname").val();
                var holdmoney = parseInt($(this).find(".holdmoney").val());
                console.log(holdname,holdmoney)
                allholdmoney += holdmoney;
                var holdobj = new Object();
                holdobj.holdname = holdname;
                holdobj.holdmoney = holdmoney;
                holdarr[hnum++] = holdobj;
            });
            // console.log(allholdmoney,JSON.stringify(holdarr))
            $(this).find("input[index='fundscale']").val(allholdmoney);
            $(this).find("input[index='shareholder']").val(JSON.stringify(holdarr));
        });

        var sharearr = new Array();
        var snum = 0;
        $(".first .clonerow").each(function(){
            var sharename = $(this).find(".sharename").val();
            var sharemoney = $(this).find(".sharemoney").val();
            var shareobj = new Object();
            shareobj.sharename = sharename;
            shareobj.sharemoney = sharemoney;
            sharearr[snum++] = shareobj;
        });
        // console.log(JSON.stringify(sharearr))
        $("input[name='fundmanager.shareholder']").val(JSON.stringify(sharearr));


        if ($(me).hasClass('tongguo')) {
            if (DataCheck.isNotNull()) {
                if (DataCheck.isZuzhi()) {
                    if (DataCheck.isPhone()) {
                        if (!checkEachNeedDate("form1")) {
                            return;
                        }
                        //判断上传文件
                        if (checkfilehidden(true)) {
                            nativeNum("isBankZint");
                            $("#form1").submit();
                        } else {
                            return;
                        }
                    } else {
                        alert("不可以提交!");
                    }
                }
            }
        } else {
            $("#form1").submit();
        }

    }
    window.onload=function (ev) {
        if($('.groupbox .table').length==0){
            $('.jbqk').hide();
        }
        if($('#scenepic').val()!=""){
            var imgarr= $('#scenepic').val().split(',');
            var td= $('#scenepic').parent('td');
            // console.log(imgarr);
            $.each(imgarr,function (i,v) {
               td.append('<img src="'+v+'" class="smallpic">')
            });
        }
    }
    $('#form1').delegate("input:not('.submit'),select,label, textarea",'blur',function(){
        if($(this).val()!=''){
            $(this).next('.error').hide();
        }
    })
</script>
</body>
</html>