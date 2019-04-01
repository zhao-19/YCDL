<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.core.appUtil.AppUtil"%>

<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<title>盈创动力-国内领先的科技金融服务门户网站</title>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
	<style>
		.fixed{top:auto;bottom:10%!important;height:82px;}
		.tocre{overflow: hidden;}
		.tocre>li{border-right:1px solid #ddd;border-bottom:1px solid #ddd;border-top:2px solid #3bbd9b;width: 20%;float:left;margin-bottom: 40px;padding:15px;}
		.tocre>li:nth-child(5n+1){border-left:1px solid #ddd;}
		.tocre>li>img{width: 210px;height: 210px;}
		.green.tocre>li{border-top-color:#3bbd9b;}
		.green.tocre>li>a{background:#3bbd9b;}
		.green.tocre>li>a:hover{background:#32b190;}

		.orange.tocre>li{border-top-color:#ff9621;}
		.orange.tocre>li>a{background:#fe9721;}
		.orange.tocre>li>a:hover{background:#ea8614;}

		.red.tocre>li{border-top-color:#fd5a5b;}
		.red.tocre>li>a{background:#fd5a5b;}
		.red.tocre>li>a:hover{background:#e54142;}

		.blue.tocre>li{border-top-color:#3f99e7;}
		.blue.tocre>li>a{background:#3f99e7;}
		.blue.tocre>li>a:hover{background:#308ad8;}

	</style>
</head>
<body>
<!-- 网站头部 -->
<%@ include file="../header.jsp"%>
<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<a href="/incredetail/22.html"> <img src="../image/box/inc_img1.jpg" alt="背景图"></a>
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li><% out.print(AppUtil.getCodeName(request.getAttribute("cretype")));%></li>
		</div>
		<div class="data_info_search fr" >
			<input type="text" id="contentquery" onkeypress="if (event.keyCode == 13)  doquery()" value="" placeholder="请输入搜索关键字">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
	</div>
</div>

<!-- /*服务类型*/ -->
<div class="widthbox">
	<ul class=" box tc tocre">
			<!--<li>-->
				<!--<img src="../image/incre/increimg.png" alt="">-->
				<!--<h3>贴息评级</h3>-->
				<!--<p>信用评级专业机构</p>-->
				<!--<a href="">查看详情</a>-->
			<!--</li>-->
</ul>

	<div class="morejz widthbox" id="loadmorewordh" onClick="lanren.loadMore();">加载更多 </div>

</div>
<div class="fixed" id="totop">
	<div class="home">
		<div class="fixed_img">
			<a href="javascript:$('body,html').animate({scrollTop:0},500)">
				<a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
			</a>
		</div>
	</div>
</div>
<script>
    var pagesize = 20;
    var queryDataCount = 0;
    var cretype='${cretype}';
    var contentquery='${increname}';
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".downlist li");
            $(".tocre").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".tocre");
            }
            for(var i=lanren._default;i<lis.length;i++){
                _content.push(lis.eq(i));
            }
            $(".downlist").html("");
        },
        loadMore:function(){
            document.getElementById("loadmorewordh").innerHTML="玩命加载中，请稍后...";
            var test = document.getElementById("loadmorewordh").innerHTML;
            queryData();
        }
    }
    lanren.init();
    function loadData(){
        var mLis = $(".tocre li").length;
        for(var i =0;i<lanren._loading;i++){
            var target = _content.shift();
            if(!target){
                $('#loadmorewordh').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
                return false;
            }
            $(".tocre").append(target);
        }
        $('#loadmorewordh').html("加载更多");
    }
    function queryData(){
        queryDataCount = queryDataCount+1;
        var _url = "/incre/tocreajax.html";
        $.ajax({
            type: 'POST',
            url: _url,
            data: {
                'page':queryDataCount,
                'cretype':cretype,
                'increname': contentquery
            },
            //dataType:"json",
            //async:false,
            beforeSend : function () {
                $("#loadmorewordh").html("数据拼命加载中...");
            },
            success: function(res){
                var  data=JSON.parse(res)
                if(data=="0"){
                    $("#loadmorewordh").html("没有更多数据了");
                    return;
                }
                for(var i=0;i<data.length;i++ ){
                    _content.push(
						'<li>' +
                        '<img src="'+data[i].picture+'">' +
                        '<h3>'+data[i].INCRENAME+'</h3>' +
                        '<p>'+data[i].INCREDESCRIP+'</p>' +
                        '<a href="/incredetail/'+data[i].ID+'.html">查看详情</a>' +
                        '</li>'
                    );
                }
                loadData();
            },
            error:function(){
                return null;
            }
        });
        return false;
    }

</script>
<script>
    window.onload=function (ev) {
        lanren.loadMore();
        var cretype='${cretype}';
        if(cretype==12501||cretype==12505){
			$('.tocre').addClass('green');

        }else if(cretype==12502||cretype==12506){
            $('.tocre').addClass('orange');

        }else if(cretype==12503||cretype==12507){
            $('.tocre').addClass('red');

        }else if(cretype==12504||cretype==12508){
            $('.tocre').addClass('blue');
        }

        if('${increname}'!=""){
            $('.data_info_gzs>li').html( $('.data_info_gzs>li').html()+'搜索结果')

		}
    }

    function doquery(){
        var query = $('#contentquery').val();
        if(query=='') {

        }else {
            var url = '/incre/tocre.html?cretype=${cretype}&increname='+query;
            window.location = url;
            return ;
        }
    }

    menu_init("incre");

</script>

<!--盈创活动end-->
<%@ include file="../footer.jsp"%>

</body>
</html>
