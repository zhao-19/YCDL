<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="基金注册"/>
</jsp:include>
<body class="zwfw">
<div class="zwfw-top">
    <dl><dt>服务名称</dt><dd>股权投资前置审批</dd></dl>
    <dl><dt>服务对象</dt><dd>将在成都高新区设立的投资机构工商注册登记申请指引</dd></dl>
    <dl><dt>主管部门</dt><dd>财政金融局</dd></dl>
    <dl><dt>业务咨询</dt><dd>67672973</dd></dl>
    <dl><dt>办理窗口</dt><dd>高新区管委会5楼财政金融局办公区</dd></dl>
    <dl><dt>交通线路
    	</dt>
	    	<dd>
                高新区天府大道北段18号A座高新区管委会5楼财政金融局办公区
			</dd>
		</dl>
    <dl><dt>工作时间</dt><dd>周一至周五9:00-17:00</dd></dl>
</div>
<div class="zwfw-nav">
    <span class="active">申请材料</span>
    <span>办理流程</span>
</div>
<ul class="zwfw-cont">
    <li>
       <dl class="sqcl">
           <dd>
               <ul>
                   <li>一、申请报告
                       <ol>
                           <li>（一）拟设立公司概况
                               公司名称、住所（经营场地）、注册资本、企业性质、法定代表人或执行事务合伙人、经营范围、设立背景等内容；</li>
                           <li>（二）股东或合伙人背景及出资情况；</li>
                           <li>（三）公司高管及管理团队架构；</li>
                           <li>（四）主营业务（非经营范围）
                               拟开展的具体业务或项目情况；基金管理公司需说明未来管理运营基金的规模、出资人背景、基金投资方向等内容。
                           </li>
                       </ol>
                   </li>
                   <li>二、“不从事非法集资、非法借贷、非法理财等违法违规行为”的承诺书（新设企业的股东授权机构加盖公章）。</li>
                   <li>三、股东资质证明材料
                       <ol>
                           <li>（一）国有法人股东需提供营业执照复印件、法定代表人身份证复印件、简历；</li>
                           <li>（二）民营法人股东需提供出资能力证明（资产负债表、利润表或基本户银行存款证明），法定代表人身份证复印件、简历；</li>
                           <li>（三）自然人股东需提供相关出资能力证明，身份证复印件、简历。</li>
                       </ol>
                   </li>
                   <li>
                       四、高管及管理团队情况
                       <ol>
                           <li>
                               高管及管理团队核心成员简历、身份证复印件、基金从业资格（股权投资管理机构）等。
                           </li>
                       </ol>
                   </li>
                   <li>五、工商、税收和统计关系将在成都高新区，且三年内不得搬离的承诺函。</li>
                   <li>六、股权投资管理机构应承诺在工商注册完成后3个月内在基金业协会完成备案。</li>
                   <li>七、员工持股平台需提供持股公司出具的平台证明材料。</li>
                   <li>八、经办人员姓名及联系方式。</li>
               </ul>
           </dd>
       </dl>
    </li>
    <li>
        <p><span>第一步：</span>按照申请材料清单的要求准备好电子版材料，通过业务咨询电话联系财政金融局工作人员，并将电子版发给工作人员；</p>
        <p><span>第二步：</span>工作人员在5个工作日内把审核结果进行反馈；</p>
        <p><span>第三步：</span>审核通过后，再提交盖章版本的纸质材料；</p>
        <p><span>第四步：</span>提交纸质材料后，15个工作日内财政金融局出具备案审批通知书。</p>
    </li>
</ul>
<script>
    $(function(){
        $('.zwfw-nav span').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.zwfw-cont>li').eq($(this).index()).show().siblings().hide();
        })
    })
</script>
</body>
</html>