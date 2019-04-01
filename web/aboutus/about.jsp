<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的的科技金融服务门户网站</title>
    <link href="../css/equity.css" rel="stylesheet" type="text/css" />
    <link href="../css/about.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/index.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="../js/app.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>

<!-- 内容部分 -->

<div class="ycdata_bgimg">
     <img src="../image/box/about_banner1.jpg"/>
</div>
 <br/>
<div class="about_type widthbox">
    <li  class="type_bgc"><a  style="display: inline-block;width: 100%;" href="/aboutus/about.html">盈创介绍</a></li>
    <li><a  style="display: inline-block;width: 100%;" href="/aboutus/rczp.html">发展历程</a></li>
    <li><a  style="display: inline-block;width: 100%;" href="/aboutus/flsm.html">法律声明</a></li>
    <li><a  style="display: inline-block;width: 100%;" href="/aboutus/yjfk.html">意见反馈</a></li>
    <li class="type_lxwm"><a  style="display: inline-block;width: 100%;" href="/aboutus/lxwm.html">联系我们</a></li>
</div>

<div class="cj_container">
    
<div id="menu">
   	<ul>
   		<li><a href="#item1" class="current">科技金融  探索与创新</a></li>
   		<li><a href="#item2">组织架构</a></li>
   		<li><a href="#item3">物理平台</a></li>
   		<li><a href="#item4">资源聚集</a></li>
   		<li><a href="#item5">股权融资服务</a></li>
   		<li><a href="#item6">天使投资</a></li>
   		<li><a href="#item7">债权融资服务</a></li>
   		<li><a href="#item8">增值服务</a></li>
   		<li><a href="#item9">发展目标</a></li>      		
   		<li><a id="back" style="cursor:pointer">返回顶部</a></li> 
   	</ul>	
</div>

