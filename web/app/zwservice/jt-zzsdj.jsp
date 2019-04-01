<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="增值税登记"/>
</jsp:include>
<body class="zwfw">
<div class="zwfw-top">
    <dl><dt>主管部门</dt><dd>国税局</dd></dl>
    <dl><dt>业务咨询</dt><dd>028-85195475</dd></dl>
    <dl><dt>办理窗口</dt><dd>政务服务中心国税局窗口</dd></dl>
    <dl><dt>交通线路</dt><dd>天府大道北段18号A座高新区管委会3楼</dd></dl>
    <dl><dt>工作时间</dt><dd>政务服务中心国税窗口，周一至周六，9:00-17:00</dd></dl>
</div>
<div class="zwfw-nav">
    <span class="active">申请材料</span>
    <span>办理流程</span>
</div>
<ul class="zwfw-cont">
    <li>
        <table>
            <thead>
            <tr>
                <th width="55%">材料名称</th>
                <th width="15%">材料说明</th>
                <th width="10%">材料形式</th>
                <th width="10%">附件</th>
                <th width="10%">出具单位</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>《增值税一般纳税人资格登记表》</td>
                <td>无</td>
                <td>纸制材料</td>
                <td>无</td>
                <td>无</td>
            </tr>
            <tr>
                <td>税务登记证件</td>
                <td>无</td>
                <td>纸制材料</td>
                <td>无</td>
                <td>无</td>
            </tr>
            </tbody>
        </table>
    </li>
    <li>
        <p><span>第一步：</span>办税服务厅接收资料，核对资料是否齐全、是否符合法定形式、填写内容是否完整，符合的录入相关信息，并在税务登记证件上加盖“增值税一般纳税人”戳记。不符合的当场一次性提示应补正资料或不予受理原因；</p>
        <p><span>第二步：</span>提示纳税人申请增值税税控系统的流程等事项。</p>
    </li>
</ul>
<script>
    $(function(){
        $('.zwfw-nav span').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.zwfw-cont').find('li').eq($(this).index()).show().siblings().hide();
        })
    })
</script>
</body>
</html>