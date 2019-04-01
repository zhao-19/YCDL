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
            <li>扶持政策</li>
        </div>
        <div class="data_info_search fr ">

            <input type="text" id="contentquery" onkeypress="if (event.keyCode == 13)  doquery()" placeholder="请输入关键词名称"
                   onfocus="if(placeholder=='请输入关键词名称'){placeholder=''}"
                   onblur="if(placeholder==''){placeholder='请输入关键词名称'}">
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
            <div class="tx_titlewk">
                <div class="tx_title"><span class='first' lang='gxqzc'>高新区政策</span><span lang='cdszc'>成都市政策</span><span
                        lang='scszc'>四川省政策</span><span lang='gjbzc'>国家部委政策</span></div>
            </div>
            <div class="tx_content">
                <div class='tx_table'>
                    <table class='gxqzc'>
                        <s:iterator value="#request.gxlist">
                            <tr>
                                <td><span class="title"><a
                                        href='/interestapp!fuchizhichengDetail?e.id=<s:property value="id"/>'><s:property
                                        value="mingcheng"/></a></span><br/><span class="source">来源：<s:property
                                        value="laiyuan"/>    &nbsp;&nbsp;&nbsp;&nbsp;发布时间：
                                    <s:date name="lurushijian" format="yyyy-MM-dd"/></span>
                                </td>

                            </tr>
                        </s:iterator>
                    </table>
                </div>
                <div class='tx_table'>
                    <table class='cdszc'>
                        <s:iterator value="#request.cdlist">
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
                <div class='tx_table'>
                    <table class='scszc'>
                        <s:iterator value="#request.sclist">
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
                <div class='tx_table'>
                    <table class='gjbzc'>
                        <s:iterator value="#request.gjlist">
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
                <input type='hidden' id='qiehuanbiaozhifu' value='gxqzc'/>
            </div>
        </div>
        <div class="morejz" id="moredata" name="1" lang="1" accesskey="1" contextmenu="1">加载更多</div>
    </div>
</div>
<input type="hidden"
       value="<s:if test="#request.gxlist != null"><s:property value="#request.gxlist.size"/></s:if><s:else>0</s:else>"
       id="gxCount">
<input type="hidden"
       value="<s:if test="#request.cdlist != null"><s:property value="#request.cdlist.size"/></s:if><s:else>0</s:else>"
       id="cdCount">
<input type="hidden"
       value="<s:if test="#request.sclist != null"><s:property value="#request.sclist.size"/></s:if><s:else>0</s:else>"
       id="scCount">
<input type="hidden"
       value="<s:if test="#request.gjlist != null"><s:property value="#request.gjlist.size"/></s:if><s:else>0</s:else>"
       id="gjCount">