<script>
$(function(){
	//回到顶部
	$("#back").click(function(){
		$('body,html').animate({scrollTop:0},500);
		return false;
	});

    //首先将#back-to-top隐藏
    $("#menu").hide();

    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
    $(function(){

        $(window).scroll(function(){
            if ($(window).scrollTop()>500){
                $("#menu").fadeIn();
            }else{
                $("#menu").fadeOut();
            }
        });


    });

});
</script>

    <!--盈创介绍start-->
    <div class="about_cj_intro_box" id="content">
         <div class="about_cj_title">
              <img src="../image/box/about_title_intro.png"/>
         </div>
         
         
		 <div id="item1" class="item">
			 <div class="about_cj_title_intro">
	              <h3>科技金融  探索与创新</h3>
	         </div>
	         <div class="about_cj_title_img">
	              <img src="../image/box/about_intro_img.png"/>
	              <p>成都高新区作为首批促进科技与金融结合试点地区，不断加强科技金融创新，由管委会下属国有独资公司成都高新投资集团投资打造了盈创动力科技金融服务平台，为中小型中小企业提供债权融资服务、股权融资服务和增值服务，着力缓解中小企业融资难、融资贵问题。</p>
	
	              <div class="about_cj_server_box">
	                   <img src="../image/box/about_content_img.jpg"/>
	                   <p class="p1">盈创动力服务模式示意图</p>
	                   <p class="p2">截至2016年12月份，盈创动力累计为1900余家科技型中小企业提供担保贷款超过187亿元，为940余家科技型中小企业提供统借统还贷款超过60亿元，小额贷款超过130亿元；股权投资项目逾300个，累计投资金融约70亿元；助推27家企业登录中小板和创业板，41家企业登录新三板。</p>
	              </div>
	         </div>
		 </div>
         
        <!--组织架构start-->
         <!--<div id="item2" class="about_cj_fra_box item">
              <div class="about_cj_fra_title">
                   <h3>组织架构</h3>
              </div>

             <div class="about_cj_fra_img">
                  <img src="../image/box/about_content_img1.jpg"/>
                  <p class="p1">盈创组织架构示意图</p>
                  <p class="p2">截至2016年12月份，盈创动力累计为1900余家科技型中小企业提供担保贷款超过187亿元，为940余家科技型中小企业提供统借统还贷款超过60亿元，小额贷款超过130亿元；股权投资项目逾300个，累计投资金融约70亿元；助推27家企业登录中小板和创业板，41家企业登录新三板。</p>
             </div>
         </div>-->
        <!--组织架构end-->

        <!--物理平台start-->
        <div id="item3" class="about_cj_phy_box item">
            <div class="about_cj_fra_title">
                <h3>物理载体</h3>
            </div>
            <div class="about_cj_phy_content">
                 <div class="about_cj_phy_p">
                     盈创动力目前已建立起以盈创动力大厦为代表，总计超过60000平方米的金融资源聚集物理空间，吸引了人民银行、交通银行、成都银行、农业银行、川藏股权交易中心、成都生产力促进中心、美国凯雷投资、美国VIVO基金、韩国KTB基金等50余家金融机构和投融资资服务机构入驻，注册资本超过100亿元（人民币），聚集资金市场规模超过200亿元（人民币）。盈创动力周边已聚集3家省级分行、2家一级支行和3家二级支行。
                 </div>
                <div class="about_cj_phy_img">
                     <img src="../image/box/about_phy_img.jpg"/>
                </div>
            </div>
        </div>
        <!--物理平台end-->

        <!--资源聚集start-->
        <div id="item4" class="about_res_box item">
            <div class="about_cj_fra_title">
                <h3>资源聚集</h3>
            </div>

            <div class="about_res_content">
                 <ul>
                     <li>
                         <a href="">
                             <img src="../image/box/about_res_1.jpg"/>
                             <div class="about_res_p">
                                 人行征信服务大厅(盈创动力网 点):西南地区除人行成都分行本行以外 的首个服务网点，满足企业和个人征信 查询服务需求。
                             </div>
                         </a>
                     </li>
                     <li>
                         <a href="">
                             <img src="../image/box/about_res_2.jpg"/>
                             <div class="about_res_p">
                                 西部(四川）路演中心:中国西部首 个、全国第五个“路演中心”，为西部企 业提供就近上市路演、业绩说明、信息发 布、重大事件实时报道等系列服务。
                             </div>
                         </a>
                     </li>
                     <li>
                         <a href="">
                             <img src="../image/box/about_res_3.jpg"/>
                             <div class="about_res_p">
                                 川藏股权交易中心:由川藏两省、区 政府共建，目前全国唯一一家跨省区的区 域性股权交易场所。
                             </div>
                         </a>
                     </li>
                     <li>
                         <a href="">
                             <img src="../image/box/about_res_4.jpg"/>
                             <div class="about_res_p">
                                 “科创通”服务平台:面向省内科技型 企业提供涵盖投融资服务、技术交易服 务、仪器情报共享服务、知识产权服务、 科技评估及财税和法律咨询服务等。
                             </div>
                         </a>
                     </li>
                 </ul>
            </div>

        </div>
        <!--资源聚集end-->

        <!--股权融资服务start-->
        <div id="item5" class="about_equ_server_box item">
            <div class="about_cj_fra_title">
                <h3>股权融资服务</h3>
            </div>

            <div class="about_equ_server_content">
                 <div class="about_equ_server_p">
                     盈创动力通过整合政府、企业、机构等各方优 势资源，构建和完善集天使投资、创业投资(VC)、 私募股权投资(PE)相结合的股权投资体系，助推中 小企业与金融资源有效对接。
                 </div>

                 <div class="about_equ_server_img">
                     　<img src="../image/box/about_equ_server_img.jpg"/>
                       <p class="p1">盈创动力服务模式示意图</p>
                 </div>

            </div>

        </div>
        <!--股权融资服务end-->

        <!--天使投资start-->
        <div id="item6" class="about_inv_box item">
            <div class="about_cj_fra_title">
                <h3>天使投资</h3>
                <p>成都高新区创业天使投资基金</p>
            </div>

            <div class="about_inv_box_content">
                2012年6月，成都高新区设立国内首支由政府全额出资的“成都高新区创业天使投资基金”，规模10000万元。截至2016年12月底，天使基金累计完成46个天使项目投资，投资金额逾9000万元，其中：高层次人才创业项目18个，占比39%；20个项目获得新一轮融资，融资金额逾4亿元，实现国有资本10倍以上放大。助推必控科技、成电光信、移联创等11个天使项目成功在“新三板”挂牌。
            </div>
            <div class="about_inv_box_content_1">
                 <img src="../image/box/about_content_img2.jpg"/>
            </div>
        </div>
        <!--天使投资end-->


        <!--债权融资服务start-->
        <div id="item7" class="about_cj_rights_box item">
            <div class="about_cj_fra_title">
                <h3>债权融资服务</h3>
            </div>

            <div class="about_inv_box_content">
                盈创动力不断丰富和完善债权融资体系，积 极拓宽服务于科技型中小企业的债权融资渠道。 通过统借统还平台贷款、政策性融资产品、担保 贷款、小额贷款等，促进科技型中小企业债权融 资服务再上台阶。
            </div>

            <div class="about_rights_box_content1">
                 <img src="../image/box/about_content_img3.jpg"/>
                 <img src="../image/box/about_content_img4.jpg" style="margin-top: 57px;"/>
                 <p>政策性融资产品模式示意图</p>
            </div>

        </div>
        <!--债权融资服务end-->

        <!--增值服务start-->
        <div id="item8" class="about_added_box item">
            <div class="about_cj_fra_title">
                <h3>增值服务</h3>
            </div>


            <div class="about_inv_box_content">
                盈创动力通过开展“天府之星”计划、融资路演、上市路演、项目对接、项目监理、改制上市辅导、投融资顾问、专业培训、高端论坛、财富沙龙 等专业化服务，提升科技型中小企业自身营运能 力，促进企业与资本有效对接。<br/>截至2016年12月底，盈创动力累计开展各类品牌培训50余场，其他管理类、政策类培训活动47场，承接、举办各类重大赛事、活动42场，对接会、论坛等活动45场；为超过14000家企业提供科技金融增值服务。
            </div>

            <div class="about_added_content1">
                 <img src="../image/box/about_content_img5.jpg"/>
            </div>

        </div>
        <!--增值服务end-->


        <!--发展目标start-->
        <div id="item9" class="about_goals_box item">
            <div class="about_cj_fra_title">
                <h3>发展目标</h3>
            </div>

            <div class="about_goals_content">
                盈创动力将按照“立足高新、服务全省、辐射全国”的发展策略，以成都高新区“打造国际创新创业中心”为核心，进一步加强科技金融创新，不断优化债权融资、股权融资和增值服务体系，持续致力于科技型中小企业，着力打造成为国内领先的科技金融服务平台！
            </div>

        </div>
        <!--发展目标end-->

    </div>
    <!--盈创介绍end-->
</div>
<script>
 menu_init("aboutus");

 
</script>
 

         <%@ include file="../footer.jsp"%>

</body>
</html>
 