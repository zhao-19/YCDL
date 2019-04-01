<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="政策申报"/>
</jsp:include>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
    <body class="zcss">

    <div class="search clearfix">
    <form id="search" action="${pageContext.request.contextPath}/app/zcsblist.action" method="post">
        <input type="search" class="search-box fl" id="searchinput"  autocomplete="off"  placeholder="请输入关键词查询高新区政策，如“挂牌奖励”" key=""/>
        <input name="key" type="hidden" >
        <%--<a href="${pageContext.request.contextPath}/app/zcsblist.action?key=贷款贴息" class="search-cancel fl">确定</a>--%>
        <input type="submit" id="searchbtn" class="search-cancel" value="确定">
    </form>
    </div>
    <p class="tc dropload-load"><span class="loading"></span>加载中...</p>
    <div class="zcss-list" style="display:none;">
        <ul>
            <li id="kind100">
                <!--<h2>支持金融服务实体经济</h2>-->
                <%--<dl>--%>
                    <%--<dt>创新债权融资补贴</dt>--%>
                    <%--<dd class="clearfix">--%>
                        <%--<a>贷款贴息</a>--%>
                        <%--<a>发债贴息</a>--%>
                        <%--<a>融资租赁补贴</a>--%>
                    <%--</dd>--%>
                <%--</dl>--%>
            </li>
            <li id="kind200"></li>
            <li id="kind300"></li>
            <li id="kind400"></li>
            <li id="kind500"></li>
            <li id="kind600"></li>
        </ul>
    </div>
    <script>
        function a() {
            $.ajax({
                cache: true,
                type: "POST",
                //            url:"/userextend/getPolicy.html",
                url: "${pageContext.request.contextPath}/app/zcsbdata.action",
                data: {
                    id: "",
                    releid: "${releid}"
                },
                dataType: "json",
                async: false,
                error: function(request) {
                    //alert("请求出错");
                },
                success: function(data) {
                    $('.dropload-load').hide();
                    $('.zcss-list').show();
                    for (var i = 0; i < data.length; i++) {
                    	var pn = data[i].policy_name;
                      if(true/* pn.indexOf("贷") == -1 && pn.indexOf("债") == -1 && pn.indexOf("资") == -1 */){//临时取消贷款贴息的前端展示
                        var da = data[i];
                        var id = da.id;
                        var toptype_code = da.toptype_code;//顶级栏目 code
                        var toptype_name = da.toptype_name;//顶级栏目 名称
                        var type_name = da.type_name;//二级栏目 名称
                        var policy_name = da.policy_name; //三级 政策名称
                        var policy_type = da.policy_type;//是否开放 开关
                        var top = null;
                        $(".zcss-list>ul>li>h2").each(function() {
                            if ($(this).html() == toptype_name) {
                                top = $(this).next();
                            }
                        });
                        var obj = null;
                        $(".toptitle").each(function() {
                            if ($(this).html() == type_name) {//第一次循环 为null 不执行
                                obj = $(this).next();
                            }
                        });
                        //三级 政策申报名称
                        var h2="<h2>"+toptype_name+"</h2>";
                        var html = "<a href=${pageContext.request.contextPath}/app/zcxq.action?id=" + data[i].id + ">" + policy_name + "</a>";
                        //二级栏目 标题+申报名称
                        var html1 = h2+"<dl><dt class='toptitle'>" + type_name + "</dt><dd>" + html + "</dd></dl>";
                        var html2 = "<dl><dt class='toptitle'>" + type_name + "</dt><dd>" + html + "</dd></dl>";
                        if(top == null){//如果没有生成顶级
                            if (obj == null) {//如果没有二级
                                if (toptype_code == 100) {//新增一个一级和二级
                                    $("#kind100").append(html1);
                                } else if (toptype_code == 200) {
                                    $("#kind200").append(html1);
                                } else if (toptype_code == 300) {
                                    $("#kind300").append(html1);
                                } else if (toptype_code == 400) {
                                    $("#kind400").append(html1);
                                } else if (toptype_code == 500) {
                                    $("#kind500").append(html1);
                                } else if (toptype_code == 600) {
                                    $("#kind600").append(html1);
                                }
                            } else {
                                obj.append(html);
                            }
                        }else{//如果有顶级
                            if (obj == null) {//但是没有二级
                                if (toptype_code == 100) {//新增一个一级和二级
                                    $("#kind100").append(html2);

                                } else if (toptype_code == 200) {
                                    $("#kind200").append(html2);
                                } else if (toptype_code == 300) {
                                    $("#kind300").append(html2);
                                } else if (toptype_code == 400) {
                                    $("#kind400").append(html2);
                                } else if (toptype_code == 500) {
                                    $("#kind500").append(html2);
                                } else if (toptype_code == 600) {
                                    $("#kind600").append(html2);
                                }
                            } else {//一级和二级都有
                                obj.append(html)
                            }
                        }
                        }
                    }
                }
            });
        }
        a();
//        $("#searchbtn").click(function() {
//            var val = $("#searchinput").val();
//            if (val == "") {
//                return false;
//            }
//            val = encodeURI(encodeURI(val));
//            $("input[name='key']").val(val);
//            $("#search").submit();
//        });
        $('#search').submit(function () {
            var val = $("#searchinput").val();
            if (val == "") {
                return false;
            }
            val = encodeURI(encodeURI(val));
            $("input[name='key']").val(val);
        })
        window.onload=function (ev) {
            $('#kind100 dt').each(function () {
                if($(this).html()=="创新债权融资补贴"){
                    $(this).parent('dl').remove();
                }
            })
        }
    </script>
</body>
</html>