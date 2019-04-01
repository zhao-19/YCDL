<%@ page import="com.winpow.services.common.TreeNode" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

        select {
            height: auto;
        }
    </style>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script>
<link rel="stylesheet" href="../css/massage.css"/>
<script src="../js/message3.js"></script> 
    <script type="text/javascript">

        function statusset(flag) {
            if (flag == '1') {
                $("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083");
                $("#issave").val("0");
            } else {
                $("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084");
                $("#issave").val("0");
            }
        };
        
       	function toBaseEdit(userid) {
	        layer.open({
	            title: '基本情况表',
	            type: 2,
	            skin: 'layui-layer-molv',
	            area: ['90%', '90%'],
	            fix: false, //不固定
	            maxmin: false,
	            content: 'declare_base!toEdit.action?e.userid=' + userid
	        });
	    }
	    if ('${msg}' != "") {
			layer.alert('${msg}', {icon: 1, title : '提示', offset: ['20%', '35%']});
		}
    </script>


</head>

<body>

<link rel="stylesheet" href="/resource/css/base.css"  type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sbapp/adminDataCheck.js"></script>

<s:form action="interestapp" namespace="/manage" theme="simple" id="form" lang="isBank">
    <table class="table table-bordered">

        <tr style="display:none;">
            <th>id</th>
            <td><s:hidden name="e.id"/></td>
            <td><input type="hidden" value="<s:property value="#request.lxr"/>" id="lxr"></td>
            <td><input type="hidden" value="<s:property value="#request.lxrsj"/>" id="lxrsj"></td></tr>


        <tr>
            <td colspan="4" style="background-color: #dff0d8">
                &nbsp;基本信息情况
            </td>
        </tr>


        <tr>
            <th class="td_right">用户编号<a onclick="toBaseEdit('<s:property value="e.userid"/>')">（查看基本情况表）</a></th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="true"/>
            </td>
            <th class="td_right">企业名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.qiyemingcheng" id="qiyemingcheng" size="80" readonly="true"/>
            </td>
        </tr>

 

        <tr>

            <th class="td_right">补贴计算开始日期</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxjsksrq" id="lxjsksrq" readonly="false"/>
            </td>


            <th class="td_right">补贴计算截止日期</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxjsjzrq" id="lxjsjzrq" readonly="false"/>
            </td>
        </tr>


     

        <tr>
            <th class="td_right">第三方信用评级结果</th>
            <td style="text-align: left;"  colspan="3">
                <s:textfield name="e.dsfxypj" id="dsfxypj" readonly="false"/>
            </td>

 
        </tr>

 


        <tr>
              <th class="td_right">企业规模</th>
            <td style="text-align: left;" colspan="3">

                <s:select list="%{#request.qygmlist}"  headerKey="" headerValue="" listKey="id" listValue="name" name="e.qygm"/>

            </td>

            <%-- <th class="td_right">是否获得高新区政策性贷款（成长贷、壮大贷、新创贷）</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.sf.childs}" headerKey="" headerValue=""  listKey="id" listValue="name" name="e.kykt"/>
            </td> --%>
        </tr>
        <tr>
            <th class="td_right">批次</th>
            <td style="text-align: left;">${e.pichi }
            </td>


            <th class="td_right">申请金额</th>
            <td style="text-align: left;">
                <s:textfield name="e.qysqje" id="qysqje" readonly="false"/>
            </td>
        </tr>
      <tr>
          <%-- <th class="td_right">支持方向</th>
          <td style="text-align: left;" >
              <s:textfield name="e.zcfx" id="zcfx" readonly="false" data-rule="支持方向:required;zcfx;length[0~8]"/>
          </td> --%>
          <th class="td_right">资料是否完整</th>
          <td style="text-align: left;" colspan="3">
              <s:select list="%{#application.dic.sf.childs}" listKey="id"
                        listValue="name" name="e.zlsfwz" label="资料是否完整"
                        headerKey="" headerValue=""/>
          </td>
        </tr>
        <tr>
            <th class="td_right">审核状态</th>
            <td style="text-align: left;">
                    <%--<s:property value="e.status"/>--%>
                <% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("e.stat")); if( o != null){
                    out.print(o.getName());}%>
                <s:hidden name="e.stat" id="status"/>
                <s:hidden name="issave" id="issave"/>
                    <%--<s:textarea cssStyle="width: 586px; height: 67px" name="e.status" id="status" readonly="false"--%>
                    <%--data-rule="审核状态:required;status;length[0~32]"/>--%>
            </td>
            <th class="td_right">系统计算金额</th>
            <td style="text-align: left;">
            	<s:textfield name="e.xtjsje" id="xtjsje" readonly="false"/>
            </td>
        </tr>
        
     <tr>

         
             <td colspan="4" style="background-color: #dff0d8">
                &nbsp;资料扫描件
            </td>
        </tr>

        <!--图片开始 -->
		<s:iterator value="#request.li" status="index" var="material">
	 		<tr>
	            <td>&nbsp;${material.value }</td>
	            <td colspan="3">
	                <s:iterator value="#request.picList" status="index" var="files">
	                    <s:if test="leixing==#material.key">
	                    	<a href="${files.picurl }" target="_blank"><img style="max-width: 100px;max-height: 100px;" src="/image/pdf.jpg"></a>
	                    </s:if>
	                </s:iterator>
	            </td>
	        </tr>
        </s:iterator>
		<!-- 图片结束 -->

        <tr>
            <td colspan="4" style="background-color: #dff0d8">
                &nbsp;贷款明细
            </td>
        </tr>


    </table>

    <table class="table table-condensed">
        <thead>
        <tr style="background-color: #dff0d8">

            <th>贷款银行</th>
            <th>贷款金额</th>
            <th>贷款开始日期</th>
            <th>贷款到期日期</th>
            <th>担保费率</th>
            <th>担保费</th>
            <th>利息补贴金额</th>
            <th>担保费补贴金额</th>
            <th>补贴天数</th>
            <th>是否政策性贷款</th>
            <th>产品名称</th>
        </tr>
        </thead>
        <s:iterator value="#request.list">
            <tr>
                <td>&nbsp;<s:property value="dkyy"/></td>
                <td>&nbsp;<input class='buttonnobg' type="button" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value='<s:property value="dkje"/>' /> 万元</td>
                <td>&nbsp;${fn:substring(fksj, 0, 10)}</td>
                <td>&nbsp;${fn:substring(dqsj, 0, 10)}</td>
                <td>&nbsp;<s:property value="dbfl"/> %</td>
                <td>&nbsp;<input class='buttonnobg' type="button" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value='<s:property value="dbf"/>' /> 万元</td>
                <td>&nbsp;<input class='buttonnobg' type="button" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value='<s:property value="inteamt"/>' /> 元</td>
                <td>&nbsp;<input class='buttonnobg' type="button" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" value='<s:property value="dbfamt"/>' /> 元</td>
                <td>&nbsp;<s:property value="daycount"/> 天</td>
                <td>&nbsp;
                	<s:if test="policy_loan_flag==1">是</s:if>
					<s:elseif test="policy_loan_flag==0">否</s:elseif>
                </td>
                <td>&nbsp;
	                <s:if test="policy_loan_flag==1">
	                	<s:property value="policy_loan_name"/>
	                </s:if>
                </td>
            </tr>
        </s:iterator>
    </table>

    <table class="table table-condensed">

        <tr>
            <td colspan="4" style="background-color: #dff0d8">
                &nbsp;补贴信息
            </td>
        </tr>


        <tr>

            <th class="td_right">利息补贴计算规则</th>
            <td style="text-align: left;" colspan="3">

                <s:textarea rows="5" cols="120" name="e.systemmemo" id="systemmemo" readonly="true"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">利息补贴金额(元)</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.inteamt" id="inteamt" readonly="false" data-rule="利息补贴金额:required;inteamt"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">担保费补贴金额(元)</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.dbfamt" id="dbfamt" readonly="false"/>
            </td>

        </tr>


        <tr>

            <th class="td_right">补贴天数</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.daycount" id="daycount" readonly="false"/>
            </td>
        </tr>


        <tr>
            <th class="td_right">审批人员备注</th>
            <td style="text-align: left;" colspan="3">

                <s:textarea rows="5" cols="120" name="e.memo" id="memo" readonly="false"
                            data-rule="审批人员备注:required;memo;length[1~1024]"/>

            </td>
        </tr>
 

        <tr>
            <td colspan="4" style="text-align: center;">
 

                <button method="interestapp!update.action" class="btn btn-success">
                    <i class="icon-ok icon-white"></i> 保存
                </button>

