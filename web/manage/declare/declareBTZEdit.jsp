<%@ page import="com.winpow.services.common.TreeNode" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <link rel="stylesheet" href="../css/massage.css"/>
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

<link rel="stylesheet" href="/resource/css/base.css"  type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sbapp/adminDataCheck.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>

<s:form action="declare_btz" namespace="/manage" theme="simple" id="form" lang="isBank">
    <table class="table table-bordered">
 		        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <tr>
            <th class="td_right">企业基本情况表的ID<a onclick="toBaseEdit('<s:property value="e.userid"/>')">（查看基本情况表）</a></th>
            <td style="text-align: left;">
                <s:textfield name="e.rele_id" id="rele_id" readonly="false"
                             data-rule="企业基本情况表的ID:required;rele_id;length[0~4]"/>
            </td>
            <th class="td_right">用户号</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="false" data-rule="用户号:required;userid;length[0~32]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">申报类别</th>
            <td style="text-align: left;">
                <s:if test="e.leibie == 1">互联网</s:if><s:else>科技创新</s:else>
                    <%--<s:textfield name="e.leibie" id="leibie" readonly="false" data-rule="申报类别:required;leibie;length[0~4]"/>--%>
            </td>
            <th class="td_right">企业名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false"
                             data-rule="企业名称:required;qiyemingcheng;length[0~128]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">主营业务</th>
            <td style="text-align: left;">
                <s:textfield name="e.zyyw" id="zyyw" readonly="false" data-rule="主营业务:required;zyyw;length[0~512]"/>
            </td>
            <th class="td_right">成立日期</th>
            <td style="text-align: left;">
                <s:textfield name="e.clri.substring(0,10)" id="clri" readonly="false" data-rule="成立日期:required;clri;"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">注册地址</th>
            <td style="text-align: left;">
                <s:textfield name="e.dizhi" id="dizhi" readonly="false" data-rule="注册地址:required;dizhi;length[0~128]"/>
            </td>
            <th class="td_right">国地税缴纳机关</th>
            <td style="text-align: left;">
                <s:textfield name="e.gdsjnjg" id="gdsjnjg" readonly="false"
                             data-rule="国地税缴纳机关:required;gdsjnjg;length[0~128]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">统计关系所在地</th>
            <td style="text-align: left;">
                <s:textfield name="e.tjgxszd" id="tjgxszd" readonly="false"
                             data-rule="统计关系所在地:required;tjgxszd;length[0~128]"/>
            </td>
            <th class="td_right">所属产业</th>
            <td style="text-align: left;">
                    <%--<s:textfield name="e.sscy" id="sscy" readonly="false" data-rule="所属产业:required;sscy;length[0~32]"/>--%>
                <select name="e.sscy" class="select">
                    <option></option>
                    <%-- <c:if test="${e.leibie == 1}">
                        <c:forEach items="${applicationScope.dic.sscy1.childs}" var="datas">
                            <option value="${datas.id}"
                                    <c:if test="${e.sscy == datas.id}">selected</c:if>>${datas.name}</option>
                        </c:forEach>
                    </c:if>
                    <c:if test="${e.leibie == 2}">
                        <c:forEach items="${applicationScope.dic.sscy.childs}" var="datas">
                            <option value="${datas.id}"
                                    <c:if test="${e.sscy == datas.id}">selected</c:if>>${datas.name}</option>
                        </c:forEach>
                    </c:if> --%>
                    
                    <c:forEach items="${applicationScope.dic.sscynew.childs}" var="datas">
                             <option value="${datas.id}"
                                      <c:if test="${e.sscy == datas.id}">selected</c:if>>${datas.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

        <tr>
            <th class="td_right">负责人</th>
            <td style="text-align: left;">
                <s:textfield name="e.fzr" id="fzr" readonly="false" data-rule="负责人:required;fzr;length[0~32]"/>
            </td>
            <th class="td_right">负责人职务</th>
            <td style="text-align: left;">
                <s:textfield name="e.fzrzw" id="fzrzw" readonly="false" data-rule="负责人职务:required;fzrzw;length[0~16]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">负责人手机</th>
            <td style="text-align: left;">
                <s:textfield name="e.fzrsj" id="fzrsj" readonly="false" data-rule="负责人手机:required;fzrsj;length[0~16]"/>
            </td>
            <th class="td_right">联系人</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxr" id="lxr" readonly="false" data-rule="联系人:required;lxr;length[0~32]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">联系人职务</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxrzw" id="lxrzw" readonly="false" data-rule="联系人职务:required;lxrzw;length[0~16]"/>
            </td>
            <th class="td_right">联系人手机</th>
            <td style="text-align: left;">
                <s:textfield name="e.lxrsj" id="lxrsj" readonly="false" data-rule="联系人手机:required;lxrsj;length[0~16]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业申请金额（万元）</th>
            <td style="text-align: left;">
                <s:textfield name="e.qysqje" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="qysqje" readonly="false"
                             data-rule="企业申请金额:required;qysqje;length[0~9]"/>
            </td>
                <th class="td_right">系统计算金额/建议支持金额（万元）</th>
               <td style="text-align: left;">
            <s:textfield name="e.xtjsje" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="xtjsje" readonly="false"
               data-rule="系统计算金额/建议支持金额:xtjsje;length[0~9]"/>
                </td>
        </tr>
        <tr>
            <th class="td_right">资料是否完整</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.sf.childs}" listKey="id"
                          listValue="name" name="e.zlsfwz" label="资料是否完整"
                          headerKey="" headerValue=""/>
            </td>
            <th class="td_right">审核状态</th>
            <td style="text-align: left;">
                    <%--<s:property value="e.status"/>--%>
                <% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("e.status"));
                    if (o != null) {
                        out.print(o.getName());
                    }%>
                <s:hidden name="e.status" id="status"/>
                <s:hidden name="issave" id="issave"/>   
            </td>
        </tr>
	<tr>
	 <tr>
            <th class="td_right">批次</th>
            <td style="text-align: left;">
                ${e.pichi }
            </td>
            <th class="td_right"></th>
            <td style="text-align: left;">
            </td>
        </tr>
	 <td colspan="4" style="color:red">
	 对获得专业股权投资机构100万元以上股权投资的中小微企业，按融资金额的5%，给予最高100万元奖励
	</td>
	</tr>
    </table>
    <table class="table table-condensed">
        <thead>
        <tr style="background-color: #dff0d8">

            <th>用户号</th>
            <th>机构名称</th>
            <th>机构三证合一代码</th>
            <th>机构投资金额</th>
            <th>机构所占股份</th>
            <th>投资是否到账</th>
            <th>机构是否备案</th>
            <th>操作</th>
        </tr>
        </thead>
        <s:iterator value="e.declareBTZCoreList">
            <tr>
                <td>&nbsp;<s:property value="userid"/></td>
                <td>&nbsp;<s:property value="jgmc"/></td>
                <td>&nbsp;<s:property value="jgzzjgdm"/></td>
                <td>&nbsp;<s:property value="jgtzje"/> 万</td>
                <td>&nbsp;<s:property value="jgszgf"/> %</td>
                <td>&nbsp;<s:property value="tzsfdz"/></td>
                <td>&nbsp;<% TreeNode o1 = SystemManager.treeNodeMap.get(request.getAttribute("jgsfba"));
                    if (o1 != null) {
                        out.print(o1.getName());
                    }%></td>
                <td><a onclick="toCodeEdit(<s:property value="id"/>)">查看</a></td>
            </tr>
        </s:iterator>
    </table>
    <table class="table table-bordered">
        <s:iterator value="#request.li" status="index" var="material">
	 		<tr>
	            <td>&nbsp;${material.value }</td>
	            <td colspan="3">
	                <s:iterator value="#request.list" status="index" var="files">
	                    <s:if test="leixing==#material.key">
	                    	<a href="${files.picurl }" target="_blank"><img style="max-width: 100px;max-height: 100px;" src="/image/pdf.jpg"></a>
	                    </s:if>
	                </s:iterator>
	            </td>
	        </tr>
        </s:iterator>
        <tr>
            <th class="td_right">备注</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea cssStyle="width: 586px; height: 67px" name="e.memo" id="memo" readonly="false"
                            data-rule="备注:memo;length[0~512]"/>
            </td>
            
        </tr>

        <tr>
            <td colspan="4" style="text-align: center;">
            
                <s:if test="e.id=='' or e.id==null">
                    <button method="declare_btz!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button method="declare_btz!update.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span method="declare_btz!update.action" id="backButton" onclick="statusset('0')"
                            class="btn btn-danger">
                        <i class="icon-ok icon-white"></i> 驳回
                    </span>
                    &nbsp;&nbsp;&nbsp;&nbsp;

                    <span method="declare_btz!update.action" id="successButton" onclick="statusset('1')"
                            class="btn btn-info">
                        <i class="icon-ok icon-white"></i> 通过
                    </span>
                </s:else>
            </td>
        </tr>
    </table>

    <div id="ldksq">
        <div id="ldksq_c">
            <div id="ldksq_lose"></div>
                <%--<form action="productapp!update.action" name="indexdksq" id="indexdksq" method="post">--%>
            <p id="tcktel"><span>电话号码：</span><input class="title" type="text"
                                                         value="<s:property value="e.lianxidianh" />" name="dianhua"></p>
            <p id="tckremark"><span class="msgcontenttype">短信内容：</span><textarea class="duanxin" rows="4" cols="80"
                                                                                 name="content" id="msgcontent">   </textarea>
            </p>
            <p>
                <button id="ldksq_lose2" type="reset" class="btn btn-inverse" style="margin-left:20px;">
                    <i class="icon-ok icon-white qx"></i> 取消
                </button>
                <button  method="declare_btz!update.action" class="btn btn-success" style="margin-left:20px;">
                    <i class="icon-ok icon-white"></i> 确定
                </button>
            </p>
                <%--</form>--%>
        </div>
    </div>
    <input type="hidden" id="lxrsj" value="${lxrsj}">
    <input type="hidden" id="lxr" value="${lxr}">
    <input type="hidden" name="qiyemingcheng" id="qiyemingcheng" value="${qiyemingcheng}">
