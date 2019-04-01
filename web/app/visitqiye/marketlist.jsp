<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
<!doctype html>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="外出拜访企业"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
<style>
    *{box-sizing: border-box;}
    .zcsblb li dt{padding:0 0.22rem;background: none;color: #141414;font-size: 0.3rem}
    .zcsblb li dt>span{color:#ff8c7e;font-size: 0.26rem;}
    .zcsblb li dd{padding:0.22rem;font-size: 0.26rem;color:#333;}
    .search .search-box{font-size: 0.26rem;color:#333;border-color: #ddd;}
    .search .search-cancel{color: #333;}
    .newadd a{display: block;padding: 0 0.3rem;line-height: 0.6rem;text-align: center;color: #fff;font-size: 0.3rem;
        background: #ff991d;border-radius: 0.1rem;margin-top: 1.2rem;margin-right: 2%; float:right;}
    .zcsblb ul{padding-top: 0.2rem;}
</style>
<body class="zcsblb fundlist">
<div class="search clearfix">
    <input type="text" value="" class="search-box fl" id="searchinput" autocomplete="off" placeholder="请输入要查询的拜访人电话" value=""/>
    <input type="button" id="searchbtn" class="search-cancel" value="确定">
    <input type="hidden" id='hidkey' value="${userid}">
</div>
<div class="newadd ov">
    <a href="${pageContext.request.contextPath}/apps/marketeEdit.action?userid=${userid}&&f_id=${f_id}&&qiyename=">新增<span id="name"></span>营销记录</a>
</div>
<div class="listbox">
    <ul class="list"></ul>
</div>
<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/bzModel.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/dropload/dropload.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/skin/layer.css">-->
<script src="${pageContext.request.contextPath}/app/js/layer/layer.js"></script>
<script>

    var qiyename=decodeURI('${qiyename}');
    $("#name").html(qiyename);

    $('.newadd>a').click(function (e) {
        $(this).attr('href',$(this).attr('href')+ encodeURI(encodeURI(qiyename)))
        var lock = '${lock}';
        var custmanage = '${custmanage}';
        var userid = '${userid}';
        var commdate = $(".list>li:first dl>dd:nth-child(6)>i").html();
        var inputuser = $(".list>li:first dl>dd:nth-child(5)>i").html();
        var day = -10;
        if (typeof(commdate) != "undefined") {
            day = Math.floor((new Date() - new Date(commdate)) / (24 * 3600 * 1000));
        }
        if (lock == "10001" && userid != inputuser && custmanage != userid) {
            e.preventDefault();
            layer.alert("该企业已有客户经理维护，暂不能新增!", {icon: 2, title : '提示',closeBtn: 0,btnAlign: 'c'});
            // layer.msg("该企业已有客户经理维护，暂不能新增!");
        }
    })

    // 时间戳格式化
    function timeformat(timestamp) {
        if (typeof(timestamp) == "undefined") {
            return "";
        }
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' ';
        var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
        var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
        var s = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds();
        return Y + M + D + h + m + s;
    }
    function onelist(page,keywords,flag,callback){
        var obj={
            pageNumber:pageNumber,
            cellphone:keywords,
            pageSize:20,
            f_id:'${f_id }'
        }
        $.ajax({
            url:'/apps/marketeList.action',
            type:'post',
            cache:false,
            data:obj,
            dataType: 'json',
            beforeSend:function () {

            },
            success:function(data){
                var h=parseInt(document.documentElement.style.fontSize)*2.6*data.data.list.length;

                if(pageNumber==1){
                    $('.listbox').height(h);
                }
                if(callback instanceof Function){
                    callback(data);
                }
                var total = data.total;
                var pagesize =  data.pagesize;
                var npage  =  total%pagesize==0?total/pagesize:total/pagesize+1;
                if(flag){
                    if(pageNumber>npage){
                        flag.noData();
                    }
                    if(data.data.list.length<=0 || !(data.data.list)){
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
    var pageNumber =1;
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
        pageNumber=1;
        appendhtml()
        drop()
    }
    function appendhtml(){
        onelist(pageNumber,keywords,'',function(data){
            var li='';
            if(data.data.list.length>0){
                for(var i=0;i<data.data.list.length;i++){
                    var vistperson = data.data.list[i].vistperson?data.data.list[i].vistperson:'--';
                    var date=timeformat(data.data.list[i].commdate);
                    li = '<li><a href=${pageContext.request.contextPath}/apps/marketeEdit.action?userid=${userid}&&pkid='+data.data.list[i].pkid+'&&qiyename='+encodeURI(encodeURI(qiyename))+'><dl><dt>' +vistperson+'</span></dt><dd><span>拜访人电话：</span>' + data.data.list[i].visttele + '</dd><dd><span>拜访人职位：</span>' + data.data.list[i].vistposition + '</dd><dd><span>沟通类型：</span>' + data.data.list[i].commtype  + '</dd><dd><span>录入人：</span><i>' + data.data.list[i].inputuser + '</i></dd><dd><span>沟通时间：</span><i>' + date+ '</i></dd></dl></a></li>'
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
                pageNumber++;
                onelist(pageNumber,keywords, me,function(data){
                    var li='';
                    if(data.data.list.length>0){
                        for(var i=0;i<data.data.list.length;i++){
                            var vistperson = data.data.list[i].vistperson?data.data.list[i].vistperson:'--';
                            var date=timeformat(data.data.list[i].commdate )
                            li = '<li><a href=${pageContext.request.contextPath}/apps/marketeEdit.action?userid=${userid}&&pkid='+data.data.list[i].pkid+'&&qiyename='+encodeURI(encodeURI(qiyename))+'><dl><dt>' +vistperson+'</span></dt><dd><span>拜访人电话：</span>' + data.data.list[i].visttele + '</dd><dd><span>拜访人职位：</span>' + data.data.list[i].vistposition + '</dd><<dd><span>沟通类型：</span>' + data.data.list[i].commtype  + '</dd>dd><span>录入人：</span><i>' + data.data.list[i].inputuser + '</i></dd><dd><span>沟通时间：</span><i>' + date + '</i></dd></dl></a></li>';
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