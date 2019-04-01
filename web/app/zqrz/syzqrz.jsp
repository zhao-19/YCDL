<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="债权融资"/>
</jsp:include>
<style type="text/css">
    *{box-sizing: border-box;font-size:0.26rem;color:#666;}
    /*列表样式*/
    #slider1{ padding-top:1.8rem; background: #eee;}
    .libox>ul>li{height:2.4rem;margin-bottom:0.2rem;background: #fff;padding:0.2rem;overflow: hidden;}
   .libox>ul>li img{width:1.6rem;height:1.6rem;float: left;margin-top:0.2rem;}
   .libox>ul>li .fl{width: 25%;position: relative;}
    .libox>ul>li .fl>i{position: absolute; top:0.1rem;left:0;width: 0.8rem; height: 0.3rem; line-height: 0.3rem; background: #c5b077; color: #fff; font-size: 0.24rem; text-align: center; border-radius: 1px;}
   .libox>ul>li .fr{width: 75%;line-height: 0.45rem;}
   .libox>ul>li .fr h2{overflow: hidden;margin-top:0.05rem;}
   .libox>ul>li .fr h3, .libox>ul>li .fr div{overflow:hidden;white-space: nowrap;text-overflow:ellipsis;}
   .libox>ul>li .fr div>span:first-child{margin-right: 0.5rem;}
   .libox>ul>li .fr h3{margin-bottom: 0.12rem;font-size: 0.24rem;}
   .libox>ul>li .fr div b{color:#fc5f00;font-family: "微软雅黑";}
   .libox>ul>li .fr h2>span{ float:left;line-height:0.28rem;color:#08b16b;border:1px solid #08b16b;border-radius:0.1rem;padding:0 0.1rem;margin-left:0.08rem;font-size: 0.2rem;margin-top:0.05rem;}
   .libox>ul>li .fr h2>b{ float:left;font-weight: normal;font-size: 0.3rem;color:#333;}
    .dropload-down,.dropload-up{height: 1rem ; line-height: 1rem;width:100%;text-align: center;}
   .libox li .fr>p>b{color:#ef0000;font-family: "微软雅黑";}

   /*头部筛选样式*/
    .shaixuan *{color: #141414;outline: none;  -webkit-tap-highlight-color: rgba(0,0,0,0);}
    .shaixuan{border-bottom:1px solid #eee;position: fixed;top:0;left:0;
        z-index: 100;  width: 100%;height:1.8rem;  background: #fff; }
    .kinds{padding:0 0.25rem 0 0.6rem;height:0.9rem;line-height: 0.9rem;}
    .kinds>li.fl{margin-right: 0.6rem;}
    .kinds>li{font-size: 0.24rem;padding-right: 0.25rem; background-repeat: no-repeat;background-position: right center;background-size: 0.18rem 0.09rem;}
    .paixubtn{background-image: url("${pageContext.request.contextPath}/app/images/zqrz/zqdown.png")}
    .paixubtn.on{color:#ff991d;background-image: url("${pageContext.request.contextPath}/app/images/zqrz/zqdown_on.png")}
    .paixubtn.active{color:#ff991d;background-image: url("${pageContext.request.contextPath}/app/images/zqrz/zqup_on.png")}
    .bankbtn{background-image: url("${pageContext.request.contextPath}/app/images/zqrz/zqdown.png")}
    .bankbtn.on{color:#ff991d;background-image: url("${pageContext.request.contextPath}/app/images/zqrz/zqdown_on.png")}
    .kinds>li.shaixuanbtn{background-image: url("${pageContext.request.contextPath}/app/images/zqrz/shaixuan.png");background-size: 0.18rem 0.18rem;}
    .loantype{padding:0.15rem;border-top:1px solid #eee;}
    .loantype>li{width:22%;height:0.6rem;line-height:0.6rem;margin:0 1.5%;background: #f7f7f7;font-size: 0.24rem;
        border:1px solid #f7f7f7;text-align: center;float: left;border-radius: 0.08rem;}
    .loantype>li.on{border-color:#ff991d;color:#ff991d;background: transparent;}
    .paixu{position: fixed;display: none;width: 100%;left:0;top:0.9rem;background: #fff;z-index: 100;}
    .paixu>li{border-top:1px solid #eee;height:0.9rem;line-height: 0.9rem;padding-left: 0.6rem;}
    .paixu>li.on,.paixubtn.on{color:#ff991d;}
    .fixbg{position: fixed;width: 100%;height: 100%;background: rgba(0,0,0,0.3);z-index: 90;display: none;}

</style>
<body class="zqrzlist" style="background: #eee;">
<div class="shaixuan">
    <ul class="kinds ov">
        <li class="fl paixubtn on">智能排序</li>
        <!--<li class="fl bankbtn" href="10005">银行</li>-->
        <li class="fr shaixuanbtn">筛选</li>
    </ul>
    <ul class="paixu">
        <li href="10001" class="on">智能排序</li>
        <li href="10002">利率最低</li>
        <li href="10003">人气最高</li>
        <li href="10004">额度最高</li>
        <li href="10005">银行名称</li>
    </ul>
    <ul class="loantype ov">
        <li href="" class="on">全部贷款</li>
        <li href="10101">政策性贷款</li>
        <li href="10103">商业性贷款</li>
        <li href="10102">个人贷款</li>
    </ul>
    <div class="fixbg"></div>
</div>

<div id="slider1">
    <ul class="ulbox">
        <li class="libox one">
            <ul></ul>
        </li>
    </ul>
</div>


<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/bzModel.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/dropload/dropload.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
<script type="text/javascript">
    function onelist(page,type,sort,area,flag,callback){
        var obj={
            curpage:page,
            prodtype:type,
            sort:sort,
            area:area
        }
        $.ajax({
            url:'/app/getProductList.action',
//            url:'https://apps.winpow.com/app/getProductList.action',
            type:'post',
            cache:false,
            data:obj,
            dataType: 'json',
            beforeSend:function () {
//                console.log(obj)
            },
            success:function(result){
                var h=parseInt(document.documentElement.style.fontSize)*2.6*result.data.length;

                if(page==1){
                    $('#slider1').height(h);
                }
                if(callback instanceof Function){
                    callback(result);
                }
                var total = result.total;
                var pagesize =  result.pagesize;
                var npage  =  total%pagesize==0?total/pagesize:total/pagesize+1;
                if(flag){
                    if(page>npage){
                        flag.noData();
                        //$('.loading').show().html('亲，没有数据可以加载了！！！');
                        //flag;
                    }
                    if(result.data.length<=0 || !(result.data)){
                        flag.lock();
                        flag.noData();
                    }
                    flag.resetload();
                }
            },
            error:function () {
                //$('.loading').show().html('亲，没有数据可以加载了！！！');
                if(flag){
                    flag.resetload();
                }
            }
        })
    }



//    $(function () {
        var page =1;
        var type="";
        var sort="10001";
        var area="";
        $('.paixubtn').click(function(){
//            if(!$(this).hasClass('on')){
//                sort=$('.paixu>li.on').attr('href');
//                update();
//            }
            $(this).addClass('on').siblings('.on').removeClass('on');
            $(this).toggleClass('active')
            $('.paixu').slideToggle(300);
            $('.fixbg').fadeToggle(300);
            $('.paixu>li.gray').removeClass('gray').addClass('on');
        });
        $('.paixu>li').click(function () {
            if(sort!=$(this).attr('href')){
                $(this).addClass('on').siblings('.on').removeClass('on');
                $('.paixubtn').html($(this).html());
                $('.paixubtn').removeClass('active');
                sort=$('.paixu>li.on').attr('href');
               update();
            }
            $('.paixu').slideUp(300);
            $('.fixbg').fadeOut(300);
        });
        $('.fixbg').click(function () {
            $(this).fadeOut(300);
            $('.paixu').slideUp(300);
            $('.paixubtn').removeClass('active');
        })
//        $('.bankbtn').click(function () {
//            $(this).addClass('on').siblings('.on').removeClass('on');
//            $(this).siblings('.active').removeClass('active');
//            $('.paixu>li.on').removeClass('on').addClass('gray');
//            $('.paixu').slideUp(300);
//            $('.fixbg').fadeOut(300);
//            sort="10005";
//            update();
//        });
        $('.loantype>li').click(function () {
            $(this).addClass('on').siblings('.on').removeClass('on');
            type=$('.loantype>li.on').attr('href')
            update();
        })
        $('.loantype>li.on').click();

        function shaixuanback(obj) {
            area=obj;
            update();
        }

        function update(){
            $('.one>ul').html('');
            $('.dropload-down').remove();
            $(window).scrollTop(0);
            page=1;
            appendhtml()
            drop()
        }
        function appendhtml(){
            onelist(page,type,sort,area,'',function(result){
                var li='';
                if(result.data.length>0){
                    for(var i=0;i<result.data.length;i++){
                        var bank,money,img,you;
                        if(result.data[i].productdetail==''){
                            bank='无'
                        }else{
                            bank=result.data[i].productdetail;
                        }
                        if(result.data[i].loanamt==result.data[i].loanamtmax){
                            money=result.data[i].loanamt;
                        }else{
                            money=result.data[i].loanamt+'万~'+result.data[i].loanamtmax
                        }
                        if(result.data[i].picurl==""){
                            img='/app/images/logo_gray.png'
                        }else{
                            img=result.data[i].picurl;
                        }
                        if(result.data[i].sift=="10001"){
                            you='<i>优选</i>';
                        }else{
                            you='';
                        }
                        li = '<li href="'+result.data[i].id+'" parentId="'+result.data[i].prodtype+'">'+
                            '<div class="fl">'+you+
                                '<img src="${pageContext.request.contextPath}'+img+'" alt="">'+
                            '</div><div class="fr">'+
                            '<h2><b>'+result.data[i].prodname+'</b><span>'+result.data[i].biaoqians[0]+'</span></h2>'+
                            '<h3>'+bank+'</h3><div>'+
                            ' <span>年利率：<b>'+result.data[i].loanrate+'%</b></span>'+
                            '<span>适用地区：'+result.data[i].loanarea+'</span>'+
                            '</div>'+
                            ' <p>贷款额度：<b>¥'+result.data[i].loanamt+'万~'+result.data[i].loanamtmax+'万</b></p>'+
                            '</div> </li>'
                        $('.one>ul').append(li);
                    };
                }
            });
        }
        function drop(){
            $(".one").dropload({
                scrollArea : window,
                domDown : {
                    domClass   : 'dropload-down',
                    domRefresh : '<div class="dropload-refresh"></div>',
                    domLoad    : '<div class="dropload-load"><span class="loading"></span>正在加载...</div>',
                    domNoData  : '<div class="dropload-noData">已经全部加载完毕</div>'
                },
                loadDownFn : function(me) {
                    page++;
                    onelist(page,type,sort,area, me,function(result){
                        var li='';
                        if(result.data.length>0){
                            for(var i=0;i<result.data.length;i++){
                                var bank,money,img,you;
                                if(result.data[i].productdetail==''){
                                    bank='无'
                                }else{
                                    bank=result.data[i].productdetail;
                                }
                                if(result.data[i].loanamt==result.data[i].loanamtmax){
                                    money=result.data[i].loanamt;
                                }else{
                                    money=result.data[i].loanamt+'万~'+result.data[i].loanamtmax
                                }
                                if(result.data[i].picurl==""){
                                    img='/app/images/logo_gray.png'
                                }else{
                                    img=result.data[i].picurl;
                                }
                                if(result.data[i].sift=="10001"){
                                    you='<i>优选</i>';
                                }else{
                                    you='';
                                }
                                li = '<li href="'+result.data[i].id+'" parentId="'+result.data[i].prodtype+'">'+
                                    '<div class="fl">'+you+
                                '<img src="${pageContext.request.contextPath}'+img+'" alt="">'+
                                    '</div><div class="fr">'+
                                    '<h2><b>'+result.data[i].prodname+'</b><span>'+result.data[i].biaoqians[0]+'</span></h2>'+
                                    '<h3>'+bank+'</h3><div>'+
                                    ' <span>年利率：<b>'+result.data[i].loanrate+'%</b></span>'+
                                    '<span>适用地区：'+result.data[i].loanarea+'</span>'+
                                    '</div>'+
                                    ' <p>贷款额度：<b>¥'+result.data[i].loanamt+'万~'+result.data[i].loanamtmax+'万</b></p>'+
                                    '</div> </li>'
                                $('.one>ul').append(li);
                            };
                        }
                    });
                }
            });
        }

//    })

    function postid(){//获取产品id和父类id
        $('.ulbox>li>ul').delegate('li','click',function(){
            var para = new Object();
            para.id = $(this).attr('href');
            para.prodtype = $(this).attr('parentId');
            window.webkit.messageHandlers.tozqrzxq.postMessage(para);
        })
    }
    postid();

    $('.shaixuanbtn').click(function () {
        window.webkit.messageHandlers.shaixuanbtn.postMessage('');
    });


</script>

</body>
</html>