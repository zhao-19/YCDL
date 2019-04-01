<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
   <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
   <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
   <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
  <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/help/help.css"/>
  <style>
  	.helpRight img{width:768px;}
  </style>
</head>
<body>
<%@ include file="../header.jsp"%>

<div class="bl helpbox">
    <div class="helpLeft">
    <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/helpcenter.png" alt="">
    <ul class="helpNav">
        <li><a href="/help/1.html">企业类政策申报 <span>></span></a></li>
        <li><a href="/help/2.html">金融类政策申报 <span>></span></a></li>
        <li class="active"><a href="/help/3.html">其他机构数据报送  <span>></span></a></li>
        
    </ul>
    </div>
    <div class="helpRight">
        <p><a href="/">首页</a> > <a href="#">帮助中心</a> > <b>其他机构数据报送   </b></p>
        <div id="menu">
            <!--根据item的个数遍历生成锚点链接-->
                <ul></ul>
       </div>
   <div id="content">
           <div id="item1" class="item">
               <h2>
                   1.注册其它机构账户（已注册直接跳到第五步），点击首页右上角注册按钮，弹出注册页面，客户类型选择<其它机构>，其它类型暂不支持数据报送，
本实例选择客户类型为<其它机构>。温馨提示：数据报送仅支持银行、保险公司、证券、融资租赁、要素市场、小额贷款、担保公司、自贸区企业这8种
其它机构类型。

               </h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy1.gif" alt=""/></a></li>
               </ul>
           </div>
           <div id="item2" class="item">
               <h2>2.注册成功后，自动返回首页界面。已注册过的企业直接点击首页右上角登录，填写账户信息完成登录。</h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy2.gif" alt=""/></a></li>
               </ul>
           </div>
           <div id="item3" class="item">
               <h2>3.登录完成后，点击首页右上角账户名称，进入个人账户后台管理。
               </h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qy3.gif" alt=""/></a></li>
               </ul>
           </div>
           <div id="item4" class="item">
               <h2>
               4.在点击政策申报之前，需要完善企业基本信息（包括企业信息和财务报表）后才能进行操作。
               </h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qt4.gif" alt=""/></a></li>
               </ul>
           </div>
           <div id="item5" class="item">
               <h2>5. 点击左侧<数据报送>，再点击<添加>，进入数据报送详情页。（此处以自贸区企业数据报送为例介绍数据报送的流程）</h2>
               <ul>
                   <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qt5.gif" alt=""/></a></li>
               </ul>
           </div>
            <div id="item6" class="item">
                <h2>6. 在数据报送详情页根据提示填写有关内容，点击保存可以暂存已填写的信息，点击提交可以提交后台审核。</h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qt6.gif" alt=""/></a></li>
                </ul>
            </div>
            <div id="item7" class="item">
                <h2>
    7. 点击提交后可以在列表页查看到刚填写的信息，至此数据报送操作完成。
                </h2>
                <ul>
                    <li><a href="#"><img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/help/gif/qt7.gif" alt=""/></a></li>
                </ul>
            </div>
       </div>
    </div>
</div>

<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/help/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/help/app.js"></script>
<script>
    var steps = ['注册','登录','进入用户中心','完善机构信息','选择数据报送','填写数据报送','查看结果'];
    var li="";
   for(var i=0;i<steps.length;i++){
      li+= ' <li><a href="#item'+(i+1)+'" class="page-scroll">'+(i+1)+'. '+steps[i]+'</a></li>'

    }
    $('#menu>ul').append(li);
</script>
<%@ include file="../footer.jsp"%>
</body>
</html>