<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<link rel="stylesheet" href="/resource/css/base.css"  type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sbapp/adminDataCheck.js"></script>

<s:form action="declare_rzzn_core" namespace="/manage" theme="simple" id="form" lang="isBank">
    <table class="table table-bordered">

        <tr style="display:none;">
            <th>id</th>
            <td> <input type="hidden" name="e.id" value="<s:property value="e.id" />"/></td>
        </tr>

        <tr>
            <th class="td_right">用户号</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="false" data-rule="用户号;userid;"/>
            </td>
            <th class="td_right">租赁机构名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.chuzujigou" id="chuzujigou" readonly="false"
                             data-rule="出租机构:required;chuzujigou;"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">出租机构三证合一代码</th>
            <td style="text-align: left;">
                <s:textfield name="e.chuzujigouzzjgdm" id="chuzujigouzzjgdm" readonly="false"
                             data-rule="出租机构三证合一代码:required;chuzujigouzzjgdm;"/>
            </td>
            <th class="td_right">租赁标的物</th>
            <td style="text-align: left;">
                <s:textfield name="e.zhulingwupin" id="ZHULINGWUPIN" readonly="false"
                             data-rule="租赁物品:required;ZHULINGWUPIN;"/>
            </td>
        </tr>
   
        <tr>
            <th class="td_right">结束时间</th>
            <td style="text-align: left;">
                <s:textfield name="e.jieshushijian.substring(0,10)" id="jieshushijian" readonly="false"
                             data-rule="结束时间:required;jieshushijian;"/>
            </td>
            <th class="td_right">补贴开始时间</th>
            <td style="text-align: left;">
                <s:textfield name="e.butiekaishiriqi.substring(0,10)" id="butiekaishiriqi" readonly="false"
                             data-rule="补贴开始日:required;butiekaishiriqi;"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">补贴结束时间</th>
            <td style="text-align: left;">
                <s:textfield name="e.butijieshuriqi.substring(0,10)" id="butijieshuriqi" readonly="false"
                             data-rule="补贴结束日:required;butijieshuriqi;"/>
            </td>
            <th class="td_right">补贴天数</th>
            <td style="text-align: left;">
                <s:textfield name="e.butietianshu" id="butietianshu" readonly="false"
                             data-rule="补贴天数:required;butietianshu;"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">补贴金额（万元）</th>
            <td style="text-align: left;">
                <s:textfield name="e.butiejine" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="butiejine" readonly="false"
                             data-rule="补贴金额:required;butiejine;"/>
            </td>

            <th class="td_right">首付金（万元）</th>
            <td style="text-align: left;">
                <s:textfield onblur="plus()" name="e.shoufujin" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="shoufujin" readonly="false"
                             data-rule="首付金:required;shoufujin;"/>
            </td>
        </tr>

  <tr>
            <th class="td_right">租赁本金（万元）</th>
            <td style="text-align: left;" >
                <s:textfield onblur="plus()" name="e.zulinchengben" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="zulinchengben" readonly="false"
                             data-rule="租赁成本:required;zulinchengben;"/>
            </td>

            <th class="td_right">融资额（万元）</th>
            <td style="text-align: left;" >
                <s:textfield name="e.rongzie" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="rongzie" readonly="true"
                             data-rule="融资额:required;rongzie;"/>
            </td>
        </tr>
        
     <tr>
            <th class="td_right">每期付款金额（万元）</th>
            <td style="text-align: left;">
                <s:textfield name="e.zhulingfeiyong" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="zhulingfeiyong" readonly="false"
                             data-rule="租赁费用:required;chuzujigouzzjgdm;"/>
            </td>
            <th class="td_right">起租时间</th>
            <td style="text-align: left;">
                <s:textfield name="e.qichushijian.substring(0,10)" id="qichushijian" readonly="false"
                             data-rule="起租时间:required;ZHULINGWUPIN;"/>
            </td>
        </tr>
      

        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <button method="declare_rzzn_core!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <a onclick="update()" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </a>
                </s:else>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>
<%--art弹出框js--%>
<script type="text/javascript" src="/js/artDialog/art_dialog.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>
<script type="text/javascript">

    $(function ($) {
        //点击其他地方关闭弹出层
        parent.$('.layui-layer-shade').click(function () {
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        })

        var qichushijian = {
            elem: '#qichushijian',
            format: 'YYYY/MM/DD hh:mm:ss',
            istime: true,
            istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
        };
        var jieshushijian = {
            elem: '#jieshushijian',
            format: 'YYYY/MM/DD hh:mm:ss',
            istime: true,
            istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
        };
        var butiekaishiriqi = {
            elem: '#butiekaishiriqi',
            format: 'YYYY/MM/DD hh:mm:ss',
            istime: true,
            istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
        };
        var butijieshuriqi = {
            elem: '#butijieshuriqi',
            format: 'YYYY/MM/DD hh:mm:ss',
            istime: true,
            istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
        };
        //时间插件初始化
        laydate(qichushijian);
        laydate(jieshushijian);
        laydate(butiekaishiriqi);
        laydate(butijieshuriqi);
    });

    function update() {
		if($("#form").attr("lang")=='isBank'){
			nativeNum("isBankZint");//还原为数字
			
		}
        $.post('manage/declare_rzzn_core!updateCore.action', $('#form').serialize(), function (data) {

            if (data.msg == 'success') {
                msg.info("保存成功！");
                setTimeout('close()', 50);
            } else {
                msg.info("保存失败，请稍后重试！");
            }

        }, 'json')
    }

    function close() {
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }

    function plus() {
        var shoufujin = $('#shoufujin').val().replace(/,/ig, '');
        var zulinchengben = $('#zulinchengben').val().replace(/,/ig, '');
        $('#rongzie').val(zulinchengben - shoufujin).onchange();
    }
</script>
</body>
</html>
