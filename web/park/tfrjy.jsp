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
<style>
    .item dl{line-height: 35px;border:1px solid #d1dfff; margin: 60px 0 70px;}
    .item dt{font-size: 16px; color: #6185d6;background: #eef2fb;padding:5px 20px;}
    .item dd{ color: #555;padding:10px 20px;}
</style>
<!-- 网站头部 -->
<%@ include file="../header.jsp"%>

<!-- 内容部分 -->

<div class="ycdata_bgimg">
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY)%>/image/index/tfrjy-banner.png" style="height:400px;"/>
</div>
<div class="cj_container">

    <div class="about_cj_intro_box" id="content">
        <div id="item1" class="item">
            <div class="about_cj_title_intro">
                <h3>天府软件园</h3>
            </div>
            <div class="about_cj_title_img">
                <p style="text-indent: 32px;line-height: 35px;font-size: 16px;">
                    天府软件园是中国10个软件产业基地之一、国家软件出口创新基地、国家服务外包基地城市示范园区。园区位于成都高新区南部园区核心地带，园区规划建筑面积220万平方米，已开发建筑面积130余万平方米。作为成都发展软件与服务外包产业的重要载体，天府软件园已成为成都软件与服务外包产业的核心聚集区。
                    作为国内目前发展最快的专业软件园区，天府软件园自2005年正式投入运营以来，已经吸引了包括IBM、SAP、NEC、GE、新电、华为、阿里巴巴、马士基、西门子、爱立信、腾讯、WIPRO、DHL、宏利金融等近250家国内外知名企业入驻，其中外资企业占比40%，25家世界500强落户，园区人员35,000人。园区已形成行业软件、ITO、数娱、通信、以及BPO/后台服务中心等几大产业集群，并成为国内外知名软件和服务外包企业在中国战略布局的首选地，以及国内外软件产业资源汇聚的焦点。
                </p>
            </div>
            <div class="about_cj_title_intro">
                <h3> 详细介绍</h3>
            </div>
            <dl>
                <dt>出售对象</dt>
                <dd>
                    出售C区大楼其中一层，出售对象为科技型企业。
                </dd>
                 <dt>出售价格</dt>
                <dd>
                   15000元/平米
                </dd>
                   <dt>占地面积</dt>
                <dd>
                   1408.89万㎡
                </dd>
                <dt>招商产业</dt>
                <dd>
                    高科技产业。
                </dd>
                <dt>基础设施</dt>
                <dd>
                    标准办公物业管理 大容量、双端供电 国际水准网络通信环境 无线网络全覆盖 足额配比、标准化停车场 高端国际会议设备设施。
                </dd>
                <dt>配套设施</dt>
                <dd>
                    食堂、自助餐厅、中西高档商务餐厅、咖啡馆、麦当劳24小时得来速餐厅 国际学校、双语幼儿园面向园区的全装修廉租公寓、保障性住房 24小时交通车、商务呼叫车、商务酒店
                    健身房、室外运动场地、图书馆、艺术馆超市、邮政、商务中心、24小时自助银行、医院、药房咖啡厅、路演厅、头脑风暴室、智能WIFI、新风系统、人脸识别、露天阳台、智能锁、洽谈区、会议室、图书馆、注册地址、独立前台、WIFI定点、独立入口、免费茶水。
                </dd>
                <dt>交通介绍</dt>
                <dd>
                    距离1号线 【天府五街】 约560米。
                </dd>
                <dt>人才服务</dt>
                <dd>
                    1、为企业提供完整的人力资源解决方案，包括招聘、猎头、培训、派遣、咨询等多种类型专业服务；
                </dd>
                <dd>
                    2、依托成都软件人才培训联盟的100多家人才机构成员单位，包括知名院校、国际国内著名培训认证机构、软件与外包企业、专业协会等；
                </dd>
                <dd>
                    3、建有12,000平方米公共人才培训与实训基地，在线培训平台提供近1,000门企业级最新课件，软件人才网每年收录超过15万份专业人才简历。
                </dd>
                <dt>联系人</dt>
                <dd>赵先生 13060001421</dd>
            </dl>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>
