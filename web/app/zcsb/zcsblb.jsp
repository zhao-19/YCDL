<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="政策申报查询结果"/>
</jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
    <body class="zcsblb">
    <div class="search clearfix">
    <input type="search" class="search-box fl" id="searchinput" autocomplete="off"  placeholder="请输入关键词查询高新区政策，如“贷款贴息”" value=""/>
    <input type="button" id="searchbtn" class="search-cancel" value="确定">
    <input type="hidden" id='hidkey' value="${key}">
    </div>
    <ul>
        <%--<li><a>--%>
            <%--<dl>--%>
                <%--<dt></dt>--%>
                <%--<dd><span>申报标准：</span>对自建金融科技项目的区内金融机构，按照项目实际成本的20%，给予最高50万元补贴。</dd>--%>
                <%--<dd><span>政策归属：</span>支持提升金融产业能级 突破发展金融科技产业</dd>--%>
            <%--</dl>--%>
        <%--</a></li>--%>
    </ul>
    <p class="tc dropload-load"><span class="loadmore">加载更多</span></p>
    <script>
    var pageNum=1;
    var toalpage;
     function a(pageNum){
        if($('#searchinput').val()==""){
             $('#searchinput').val(decodeURI(decodeURI($('#hidkey').val())))
        }
         var val=$('#searchinput').val();
        if(!pageNum){pageNum=1;}
        $.ajax({
            cache: true,
            type: "POST",
            url:"${pageContext.request.contextPath}/app/acsbsearch.action",
            data:{
                keyWord:val,
                pageNum:pageNum,
                pageSize:10
            },
            async: false,
            before:function(){
             $('.loadmore').html('<span class="loading"></span>加载中...')
            },
            error: function(request) {
                alert("请求出错");
            },
            success: function(data) {
                $('.loadmore').html('加载更多');
                 toalpage=data.totalPage;
                    if(pageNum==toalpage||data.data.length==0){
                         $('.loadmore').html('没有更多数据了');
                    }
                var li="";
                for(var i=0;i<data.data.length;i++){
                    li+='<li><a href=${pageContext.request.contextPath}/app/zcxq.action?id='+data.data[i].id+'><dl><dt>'+data.data[i].policy_name+'</dt><dd><span>申报标准：</span>'+data.data[i].sub_describe+'</dd><dd><span>政策归属：</span>'+data.data[i].toptype_name+'&nbsp;'+data.data[i].type_name+'</dd></dl></a></li>'
                }
                $('.zcsblb>ul').append(li);

            }
        });
    }
    a();
     //默认加载一次
    $('#searchbtn').click(function(){
        if($('#searchinput').val().trim()!=""){
            pageNum=1;
             $('.zcsblb>ul').html("");
            a(pageNum);
        }else{
             return false;
        }
     });
    $('.loadmore').click(function(){
        pageNum++;
        if(pageNum<=toalpage){
            a(pageNum);
        }
    })
    </script>
</body>
</html>