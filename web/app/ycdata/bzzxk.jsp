<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="盈创数据标准增信库"/>
</jsp:include>
<body class="bzdzk">
<table class="bzdzk-table">
    <thead>
    <tr>
        <th width="25%">企业名称</th>
        <th>标准名称</th>
        <th width="25%">增信权重</th>
        <th width="25%">授信额度</th>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>
<%--<div class="loading">数据拼命加载中...</div>--%>
<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/bzModel.js"></script>
<script  type="text/javascript" src="${pageContext.request.contextPath}/app/js/dropload/dropload.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/dropload/dropload.css">
<script type="text/javascript">
    var page =0;
    $(function () {

//        bzDataList(1,1);
        $(".bzdzk").dropload({
            scrollArea : window,
            loadDownFn : function(me) {
                page++;
                bzDataList(page, 3, me,function(result){
                    var card='';
                    if(result.list.length>0){
                        for(var i=0;i<result.list.length;i++){
                            card = '<tr>'+
                            '<td>'+result.list[i].qiyemingcheng+'</td>' +
                            '<td>'+result.list[i].biaozhunmingcheng+'</td>' +
                            '<td>'+result.list[i].zengxinquanzhong+'</td>' +
                            '<td>'+result.list[i].shouxinedu+'</td>' +
//                            '<td>'+result.list[i].zhiwu+'</td>' +
                            '</tr>';
                            $('tbody').append(card);
                        };
                    }
                });
            }
        });

    })
</script>
</body>
</html>