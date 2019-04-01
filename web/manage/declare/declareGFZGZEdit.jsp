<%@ page import="com.winpow.services.common.TreeNode" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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

<s:form action="declare_gfzgz" namespace="/manage" theme="simple" id="form" lang="isBank">
    <table class="table table-bordered">

        <tr style="display:none;">
            <th>id</th>
 		        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        </tr>

        <tr>
            <th class="td_right">用户号<a onclick="toBaseEdit('<s:property value="e.userid"/>')">（查看基本情况表）</a></th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="false" data-rule="用户号:required;userid;length[0~32]"/>
            </td>
            <th class="td_right">拟上市交易所</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.nssjys.childs}" listKey="id"
                          listValue="name" name="e.nssjys" label="拟上市交易所"
                          headerKey="" headerValue="" />
            </td>
        </tr>

        <tr>
            <th class="td_right">签约证券公司名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.zqgsmc" id="zqgsmc" readonly="false"
                             data-rule="签约证券公司名称:required;zqgsmc;length[0~128]"/>
            </td>

            <th class="td_right">签约会计师事务所名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.kjssws" id="kjssws" readonly="false"
                             data-rule="签约会计师事务所名称:required;kjssws;length[0~128]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">签约律师事务所名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.lssws1" id="lssws1" readonly="false"
                             data-rule="签约律师事务所名称:required;lssws1;length[0~128]"/>
            </td>

            <th class="td_right">完成改造时间(以工商登记为准)</th>
            <td style="text-align: left;">
                <s:textfield name="e.wanchengshijian" id="wanchengshijian" readonly="false"
                             data-rule="完成改造时间(以工商登记为准):wanchengshijian;"/>
            </td>
        </tr>
        
        <tr>
            <th class="td_right">改制上市挂牌进度</th>
            <td style="text-align: left;">
				
            

					<select id="form_e_gaizhijindu" class="select"   name="gaizhijindu"  data-rule="改制上市挂牌进度:gaizhijindu;"> 
							<option value=""></option>
							
							
						<option  <% if ("1".equals(((com.winpow.services.manage.declare.bean.DeclareGFZGZ) request.getAttribute("e")).getGaizhijindu())) { out.print("selected=selected");} %>  value="1">已股改,但未报证监会或股转系统</option>
						<option  <% if ("2".equals(((com.winpow.services.manage.declare.bean.DeclareGFZGZ) request.getAttribute("e")).getGaizhijindu())) { out.print("selected=selected");} %>  value="2">已报证监会或股转系统，待审</option>
						<option  <% if ("3".equals(((com.winpow.services.manage.declare.bean.DeclareGFZGZ) request.getAttribute("e")).getGaizhijindu())) { out.print("selected=selected");} %>  value="3">已上市或挂牌</option>
								<!-- 
							<option value="1" <c:if test="${e.gaizhijindu == '1'}">selected</c:if>>已股改,但未报证监会或股转系统</option>
							<option value="2" <c:if test="${e.gaizhijindu == '2'}">selected</c:if>>已报证监会或股转系统，待审</option>
							<option value="3" <c:if test="${e.gaizhijindu == '3'}">selected</c:if>>已上市或挂牌</option>
							
						
							<option value="1" <c:if test="${e.gaizhijindu == '1'}">selected</c:if>>已股改,但未报证监会或股转系统</option>
							<option value="2" <c:if test="${e.gaizhijindu == '2'}">selected</c:if>>已报证监会或股转系统，待审</option>
							<option value="3" <c:if test="${e.gaizhijindu == '3'}">selected</c:if>>已上市或挂牌</option>
							 -->
						<select>
						
            </td>

            <th class="td_right"><font id="sbgzxtspan">上报(预计上报)证监会或股转系统时间</font></th>
            <td style="text-align: left;">
                <s:textfield name="e.sbgzxt" id="sbgzxt" readonly="false"
                             data-rule="上报(预计上报)证监会或股转系统:required;sbgzxt;"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业申请金额（万元）</th>
            <td style="text-align: left;"  >
                <s:textfield name="e.qysqje" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="qysqje" readonly="false"
                             data-rule="企业申请金额:qysqje;length[0~9]"/>
            </td>

			<th class="td_right">系统计算金额/建议支持金额（万元）</th>
               <td style="text-align: left;">
            <s:textfield name="e.xtjsje" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" id="xtjsje" readonly="false"
               data-rule="系统计算金额/建议支持金额:required;xtjsje;length[0~9]"/>
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
                <% TreeNode o = SystemManager.treeNodeMap.get(request.getAttribute("e.status")); if( o != null){
                    out.print(o.getName());}%>
                <s:hidden name="e.status" id="status"/>
                <s:hidden name="issave" id="issave"/>
                <%--<s:textfield name="e.status" id="status" readonly="false"--%>
                             <%--data-rule="审核状态:required;status;length[0~32]"/>--%>
            </td>
        </tr>
         <tr>
            <th class="td_right">批次</th>
            <td style="text-align: left;">
                ${e.pichi }
            </td>
            <th class="td_right"></th>
            <td style="text-align: left;">
            </td>
        </tr>
        
        	<tr>
	 <td colspan="4" style="color:red">
