<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="我的债权融资"/>
</jsp:include>
<style type="text/css">
    .myzqrz *{box-sizing: border-box;}
    .myzqrz{background: #eee;color:#666;}
    .list>li{margin-top:0.2rem;border-top:1px solid #e7e7e7;border-bottom:1px solid #e7e7e7;
        background: #fff;}
    .list>li>h2{height:0.85rem;line-height: 0.85rem;font-size: 0.28rem;padding:0 0.24rem;color:#444;}
    .list>li>h2>span{float: right;font-size: 0.22rem;}
    .list>li>ol{border-top:1px solid #e7e7e7;border-bottom:1px solid #e7e7e7;overflow: hidden;padding:0.24rem 0;}
    .list>li>ol>li{width: 33.33%;float: left;font-size: 0.28rem;text-align: center;border-right:1px solid #e7e7e7;}
    .list>li>ol>li:last-child{border-right: 0;}
    .list>li>ol>li>span{font-size: 0.26rem;margin-top:0.1rem;display: block;}
    .list>li>ol>li:first-child>p{color: #fc2b00;}
    .list>li>ol>li:nth-child(2)>p{color: #43b431;}
    .list>li>ol>li:nth-child(3)>p{color: #83c9ff;}
    .list>li>h3{padding:0.24rem;font-size: 0.26rem;border-bottom:1px solid #e7e7e7;}
    .list>li>p{padding:0.24rem;font-size: 0.22rem;color: #f36818;}
    .list>li>div{padding:0.24rem;overflow: hidden;border-bottom:1px solid #e7e7e7;}
    .list>li>div>ul{float: right;overflow: hidden;z-index: 10;}
    .list>li>div>ul>li{float: left;border-radius:0.2rem;border:1px solid #f36818;color:#f36818;font-size: 0.24rem;margin-left:0.2rem;padding:0.04rem 0.2rem;}
    .dropload-down,.dropload-up{height: 1rem ; line-height: 1rem;width:100%;text-align: center;}
</style>
<body class="myzqrz">
<input type="hidden" value="${userid}" id="userid">
<ul class="list">
    <!--<li>-->
        <!--<h2>成长贷 <span>驳回</span></h2>-->
        <!--<ol>-->
            <!--<li>-->
                <!--<p>¥108.00万</p>-->
                <!--<span>贷款金额</span>-->
            <!--</li>-->
            <!--<li>-->
                <!--<p>56465</p>-->
                <!--<span>贷款主体</span>-->
            <!--</li>-->
            <!--<li>-->
                <!--<p>贷款用途贷途</p>-->
                <!--<span>贷款用途</span>-->
            <!--</li>-->
        <!--</ol>-->
        <!--<h3>申请时间：2018-05-21 12：00</h3>-->
        <!--<div>-->
            <!--<ul>-->
                <!--<li>查看流程</li>-->
                <!--<li>取消申请</li>-->
            <!--</ul>-->
        <!--</div>-->
        <!--<p>哈哈哈哈哈或或</p>-->
    <!--</li>-->
</ul>

<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/bzModel.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/dropload/dropload.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
<script type="text/javascript">
    function onelist(page,flag,callback){
        $.ajax({
            url:'/app/getLoan.action',
            type:'post',
            cache:false,
            data:{
                curpage:page,
                userid:'${userid}'
//                userid:'crackajack'
            },
            dataType: 'json',
            beforeSend:function () {
            },
            success:function(result){
                if(page==1&&result.code!=100){
                    $('body').html('<div class="save"><img src="${pageContext.request.contextPath}/app/images/onlyVIP.png" alt=""><p>'+result.msg+'</p> </div>')
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
    $(function () {
        var page = 0;
        $(".myzqrz").dropload({
            scrollArea: window,
            domUp : {
                domClass   : 'dropload-up',
                domRefresh : '<div class="dropload-refresh">↓下拉可以刷新</div>',
                domUpdate  : '<div class="dropload-update">↑松开立即刷新</div>',
                domLoad    : '<div class="dropload-load"><span class="loading"></span>正在刷新数据中...</div>'
            },
            domDown : {
                domClass   : 'dropload-down',
                domRefresh : '<div class="dropload-refresh">↑上拉加载更多</div>',
                domLoad    : '<div class="dropload-load"><span class="loading"></span>正在加载更多数据...</div>',
                domNoData  : '<div class="dropload-noData">已经全部加载完毕 </div>'
            },
            loadUpFn: function (me) {
                page = 1;
                onelist(page, me, function (result) {
                    $('.list').html('');
                    var li = '';
                    if (result.data.length > 0) {
                        for (var i = 0; i < result.data.length; i++) {
                            var oper = '';
                            if (result.data[i].datagener == 'productapp' || result.data[i].datagener == 'product') {

                            } else if (result.data[i].datagener == 'loanapp') {
                                if (result.data[i].chstatus == '10401') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="cancel oper">取消申请</li></ul></div>'
                                } else {
                                    oper = '<div><ul><li class="look">查看流程</li></ul></div>'
                                }
                            } else if (result.data[i].datagener == 'loanproduct') {
                                if (result.data[i].chstatus == '10301') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="cancel oper">取消申请</li></ul></div>'
                                } else {
                                    oper = '<div><ul><li class="look">查看流程</li></ul></div>'
                                }
                            } else if (result.data[i].datagener == 'loanallot') {
                                if (result.data[i].chstatus == '10501') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="shouli oper">受理</li><li class="zanhuan oper">暂缓受理</li></ul></div>'
                                } else if (result.data[i].chstatus == '10502') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="fangk oper">放款</li><li class="butg oper">不通过</li></ul></div>'
                                } else {
                                    oper = '<div><ul><li class="look">查看流程</li></ul></div>'
                                }

                            }


                            li = '<li datagener="' + result.data[i].datagener + '" pkid="' + result.data[i].pkid + '" chno="' +
                                result.data[i].chno + '"chstatus="' + result.data[i].chstatus + '" userid  ="' +
                                result.data[i].userid + '"proid ="' + result.data[i].proid + '" genre ="' +
                                result.data[i].genre +
                                '">' +
                                '<h2>' + result.data[i].proname + '<span>' + result.data[i].chstatusname + '</span></h2>' +
                                ' <ol><li>' +
                                '<p>¥' + result.data[i].amount + '万</p>' +
                                '<span>贷款金额</span>' +
                                '</li><li>' +
                                '<p>' + result.data[i].genrename + '</p>' +
                                '<span>贷款主体</span>' +
                                '</li><li>' +
                                '<p>' + result.data[i].loanusagename + '</p>' +
                                '<span>贷款用途</span>' +
                                '</li>' +
                                '</ol>' +
                                '<h3>申请时间：' + result.data[i].createdate + '</h3>' +
                                oper +
                                ' <p>' + result.data[i].remark + '</p>' +
                                '</li>';
                            $('.list').append(li);
                        }
                        ;
                    }
                });
            },
            loadDownFn: function (me) {
                page++;
                onelist(page, me, function (result) {
                    var li = '';
                    if (result.data.length > 0) {
                        for (var i = 0; i < result.data.length; i++) {
                            var oper = '';
                            if (result.data[i].datagener == 'productapp' || result.data[i].datagener == 'product') {

                            } else if (result.data[i].datagener == 'loanapp') {
                                if (result.data[i].chstatus == '10401') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="cancel oper">取消申请</li></ul></div>'
                                } else {
                                    oper = '<div><ul><li class="look">查看流程</li></ul></div>'
                                }
                            } else if (result.data[i].datagener == 'loanproduct') {
                                if (result.data[i].chstatus == '10301') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="cancel oper">取消申请</li></ul></div>'
                                } else {
                                    oper = '<div><ul><li class="look">查看流程</li></ul></div>'
                                }
                            } else if (result.data[i].datagener == 'loanallot') {
                                if (result.data[i].chstatus == '10501') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="shouli oper">受理</li><li class="zanhuan oper">暂缓受理</li></ul></div>'
                                } else if (result.data[i].chstatus == '10502') {
                                    oper = '<div><ul><li class="look">查看流程</li><li class="fangk oper">放款</li><li class="butg oper">不通过</li></ul></div>'
                                } else {
                                    oper = '<div><ul><li class="look">查看流程</li></ul></div>'
                                }

                            }


                            li = '<li datagener="' + result.data[i].datagener + '" pkid="' + result.data[i].pkid + '" chno="' +
                                result.data[i].chno + '"chstatus="' + result.data[i].chstatus + '" userid  ="' +
                                result.data[i].userid + '"proid ="' + result.data[i].proid + '" genre ="' +
                                result.data[i].genre +
                                '">' +
                                '<h2>' + result.data[i].proname + ' <span>' + result.data[i].chstatusname + '</span></h2>' +
                                ' <ol><li>' +
                                '<p>¥' + result.data[i].amount + '万</p>' +
                                '<span>贷款金额</span>' +
                                '</li><li>' +
                                '<p>' + result.data[i].genrename + '</p>' +
                                '<span>贷款主体</span>' +
                                '</li><li>' +
                                '<p>' + result.data[i].loanusagename + '</p>' +
                                '<span>贷款用途</span>' +
                                '</li>' +
                                '</ol>' +
                                '<h3>申请时间：' + result.data[i].createdate + '</h3>' +
                                oper +
                                ' <p>' + result.data[i].remark + '</p>' +
                                '</li>';
                            $('.list').append(li);
                        }
                        ;
                    }
                });
            }

        })
    })
    function detail(){//跳转详情页
        $('.list').delegate('>li','click',function(){
            var para = new Object();
            para.datagener = $(this).attr('datagener');
            para.pkid = $(this).attr('pkid');
            para.userid = $(this).attr('userid');
            para.proid = $(this).attr('proid');
            para.genre = $(this).attr('genre');
            window.webkit.messageHandlers.grzxzqrzxq.postMessage(para);
        })
    }
    detail();
    function look(){//查看流程按钮
        $('.list').delegate('.look','click',function(event){
            event.stopPropagation();
            var li=$(this).parent().parent().parent();
            var genre;
            if(li.attr('datagener')=='loanapp'){
                genre='11222'
            }else if(li.attr('datagener')=='loanproduct'||li.attr('datagener')=='loanallot'){
                genre='11202'
            }
            var para = new Object();
            para.releid = li.attr('pkid');
            para.genre = genre;
            para.btntitle = $.trim($(this).text());
            window.webkit.messageHandlers.grzxlcxq.postMessage(para);
        })
    }
    look();
    function oper(){//其余几个操作按钮
        $('.list').delegate('.oper','click',function(event){
            event.stopPropagation();
            var li=$(this).parent().parent().parent();
            var chstatus;
            if($(this).hasClass('cancel')){
                if(li.attr('datagener')=='loanapp'){
                    chstatus ='10404';
                }else if(li.attr('datagener')=='loanproduct'){
                    chstatus ='10304';
                }
            }else if($(this).hasClass('shouli')){
                chstatus ='10502';
            }else if($(this).hasClass('zanhuan')){
                chstatus ='10505';
            }else if($(this).hasClass('fangk')){
                chstatus ='10503';
            }else if($(this).hasClass('butg')){
                chstatus ='10504';
            }
            var para = new Object();
            para.datagener = li.attr('datagener');
            para.pkid = li.attr('pkid');
            para.chno = li.attr('chno');
            para.chstatus = chstatus ;
            para.btntitle = $.trim($(this).text());
            window.webkit.messageHandlers.grzxczan.postMessage(para);
        })
    }
    oper();
    
    function reload() {
    	location.reload();
    }

</script>
</body>
</html>