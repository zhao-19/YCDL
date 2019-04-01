<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="一、个人信用报告查询 (一) 互联网查询：本人有效身份证件。(二) 自助机查询：本人有效身份证原件。">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="中国人民银行征信打印指南"/>
</jsp:include>
<body class="fwxq zxdyzn">
<div class="fwxq-banner"><img src="${pageContext.request.contextPath}/app/images/zgrmbank.png"></div>
<div class="fwxq-title" style="padding-top:0;">
    <h2 style="border-top:1px solid #e5e5e5;padding-top:0.15rem;">中国人民银行征信打印指南</h2>
</div>
<div class="fwxq-cont">
    <h2>一、个人信用报告查询</h2>
    <dl>
        <%--<dt>一、个人信用报告查询</dt>--%>
        <dd>
           <ul>
               <li>(一) 互联网查询：本人有效身份证件。</li>
               <li>(二) 自助机查询：本人有效身份证原件。</li>
               <li>(三) 柜台查询：
                    <ol>
                        <li>1. 本人查询
                            <div>
                                <p><b>（1）</b>出示本人有效身份证件原件（包括身份证、军官证、士兵证、护照、港澳居民来往内地通行证、台湾同胞来往内地通行证、外国人居留证等）供查验，提供有效身份证件复印件留存备查。</p>
                                <p><b>（2）</b>现场填写《个人征信信用报告本人查询申请表》</p>
                            </div>
                        </li>
                        <li>2. 委托他人代理查询
                            <div>
                                <p><b>（1）</b>出示委托人和代理人的有效身份证原件、授权委托公证证明原件供查验，提供委托人和代理人的有效身份证件复印件、授权委托公证证明原件留存备查。</p>
                                <p><b>（2）</b>现场填写《个人征信信用报告本人查询申请表》</p>
                            </div>
                        </li>
                        <li>3. 查询已死亡人员的个人信用报告
                            <div>
                                <p><b>（1）</b>死亡人直系亲属（配偶、子女、父母）出示被查询人死亡证明原件、死亡人有效身份证原件、证明其直系亲属关系的有关证明材料原件（如结婚证、户口簿、户籍机关证明等）、代理人（指死亡人直系亲属）有效身份证原件供查验，提供上述资料复印件留存备查。</p>
                                <p><b>（2）</b>现场填写《个人征信信用报告本人查询申请表》</p>
                            </div>
                        </li>
                    </ol>
               </li>
           </ul>
        </dd>
    </dl>
</div>
<div class="fwxq-cont">
    <h2>二、企业信用报告查询</h2>
    <dl>
    <%--<dt>二、企业信用报告查询</dt>--%>
        <dd>
            <ul>
                <li>(一) 企业法定代表人本人查询
                    <ol>
                        <li>1. 《企业信用报告查询申请表》</li>
                        <li>2. 法定代表人本人身份证复印件并出示原件供查验。</li>
                        <li>3. 企业营业执照或事业单位法人登记证复印件并出示原件供查验。（未三证合一的企业还需准备组织机构代码证复印件或贷款卡正反面复印件并出示原件供查验）</li>
                        <li>4. 提供机构信用代码证号码。</li>
                    </ol>
                </li>
                <li>(二) 经办人代理查询
                    <ol>
                        <li>1.《企业信用报告查询申请表》</li>
                        <li>2.《企业法定代表人授权委托证明书》</li>
                        <li>3. 法定代表人身份证复印件加盖公章和法人章。</li>
                        <li>4. 经办人身份证复印件并出示原件供查验。</li>
                        <li>5. 企业营业执照或事业单位法人登记证复印件并出示原件供查验（未三证合一的企业还需准备组织机构代码证复印件或贷款卡正反面复印件并出示原件供查验）</li>
                        <li>6. 提供机构信用代码证号码。</li>
                    </ol>
                </li>
            </ul>
        </dd>
    </dl>
 </div>