<%-- method="interestapp!update.action" --%>
                <button type="button"  onclick="statusset('0')" id="backstep" class="btn btn-danger ">
                    <i class="icon-ok icon-white"></i> 驳回
                </button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                
<%-- method="interestapp!update.action" --%>
                <button type="button"  onclick="statusset('1')" class="btn btn-info btnnextstep">
                    <i class="icon-ok icon-white"></i> 通过
                </button>
                &nbsp;&nbsp;&nbsp;&nbsp;

            </td>


        </tr>

    </table>
    <div id="ldksq">
        <div id="ldksq_c">
            <div id="ldksq_lose"></div>
                <p id="tcktel"><span>电话号码：</span><input class="title" type="text"
                                                        value="<s:property value="e.lianxidianh" />" name="dianhua"></p>
                <p id="tckremark"><span class="msgcontenttype">短信内容：</span><textarea class="duanxin" rows="4" cols="80"
                                                                                     name="content" id="msgcontent">   </textarea>
                </p>
                <p>
                    <button id="ldksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
                        <i class="icon-ok icon-white qx"></i> 取消
                    </button>
                    <button method="interestapp!update.action" class="btn btn-success" style="margin-left:20px;">
                        <i class="icon-ok icon-white"></i> 确定
                    </button></p>
        </div>
    </div>
</s:form>
<!--点击下一步弹出发送短信对话框 start-->

<script src="../js/ToolTip.js"></script>
</body>
</html>
