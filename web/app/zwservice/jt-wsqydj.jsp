<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="外商企业登记"/>
</jsp:include>
<body class="zwfw">
<div class="zwfw-top">
    <dl><dt>主管部门</dt><dd>环境保护和城市综合管理执法局</dd></dl>
    <dl><dt>业务咨询</dt><dd>南区大厅：028-85339219；自贸（双创）大厅：028-83396937；空港新城大厅：028-27250506。</dd></dl>
    <dl><dt>办理窗口</dt><dd>环城局注册登记窗口</dd></dl>
    <dl><dt>交通线路</dt><dd>南区大厅：天府大道北段18号A座高新区管委会3楼政务服务中心环城局；自贸（双创）大厅：天府五街200号菁蓉国际广场1号楼自贸区、双创政务服务大厅环城局；空港新城大厅：新民乡迎宾大道2号成都天府空港新城政务服务中心环城局</dd></dl>
    <dl><dt>工作时间</dt><dd>环城局注册登记窗口，周一至周五，9:00—17:00</dd></dl>
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
                <td>企业法定代表人（负责人）签署的《申请增（减）、补、换发营业执照/登记证申请书》1份（加盖企业公章（鲜章））；</td>
                <td>无</td>
                <td>纸制材料</td>
                <td>无</td>
                <td>无</td>
            </tr>
            <tr>
                <td>企业加盖公章（鲜章）的《指定代表或者共同委托代理人的证明》1份及指定代表或委托代理人身份证复印件1份；</td>
                <td>无</td>
                <td>纸制材料</td>
                <td>无</td>
                <td>无</td>
            </tr>
            <tr>
                <td>其他有关文件、证件。 申请换发或增（减）发提交营业执照/登记证/注册证/集团登记证 申请补发需提交在公开发行的报纸上刊登遗失/损毁营业执照/登记证/注册证/集团登记证声明的报纸原件及营业执照/登记证/注册证/集团登记证的复印件。</td>
                <td>无</td>
                <td>纸制材料</td>
                <td>无</td>
                <td>无</td>
            </tr>
            </tbody>
        </table>
    </li>
    <li>
        <p><span>第一步：</span>申请人持相关材料向成都高新区政务服务中心环城局注册登记窗口提出申请，经受理审查员初审通过，开具《受理通知书》或者《申请材料接收单》；申请材料不齐全或者不符合法定形式的，当场（需上报或会审的情况除外）一次告知申请人需要补正的全部内容。告知时，将申请材料退回申请人并决定不予受理；</p>
        <p><span>第二步：</span>对申请人申请材料齐全、符合法定形式的，当场作出是否准予登记的决定并出具《登记决定通知书》（需要对申请材料的实质内容进行核实的除外）；</p>
        <p><span>第三步：</span>准予登记的，在承诺时限内，申请人可凭《登记决定通知书》到发照窗口领取《营业执照》或其他证件。</p>
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