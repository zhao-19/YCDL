<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <style>
        .td_right {
            text-align: right;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#username").focus();
        });
    </script>
</head>

<body>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css"/>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>


<link rel="stylesheet" href="/resource/css/base.css"  type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sbapp/adminDataCheck.js"></script>

<s:form action="sbbase" namespace="/manage" theme="simple" id="form" lang="isBank">
    <table class="table table-bordered">

        <tr style="display:none;">
            <th>id</th>
 		        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        </tr>

        <tr>
            <th class="td_right">用户号</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="false" data-rule="用户号:required;userid;length[0~32]"/>
            </td>

            <th class="td_right">申报窗口期</th>
            <td style="text-align: left;">
                <s:textfield name="e.pichi" id="pichi" readonly="false" data-rule="申报窗口期:required;pichi;length[0~8]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false"
                             data-rule="企业名称:required;qiyemingcheng;length[0~128]"/>
            </td>

            <th class="td_right">三证合一代码</th>
            <td style="text-align: left;">
                <s:textfield name="e.zzjgdm" id="zzjgdm" readonly="false"
                             data-rule="三证合一代码:required;zzjgdm;length[0~32]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">注册地址</th>
            <td style="text-align: left;">
                <s:textfield name="e.dizhi" id="dizhi" readonly="false" data-rule="注册地址:required;dizhi;length[0~128]"/>
            </td>

            <th class="td_right">实际经营地址</th>
            <td style="text-align: left;">
                <s:textfield name="e.sjdizhi" id="sjdizhi" readonly="false"
                             data-rule="实际经营地址:required;sjdizhi;length[0~128]"/>
            </td>
        </tr>

        <tr>
        <span id="jjj">检测 </span>
            <th class="td_right">注册资本（万元）</th>
            <td style="text-align: left;">
                <s:textfield name="e.zhuceziben" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="zhuceziben" readonly="false"
                             data-rule="注册资本:required;zhuceziben;length[0~9]"/>
            </td>

            <th class="td_right">注册资金币种</th>
            <td style="text-align: left;">
                <s:select  list="%{#application.dic.aadf63ab73e949859574f6ed6bf34b4d.childs}" listKey="id"
                           listValue="name" name="e.zczjbz"
                           headerKey="" headerValue="" cssClass="select iselect"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">实缴到位（万元）</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.shijiaoziben" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="shijiaoziben" readonly="false"
                             data-rule="实缴到位:required;shijiaoziben;length[0~9]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">所属产业</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.sscynew.childs}" listKey="id"
                          listValue="name" name="e.sscy" label="所属产业"
                          headerKey="" headerValue=""/>
            </td>

            <th class="td_right">主营业务</th>
            <td style="text-align: left;">
                <s:textfield name="e.zyyw" id="zyyw" readonly="false" data-rule="主营业务:required;zyyw;length[0~512]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业类型</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.qylx.childs}" listKey="id"
                          listValue="name" name="e.qylx" label="企业类型"
                          headerKey="" headerValue=""/>
            </td>

            <th class="td_right">当前从业人数</th>
            <td style="text-align: left;">
                <s:textfield name="e.cyrs" id="cyrs" readonly="false" data-rule="当前从业人数:required;cyrs;length[0~4]"/>
            </td>
        </tr>

        <tr>
            

            <th class="td_right">企业负责人</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.fzr" id="fzr" readonly="false" data-rule="企业负责人:required;fzr;length[0~32]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业负责人职务</th>
            <td style="text-align: left;">
                <s:textfield name="e.fzrzw" id="fzrzw" readonly="false"
                             data-rule="企业负责人职务:required;fzrzw;length[0~16]"/>
            </td>

            <th class="td_right">企业负责人手机</th>
            <td style="text-align: left;">
                <s:textfield name="e.fzrsj" id="fzrsj" readonly="false"
                             data-rule="企业负责人手机:required;fzrsj;length[0~16]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">联系人</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxr" id="lxr" readonly="false" data-rule="联系人:required;lxr;length[0~32]"/>
            </td>

            <th class="td_right">联系人职务</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxrzw" id="lxrzw" readonly="false" data-rule="联系人职务:required;lxrzw;length[0~16]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">联系人手机</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxrsj" id="lxrsj" readonly="false" data-rule="联系人手机:required;lxrsj;length[0~16]"/>
            </td>

            <th class="td_right">工商注册机关</th>
            <td style="text-align: left;">
                <s:textfield name="e.gszcjg" id="gszcjg" readonly="false"
                             data-rule="工商注册机关:required;gszcjg;length[0~128]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">国地税缴纳机关</th>
            <td style="text-align: left;">
                <s:textfield name="e.gdsjnjg" id="gdsjnjg" readonly="false"
                             data-rule="国地税缴纳机关:required;gdsjnjg;length[0~128]"/>
            </td>

            <th class="td_right">统计关系所在地</th>
            <td style="text-align: left;">
                <s:textfield name="e.tjgxszd" id="tjgxszd" readonly="false"
                             data-rule="统计关系所在地:required;tjgxszd;length[0~128]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">上年末总资产（万元）</th>
            <td style="text-align: left;">
                <s:textfield name="e.snmzzc" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="snmzzc" readonly="false"
                             data-rule="上年末总资产:required;snmzzc;length[0~9]"/>
            </td>

            <th class="td_right">上年末总负债（万元）</th>
            <td style="text-align: left;">
                <s:textfield name="e.snmzfz" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="snmzfz" readonly="false"
                             data-rule="上年末总负债:required;snmzfz;length[0~9]"/>
            </td>
        </tr>

        <tr>

            <th class="td_right">融资方式</th>
            <td style="text-align: left;">
                <% String rzfsStr = (String)request.getAttribute("e.rzfs");
                
                    List<String> list = new ArrayList<String>();
                if(null!=rzfsStr) {
                
                    String[] rzfs = rzfsStr.split(",");

                    if (rzfs != null) {

                        for (String str : rzfs) {
                            list.add(str.trim());
                        }
                    }
                }
                    request.setAttribute("rzfs", list);%>
                <s:checkboxlist label="融资方式" list="%{#application.dic.rzfs.childs}"
                                name="e.rzfs" listValue="name" listKey="id" value="#request.rzfs"/>
            </td>

            <th class="td_right">其他融资方式</th>
            <td style="text-align: left;">
                <s:textfield name="e.qtrzfs" id="qtrzfs" readonly="false"
                             data-rule="其他融资方式:required;qtrzfs;length[0~32]"/>
            </td>
        </tr>

        <tr>

            <th class="td_right">融资金额（万元）</th>
            <td style="text-align: left;">
                <s:textfield name="e.rzje" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="rzje" readonly="false" data-rule="融资金额:required;rzje;length[0~9]"/>
            </td>
            <th class="td_right">是否有可抵押资产</th>
            <td style="text-align: left;" colspan="3">
                <s:select list="%{#application.dic.sf.childs}" listKey="id"
                          listValue="name" name="e.ywkdyzc" label="是否有可抵押资产"
                          headerKey="" headerValue=""/>
            </td>
        </tr>
        <tr>
			<th class="td_right">是否国家高新技术企业</th>
            <td style="text-align: left;">
            
            	<select isNotNull="" isLength="[0,32]" name="e.high_tech_stat" id="e.high_tech_stat">
                    <option value=""></option>
                    <option value="1">是</option>
                    <option value="0">否</option>
                </select>
            
            </td>
            
            <th class="td_right">是否国家战略性新兴产业企业</th>
            <td style="text-align: left;">
                <select isNotNull="" isLength="[0,32]" name="e.strategy_stat" id="e.strategy_stat">
                     <option value=""></option>
                     <option value="1">是</option>
                     <option value="0">否</option>
                 </select>
            
            	 <script>
	                 $("select[id='e.high_tech_stat']").val('${e.high_tech_stat}');
	                 $("select[id='e.strategy_stat']").val('${e.strategy_stat}');
                 </script>
            </td>
        </tr>
        
        
        <tr>
            
        <th class="td_right" >去年底从业人数</th>
           <td style="text-align: left;" colspan="3">
               <s:textfield name="e.qncyrs" id="qncyrs" readonly="false"
                            data-rule="去年底从业人数:required;qncyrs;length[0~4]"/>
           </td>
        </tr>
        
        <tr>
       	  <th class="td_right" style="border-top-color: red;border-left-color: red;">社保人数</th>
            <td style="text-align: left;border-top-color: red;" >
                <s:textfield name="e.socialsecurity" id="socialsecurity" readonly="false" data-rule="社保人数:required;socialsecurity;length[0~4]"/>
            </td>
                                          
           <th class="td_right" style="border-top-color: red;">中小微企业行业类型</th>
           <td style="text-align: left;border-top-color: red;border-right: 1px solid red;">
               <s:select list="%{#application.dic.qiyeindustry.childs}" listKey="id"
                         listValue="name" name="e.qiyeindustry" label="中小微企业行业类型"
                         headerKey="" headerValue=""/>
           </td>
         </tr>
         <tr>
         	<th class="td_right" style="border-left-color: red;">去年销售收入(万元)</th>
            <td class="input">${e.secondsell }</td>
            <th class="td_right">总资产(万元)</th>
            <td class="input" style="border-right: 1px solid red;">${e.snmzzc }</td>
        </tr>
        <tr>
         	<th class="td_right" style="border-left-color: red;border-bottom: 1px solid red;">企业规模</th>
            <td class="input" colspan="3" id="qiyescale" style="border-bottom: 1px solid red;border-right: 1px solid red;"></td>
        </tr>
    </table>
    <table class="table table-condensed">
        <thead>
        <tr style="background-color: #dff0d8">

            <th>用户号</th>
            <th>机构名称</th>
            <th>机构投资金额</th>
            <th>到账时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <s:iterator value="e.declareBaseCoreList" status="status">
            <tr id="core${id}">
                <td><s:property value="userid"/></td>
                <td class="jgmc"><s:property value="jgmc"/></td>
                <td class="jgtzje"><s:property value="jgtzje"/></td>
                <td class="dzsj"><fmt:parseDate value="${dzsj}" var="date" pattern="yyyy-MM-dd"/><fmt:formatDate
                        value="${date}" pattern="yyyy-MM-dd"/></td>
                <td><a onclick="toCodeEdit(<s:property value="id"/>)">编辑</a></td>
            </tr>
        </s:iterator>
    </table>
    <table class="table table-condensed">

        <tr style="background-color: #dff0d8;">
            <td colspan="7" style="text-indent: 25px;">财务情况（万元）</td>
        </tr>

        <tr style="background-color: #dff0d8;" class="TT">
            <td rowspan="2" style="width: 140px;text-indent: 25px;padding-top: 18px;">项目</td>
            <td colspan="3" style="text-align: center;border-left: 1px solid #ddd;border-right: 1px solid #ddd;">前三年度
            </td>
        </tr>
        <tr style="background-color: #dff0d8;" class="TT" lang="firsttr">
            <td style="border-left: 1px solid #ddd;"><s:property value='e.thirdyear'/>年</td>
            <td><s:property value='e.thirdyear + 1'/>年</td>
            <td style="border-right: 1px solid #ddd;"><s:property value='e.thirdyear + 2'/>年</td>
        </tr>
        <tr>
            <td>
                <ol>销售收入(万元)</ol>
            </td>
            
              <td class="input"><s:textfield name="e.firstsell" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="当年前的销售:required;thirdzongzichan;length[1~16]"/></td>
                                           
                                           
               <td class="input"><s:textfield name="e.secondsell" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="二年前的销售:required;secondzongzichan;length[1~16]"/></td>
            
            
              <td class="input"><s:textfield name="e.thirdsell" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="三年前的销售:required;firstzongzichan;length[1~16]"/></td>
     
        </tr>
        <tr>
            <td>
                <ol>净利润(万元)</ol>
            </td>
           
              <td class="input"><s:textfield name="e.firstinte" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="当年前的利润:required;thirdzongfuzai;length[1~16]"/></td>
           
           
           
             <td class="input"><s:textfield name="e.secondinte" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="二年前的利润:required;secondzongfuzai;length[1~16]"/></td>
                                           
                    <td class="input"><s:textfield name="e.thirdinte" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                   readonly="false"
                   data-rule="三年前的利润:required;firstzongfuzai;length[1~16]"/></td>

                 </tr>
        <tr>
            <td>
                <ol>税收总额(万元)</ol>
            </td>
            <td class="input"><s:textfield name="e.firsttax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="当年前的税收:required;thirdsuoyouzequanyi;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.secondtax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"
                                           onkeyup="value=value.replace(/[^\d^\.]/g,'')" id="secondsuoyouzequanyi"
                                           readonly="false"
                                           data-rule="二年前的税收:required;secondsuoyouzequanyi;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.thirdtax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           id="firstsuoyouzequanyi" readonly="false"
                                           data-rule="三年前的税收:required;firstsuoyouzequanyi;length[1~16]"/></td>
        </tr>
        <tr>
            <td>
                <ol>企业所得税(万元)</ol>
            </td>
            <td class="input"><s:textfield name="e.first_income_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="当年前的税收:required;firstincometax;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.second_income_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"
                                           onkeyup="value=value.replace(/[^\d^\.]/g,'')" id="secondincometax"
                                           readonly="false"
                                           data-rule="二年前的税收:required;secondincometax;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.third_income_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           id="thirdincometax" readonly="false"
                                           data-rule="三年前的税收:required;thirdincometax;length[1~16]"/></td>
        </tr>
        <tr>
            <td>
                <ol>营业税(万元)</ol>
            </td>
            <td class="input"><s:textfield name="e.first_sales_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="当年前的税收:required;firstsalestax;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.second_sales_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"
                                           onkeyup="value=value.replace(/[^\d^\.]/g,'')" id="secondsalestax"
                                           readonly="false"
                                           data-rule="二年前的税收:required;secondsalestax;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.third_sales_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           id="thirdsalestax" readonly="false"
                                           data-rule="三年前的税收:required;thirdsalestax;length[1~16]"/></td>
        </tr>
        <tr>
            <td>
                <ol>增值税(万元)</ol>
            </td>
            <td class="input"><s:textfield name="e.first_added_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           readonly="false"
                                           data-rule="当年前的税收:required;firstaddedtax;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.second_added_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"
                                           onkeyup="value=value.replace(/[^\d^\.]/g,'')" id="secondaddedtax"
                                           readonly="false"
                                           data-rule="二年前的税收:required;secondaddedtax;length[1~16]"/></td>
            <td class="input"><s:textfield name="e.third_added_tax" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" onkeyup="value=value.replace(/[^\-\d^\,\.]/g,'')"
                                           id="thirdaddedtax" readonly="false"
                                           data-rule="三年前的税收:required;thirdaddedtax;length[1~16]"/></td>
        </tr>
    </table>
    <table class="table table-bordered">
        <tr>
            <td>&nbsp;三证合一</td>

            <td colspan="3">
                <s:iterator value="#request.list" status="index">
                    <s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaatplx200'">
                        <s:if test="picurl.lastIndexOf('pdf')>=0 || picurl.lastIndexOf('PDF')>=0">
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 70px;max-height: 70px;" src="/image/pdf.jpg"></a></s:if>
                        <s:else>
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 70px;max-height: 70px;" alt=""
                                    src="<s:property value="reducepath" />">
                            </a>
                        </s:else>
                    </s:if>
                </s:iterator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;高企证书</td>

            <td colspan="3">
                <s:iterator value="#request.list" status="index">
                    <s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaatplx431'">
                        <s:if test="picurl.lastIndexOf('pdf')>=0 || picurl.lastIndexOf('PDF')>=0">
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 70px;max-height: 70px;" src="/image/pdf.jpg"></a></s:if>
                        <s:else>
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 70px;max-height: 70px;" alt=""
                                    src="<s:property value="reducepath" />">
                            </a>
                        </s:else>
                    </s:if>
                </s:iterator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;国家战略性新兴产业证明材料</td>

            <td colspan="3">
                <s:iterator value="#request.list" status="index">
                    <s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaatplx432'">
                        <s:if test="picurl.lastIndexOf('pdf')>=0 || picurl.lastIndexOf('PDF')>=0">
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 70px;max-height: 70px;" src="/image/pdf.jpg"></a></s:if>
                        <s:else>
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 70px;max-height: 70px;" alt=""
                                    src="<s:property value="reducepath" />">
                            </a>
                        </s:else>
                    </s:if>
                </s:iterator>
            </td>
        </tr>
        <%-- <tr>
            <td>&nbsp;真实性申明</td>

            <td colspan="3">
                <s:iterator value="#request.list" status="index">
                    <s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaatplx201'">
                        <s:if test="picurl.lastIndexOf('pdf')>=0 || picurl.lastIndexOf('PDF')>=0">
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 100px;max-height: 100px;" src="/image/pdf.jpg"></a></s:if>
                        <s:else>
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 100px;max-height: 100px;" alt=""
                                    src="<s:property value="reducepath" />">
                            </a>
                        </s:else>
                    </s:if>
                </s:iterator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;申请报告</td>

            <td colspan="3">
                <s:iterator value="#request.list" status="index">
                    <s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaatplx202'">
                        <s:if test="picurl.lastIndexOf('pdf')>=0 || picurl.lastIndexOf('PDF')>=0">
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 100px;max-height: 100px;" src="/image/pdf.jpg"></a></s:if>
                        <s:else>
                            <a href="<s:property value="picurl" />" target="_blank"> <img
                                    style="max-width: 100px;max-height: 100px;" alt=""
                                    src="<s:property value="reducepath" />">
                            </a>
                        </s:else>
                    </s:if>
                </s:iterator>
            </td>
        </tr> --%>
        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <button method="declare_base!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button method="declare_base!update.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                </s:else>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href='javascript :;' onClick='javascript :history.back(-1);' class="btn">
                        <i class="icon-arrow-left icon-black"></i>返回
                    </a>
            </td>
        </tr>
    </table>
