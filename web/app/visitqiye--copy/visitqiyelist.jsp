<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="营销记录"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
<style>
    .zcsblb li dt{padding:0 0.22rem;background: none;color: #141414;font-size: 0.3rem}
    .zcsblb li dt>span{color:#ff8c7e;font-size: 0.26rem;}
    .zcsblb li dd{padding:0.22rem;font-size: 0.26rem;color:#333;}
    .search .search-box{font-size: 0.26rem;color:#333;border-color: #ddd;}
    .search .search-cancel{color: #333;}
    .newadd a{display: block;width: 16%;line-height: 0.6rem;text-align: center;color: #fff;font-size: 0.3rem;
        background: #ff991d;border-radius: 0.1rem;margin-top: 1.2rem;margin-right: 2%; float:right;}
    .zcsblb ul{padding-top: 0.2rem;}
</style>
<body class="zcsblb fundlist">
    <div class="search clearfix">
        <input type="text" value="" class="search-box fl" id="searchinput" autocomplete="off" placeholder="请输入要查询的公司名称" value=""/>
        <input type="button" id="searchbtn" class="search-cancel" value="确定">
        <input type="hidden" id='hidkey' value="${userid}">
    </div>
    <div class="newadd ov">
        <a href="${pageContext.request.contextPath}/app/visitqiyedetail.action?userid=${userid}">新增</a>
    </div>
    <div class="listbox">
        <ul class="list">
            <!--<li>-->
            <!--<a>-->
            <!--<dl>-->
            <!--<dt>成都高投盈创动力有限公司 <span class="fr">审核通过</span></dt>-->
            <!--<dd><span>公司性质：</span>国有控股</dd>-->
            <!--<dd><span>法定代理人：</span>张三</dd>-->
            <!--<dd><span>成立日期：</span>2018-08-22</dd>-->
            <!--<dd><span>录入时间：</span> 2018-08-24</dd>-->
            <!--</dl>-->
            <!--</a>-->
            <!--</li>-->
        </ul>
    </div>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/bzModel.js"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/dropload/dropload.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
    <script>
        function onelist(page,keywords,flag,callback){
            var obj={
                page:page,
                qiyename:keywords
            }
            $.ajax({
                url:'/app/visitqiyeData.action',
                type:'post',
                cache:false,
                data:obj,
                dataType: 'json',
                beforeSend:function () {

                },
                success:function(data){
                    var h=parseInt(document.documentElement.style.fontSize)*2.6*data.data.length;

                    if(page==1){
                        $('.listbox').height(h);
                    }
                    if(callback instanceof Function){
                        callback(data);
                    }
                    var total = data.total;
                    var pagesize =  data.pagesize;
                    var npage  =  total%pagesize==0?total/pagesize:total/pagesize+1;
                    if(flag){
                        if(page>npage){
                            flag.noData();
                        }
                        if(data.data.length<=0 || !(data.data)){
                            flag.lock();
                            flag.noData();
                        }
                        flag.resetload();
                    }
                },
                error:function () {
                    if(flag){
                        flag.resetload();
                    }
                }
            })
        }
        var page =1;
        var keywords="";
        $('#searchbtn').click(function () {
            keywords=$('#searchinput').val();
            update();
        });
        $('#searchbtn').click();
        function update(){
            $('.list').html('');
            $('.dropload-down').remove();
            $(window).scrollTop(0);
            page=1;
            appendhtml()
            drop()
        }
        function appendhtml(){
            onelist(page,keywords,'',function(data){
                var li='';
                if(data.data.length>0){
                    for(var i=0;i<data.data.length;i++){
                        var qiyequality = '无';
                        if (data.data[i].qiyequality != undefined) {
                            qiyequality = data.data[i].qiyequality;
                        }
                        li = '<li><a href=${pageContext.request.contextPath}/app/visitqiyedetail.action?userid=${userid}&&pkid='+data.data[i].pkid+'><dl><dt>' + data.data[i].qiyename+'</span></dt><dd><span>客户经理：</span>' + data.data[i].username  + '</dd><dd><span>融资需求：</span>' + data.data[i].findemand + '</dd><dd><span>外出日期：</span>' + data.data[i].visitdate + '</dd><dd><span>录入时间：</span>' + data.data[i].lurushijian + '</dd></dl></a></li>'
                        $('.list').append(li);
                    };
                }
            });
        }
        function drop(){
            $(".listbox").dropload({
                scrollArea : window,
                domDown : {
                    domClass   : 'dropload-down',
                    domRefresh : '<div class="dropload-refresh"></div>',
                    domLoad    : '<div class="dropload-load"><span class="loading"></span>正在加载...</div>',
                    domNoData  : '<div class="dropload-noData">已经全部加载完毕</div>'
                },
                loadDownFn : function(me) {
                    page++;
                    onelist(page,keywords, me,function(data){
                        var li='';
                        if(data.data.length>0){
                            for(var i=0;i<data.data.length;i++){
                                var qiyequality = '无';
                                if (data.data[i].qiyequality != undefined) {
                                    qiyequality = data.data[i].qiyequality;
                                }
                                li = '<li><a href=${pageContext.request.contextPath}/app/visitqiyedetail.action?userid=${userid}&&pkid='+data.data[i].pkid+'><dl><dt>' + data.data[i].qiyename+'</span></dt><dd><span>客户经理：</span>' + data.data[i].username  + '</dd><dd><span>融资需求：</span>' + data.data[i].findemand + '</dd><dd><span>外出日期：</span>' + data.data[i].visitdate + '</dd><dd><span>录入时间：</span>' + data.data[i].lurushijian + '</dd></dl></a></li>'
                                $('.list').append(li);
                            };
                        }
                    });
                }
            });
        }
    </script>
</body>
</html>