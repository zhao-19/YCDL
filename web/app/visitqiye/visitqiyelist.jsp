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
    .lock{background: url("${pageContext.request.contextPath}/app/images/visit/lock.png") no-repeat 98% center !important;
        background-size: 0.3rem 0.3rem !important;
    }
    .zcsblb li dt{padding:0 0.22rem;background: none;color: #141414;font-size: 0.3rem}
    .zcsblb li dt>span{color:#ff8c7e;font-size: 0.26rem;}
    .zcsblb li dd{padding:0.22rem;font-size: 0.26rem;color:#333;}
    .search .search-box{font-size: 0.26rem;color:#333;border-color: #ddd;}
    .search .search-cancel{color: #333;}
    .newadd a{display: block;padding: 0 0.3rem;line-height: 0.6rem;text-align: center;color: #fff;font-size: 0.3rem;
        background: #ff991d;border-radius: 0.1rem;margin-top: 1.2rem;margin-right: 2%; float:right;}
    .zcsblb ul{padding-top: 0.2rem;}
    .msg{margin-top:0.2rem;color:red;font-size: 0.24rem;
         /*display: none;*/
        visibility: hidden;

    }

    .inputRow{margin:0.1rem 0;font-size: 0.28rem;color: #141414}
    .inputRow>span{width: 30%;float: left;text-align: right;line-height: 0.7rem;}
    .inputRow>span>i{color: red;}
    .inputRow>div{width: 62%;float: left;margin-left: 3%;}
    .inputRow>div>input{width: 100%;border:1px solid #ddd;line-height: 0.7rem;padding:0 0.2rem;font-size: 0.3rem;color: #141414;margin-bottom: 0.1rem;}
    .ui-widget.ui-widget-content{z-index: 100000000;}
    .ui-menu-item{padding-bottom: 0 !important;}
    /*.layui-layer-btn0{background:#ff991d !important;}*/
    /*.layui-layer-btn1{background:#ddd !important;}*/
    .layui-layer-btn a{margin:0px 10px 5px!important;}
</style>
<body class="zcsblb fundlist">
    <div class="search clearfix">
        <input type="text" value="" class="search-box fl" id="searchinput" autocomplete="off" placeholder="请输入要查询的公司名称" value=""/>
        <input type="button" id="searchbtn" class="search-cancel" value="确定">
        <input type="hidden" id='hidkey' value="${userid}">
    </div>
    <div class="newadd ov">
        <a href="#">新增企业</a>
    </div>
    <div class="listbox">
        <ul class="list"></ul>
    </div>

    <script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/bzModel.js"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/dropload/dropload.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
    <script src="${pageContext.request.contextPath}/app/js/layer/layer.js"></script>
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/skin/layer.css">-->
    <!--<script src="${pageContext.request.contextPath}/app/js/layer.js"></script>-->

    <link rel="stylesheet" href="/css/jquery-ui.min.css"/>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script>
    var index;
    var click = false;
      window.onload=function(){
          $('.noFid').click(function (e) {
              e.preventDefault();
              layer.alert('该用户未成功关联企业，请稍候重试！')
          })

          $('.newadd>a').click(function (e) {
              e.preventDefault();
              index=layer.open({
                  type: 1,
                  title:'新增企业',
                  skin: 'layui-layer-demo', //样式类名
                  closeBtn: 0, //不显示关闭按钮
                  btn:['确定','取消'],
                  btnAlign: 'c',
                  anim: 2,
                  area: ['330px'], //宽高
                  // shadeClose: true, //开启遮罩关闭
                  content: '  <form action="" id="addQiye">\n' +
                  '        <input type="hidden" id="dizhi" name="dizhi"/>\n' +
                  '        <input type="hidden" id="zhuceziben" name="zhuceziben"/>\n' +
                  '        <input type="hidden" id="faren" name="faren"/>\n' +
                  '        <input type="hidden" id="chengliriqi" name="chengliriqi"/>\n' +
                  '        <input type="hidden" id="jingyingfanwei" name="jingyingfanwei"/>\n' +
                  '        <input type="hidden" id="userid" name="userid" value="${userid}"/>\n' +
                  '        <div class="inputRow ov" style="margin-top: 25px;">\n' +
                  '            <span>企业名称 <i>*</i></span>\n' +
                  '            <div>\n' +
                  '                <input name="qiyename" id="qiyename" maxlength="128"  auto-complete auto-complete-data="autoCompleteData"/>\n' +
                  '                <span class="umsg msg">请正确输入企业名称！</span>\n' +
                  '            </div>\n' +
                  '        </div>\n' +
                  '        <div class="inputRow ov">\n' +
                  '            <span>社会信用代码 <i>*</i></span>\n' +
                  '            <div>\n' +
                  '                <input name="zzjgdm" id="zzjgdm" maxlength="36"/>\n' +
                  '                <span class="pmsg msg">请正确输入社会信用代码！</span>\n' +
                  '            </div>\n' +
                  '        </div>\n' +
                  '        <div class="inputRow ov">\n' +
                  '            <span>手机号 <i>*</i></span>\n' +
                  '            <div>\n' +
                  '                <input name="cellphone" id="cellphone" maxlength="11"/>\n' +
                  '                <span class="cmsg msg">请正确输入手机号！</span>\n' +
                  '            </div>\n' +
                  '        </div>\n' +
                  '    </form>',
                  yes:function(index, layero){

                      if(!click){
                          click = true;
                          addqiye();
                      }

                  }
              });
          })
      }

        //    新增
        function addqiye()	{
            setTimeout(function () {
                click = false;
            },2000);

            $(".msg").css('visibility', 'hidden');

            var sum = 1;
            if ($("#qiyename").val() == "") {
                $(".umsg").css('visibility', 'visible')
                sum = 0;
            }
            var zzjgdm = $("#zzjgdm").val();
            var zzcheck = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
            if (!zzcheck.test(zzjgdm)) {
                $(".pmsg").css('visibility', 'visible')
                sum = 0;
            }
            var mobile = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
            var cellphone = $("#cellphone").val();
            if (cellphone.length != 11 || !mobile.test(cellphone)) {
                $(".cmsg").css('visibility', 'visible')
                sum = 0;
            }
            if (sum == 1) {
                $.ajax({
                    type: 'post',
                    url: "/apps/addQiyeImpl.action",
                    dataType: "json",
                    data: $("#addQiye").serialize(),
                    success: function(data) {
                        layer.msg(data.msg)
                        if (data.msg == "新增企业成功！") {
                            layer.close(index);
                            update();

                        }
                    }
                });
            }
        }
        //搜索企业
        $('body').delegate('#qiyename','click',function () {
            $(this).autocomplete({
                source: function(request, response) {
                    var key = $("#qiyename").val();
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
                                        code: item.credit_code,
                                        dizhi: item.address,
                                        zhuceziben: item.regist_capi,
                                        faren: item.oper_name,
                                        chengliriqi: item.term_start,
                                        jingyingfanwei: item.business_scope
                                    }
                                }));
                        }
                    });
                },
                select: function(event, ui) {
                    var riqi = ui.item.chengliriqi;
                    $('#zzjgdm').val(ui.item.code);
                    $('#dizhi').val(ui.item.dizhi);
                    $('#zhuceziben').val(ui.item.zhuceziben);
                    $('#faren').val(ui.item.faren);
                    $('#chengliriqi').val((riqi == null || riqi.length < 10) ? riqi : riqi.substr(0,10));
                    $('#jingyingfanwei').val(ui.item.jingyingfanwei);
                },
                minLength: 2
            });
        })



        function onelist(page,keywords,flag,callback){
            var obj={
                pageNumber:pageNumber,
                qiyename:keywords,
                pageSize:20,
                // cellphone:'13510234578'
            }
            $.ajax({
                url:'/apps/getQiyeList.action',
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
                        var qiyename = data.data.list[i].qiyename?data.data.list[i].qiyename:'--'
                        var noFid = data.data.list[i].f_id?'':'noFid';
                        var lock = data.data.list[i].lock=='10002'?'':'lock';
                        li='<li><a class="'+noFid+'" href="${pageContext.request.contextPath}/apps/marketeListPage.action?userid=${userid}&&lock='+data.data.list[i].lock+'&&custmanage='+data.data.list[i].custmanage+'&&f_id='+data.data.list[i].f_id+'&&qiyename='+encodeURI(encodeURI(data.data.list[i].qiyename))+'"><dl><dt class="'+lock+'">' + qiyename+'</span></dt><dd><span>信用代码：</span>' + data.data.list[i].zzjgdm + '</dd><dd><span>用户名称：</span>' + data.data.list[i].userid  + '</dd><dd><span>联系电话：</span>' + data.data.list[i].cellphone + '</dd></dl></a></li>'
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
                                var qiyename = data.data.list[i].qiyename?data.data.list[i].qiyename:'--'
                                var noFid = data.data.list[i].f_id?'':'noFid';
                                var lock = data.data.list[i].lock=='10002'?'':'lock';
                                li='<li><a class="'+noFid+'" href="${pageContext.request.contextPath}/apps/marketeListPage.action?userid=${userid}&&lock='+data.data.list[i].lock+'&&custmanage='+data.data.list[i].custmanage+'&&f_id='+data.data.list[i].f_id+'&&qiyename='+encodeURI(encodeURI(data.data.list[i].qiyename))+'"><dl><dt class="'+lock+'">' + qiyename+'</span></dtclass><dd><span>信用代码：</span>' + data.data.list[i].zzjgdm + '</dd><dd><span>用户名称：</span>' + data.data.list[i].userid  + '</dd><dd><span>联系电话：</span>' + data.data.list[i].cellphone + '</dd></dl></a></li>'
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