<div class="fwxq-cont">
    <h2>三、查询时间和地点</h2>
    <dl>
    <%--<dt>三、查询时间和地点</dt>--%>
        <dd>
        <ul class="creditAddr">

            <style>
                .duiwai{border: 1px solid #f6cccc;border-bottom: 0; width: 98%;margin: 0.4rem 0 0.5rem; }
                .duiwai>p{ background: #ffdbdb;color: red;padding-left:0.2rem;line-height: 0.6rem !important;}
                .duiwai>ol{padding-left: 0 !important;}
                .duiwai>ol>li{padding: 0.1rem 0.2rem; border-bottom: 1px solid #f6cccc; }

            </style>
            <li class="duiwai">
                <p>周六、周日对外查询个人信用报告网点</p>
                <ol>
                    <li>1. 建设银行成都岷江支行 <em addr="锦江区提督街88号建行大厦">锦江区提督街88号建行大厦</em><br></li>
                    <li>2. 浦发银行成都分行营业部<em addr="成华区二环路东二段22号">成华区二环路东二段22号</em><br></li>
                    <li>3. 泸州市商业银行成都分行营业部<em addr="双流区东升街道白河路三段28号">双流区东升街道白河路三段28号</em><br></li>
                </ol>
            </li>

            <li style="color: red;">
                (一) 成都市城区: 中国人民银行成都分行营业管理部征信服务大厅 <em addr="成都市高新区锦城大道539号盈创动力大楼A座">成都市高新区锦城大道539号盈创动力大楼A座 1楼、2楼</em> <br>工作日9：00—17:00</li>
            <li>(二) 中国人民银行成都分行营业管理部所辖支行：
                <ol>
                    <li>1. 中国人民银行新都支行 <em addr="新都区桂湖东路116号">新都区桂湖东路116号</em><br><span>工作日8：30—12:00、14：30—17:30</span></li>
                    <li>2. 中国人民银行温江支行<em addr="温江区西大街44号">温江区西大街44号</em><br><span>工作日9：00—12:00、13：30—17:00</span></li>
                    <li>3. 中国人民银行双流支行<em addr="双流区东升街道白河路三段28号">双流区东升街道白河路三段28号</em><br><span>工作日9：00—11:30、13：00—17:00</span></li>
                    <li>4. 中国人民银行都江堰市支行<em addr="都江堰市大道205号">都江堰市大道205号</em><br><span>工作日8：30—12:00、14：30—17:30</span></li>
                    <li>5. 中国人民银行彭州市支行<em addr="彭州市天彭镇金彭西路211号">彭州市天彭镇金彭西路211号</em><br><span>工作日9：00—12:00、14：30—17:30</span></li>
                    <li>6. 中国人民银行邛崃市支行<em addr="邛崃市南街237号">邛崃市南街237号</em><br><span>工作日9：00—12:00、14：30—17:00</span></li>
                    <li>7. 中国人民银行崇州市支行<em addr="崇州市蜀州中路宫保里2号">崇州市蜀州中路宫保里2号</em><br><span>工作日8：30—12：00、14：30—17：30</span></li>
                    <li>8. 中国人民银行郫县支行<em addr="郫县郫筒镇新南街255号">郫县郫筒镇新南街255号</em><br><span>工作日9：00—12:00、14：30—17:00</span></li>
                    <li>9. 中国人民银行金堂县支行<em addr="金堂县赵镇金龙路135号">金堂县赵镇金龙路135号</em><br><span>工作日8：30—12:00、14：30—17:00</span></li>
                    <li>10. 中国人民银行新津县支行<em addr="新津县五津东路238号">新津县五津东路238号</em><br><span>工作日8：30—11:30、14：30—17:30</span></li>
                    <li>11. 中国人民银行大邑县支行<em addr="大邑晋原镇富民路中段274号">大邑晋原镇富民路中段274号</em><br><span>工作日8：30—12:00、14：30—17:00</span></li>
                    <li>12. 中国人民银行蒲江县支行<em addr="蒲江县鹤山镇鹤山北路4号">蒲江县鹤山镇鹤山北路4号</em><br><span>工作日9：00—12:00 、14：30—17:00</span></li>
                </ol>
            </li>
        </ul>
        </dd>
    </dl>
</div>
<script>
    $('.creditAddr>li em').click(function () {
        var addr=$(this).attr('addr');//获取有效的地址
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
   			window.webkit.messageHandlers.openmap.postMessage(addr);
    	} else {
    		openmap.openmap(addr);
    	}
    })
</script>
</body>
</html>