<!--企业进行股份制改造且改造目的是到沪深交易所、全国中小企业股权转让系统上市为目的，改制成功后给予50万元的奖励。-->
对以境内上市或“新三板”挂牌为目的进行股份制改造的企业，给予50万元奖励。
	</td>
	</tr>
        
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
                <s:textarea cssStyle="width: 586px; height: 67px" name="e.memo" id="memo" readonly="false" data-rule="备注:memo;length[0~512]"/>
            </td>
        </tr>

        <tr>
            <td colspan="4" style="text-align: center;">
            
             
              
                <s:if test="e.id=='' or e.id==null">
                    <button method="declare_gfzgz!insert.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button method="declare_gfzgz!update.action" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span method="declare_gfzgz!update.action" id="backButton" onclick="statusset('0')" class="btn btn-danger">
                        <i class="icon-ok icon-white"></i> 驳回
                    </span>
                    &nbsp;&nbsp;&nbsp;&nbsp;

                    <span method="declare_gfzgz!update.action" id="successButton" onclick="statusset('1')" class="btn btn-info">
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
                <button  method="declare_gfzgz!update.action" class="btn btn-success" style="margin-left:20px;">
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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/laydate/laydate.js"></script>
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
        elem: '#sbgzxt',
        elem: '#wanchengshijian',
        format: 'YYYY/MM/DD',
        istime: true,
        istoday: false,
//        choose: function (datas) {
//            end.min = datas; //开始日选好后，重置结束日的最小日期
//        }
    };
    //时间插件初始化
    //laydate(date);
    laydate({elem: '#sbgzxt'});//绑定元素
    laydate({elem: '#wanchengshijian'});//绑定元素
    function statusset(flag) {
    	$("#issave").val("0");
        if (flag == '1') {
            $("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa083");
        } else {
            $("#status").val("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa084");
        }
    }



	$("#form_e_gaizhijindu").change(function(){
		var thisgaiV = $(this).val();
		if(thisgaiV == '1'){
			$("#sbgzxtspan").html('拟上报证监会或股转时间：');
		}else if(thisgaiV == '2'){
			$("#sbgzxtspan").html('报送证监会或股转时间：');
		}else if(thisgaiV == '3'){
			$("#sbgzxtspan").html('上市挂牌时间：');
		}else{
			$("#sbgzxtspan").html('上报(预计上报)证监会或股转时间：');
		}
	});


    $(function () {
    
        var gaizhijinduLV = $("#form_e_gaizhijindu").val();
	    if(gaizhijinduLV=='1'){
	    	$("#sbgzxtspan").html('拟上报证监会或股转时间：');
	    }else if(gaizhijinduLV == '2'){
			$("#sbgzxtspan").html('报送证监会或股转时间：');
		}else if(gaizhijinduLV == '3'){
			$("#sbgzxtspan").html('上市挂牌时间：');
		}else{
			$("#sbgzxtspan").html('上报(预计上报)证监会或股转时间：');
		}
	
	

        //初审的页面  点击下一步弹出发送短信对话框
        var qiyemingcheng = $("#qiyemingcheng").val();
        var lxr = $("#lxr").val();
        var lxrsj = $('#lxrsj').val();

        $("#successButton").click(function () {
            var content = lxr + "您好，"+ qiyemingcheng +"申请的股份制改造补贴获得成都高新区财政金融局初审通过，请根据操作手册说明从系统导出资料，双面打印并胶装，签字盖章后交到锦城大道539号盈创动力大厦A座五楼且带上财务章（用于收据盖章）。如有疑问请联系申报通知中对应的联系人。";

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
            var content = lxr + "您好，很遗憾"+ qiyemingcheng +"申请的股份制改造补贴未获得成都高新区财政金融局初审通过，原因：xxxxxxxxxxxxxxxxxxxx。如有疑问请联系申报通知中对应的联系人。";

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
