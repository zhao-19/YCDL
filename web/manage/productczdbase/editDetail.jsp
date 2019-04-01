<%@page import="com.winpow.services.manage.catalog.bean.Catalog"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/layer/layer.js"></script>

<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
select{height:auto;}
/*重新调整财务信息table表的样式，只在当前页面有效*/
#tabs-3 input{width:104px;margin: 10px 0px;}
#tabs-3 td{vertical-align: middle;}
.n-ok .n-icon {margin-top: 12px;}
</style>


<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../css/progressBar.css"/>
<link rel="stylesheet" href="../css/massage.css"/>
<script src="../js/jquery.min.js"></script> 
<script src="../js/message.js"></script> 
 

</head>

<body>
<input type="hidden" id="ifsave" value="<s:property value="#request.ifsave"/>"/>
 <s:form action="productczdbase!update.action" id="form" name="form" namespace="/manage" theme="simple"   method="post">
 
    <div class="navbar navbar-inverse" >
        <div id="insertOrUpdateMsg">
            <s:property value="#session.insertOrUpdateMsg"/>
            <%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
        </div>
    </div>
    
    <span id="pifeSpan" class="input-group-addon" style="display:none"><%=SystemManager.systemSetting.getImagerootpath()%></span>
 

         
         

    <script type="text/javascript">
    

    function refresh(value){
            var _parent = $("#step"+value+"");
        var _postX = _parent.position().left+65;
        _parent.siblings(".screening-select").removeClass("current");

        _parent.siblings(".project-screening-yellow").animate({ width: _postX }, 300);

        _parent.siblings(".select-1-yellow").animate({ left: _postX -75 }, 300,function(){
            _parent.addClass("redbg");
            _parent.prevAll(".screening-select").addClass("redbg");
            _parent.addClass("current");
        });

        //_parent.nextAll().removeAttr("style");
    }
    </script>
         
         
         
            <div style="text-align: center;margin-bottom:20px;">
            <div id="updateMsg"><font color='red'><s:property value="updateMsg" /></font></div>
        <!--    <s:if test="e.id=='' or e.id==null">
                <button method="productczdbase!insert.action" class="btn btn-success">
                    <i class="icon-ok icon-white"></i> 新增
                </button>
            </s:if> 
            <s:else> 
            </s:else>
            -->
                
                <button method="productczdbase!update.action" class="btn btn-success" >
                    <i class="icon-ok icon-white"></i> 保存
                </button>
 
             
            
        <!-- <input type="button" class="btnnextstep"  value="下一步"> --> 
        </div>
        
        
        
        <div id="tabs">
        
            <ul>
                   <li><a href="#tabs-1">基本信息</a></li>
                     <li><a href="#tabs-2">高管信息</a></li>
                     <li><a href="#tabs-3">财务信息</a></li>
                     <li><a href="#tabs-4">经营信息</a></li>
                     <li><a href="#tabs-5">存量贷款情况</a></li>
                     <li><a href="#tabs-6">拟提供担保情况</a></li>
                     <li><a href="#tabs-7">其他信息</a></li>
 
            </ul>
            
             
        <div id="tabs-1">
                 <table class="table table-bordered">
         
             
              <tr >
                <td colspan="4" style="background-color: #dff0d8" > 
                &nbsp;关键信息
                </td>
            </tr>
            
                <tr>
                <th class="td_right">企业名称</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield name="e.qiyemingcheng" id="qiyemingcheng" size="80" readonly="false" data-rule="企业名称:required;qiyemingcheng;length[2~128]"/>
                </td>
            
            
            
                </tr>
                                 
                <tr>
                <th class="td_right">贷款品种</th>
                <td style="text-align: left;">  
                <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
                <input type="hidden" name="e.daikuanpingz" value="${e.daikuanpingz }" id="daikuanpingz"/>
                <s:select list="#{'0201010003':'成长贷','0201010004':'壮大贷','0201010049':'新创贷','0201010047':'期权贷','0201010006':'园保贷','0201010001':'开行统借统还贷款','0201010002':'口行统借统还贷款'}" id="prodid" name="e.prodid"  cssClass="input-medium" 
                                        listKey="key" listValue="value"  headerKey="" headerValue=""  data-rule="贷款品种:required;prodid" onchange="changeprodid();"/>
                    &nbsp;&nbsp;&nbsp;<input style="margin-top:-5px!important;height:auto;padding:0px 2px;" type="button" value="修改" onclick="changeprodname();"/>                    
                </td>
             
                <th class="td_right">申请贷款期限（月）</th>
                <td style="text-align: left;">
                <s:textfield name="e.daikuanqixian"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="daikuanqixian" readonly="false" data-rule="申请贷款期限:required;daikuanqixian;length[1~4]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">贷款银行</th>
                <td style="text-align: left;">
                
                <s:select list="#{'国家开发银行':'国家开发银行','进出口银行':'进出口银行','盈创动力分配银行':'盈创动力分配银行','成都银行科技支行':'成都银行科技支行','成都银行高新支行':'成都银行高新支行','盈创动力分配银行':'盈创动力分配银行','成都银行营业部':'成都银行营业部','成都银行华兴支行':'成都银行华兴支行','成都银行高新支行':'成都银行高新支行','成都银行琴台支行':'成都银行琴台支行','成都银行金河支行':'成都银行金河支行','成都银行长顺支行':'成都银行长顺支行','成都银行锦江支行':'成都银行锦江支行','成都银行成华支行':'成都银行成华支行','成都银行武侯支行':'成都银行武侯支行','成都银行德盛支行':'成都银行德盛支行','成都银行青羊支行':'成都银行青羊支行','成都银行高升桥支行':'成都银行高升桥支行','成都银行金牛支行':'成都银行金牛支行','成都银行沙湾支行':'成都银行沙湾支行','成都银行体育场路支行':'成都银行体育场路支行','成都银行科技支行':'成都银行科技支行','成都银行双流支行':'成都银行双流支行','成都银行龙泉驿支行':'成都银行龙泉驿支行','成都银行彭州支行':'成都银行彭州支行','成都银行邛崃支行':'成都银行邛崃支行','成都银行新津支行':'成都银行新津支行','成都银行郫县支行':'成都银行郫县支行','成都银行都江堰支行':'成都银行都江堰支行','成都银行温江支行':'成都银行温江支行','成都银行崇州支行':'成都银行崇州支行','成都银行新都支行':'成都银行新都支行','成都银行大邑支行':'成都银行大邑支行','成都银行青白江支行':'成都银行青白江支行','成都银行金堂支行':'成都银行金堂支行','成都银行蒲江支行':'成都银行蒲江支行','工行高新支行':'工行高新支行','邮储银行四川省分行直属支行':'邮储银行四川省分行直属支行','邮储银行成都市高新区支行':'邮储银行成都市高新区支行','邮储银行成都市太升南路支行':'邮储银行成都市太升南路支行','邮储银行成都市高新支行':'邮储银行成都市高新支行','邮储银行省分行直属支行':'邮储银行省分行直属支行','邮储银行成都市沙湾支行':'邮储银行成都市沙湾支行','邮储银行成都市双楠支行':'邮储银行成都市双楠支行','建设银行成都第五支行':'建设银行成都第五支行','工行双流支行':'工行双流支行'}" id="daikuanyinhang" name="e.daikuanyinhang"  cssClass="input-medium" 
                                        listKey="key" listValue="value"  headerKey="" headerValue=""  data-rule="贷款银行:required;daikuanyinhang"/>
            
            
                </td>
             
                <th class="td_right">担保公司</th>
                <td style="text-align: left;">
                
                    <s:select list="#{'无':'无','成都中小担':'成都中小担','成都高投担':'成都高投担'}" id="danbaogongsi" name="e.danbaogongsi"  cssClass="input-medium" 
                                        listKey="key" listValue="value"  headerKey="" headerValue="" data-rule="担保公司:required;danbaogongsi;length[1~32]" />
            
            
                </td>
                </tr>
                <tr>
                <th class="td_right">金融信用情况<br/>（有无银行贷款违约情况）</th>
                <td style="text-align: left;" colspan="3" >
                <s:textarea rows="3" cols="90" name="e.jinrongxinyong" id="jinrongxinyong" readonly="false" data-rule="金融信用情况:required;jinrongxinyong;length[1~2000]"/>
                </td>
             </tr>
                
                                <tr>
                <th class="td_right">公共信用情况<br/>（有无法院强制执行、<br/>税务稽查、工商执法、<br/>环保事故、安全生产事故<br/>等情况）</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="2" cols="80" name="e.gonggongxinyong" id="gonggongxinyong" readonly="false" data-rule="公共信用情况:required;gonggongxinyong;length[1~2000]"/>
                
                </td>
                </tr>   
                <tr>
                <th class="td_right">综合评价</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="2" cols="80" name="e.zhonghepingjia" id="zhonghepingjia" readonly="false" data-rule="综合评价:required;gonggongxinyong;length[1~2000]"/>
                
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">申请人</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield name="e.userid" id="userid" readonly="false" data-rule="申请人:required;userid;length[1~32]"/>
                </td>
             
                 
                </tr>
                
                
                
              <tr >
                <td colspan="4" style="background-color: #dff0d8" > 
                &nbsp;审批信息
                </td>
            </tr>
            
                            
                
                                <tr>
                <th class="td_right">注册地</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield name="e.gszcd_province" id="gszcd_province" readonly="true"/>
                <s:textfield name="e.gszcd_city" id="gszcd_city"  readonly="true"/>
                <s:textfield name="e.gszcd_county" id="gszcd_county"   readonly="true"/>
                 
                </td>
                </tr>
                
                                <tr>
            
                
                    
                <th class="td_right">成立时间</th>
                <td style="text-align: left;">
                    <input id="d4311" class="Wdate search-query input-small" type="text" name="e.chengliriqi"
                    value="<s:property value="e.chengliriqi" />"
                    onFocus="WdatePicker()" />
                </td>
                
                </tr>
                
                                <tr>
                <th class="td_right">注册资本(万)</th>
                <td style="text-align: left;" >
                <s:textfield name="e.zhuceziben" id="zhuceziben" readonly="false" data-rule="注册资本:required;zhuceziben;length[1~9]"/>
                </td>
                
                    <th class="td_right">办公地址</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield name="e.bgdz" id="bgdz" readonly="false"  style="width: 80%;" data-rule="办公地址:required;bgdz;length[2~64]"/>
                </td>
                
                </tr>
                
                                <tr>
                <th class="td_right">生产地址</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield name="e.scdz" id="scdz" readonly="false" style="width: 80%;" data-rule="生产地址:required;scdz;length[2~64]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">法人代表</th>
                <td style="text-align: left;">
                <s:textfield name="e.faren" id="faren" readonly="false" data-rule="法人代表:required;faren;length[1~64]"/>
                </td>
         
                <th class="td_right">身份证号码</th>
                <td style="text-align: left;">
                <s:textfield name="e.sfzhm" id="sfzhm" readonly="false" data-rule="身份证号码:required;sfzhm;length[1~32]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">联系人</th>
                <td style="text-align: left;">
                <s:textfield name="e.lianxiren" id="lianxiren" readonly="false" data-rule="联系人:required;lianxiren;length[2~16]"/>
                </td>
         
                <th class="td_right">职务</th>
                <td style="text-align: left;">
                <s:textfield name="e.zhiwu" id="zhiwu" readonly="false" data-rule="职务:required;zhiwu;length[2~16]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">电话（手机）</th>
                <td style="text-align: left;">
                <s:textfield name="e.dianhua" id="dianhua" readonly="false" data-rule="电话/传真:required;dianhua;length[2~16]"/>
                </td>
         
                <th class="td_right">电子邮件</th>
                <td style="text-align: left;">
                <s:textfield name="e.dianzhiyoujian" id="dianzhiyoujian" readonly="false" data-rule="电子邮件:required;dianzhiyoujian;length[1~32]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">客户类型</th>
                <td style="text-align: left;">
                
                <s:select list="%{#application.dic.zcdkhlx.childs}" listKey="id"  
                            listValue="name" name="e.kehuleixing" label="客户类型"  
                            headerKey="" headerValue="" />  
                            
                </td>
             
                <th class="td_right">业务来源</th>
                <td style="text-align: left;">

        <s:select list="%{#application.dic.czdywly.childs}" listKey="id"  
                            listValue="name" name="e.yewulaiyuan" label="客户类型"  
                            headerKey="" headerValue="" />  
                            
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">主营业务</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="2" cols="80" name="e.zhuyingyewu" id="zhuyingyewu" readonly="false" data-rule="主营业务:required;zhuyingyewu;length[2~256]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">兼营业务</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="2" cols="80" name="e.jianyingywu" id="jianyingywu" readonly="false" data-rule="兼营业务:jianyingywu"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">主营产品</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield   style="width: 80%;" name="e.zhuyingchanpin" id="zhuyingchanpin" readonly="false" data-rule="主营产品:required;zhuyingchanpin;length[1~32]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">兼营产品</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield   style="width: 80%;"  name="e.jianyingchanpin" id="jianyingchanpin" readonly="false" data-rule="兼营产品:jianyingchanpin;length[1~32]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">企业相关资质证书</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield   style="width: 80%;"  name="e.zhizhizhegnshu" id="zhizhizhegnshu" readonly="false" data-rule="企业相关资质证书:required;zhizhizhegnshu;length[1~1024]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">专利个数</th>
                <td style="text-align: left;">
                <s:textfield name="e.zhuanligeshu"   onkeyup="value=value.replace(/[^\d]/g,'')"  id="zhuanligeshu" readonly="false" data-rule="专利个数:required;zhuanligeshu;length[0~4]"/>
                </td>
             
                <th class="td_right">行业归属</th>
                <td style="text-align: left;">
                
                <s:select list="%{#application.dic.cdzhygs.childs}" listKey="id"  
                            listValue="name" name="e.hangyeguishu" label="行业归属"  
                            headerKey="" headerValue="" />  
                            
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">企业性质</th>
                <td style="text-align: left;">
                        <s:select list="%{#application.dic.qylx.childs}" listKey="id"  
                            listValue="name" name="e.qiyexingzhi" label="行业归属"  
                            headerKey="" headerValue="" /> 
                            
                </td>
             
                <th class="td_right">员工总数</th>
                <td style="text-align: left;">
                <s:textfield name="e.yuangongshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="yuangongshu" readonly="false" data-rule="员工总数:required;yuangongshu;length[1~8]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">技术开发人员总数</th>
                <td style="text-align: left;">
                <s:textfield name="e.jishurenyuanshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="jishurenyuanshu" readonly="false" data-rule="技术开发人员总数:required;jishurenyuanshu;length[1~8]"/>
                </td>
         
                <th class="td_right">硕士及以上人数</th>
                <td style="text-align: left;">
                <s:textfield name="e.shuoshirenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="shuoshirenshu" readonly="false" data-rule="硕士及以上人数:required;shuoshirenshu;length[1~8]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">管理人员人数</th>
                <td style="text-align: left;">
                <s:textfield name="e.guanliyuanrenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="guanliyuanrenshu" readonly="false" data-rule="管理人员人数:required;guanliyuanrenshu;length[1~8]"/>
                </td>
     
                <th class="td_right">大专以上人数</th>
                <td style="text-align: left;">
                <s:textfield name="e.dazhuanrenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="dazhuanrenshu" readonly="false" data-rule="大专以上人数:required;dazhuanrenshu;length[1~8]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">管理人员中中本科学历人数</th>
                <td style="text-align: left;">
                <s:textfield name="e.benkerenshu"   onkeyup="value=value.replace(/[^\d]/g,'')"  id="benkerenshu" readonly="false" data-rule="其中本科学历人数:required;benkerenshu;length[1~8]"/>
                </td>
                 
                <th class="td_right">中高级技术职称人数</th>
                <td style="text-align: left;">
                <s:textfield name="e.zhonggaojirenshu"  onkeyup="value=value.replace(/[^\d]/g,'')"  id="zhonggaojirenshu" readonly="false" data-rule="中高级技术职称人数:required;zhonggaojirenshu;length[1~8]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">本科以上人数</th>
                <td style="text-align: left;">
                <s:textfield name="e.benkeyishangrenshu"   onkeyup="value=value.replace(/[^\d]/g,'')"  id="benkeyishangrenshu" readonly="false" data-rule="本科以上人数:required;benkeyishangrenshu;length[1~8]"/>
                </td>
     
                <th class="td_right">申请金额</th>
                <td style="text-align: left;">
                <s:textfield name="e.shenqingjine"   id="shenqingjine" readonly="false" data-rule="申请金额:required;shenqingjine;length[1~8]"/>
                </td>
                </tr>
                
                            
                                <tr>
                <th class="td_right">贷款用途</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="2" cols="80" name="e.daikuanyongtu" id="daikuanyongtu" readonly="false" data-rule="贷款用途:required;daikuanyongtu;length[2~128]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">与贷款用途相关的项目情况</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="2" cols="80" name="e.xiangmuqingkuang" id="xiangmuqingkuang" readonly="false" data-rule="与贷款用途相关的项目情况:xiangmuqingkuang;length[2~1512]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">还款来源</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="2" cols="80" name="e.huankuanlaiyuan" id="huankuanlaiyuan" readonly="false" data-rule="还款来源:required;huankuanlaiyuan;length[2~128]"/>
                </td>
                </tr>
                <!-- 
                                <tr>
                <th class="td_right">贷款联系人</th>
                <td style="text-align: left;">
                <s:textfield name="e.lianxiren2" id="lianxiren2" readonly="false" data-rule="联系人2:required;lianxiren2;length[2~16]"/>
                </td>
         
                <th class="td_right">贷款联系人电话</th>
                <td style="text-align: left;">
                <s:textfield name="e.lianxidianh2" id="lianxidianh2" readonly="false" data-rule="联系电话2:required;lianxidianh2;length[2~16]"/>
                </td>
                </tr> -->
                <!--    <tr>
                <th class="td_right">审批状态</th>
                <td style="text-align: left;">
                <s:textfield name="e.status" id="status" readonly="false" data-rule="审批状态:required;status;length[2~4]"/>
                </td> 
         
                </tr>-->    
                
                                <tr>
                <th class="td_right">录入时间</th>
                <td style="text-align: left;">
                <s:textfield name="e.lurushijian" id="lurushijian" readonly="true" />
                </td>
             
                <th class="td_right">录入人</th>
                <td style="text-align: left;">
                <s:textfield name="e.inputuser" id="inputuser" readonly="true"  />
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">最后修改时间</th>
                <td style="text-align: left;"  >
                <s:textfield name="e.lastchgtime" id="lastchgtime" readonly="true"  />
                </td>
                
                
                <th class="td_right">审核人</th>
                <td style="text-align: left;">
                <s:textfield name="e.checkuser" id="checkuser" readonly="true"  />
                </td>
                </tr>
                
                                
                   
        </table>
            </div>
                    <!-- 股东信息 -->
            <div id="tabs-2">
                <table class="table table-condensed">
                    
                    <thead>
        <tr style="background-color: #dff0d8">

                <th>股东名称</th>
                <th>出资金额</th>
                <th>占比</th>
        </tr></thead>
        <s:iterator value="#request.gdqqList">
            <tr >
                <td>&nbsp;<s:property value="gudongmingcheng"/></td>
                <td>&nbsp;<s:property value="chuzijine"/>万</td>
                <td>&nbsp;<s:property value="zhanbi"/>%</td>
             
            </tr>
        </s:iterator>
                
                </table>
         <!--经营班子构成 -->
                <table class="table table-condensed">
                    <thead>
                    <tr style="background-color: #dff0d8">
                                        <th>姓名</th>
                                        <th>职务</th>
                                        <th>年龄</th>
                                        <th>学历</th>
                                        <th>职称</th>
                    </tr></thead>
                    <s:iterator value="#request.bzqkList">
                        <tr >
                            <td>&nbsp;<s:property value="xingming"/></td>
                            <td>&nbsp;<s:property value="zhiwu"/></td>
                            <td>&nbsp;<s:property value="nianling"/></td>
                            <td>&nbsp;<s:property value="xueli"/></td>
                            <td>&nbsp;<s:property value="zhicheng"/></td>
                        </tr>
                    </s:iterator>
                    
                 
                </table>
                            
                
                
                
            </div>
                <!-- 财务信息 -->
            <div id="tabs-3">
                <table class="table table-condensed">
                
                <tr style="background-color: #dff0d8;">
                        <td colspan="7"  style="text-indent: 25px;">财务情况（万元）</td> 
                        <input type="hidden"  name="cwxx.thirdyear"  value="<s:property value='cwxx.thirdyear'/>">
                        <input type="hidden"  name="cwxx.releid"  value="<s:property value='cwxx.releid'/>">
                        <input type="hidden"  name="cwxx.cudate"  value="<s:property value='cwxx.cudate'/>">
                        <input type="hidden"  name="e.t"  value="<s:property value='e.t'/>">
                        <input type="hidden"  name="cwxx.id"  value="<s:property value='cwxx.id'/>">
                        
                    </tr>
                
                    <tr style="background-color: #dff0d8;" class="TT" >
                        <td rowspan="2" style="width: 140px;text-indent: 25px;padding-top: 18px;">项目</td>
                        <td colspan="3" style="text-align: center;border-left: 1px solid #ddd;border-right: 1px solid #ddd;">前三年度</td>
                        <td colspan="3" style="text-align: center;border-left: 1px solid #ddd;border-right: 1px solid #ddd;">同期对比</td>
                    </tr>
                    <tr style="background-color: #dff0d8;" class="TT"  lang="firsttr">
                       <td style="border-left: 1px solid #ddd;"><s:property value="cwxx.thirdyear"/>年</td>
                       <td><s:property value="cwxx.thirdyear+1"/>年</td>
                       <td style="border-right: 1px solid #ddd;"><s:property value="cwxx.thirdyear+2"/>年</td>
                       <td style="border-left: 1px solid #ddd;">本年上月</td>
                       <td>去年同期</td>
                       <td style="border-right: 1px solid #ddd;">%</td>
                    </tr>
                    <tr>
                       <td><ol>总资产</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstzongzichan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstzongzichan" readonly="false" data-rule="第一年总资产:required;firstzongzichan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondzongzichan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondzongzichan" readonly="false" data-rule="第二年总资产:required;secondzongzichan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdzongzichan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdzongzichan" readonly="false" data-rule="第三年总资产:required;thirdzongzichan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cuzongzichan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cuzongzichan" readonly="false" data-rule="当前总资产:required;cuzongzichan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastzongzichan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastzongzichan" readonly="false" data-rule="去年同期总资产:required;lastzongzichan;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changezongzichan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changezongzichan" readonly="false" data-rule="总资产增减量:required;changezongzichan;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>总负债</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstzongfuzai" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstzongfuzai" readonly="false" data-rule="第一年总负债:required;firstzongfuzai;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondzongfuzai" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondzongfuzai" readonly="false" data-rule="第二年总负债:required;secondzongfuzai;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdzongfuzai" onkeyup="value=value.replace(/[^\d^\.]/g,'')"       id="thirdzongfuzai" readonly="false"   data-rule="总负债:required;thirdzongfuzai;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cuzongfuzai" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cuzongfuzai" readonly="false" data-rule="当前总负债:required;cuzongfuzai;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastzongfuzai" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastzongfuzai" readonly="false" data-rule="去年同期总负债:required;lastzongfuzai;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changezongfuzai" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changezongfuzai" readonly="false" data-rule="总负债增减量:required;changezongfuzai;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>所有者权益</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstsuoyouzequanyi" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstsuoyouzequanyi" readonly="false" data-rule="第一年所有者权益:required;firstsuoyouzequanyi;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondsuoyouzequanyi" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondsuoyouzequanyi" readonly="false" data-rule="第二年所有者权益:required;secondsuoyouzequanyi;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdsuoyouzequanyi" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdsuoyouzequanyi" readonly="false" data-rule="第三年所有者权益:required;thirdsuoyouzequanyi;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cusuoyouzequanyi" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cusuoyouzequanyi" readonly="false" data-rule="当前所有者权益:required;cusuoyouzequanyi;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastsuoyouzequanyi" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastsuoyouzequanyi" readonly="false" data-rule="去年同期所有者权益:required;lastsuoyouzequanyi;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changesuoyouzequanyi" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changesuoyouzequanyi" readonly="false" data-rule="所有者权益增减量:required;changesuoyouzequanyi;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>其中：实收资本</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstshishouzhiben" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstshishouzhiben" readonly="false" data-rule="第一年实收资本:required;firstshishouzhiben;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondshishouzhiben" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondshishouzhiben" readonly="false" data-rule="第二年实收资本:required;secondshishouzhiben;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdshishouzhiben" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdshishouzhiben" readonly="false" data-rule="第三年实收资本:required;thirdshishouzhiben;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cushishouzhiben" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cushishouzhiben" readonly="false" data-rule="当前实收资本:required;cushishouzhiben;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastshishouzhiben" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastshishouzhiben" readonly="false" data-rule="去年同期实收资本:required;lastshishouzhiben;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changeshishouzhiben" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changeshishouzhiben" readonly="false" data-rule="实收资本增减量:required;changeshishouzhiben;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>银行借款</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstyinhangjiekuan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstyinhangjiekuan" readonly="false" data-rule="第一年银行借款:required;firstyinhangjiekuan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondyinhangjiekuan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondyinhangjiekuan" readonly="false" data-rule="第二年银行借款:required;secondyinhangjiekuan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdyinhangjiekuan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdyinhangjiekuan" readonly="false" data-rule="第三年银行借款:required;thirdyinhangjiekuan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cuyinhangjiekuan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cuyinhangjiekuan" readonly="false" data-rule="当前银行借款:required;cuyinhangjiekuan;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastyinhangjiekuan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastyinhangjiekuan" readonly="false" data-rule="去年同期银行借款:required;lastyinhangjiekuan;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changeyinhangjiekuan" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changeyinhangjiekuan" readonly="false" data-rule="银行借款增减量:required;changeyinhangjiekuan;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>销售收入</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstxiaoshoushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstxiaoshoushouru" readonly="false" data-rule="第一年销售收入:required;firstxiaoshoushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondxiaoshoushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondxiaoshoushouru" readonly="false" data-rule="第二年销售收入:required;secondxiaoshoushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdxiaoshoushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdxiaoshoushouru" readonly="false" data-rule="第三年销售收入:required;thirdxiaoshoushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cuxiaoshoushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cuxiaoshoushouru" readonly="false" data-rule="当前销售收入:required;cuxiaoshoushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastxiaoshoushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastxiaoshoushouru" readonly="false" data-rule="去年同期销售收入:required;lastxiaoshoushouru;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changexiaoshoushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changexiaoshoushouru" readonly="false" data-rule="销售收入增减量:required;changexiaoshoushouru;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>其中：主营业务收入</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstzhuyinyewushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstzhuyinyewushouru" readonly="false" data-rule="第一年主营业务:required;firstzhuyinyewushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondzhuyinyewushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondzhuyinyewushouru" readonly="false" data-rule="第二年主营业务:required;secondzhuyinyewushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdzhuyinyewushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdzhuyinyewushouru" readonly="false" data-rule="第三年主营业务:required;thirdzhuyinyewushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cuzhuyinyewushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cuzhuyinyewushouru" readonly="false" data-rule="当前主营业务:required;cuzhuyinyewushouru;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastzhuyinyewushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastzhuyinyewushouru" readonly="false" data-rule="去年同期主营业务:required;lastzhuyinyewushouru;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changezhuyinyewushouru" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changezhuyinyewushouru" readonly="false" data-rule="主营业务增减量:required;changezhuyinyewushouru;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>利润总额</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstlirunzonge" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstlirunzonge" readonly="false" data-rule="第一年利润总额:required;firstlirunzonge;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondlirunzonge" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondlirunzonge" readonly="false" data-rule="第二年利润总额:required;secondlirunzonge;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdlirunzonge" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdlirunzonge" readonly="false" data-rule="第三年利润总额:required;thirdlirunzonge;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.culirunzonge" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="culirunzonge" readonly="false" data-rule="当前利润总额:required;culirunzonge;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastlirunzonge" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastlirunzonge" readonly="false" data-rule="去年同期利润总额:required;lastlirunzonge;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changelirunzonge" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changelirunzonge" readonly="false" data-rule="利润总额增减量:required;changelirunzonge;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>其中：净利润</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstjinglirun" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstjinglirun" readonly="false" data-rule="第一年净利润:required;firstjinglirun;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondjinglirun" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondjinglirun" readonly="false" data-rule="第二年净利润:required;secondjinglirun;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdjinglirun" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdjinglirun" readonly="false" data-rule="第三年净利润:required;thirdjinglirun;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cujinglirun" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cujinglirun" readonly="false" data-rule="当前净利润:required;cujinglirun;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastjinglirun" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastjinglirun" readonly="false" data-rule="去年同期净利润:required;lastjinglirun;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changejinglirun" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changejinglirun" readonly="false" data-rule="净利润增减量:required;changejinglirun;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td><ol>年度纳税总额（万元）</ol></td>
                       <td class="input" ><s:textfield name="cwxx.firstniandunashui" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="firstniandunashui" readonly="false" data-rule="第一年年度纳税:required;firstniandunashui;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.secondniandunashui" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="secondniandunashui" readonly="false" data-rule="第二年年度纳税:required;secondniandunashui;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.thirdniandunashui" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="thirdniandunashui" readonly="false" data-rule="第三年年度纳税:required;thirdniandunashui;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.cuniandunashui" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cuniandunashui" readonly="false" data-rule="当前年度纳税:required;cuniandunashui;length[1~16]"/></td>
                       <td class="input" ><s:textfield name="cwxx.lastniandunashui" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="lastniandunashui" readonly="false" data-rule="去年同期年度纳税:required;lastniandunashui;length[1~16]"/></td>
                       <td class="input bfb" ><s:textfield name="cwxx.changeniandunashui" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="changeniandunashui" readonly="false" data-rule="年度纳税增减量:required;changeniandunashui;length[1~16]"/></td>
                    </tr>
                
                <script type="text/javascript">
                //13、   自动计算%，公式=（本年上月-去年同期）/去年同期
                    var bfbs = $(".bfb").children("input");//百分比结果 
                    bfbs.each(function(){
                        $(this).focus(function(){
                            var bnsy = $(this).parent().prev().prev().children("input").eq(0).val();
                            var qntq = $(this).parent().prev().children("input").eq(0).val();
                            
                            var bfb = (bnsy-qntq)/qntq;
                            var bfbval = bfb.toFixed(2);                            
                            $(this).val(bfbval);

                        });
                    });
                </script>
                <tr>
                       <td colspan="2">毛利润(%)</td>
                       <td colspan="2" class="input" ><s:textfield name="cwxx.maolilv" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="maolilv" readonly="false" data-rule="毛利率:required;maolilv;length[1~16]"/></td>
                       <td colspan="2">存货周转率</td>
                       <td class="input" ><s:textfield name="cwxx.cunhuozhouzhuanlv" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="cunhuozhouzhuanlv" readonly="false" data-rule="存货周转率:required;cunhuozhouzhuanlv;length[1~16]"/></td>
                </tr>
                <tr>
                       <td colspan="2">流动比率</td>
                       <td colspan="2" class="input" ><s:textfield name="cwxx.liudongbilv" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="liudongbilv" readonly="false" data-rule="流动比率:required;liudongbilv;length[1~16]"/></td>
                       <td colspan="2">应收账款周转率</td>
                       <td class="input" ><s:textfield name="cwxx.yingshouzhangkuanzhouzhuanlv" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="yingshouzhangkuanzhouzhuanlv" readonly="false" data-rule="应收账款周转率:required;yingshouzhangkuanzhouzhuanlv;length[1~16]"/></td>
                    </tr>
                    <tr>
                       <td colspan="2">速动比率</td>
                       <td colspan="2" class="input" ><s:textfield name="cwxx.sudongbilv" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="sudongbilv" readonly="false" data-rule="速动比率:required;sudongbilv;length[1~16]"/></td>
                       <td colspan="2">资产负债率(%)</td>
                       <td class="input" ><s:textfield name="cwxx.zichanfuzhailv" onkeyup="value=value.replace(/[^\d^\.]/g,'')"   id="zichanfuzhailv" readonly="false" data-rule="资产负债率:required;zichanfuzhailv;length[1~16]"/></td>
                    </tr>    
                    <tr> 
                         <td colspan="2">审计报表的会计师事务所：</td>
                         <td class="input" colspan="2">
                             <input type="text"  name="cwxx.shiwusuo"  value="<s:property value='cwxx.shiwusuo'/>" >
                        </td>
                        <td class="input" colspan="3">
                            
                        </td>
                    </tr>
                    <tr>
                        <td>录入时间</td>
                        <td style="text-align: left;">
                            <s:textfield name="cwxx.lurushijian"   id="lurushijian" readonly="true" />
                        </td>
                        <td>录入人</td>
                        <td style="text-align: left;">
                            <s:textfield name="cwxx.inputuser"   id="inputuser" readonly="true" />
                        </td>
                        <td>最后修改时间</td>
                        <td style="text-align: left;">
                            <s:textfield name="cwxx.lastchgtime" id="lastchgtime" readonly="true" />
                        </td>
                        <td class="input" >
                            
                        </td>
                    </tr>
                
                                
                
                </table>
            </div>
         
                
            <div id="tabs-4">
                <table class="table table-condensed">
                        <!-- 经营信息  主要产品 -->
                <thead>
                    <tr style="background-color: #dff0d8">
         
                            <th>主要产品</th>
                            <th>主要销售市场</th>
                            <th>技术先进性</th>
                            <th>国内市场占有率</th>
                            <th>四川占有率</th>
                            <th>上年度销售额</th>
                            <th>占收入比例</th>
                        </tr></thead>
                        <s:iterator value="#request.cpxxList">
                            <tr >
                 
                                <td>&nbsp;<s:property value="zhuyaochanpin"/></td>
                                <td>&nbsp;<s:property value="zhuyaoxiaoshoushichang"/></td>
                                <td>&nbsp;<s:property value="jishuxianjinxing"/></td>
                                <td>&nbsp;<s:property value="guoneishichagnzhanyoulv"/> %</td>
                                <td>&nbsp;<s:property value="sichuanshichagnzhanyoulv"/> %</td>
                                <td>&nbsp;<s:property value="shangnianduxiaoshoue"/> 万</td>
                                <td>&nbsp;<s:property value="zhanshourubili"/> %</td>
                 
            </tr>
        </s:iterator>
        
                </table>
                <!--供应商 销售商-->
                    <table class="table table-condensed">
 
                    <thead>
        <tr style="background-color: #dff0d8">
                            <th>类型（供应商/销售商）</th>
                            <th>市场集中区域</th>
                            <th>公司名称</th>
                            <th>商品名称</th>
                            <th>金额</th>
        </tr></thead>
        <s:iterator value="#request.gysxssxxList">
            <tr >
                                <td>&nbsp;<s:property value="custype"/></td>
                                <td>&nbsp;<s:property value="shichangquyu"/></td>
                                <td>&nbsp;<s:property value="gongshingmingcheng"/></td>
                                <td>&nbsp;<s:property value="shagnminmingcheng"/></td>
                                <td>&nbsp;<s:property value="jine"/> 万</td>
                                
                 
            </tr>
        </s:iterator>
                </table>
                
            </div>
         
         
            <div id="tabs-5">
                <table class="table table-condensed">
                    <!-- 贷款情况 -->
                <thead>
        <tr style="background-color: #dff0d8">
                            <th>债权银行</th>
                            <th>贷款余额</th>
                            <th>贷款方式</th>
                            <th>借款日期</th>
                            <th>到期日期</th>
        </tr></thead>
        <s:iterator value="#request.gyqtdkqkList">
            <tr >
                                <td>&nbsp;<s:property value="zhaiquanyinhang"/></td>
                                <td>&nbsp;<s:property value="daikuanyue"/> 万</td>
                                <td>&nbsp;<s:property value="daikuanfangshi"/></td>
                                <td>&nbsp;<s:property value="jiekuanriqi"/></td>
                                <td>&nbsp;<s:property value="daoqiriqi"/></td>
                                
         
            </tr>
        </s:iterator>
        
                </table>
            </div>
         
         
            <div id="tabs-6">
                <table class="table table-condensed">
                    <!-- 对外担保 -->
                
                <thead>
                    <tr style="background-color: #dff0d8">
                            <th>被担保人</th>
                            <th>担保余额</th>
                            <th>担保方式</th>
                            <th>担保开始日</th>
                            <th>担保到期日</th>
                        </tr></thead>
                        <s:iterator value="#request.gydwdbqkList">
                            <tr >
                                <td>&nbsp;<s:property value="beidanbaoren"/></td>
                                <td>&nbsp;<s:property value="danbaoyue"/> 万</td>
                                <td>&nbsp;<s:property value="danbaofangshi"/></td>
                                <td>&nbsp;<s:property value="kaishiriqi"/></td>
                                <td>&nbsp;<s:property value="daoqiriqi"/></td>
             
            </tr>
        </s:iterator>
                </table>
                <!-- 反担保情况 -->
                
                    <table class="table table-condensed">
  
             
             
                             
                 
                
                                <tr>
                <th class="td_right">保证担保</th>
                <td style="text-align: left;">
                                <input type="hidden" name="fdbcs.id" value="<s:property value="fdbcs.id" />"/>
                
                                <input type="hidden" name="fdbcs.releid" value="<s:property value="fdbcs.releid" />"/>
                
                <s:textarea rows="4" cols="80" name="fdbcs.baozhegndanbao" id="baozhegndanbao" readonly="false" data-rule="保证担保:required;baozhegndanbao;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">质押担保</th>
                <td style="text-align: left;">
                <s:textarea rows="4" cols="80" name="fdbcs.zhiyadanbao" id="zhiyadanbao" readonly="false" data-rule="质押担保:required;zhiyadanbao;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">抵押担保</th>
                <td style="text-align: left;">
                <s:textarea rows="4" cols="80" name="fdbcs.diyadanbao" id="diyadanbao" readonly="false" data-rule="抵押担保:required;diyadanbao;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">其他担保</th>
                <td style="text-align: left;">
                <s:textarea rows="4" cols="80" name="fdbcs.qitadanbao" id="qitadanbao" readonly="false" data-rule="其他担保:qitadanbao;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">录入时间</th>
                <td style="text-align: left;">
                <s:textfield name="fdbcs.lurushijian" id="lurushijian" readonly="true"  />
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">录入人</th>
                <td style="text-align: left;">
                <s:textfield name="fdbcs.inputuser" id="inputuser" readonly="true"  />
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">最后修改时间</th>
                <td style="text-align: left;">
                <s:textfield name="fdbcs.lastchgtime" id="lastchgtime" readonly="true" />
                </td>
                </tr>
                
                </table>
            </div>
         
         <!-- 其他信息 -->
            <div id="tabs-7">
                <table class="table table-condensed">
 
 
 
            <tr>
                <th class="td_right">研发费用</th>
                <td style="text-align: left;">
                
                <s:textfield name="qtxx.yanfafeiyong" id="yanfafeiyong" readonly="false" data-rule="研发费用:required;yanfafeiyong;length[1~9]"/>
                </td>
                 
                <th class="td_right">销售收入</th>
                <td style="text-align: left;">
                <s:textfield name="qtxx.xiaoshoufeiyong" id="xiaoshoufeiyong" readonly="false" data-rule="销售收入:required;xiaoshoufeiyong;length[1~9]"/>
                </td>
                </tr>
                
                
                
                            <tr>
                <th class="td_right">研发人员</th>
                <td style="text-align: left;">
                
                <s:textfield name="qtxx.yanfarenyuan" id="yanfarenyuan" readonly="false" data-rule="研发人员:required;yanfarenyuan;length[1~9]"/>
                </td>
                 
                <th class="td_right">总员工数</th>
                <td style="text-align: left;">
                <s:textfield name="qtxx.gongsizongrenshu" id="gongsizongrenshu" readonly="false" data-rule="公示总人数:required;gongsizongrenshu;length[1~9]"/>
                </td>
                </tr>
                
                
                
                
                                <tr>
                <th class="td_right">研发费用比例 %</th>
                <td style="text-align: left;">
                                                <input type="hidden"  name="qtxx.id" value="<s:property value="qtxx.id" />"/>
                
                                                <input type="hidden"  name="qtxx.releid"  value="<s:property value="qtxx.releid" />"/>
                
                <s:textfield name="qtxx.yanfafeiyongbili" id="yanfafeiyongbili" readonly="false" data-rule="研发费用比例(%):required;yanfafeiyongbili;length[1~9]"/>%
                
                </td>
                 
                <th class="td_right">研发人员比例 %</th>
                <td style="text-align: left;">
                <s:textfield name="qtxx.yanfarenyuanbili" id="yanfarenyuanbili" readonly="false" data-rule="研发人员比例(%):required;yanfarenyuanbili;length[1~9]"/> %
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">知识产权</th>
                <td style="text-align: left;" colspan="3">
                <s:checkboxlist name="qtxx.zhishichanquan1" id="zhishichanquan1" list="%{#application.dic.czdzscqbz.childs}" listKey="id" listValue="name"  value="#request.qtxx.zhishichanquan1.split(',')"  />
                
                </td>
                </tr>
                
                                <tr  style="display:none;">
                <th class="td_right">知识产权</th>
                <td style="text-align: left;">
                <s:textfield name="qtxx.zhishichanquan2" id="zhishichanquan2" readonly="false" />
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">知识产权</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="4" cols="80"  name="qtxx.zhishichanquan3" id="zhishichanquan3" readonly="false" data-rule="知识产权:required;zhishichanquan3;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">权威认定</th>
                <td style="text-align: left;" colspan="3">
                <s:checkboxlist name="qtxx.quanweirending1" id="qtxx.quanweirending1" list="%{#application.dic.czdqwrd.childs}" listKey="id" listValue="name"  value="#request.qtxx.quanweirending1.split(',')"  />
                
                </td>
                </tr>
                
                                <tr  style="display:none;">
                <th class="td_right">权威认定</th>
                <td style="text-align: left;" colspan="3">
                <s:textfield name="qtxx.quanweirending2" id="quanweirending2" readonly="false" />
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">权威认定</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="4" cols="80" name="qtxx.quanweirending3" id="quanweirending3" readonly="false" data-rule="权威认定:quanweirending3;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">技术应用情况（技术应用的市场前景）</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="4" cols="80" name="qtxx.shichangqianjing" id="shichangqianjing" readonly="false" data-rule="市场前景:required;shichangqianjing;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">行业情况及企业简介</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="4" cols="80" name="qtxx.fazhanqianjing" id="fazhanqianjing" readonly="false" data-rule="发展前景:required;fazhanqianjing;length[1~2048]"/>
                </td>
                </tr>
                
                
                                <tr>
                <th class="td_right">主要产品介绍</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="4" cols="80" name="qtxx.zhuyaochanpingjieshao" id="zhuyaochanpingjieshao" readonly="false" data-rule="主要产品介绍:required;zhuyaochanpingjieshao;length[1~2048]"/>
                </td>
                </tr>
                
                
                                <tr>
                <th class="td_right">产品竞争力</th>
                <td style="text-align: left;" colspan="3"> 
                <s:textarea rows="4" cols="80" name="qtxx.chanpinjingzhengli" id="chanpinjingzhengli" readonly="false" data-rule="产品竞争力:required;chanpinjingzhengli;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">高管团队</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="4" cols="80" name="qtxx.gaoguantuandui" id="gaoguantuandui" readonly="false" data-rule="高管团队:required;gaoguantuandui;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">拓展前景</th>
                <td style="text-align: left;" colspan="3">
                <s:textarea rows="4" cols="80" name="qtxx.tuozhanqianjing" id="tuozhanqianjing" readonly="false" data-rule="拓展前景:required;tuozhanqianjing;length[1~2048]"/>
                </td>
                </tr>
                
                                <tr>
                <th class="td_right">录入时间</th>
                <td style="text-align: left;" >
                <s:textfield name="qtxx.lurushijian" id="lurushijian" readonly="true" />
                </td>
             
                <th class="td_right">录入人</th>
                <td style="text-align: left;">
                <s:textfield name="qtxx.inputuser" id="inputuser" readonly="true"  />
                </td>
                </tr> 
                
                </table>
            </div>
         
                
        </div>
            
         
 </s:form>
 

