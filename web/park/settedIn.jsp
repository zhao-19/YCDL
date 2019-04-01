<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的的科技金融服务门户网站</title>
    <link href="../css/equity.css" rel="stylesheet" type="text/css"/>
    <link href="../css/about.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link href="../css/common.css" rel="stylesheet" type="text/css"/>
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/index.js"></script>
    <script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../js/app.js"></script>
    <script src="/app/js/layer/layer.js${sysversion}"></script>
    <script src="/app/js/check.js${sysversion}"></script>
</head>
<body>
<style>
    .about_cj_title_img p{margin:50px 0 30px;}
    .item dl {
        width: 900px;
        line-height: 35px;
        border: 1px solid #d1dfff;
        margin:0 auto;
    }

    .item dt {
        font-size: 16px;
        color: #6185d6;
        background: #eef2fb;
        padding: 5px 20px;
    }

    .item dd {
        color: #555;
        padding: 10px 20px;
    }
    .cj_container img{max-width: 900px;display: block;margin:0 auto;}
    .item ul>li{margin:20px 0;font-size: 18px;}
    form{width: 900px;margin:0 auto;border:1px solid #ddd;padding:20px;}
    .inputrow{line-height: 50px;margin-bottom: 20px;font-size: 15px;}
    .inputrow>span{float:left;width: 11%;}
    .inputrow>input{float:left;width: 86%;border-bottom:1px solid #ddd;height:50px;padding:0 10px;font-size: 15px;}
    .inputrow>input.subbutton{width: 100%;border:0;background: #FF9002;color: #fff;font-size: 20px;
        margin-top:20px;border-radius: 4px;cursor: pointer;}
    .inputrow>input.subbutton:hover{background: #FEB251;}
    .inputrow i{color:#FF9002; font-style: normal;}
    #menu ul li a,#menu ul li:last-child a{width: 180px;}
    #menu{right: 0;left:auto;}
.title>h3{
    text-align: center;
    font-size: 30px;
    line-height: 47px;
    color: #ea5504;
    font-weight: normal;
    margin: 60px 0 40px;
}
</style>
<!-- 网站头部 -->
<%@ include file="../header.jsp"%>

<div class="ycdata_bgimg">
    <img src="/image/park/banner_settedInner.jpg?${sysversion}" style="width: 1200px;height:400px;margin:0 auto;"/>
</div>

<div class="cj_container">
    <div id="menu">
        <ul>
            <li><a href="#item1" class="current">区域规划</a></li>
            <li><a href="#item2">产业定位</a></li>
            <li><a href="#item3">区域核心</a></li>
            <li><a href="#item4">尖峰配置</a></li>
            <li><a href="#item5">写字楼技术参考</a></li>
            <li><a href="#item6">金融科技孵化器</a></li>
            <li><a href="#item7">FinTech Pod 行政服务中心</a></li>
            <li><a href="#item8">项目入驻流程</a></li>
            <li><a href="#item9">租金价格和配套政策</a></li>
            <li><a href="#item10">联系我们</a></li>
            <li><a href="#item11">入驻申请</a></li>
            <li><a id="back" style="cursor:pointer">返回顶部</a></li>
        </ul>
    </div>
    <script>
        $(function () {
            //回到顶部
            $("#back").click(function () {
                $('body,html').animate({scrollTop: 0}, 500);
                return false;
            });

            //首先将#back-to-top隐藏
            $("#menu").hide();

            //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
            $(function () {

                $(window).scroll(function () {
                    if ($(window).scrollTop() > 500) {
                        $("#menu").fadeIn();
                    } else {
                        $("#menu").fadeOut();
                    }
                });


            });

        });
    </script>
    <div id="content">
        <div id="item1" class="item">
            <div class="title">
                <h3>区域规划</h3>
            </div>
            <div class="about_cj_title_img">
                <p>
                   <b> “一区”：“新金融街区”。</b>北起锦晖西二街；南至锦尚西二路；西连成汉南路；东临天府大道，面积约1平方公里。预计到2023年，聚集各类金融机构上千家，聚集资金规模超1万亿元。
                </p>
                <img src="/image/park/1.png?${sysversion}"/>
                <p>
                    <b>“一街”：“科技金融大街”。</b>交子大道核心部分，东起益州大道，西至成汉南路，全长500米，打造中国西部“华尔街”。
                </p>
                <img src="/image/park/2.png?${sysversion}"/>

                <p>
                   <b> “一楼”：“科技金融大厦”。</b>未来将打造成为高新区科技金融产业主要聚集载体，西部“科技金融聚集高地”，促进“科技金融+金融科技”融合发展。
                </p>
                <div class="">
                    <img src="/image/park/3.png?${sysversion}"/>
                </div>

            </div>
        </div>
        <div id="item2" class="about_cj_phy_box item">
            <div class="title">
                <h3>产业定位</h3>
            </div>
            <div class="about_cj_title_img">

                <div class="">
                    <img src="/image/park/4.png?${sysversion}"/>
                </div>
                <dl>
                    <dt>
                        科技金融机构
                    </dt>
                    <dd>
                        银行、保险、保险资产管理、证券、信托、金融资产管理、金融租赁等持牌金融机构及其分支机构。
                    </dd>
                    <dt>
                        地方金融服务机构
                    </dt>
                    <dd>
                        融资租赁、融资担保、小额贷款、区域股权市场、商业保理等。
                    </dd>
                    <dt>
                        金融科技企业
                    </dt>
                    <dd>
                        以区块链、大数据、云计算、人工智能等技术服务于金融领域的科技企业。
                    </dd>
                    <dt>
                        孵化器和科研机构
                    </dt>
                    <dd>
                        金融科技孵化器；金融科技实验室、研究院、研究所等。
                    </dd>
                    <dt>
                        基金类机构
                    </dt>
                    <dd>
                        私募股权投资基金（包括天使投资基金、创业投资基金、PE基金、并购基金、母基金（FOF））、私募证券投资基金、基金子公司、基金管理机构等。
                    </dd>
                </dl>

            </div>
        </div>
        <div id="item3" class="about_res_box item">
            <div class="title">
                <h3>区域核心</h3>
            </div>
            <div class="about_equ_server_content">
                <div class="about_equ_server_p" style="margin-top:0;">
                    科技金融大厦——中海国际中心D座，位于国际城南高新区金融城交子大道（科技金融大街）核心位置。三纵三横、双铁和BRT主要交通干线，无缝连通周边发达路网，辐射多个核心商圈。周边政经中心云集，坐拥城南双政务（成都市、高新区）核心、产业集群、总部共振、商务聚集、商住复合五大价值体系。
                </div>
            </div>
        </div>
        <div id="item4" class="about_equ_server_box item">
            <div class="title">
                <h3>尖峰配置</h3>
            </div>

            <div class="about_equ_server_content">
                <ul>
                    <li>
                        • 15.2米3层挑高星级大堂，彰显非凡商务气度。
                    </li>
                    <li>
                        • 4.05米层高，约2.85米净高，架高地板，可拆卸楼板，优化办公挥洒空间。
                    </li>
                    <li>
                        • 15部进口通力电梯，最快梯速可达6m/s，高中低三区域划分，倍增垂直交通效率。
                    </li>
                    <li>
                        • 移动千兆入网，无线AP全覆盖，全城领先配置极速链接商务世界。
                    </li>
                    <li>
                        • 停车场出入口车牌识别系统，停车场视频引导系统，高科技系统助力楼宇交通系统通达提升。
                    </li>
                    <li>
                        • 约2100平米FinTech Pod国际科技金融行政服务中心，国内顶尖的金融家与金融科技精英俱乐部，满足高端人士与企业商务及会务需求。
                    </li>
                    <li>
                        • 国际一线品牌LOW-E中空玻璃，办公单元预留5处上下水点位，公共区域24小时冷热水，灵活配置满足多样需求。
                    </li>
                    <li>
                        • 标准层茶水间增设直饮水设备（部分楼层），卫生间坐便器马桶增设智能盖板，人性化设备全力呵护商务精英(部分楼层)。
                    </li>
                    <li>
                        • 中央空调系统（直燃机组+冷却塔 ），LG空调主机，新风量35m³/h/人。办公单元空气净化装置，可有效降低室内PM2.5指数，尽享畅快绿色呼吸。
                    </li>
                </ul>
            </div>
            <br>
            <img src="/app/images/apply/6.png?${sysversion}" alt="">
        </div>
        <div id="item5" class="about_inv_box item">
            <div class="title">
                <h3>写字楼技术参考</h3>
            </div>
            <div class="about_inv_box_content_1">
                <img src="/image/park/5.png?${sysversion}"/>
                <img src="/image/park/6.png?${sysversion}"/>
                <img src="/image/park/7.png?${sysversion}"/>
            </div>
        </div>
        <div id="item6" class="about_cj_rights_box item">
            <div class="title">
                <h3>金融科技孵化器</h3>
            </div>

            <div class="about_inv_box_content_1">
                <img src="/image/park/8.png?${sysversion}"/>
            </div>
        </div>
        <div id="item7" class="about_cj_rights_box item">
            <div class="title">
                <h3>FinTech Pod国际科技金融行政服务中心</h3>
            </div>

            <div class="about_inv_box_content_1">
                <img src="/image/park/9.png?${sysversion}"/>
            </div>
        </div>
        <div id="item8" class="about_cj_rights_box item">
            <div class="title">
                <h3>项目入驻流程</h3>
            </div>

            <div class="about_inv_box_content_1">
                <img src="/image/park/10.png?${sysversion}"/>
            </div>
        </div>
        <div id="item9" class="item">
            <div class="title">
                <h3>租金价格和配套政策</h3>
            </div>
            <dl>
                <dt>专业楼宇</dt>
                <dd>
                    政策性专业楼宇，极具竞争力的租金价格
                </dd>
                <dt>优厚的配套政策</dt>
                <dd>
                    1、针对金融科技企业，按照40元/平方米/月的标准，连续三年给予每年最高30万元补贴；
                </dd>
                <dd>
                    2、针对年度纳税（企业所得税及增值税）在100万元以上的企业，按当年企业对地方实际贡献增量部分的50%对企业给予不超过三年奖励。
                </dd>
                <dd>
                    3、如遇政策调整，按照调整后的政策执行。
                </dd>
                <dt>专项政策</dt>
                <dd>
                    重大项目享受政府一企一策
                </dd>
            </dl>
        </div>
        <div id="item10" class="item">
            <div class="title">
                <h3>联系我们</h3>
            </div>
            <dl>
                <dt>招商电话</dt>
                <dd>
                    028-85179612
                </dd>
                <dd>
                    028-83159999
                </dd>
                <dd>
                    028-85331811
                </dd>
                <dt>招商运营单位</dt>
                <dd>
                    成都高投盈创动力投资发展有限公司
                </dd>
                <dt>地址</dt>
                <dd>
                    成都市高新区交子大道中海国际中心233号
                    中海国际中心D座
                </dd>
            </dl>
        </div>
        <div id="item11" class="about_goals_box item" style="margin-bottom: 80px;">
            <div class="title">
                <h3>入驻申请</h3>
            </div>
            <form action="" method="post" id="rzform" onsubmit="return checkSettedIn(this);">

                <div class="inputrow ov">
                    <span>公司名称 <i>*</i></span>

                        <input type="text" name="qiyename" value="" placeholder="请输入公司名称">

                </div>
                <div class="inputrow ov">
                    <span>需求面积 <i>*</i></span>

                        <input type="text" name="area" value="" placeholder="请输入需求面积">

                </div>

                <div class="inputrow ov">
                    <span>联系人 <i>*</i></span>

                        <input type="text" name="linkman" value="" placeholder="请输入联系人" >

                </div>
                <div class="inputrow ov">
                    <span>联系电话 <i>*</i></span>
                        <input type="number" name="phone" value="" placeholder="请输入联系电话"  id="dianhuan">
                </div>
                <div class="inputrow ov">
                    <input type="submit" class="subbutton" >
                </div>
            </form>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp"%>
</body>
</html>