</s:form>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script> --%>
<script type="text/javascript">
    /* var date = {
        elem: '#yrgqsj',
        format: 'YYYY/MM/DD',
        istime: true,
        istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
    }; */
    //时间插件初始化
    //laydate(date);

    function toCodeEdit(id) {
        layer.open({
            title: '企业被投资明细',
            type: 2,
            skin: 'layui-layer-lan',
            area: ['800px', '250px'],
            fix: false, //不固定
            maxmin: false,
            content: 'declare_base_core!toEdit.action?id=' + id
        });
    }
    
    function qiyescales(){
		var qncyrs = '${e.socialsecurity}';
		var secondsell = '${e.secondsell}';
		var qiyeindustry = '${e.qiyeindustry}';
		var snmzzc = '${e.snmzzc}';
		if (qncyrs != "" && secondsell != "" && qiyeindustry != "" && snmzzc != "") {
			$.ajax({
				type: 'post',
				url: "/declare_base/qiyescale.html",
				data: {"qncyrs": qncyrs, "secondsell": secondsell, "qiyeindustry": qiyeindustry, "snmzzc": snmzzc},
				dataType:"json",
				success: function(data){
					$("#qiyescale").html(data.data);
				}
			});
		}
	}
	qiyescales();
</script>
</body>
</html>