<script>
    //政策切换
    //1设置没有更多内容bzf,
	var gxqzc=cdszc=scszc=gjbzc=0,qiehuanbiaozhifu;
    //2
    var tx_title_span2 = $('span', '.tx_wktwo2 .tx_title');
    var tx_content_tx_table2 = $('.tx_table', '.tx_wktwo2 .tx_content');
    tx_title_span2.eq(0).addClass('active');
    tx_content_tx_table2.eq(0).fadeIn('slow');
    tx_title_span2.click(function () {
        //alert(gxqzc+"||"+cdszc+"||"+scszc+"||"+gjbzc);
        var thisqhbzf = $(this).attr('lang');
        	if (thisqhbzf == 'gxqzc') {
	            if(!gxqzc){$("#moredata").text("加载更多").css("color","#333");};
	        }
	        if (thisqhbzf == 'cdszc') {
	        	if(!cdszc){$("#moredata").text("加载更多").css("color","#333");};
	        }
	        if (thisqhbzf == 'scszc') {
	        	if(!scszc){$("#moredata").text("加载更多").css("color","#333");};
	        }
	        if (thisqhbzf == 'gjbzc') {
	        	if(!gjbzc){$("#moredata").text("加载更多").css("color","#333");};
	        }
        
        if(!eval($(this).attr('lang'))){$("#moredata").text("加载更多").css("color","#333");}
        //alert($("#moredata").attr("name")+'&'+$("#moredata").attr("lang")+'&'+$("#moredata").attr("accesskey")+'*'+$("#moredata").attr("contextmenu"));
        
        var pageSize = <s:property value="pageSize"/>;
        $('#qiehuanbiaozhifu').val($(this).attr('lang'));
        $(this).addClass('active').siblings().removeClass('active');
        spanindex2 = $(this).index();
        tx_content_tx_table2.eq(spanindex2).fadeIn('slow').siblings().hide();

    });


    //点击加载更多
    $("#moredata").click(function () {
        //qiehuanbiaozhifu表明当前是属于哪个切换块
        qiehuanbiaozhifu = $('#qiehuanbiaozhifu').val();
        //page是点击加载更多时传递的页码，count是每页显示条数
        var page = '';
        if (qiehuanbiaozhifu == 'gxqzc') {
            if(gxqzc){return;}//表示该区域块没有更多数据
            page = $(this).attr("name");
        }
        if (qiehuanbiaozhifu == 'cdszc') {
        	if(cdszc){return;}
            page = $(this).attr("lang");
        }
        if (qiehuanbiaozhifu == 'scszc') {
        	if(scszc){return;}
            page = $(this).attr("accesskey");
        }
        if (qiehuanbiaozhifu == 'gjbzc') {
        	if(gjbzc){return;}
            page = $(this).attr("contextmenu");
        }
        var pageSize = <s:property value="pageSize"/>;
        $.ajax({
            url: '/interestapp/fuchizhichengLoadMore.html',
            type: 'POST',
            data: {
                'qiehuanbiaozhifu': qiehuanbiaozhifu,
                'page': page,
                'count': pageSize
            },
            dataType: "json",
            beforeSend: function () {
                $("#moredata").text("数据加载中...");
            },
            success: function (data, response, status) {
                
	            	if(data.length<1){
	      			  $("#moredata").text("没有更多内容了").css("color","#888");
	      			if (qiehuanbiaozhifu == 'gxqzc') {
	      	            gxqzc=1;
	      	        }
	      	        if (qiehuanbiaozhifu == 'cdszc') {
	      	        	cdszc=1;
	      	        }
	      	        if (qiehuanbiaozhifu == 'scszc') {
	      	        	scszc=1;
	      	        }
	      	        if (qiehuanbiaozhifu == 'gjbzc') {
	      	        	gjbzc=1;
	      	        }
      			    return;
      			  
      			}else{

      				if(qiehuanbiaozhifu=='gxqzc'){
      					$("#moredata").attr("name",parseInt(page)+1);
      				}
      				if(qiehuanbiaozhifu=='cdszc'){
      				    $("#moredata").attr("lang",parseInt(page)+1);
      				}
      				if(qiehuanbiaozhifu=='scszc'){
      				    $("#moredata").attr("accesskey",parseInt(page)+1);
      				}
      				if(qiehuanbiaozhifu=='gjbzc'){
      				    $("#moredata").attr("contextmenu",parseInt(page)+1);
      				}
      				
      				
      			    $("#moredata").text("加载更多");
      			 	var item;  
                    $.each(data, function (i, result) {
                        var date = new Date(result['lurushijian']);
                        var newdate = formatDate(date, "yyyy-MM-dd hh:mm:ss");

                        item = "<tr><td><span class='title'><a href='/interestapp!fuchizhichengDetail?e.id=" +
                                result['id'] + "'>" + result['mingcheng'] + "</a></span><br/><span class='source'>来源：" +
                                result['laiyuan'] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间：" + newdate +
                                "</span></td></tr>";

                        $("." + qiehuanbiaozhifu).append(item);
                        //$("table[name = "+ qiehuanbiaozhifu +"]").append(item);
                    });

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
        var url = '/interestapp/interestlistsearch.html?count=<s:property value="pageSize"/>&q=' + query;
        location.href = url;
    }


</script>

<div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;height:82px;}
</style>
<script>
    menu_init("interestapp");

</script>

<!--盈创活动end-->
<%@ include file="../footer.jsp" %>

</body>
</html>

 
