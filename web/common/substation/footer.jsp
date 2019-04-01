<%@ page contentType="text/html; charset=UTF-8"%>
<style>
    .footer_box_left .footer_box_left_info{margin-right: 70px;}
    .footer_box_right .code{width: auto;height:auto;margin-top:0;}
    #footPhone>dt{font-size: 16px;}
    #footPhone>dd{font-size: 22px;font-weight: bold;margin: 2px 0 5px;}
    .footer_box{height:auto;}
    .booter_bottominfo i{font-style: normal;}
</style>
<!-- 网站尾部 -->
<div class="footer" style="height: 270px;border-color: transparent;">
    <div class="footer_box widthbox"> 
        <div class="footer_box_left fl" style="width: 870px;height:130px;">
            <div class="footer_box_left_info fl">
                <ul>
                    <li class="title"> 关于我们 </li>
                    <li><a href="/substation/aboutus/${sessionsubcode}.html">公司介绍</a></li>
                    <li><a href="/common/substation/feedback.jsp">意见反馈</a></li>
                </ul>
            </div>
            <div class="footer_box_left_info fl">
                <ul>
                    <li class="title"> 新闻资讯 </li>
                    <li><a href="/substation/news/${sessionsubcode}.html">新闻</a></li>
                </ul>
            </div>
            <div class="footer_box_left_info fl">
                <ul>
                    <li class="title"> 中介服务 </li>
                    <li><a href="/substation/incre/${sessionsubcode}.html">中介服务</a></li>
                </ul>
            </div>
            <div class="footer_box_left_info fl" style="margin-right: 50px;">
                <ul>
                    <li class="title"> 盈创活动 </li>
                    <li><a href="/substation/activity/${sessionsubcode}.html">培训活动</a></li>
                </ul>
            </div>
            <div class="footer_box_center_info fr" style="width: 300px;">
                <dl id="footPhone">
                    <!--<img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/fenzhan/footphone/${sessionsubcode}.png" alt="二维码">-->
                    <!--<div class="title"><a href="">简阳金融办工投公司</a></div>-->
                    <!--<div class="title" style="margin-top: 7px;margin-bottom: 7px;"><span class="phone" style="background:none;padding-left:0px;">028-27029027</span></div>-->
                   <!--<div class="title" style="margin-top: 7px;margin-bottom: 7px;"><span class="phone" style="background:none;padding-left:0px;">028-27697897</span></div>-->
                    <dt>简阳金融办</dt>
                    <dd>028-27029027</dd>
                    <dt>工投公司</dt>
                    <dd>028-27697897</dd>
                </dl>
            </div>
        </div>
        
        <div class="footer_box_right fr" style="width: 330px;height:130px;" id="footerCode">
            <div class="code fl">
                <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/fenzhan/footcode/${sessionsubcode}.png" alt="二维码">
                <!--<li>扫一扫关注我们</li>-->
            </div>
            <div class="footer_box_right_test fr" style="width: 195px;">
                <a href="/usermanage/index.html" style="color: #B7BBC5;"><li id="qqName">盈创动力简阳站中小企业</li></a>
                <li>官方QQ群：<span id="qqNum">475520872</span></li>
                <li>扫一扫加入我们</li>
            </div>
        </div>
    </div>
    <!-- 水平线 -->
    <div class="border widthbox"></div>
    <!-- 版权信息 -->
    <div class="booter_bottominfo widthbox">
        <li><span>Copyright © 2011-2019</span><span>版权所有: <i id="bottomCompany">成都高投盈创动力投资发展有限公司</i></span>
            <span id="bottomCopy">蜀ICP备18022655号-1</span><span>免责声明</span>
            <span>地址：<i id="bottomAdress">成都高新区锦城大道539号盈创动力科技金融大厦A座5楼</i></span></li>
        <li><span>电话：<i id="bottomPhone">028-83159999</i></span><span id="bottomFaxHide">传真：<i id="bottomFax">028-85988444</i></span><span>Email：<i id="bottomEmail">admin@winpow.com</i></span></li>
    </div>
</div>
<script type="text/javascript" src="/js/fenzhan/contactConfig.js?1${sysversion}"></script>