<script type="text/javascript">

var custtype = '<s:property value="userType"/>';
</script>

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script src="<%=request.getContextPath() %>/resource/js/area.js"></script>



<script type="text/javascript">
  
var Gid  = document.getElementById ;
 

$(function() {
    $( "#tabs" ).tabs({
        //event: "mouseover"
    });
    //alert($("#insertOrUpdateMsg").html());
    if($("#insertOrUpdateMsg").html()!='' && $("#insertOrUpdateMsg").html().trim().length>0){
        $("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
    }
    
    
    $("#removePife").click(function(){
        clearRootImagePath();
    });
}); 

function changeprodid(){
	$("#daikuanpingz").val($("#prodid").find("option:selected").text());
}

function changeprodname(){
	layer.confirm("确认修改产品名称？", {
		title:"提示",btn:['确定', '取消'],area: ['300px', '180px']
      }, function(index) {
         layer.close(index);
         $.ajax({
			type : "post",
			url : "productczdbase!updateproducname.action",
			data : {id: '${e.id}',userid: '${e.userid}' , prodid: $("#prodid").val(), prodname: $("#prodid").find("option:selected").text()},
			dataType : "text",
			success : function(data) {
				if (data == "10001") {
					layer.confirm("修改成功！", {
						title:"提示",icon: 0, btn:['确定'],area: ['300px', '180px']
			        }, function(index) {
			            layer.close(index);
						location.href = "productczdbase!toEditDetail.action?e.id=${e.releid }";
			        });
				}
			}
		});
     }, function(index) {
         layer.close(index);
     });
}
</script>

<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script> 
 
     

</body>
</html>
