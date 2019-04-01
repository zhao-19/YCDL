<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/equity.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/tiexizhinan.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 内容部分 -->
<div class="ycdata_bgimg">
    <img src="../image/data/zcsbbanner_02.png" alt="背景图">
</div>

<div class="ycdata_info ycdata_info_inlist">
    <div class="data_info_nav widthbox">
        <div class="data_info_gzs fl">
            <li>扶持政策查询</li>
        </div>
        <div class="data_info_search fr ">

            <input type="text" id="contentquery" onkeypress="if (event.keyCode == 13)  doquery()" placeholder="请输入关键词名称"
                   onfocus="if(placeholder=='请输入关键词名称'){placeholder=''}"
                   onblur="if(placeholder==''){placeholder='请输入关键词名称'}"
                   value="<s:property value="#request.contentquery"/>">
            <a href="javascript:doquery()"><span class="glyphicon_search" style="width: 38px;"></span></a>

        </div>
    </div>

</div>

<div class="ycdata_center ycdata_center_inlist" style='background:none;'>
    <%--<div class="ycdata_title widthbox widthbox_inlist">
        <div class="intrestlistwk">
            <div class="blockwk">
                <div class="li" style="background:url('../img/img_02.png') no-repeat center;">
                    <a href="/interestapp/selectList.html">
                        <p class="t">贴息申报入口</p>
                        <p><span class="w"><span class="st">进入</span><span class="sjx">&nbsp;&nbsp;&nbsp;</span></span></p>
                        <div class="yy"></div>
                    </a>

                </div>
                <div class="jj" style="font-size:12px">成都高新区利息补贴和担保补贴在此申报（申报截止日为2016-10-31）</div>
            </div>

        </div>
    </div>

    --%>
    <div class="tx_wk">

        <div class="tx_wktwo tx_wktwo2">
            <div class="tx_content">
                <div class='tx_table'>
                    <table class='searchtable' style="margin-top: 15px;">

                        <s:iterator value="#request.list">

                            <tr>
                                <td><span class="title"><a
                                        href='/interestapp!fuchizhichengDetail?e.id=<s:property value="id"/>'><s:property
                                        value="mingcheng"/></a></span><br/><span class="source">来源：<s:property
                                        value="laiyuan"/>    &nbsp;&nbsp;&nbsp;&nbsp;发布时间：
                                <s:date name="lurushijian"/></span></td>

                            </tr>
                        </s:iterator>
                    </table>
                </div>
            </div>
        </div>

        <div class="morejz" id="moredata" name="1">加载更多</div>
    </div>
</div>


<script>
    //政策搜索结果页面

    $('.tx_table').eq(0).fadeIn('slow');

    //点击加载更多
    $("#moredata").click(function () {
        var contentquery = $('#contentquery').val();
        var page = $("#moredata").attr("name");

        $.ajax({
            url: 'interestapp/interestlistsearchLoatMore.html',
            type: 'POST',
            data: {
                page: page,
                count: <s:property value="pageSize"/>,
                contentquery: contentquery
            },
            dataType: "json",
            beforeSend: function () {
                $("#moredata").text("数据加载中...");

            },
            success: function (data, response, status) {

                if (data.length < 0) {
                    $("#moredata").text("没有更多内容了");
                } else {
                    page++;
                    $("#moredata").attr("name", page);

                    $("#moredata").text("加载更多");
                    var item;
                    $.each(data, function (i, result) {
                        var date = new Date(result['lurushijian']);
                        var newdate = formatDate(date, "yyyy-MM-dd hh:mm:ss");

                        item = "<tr><td><span class='title'><a href='/interestapp!fuchizhichengDetail?e.id=" +
                                result['id'] + "'>" + result['mingcheng'] + "</a></span><br/><span class='source'>来源：" +
                                result['laiyuan'] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间：" + newdate +
                                "</span></td></tr>";

                        $(".searchtable").append(item);
                        //$("table[name = searchtable]").append(item);
                    });

                    if(data.length < <s:property value="pageSize"/>) {
                        $("#moredata").text("没有更多内容了");
                    }
                }
                ;
            }
        });
    });


    //日期转换格式转换----函数
    function formatDate(date,format) {
        var o = {
            "M+" : date.getMonth()+1, //month
            "d+" : date.getDate(),    //day
            "h+" : date.getHours(),   //hour
            "m+" : date.getMinutes(), //minute
            "s+" : date.getSeconds(), //second
            "q+" : Math.floor((date.getMonth()+3)/3),  //quarter
            "S" : date.getMilliseconds() //millisecond
        }
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,(date.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o) if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,
                    RegExp.$1.length==1 ? o[k] :("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    }

    //点击搜索，不带当前切换区域参数，搜索全部区域块，异步返回来的数据就加载在这个区域
    function doquery() {
        var query = $('#contentquery').val();
        if (query == '') {

        } else {
            var url = '/interestapp/interestlistsearch.html?count=<s:property value="pageSize"/>&q=' + query;
            location.href = url;
        }
    }


</script>

<script>
    menu_init("interestapp");

</script>

<!--盈创活动end-->
<%@ include file="../footer.jsp" %>

</body>
</html>

 