</s:form>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/newlayer/layer.js"></script>
<script type="text/javascript">

  function toBaseEdit(userid) {
        layer.open({
            title: '基本情况表',
            type: 2,
            skin: 'layui-layer-lan',
            area: ['800px', '500px'],
            fix: false, //不固定
            maxmin: false,
            content: 'declare_base!toEdit.action?e.id=&e.userid=' + userid
        });
    }
    
    
    
    var date = {
        elem: '#clri',
        format: 'YYYY/MM/DD hh:mm:ss',
        istime: true,
        istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
    };
    //时间插件初始化
    laydate(date);

    function toCodeEdit(id) {
        layer.open({
            title: '编辑企业被投资明细',
            type: 2,
            skin: 'layui-layer-lan',
            area: ['800px', '450px'],
            fix: false, //不固定
            maxmin: false,
            content: 'declare_btz_core!toEdit.action?id=' + id
        });
    }

    function statusset(flag) {
    	$("#issave").val("0");
        if (flag == '1') {
            $("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083");
        } else {
            $("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084");
        }
    }

    $(function () {

        //初审的页面  点击下一步弹出发送短信对话框
        var qiyemingcheng = $("#qiyemingcheng").val();
        var lxr = $("#lxr").val();
        var lxrsj = $('#lxrsj').val();

        $("#successButton").click(function () {
            var content = lxr + "您好，"+ qiyemingcheng +"申请的<s:if test="e.leibie == 1">互联网补贴申报</s:if><s:else>科技创新补贴申报</s:else>获得成都高新区财政金融局初审通过，请根据操作手册说明从系统导出资料，双面打印并胶装，签字盖章后交到锦城大道539号盈创动力大厦A座五楼且带上财务章（用于收据盖章）。如有疑问请联系申报通知中对应的联系人。";

            $("#ldksq").show();
            $(".msgcontenttype").html('短信内容:');

            $("#status2").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083");
            $('[name=dianhua]').val(lxrsj);
            $("#msgcontent").val(content);
            var divName = $("#ldksq_c");
            var top = ($(window).height() - $(divName).height()) / 2;
            var left = ($(window).width() - $(divName).width()) / 2;
            var scrollTop = $(document).scrollTop();
            var scrollLeft = $(document).scrollLeft();
            $(divName).css({position: 'absolute', 'top': top, left: left + scrollLeft}).show();
        });

        $("#ldksq_lose").click(function () {
            $("#ldksq").hide();
        });
        $("#ldksq_lose2").click(function () {
            $("#ldksq").hide();
        });

        //点击驳回
        $("#backButton").click(function () {

            $("#ldksq").show();
            $("#status2").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084");

            $(".msgcontenttype").html('驳回原因:');
            var content = lxr + "您好，很遗憾"+ qiyemingcheng +"申请的<s:if test="e.leibie == 1">互联网补贴申报</s:if><s:else>科技创新补贴申报</s:else>未获得成都高新区财政金融局初审通过，原因：xxxxxxxxxxxxxxxxxxxx。如有疑问请联系申报通知中对应的联系人。";

            $('[name=dianhua]').val(lxrsj);
            $("#msgcontent").val(content);
            var divName = $("#ldksq_c");
            var top = ($(window).height() - $(divName).height()) / 2;
            var left = ($(window).width() - $(divName).width()) / 2;
            var scrollTop = $(document).scrollTop();
            var scrollLeft = $(document).scrollLeft();

            $(divName).css({position: 'absolute', 'top': top, left: left + scrollLeft}).show();
        });
    });

</script>
</body>
</html>
