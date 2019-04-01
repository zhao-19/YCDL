<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/resource/common_html_meat.jsp" %>
    <%@ include file="/manage/system/common.jsp" %>
    <%@ include file="/resource/common_html_validator.jsp" %>
    <style>
		.td_right{text-align: right;}
		select{height: auto;}
    </style>
    <script type="text/javascript">
        $(function () {
            $("#username").focus();
        });
    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<%--art提示--%>
<script type="text/javascript" src="/js/artDialog/art_dialog1.js"></script>
<script type="text/javascript" src="/resource/jquery-easyui-1.3.4/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="/resource/jquery-easyui-1.3.4/themes/default/easyui.css"/>

<s:form action="tbotherorg!" namespace="/" theme="simple" id="form">
    <table class="table table-bordered">
        <tr style="display:none;">
            <th colspan="2">e.id</th>
            <td colspan="2"><s:hidden name="e.id" id="orgId"/></td>
            <th class="td_right"></th>
            <td style="text-align: left;">
            </td>
        </tr>
        <tr>
            <th class="td_right" style="width: 200px">机构名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.org_name" id="org_name" readonly="false" data-rule="org_name;length[1~64]"/>
            </td>
            <th class="td_right">机构类型</th>
            <td style="text-align: left;">
            	<%-- <select class="select" name="e.org_type" id="org_type" data-rule="机构类型:required;org_type;">
					<option value=""></option>
					<!-- <option value="1">公司内部</option> -->
					<option value="12">保险公司</option>
					<option value="2">银行</option>
					<option value="5">券商期货</option>
					<option value="6">融资租赁</option>
					<option value="7">要素市场</option>
					<option value="8">股权投资</option>
					<option value="9">小额贷款</option>
					<option value="10">担保公司</option>
					<option value="15">自贸区企业</option>
					<option value="3">媒体</option>
					<option value="4">政府部门</option>
					<option value="11">专家</option>
					<option value="13">评级公司</option>
					<option value="14">其他</option>
				</select> --%>
				<s:select list="%{#application.dic.otherorgtype.childs}" listKey="id" headerKey="" headerValue="" 
            		listValue="name" name="e.org_type" id="org_type" data-rule="机构类型:required;org_type;"/>
            </td>
        </tr>
        <tr>
        	<th class="td_right">组织机构代码（统一社会信用代码）</th>
            <td style="text-align: left;">
                <input type="text" name="e.org_credit_id" id="org_credit_id" class="n-valid" value="<s:property value="e.org_credit_id"/> ">
            </td>
            <th class="td_right">注册资本(万元)</th>
            <td style="text-align: left;">
                <s:textfield name="e.regist_amt" id="regist_amt" readonly="false" data-rule="required;"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">办公地址</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.org_address" id="org_address" readonly="false" data-rule="org_address;length[2~128]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">主营业务</th>
            <td colspan="3">
                <s:textarea name="e.org_info" rows="3" cols="80" id="org_info" readonly="false" data-rule="org_info;length[2~512]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">工商注册地</th>
            <td style="text-align: left;" colspan="3">
					<span class="rightinfo" id="gszcdspan">
						<select class="ssx" id="gszcd_province" name="e.gszcd_province" style="margin-left:6px;"><s:property value="e.gszcd_province"/></select>  
					    <select class="ssx" id="gszcd_city" name="e.gszcd_city" ><s:property value="e.gszcd_city"/></select>  
					    <select class="ssx" id="gszcd_county" name="e.gszcd_county"><s:property value="e.gszcd_county"/></select>
					</span>
					<input type="hidden" id="province" value='<s:property value="e.gszcd_province"/>'/>
					<input type="hidden" id="city" value='<s:property value="e.gszcd_city"/>'/>
					<input type="hidden" id="county" value='<s:property value="e.gszcd_county"/>'/>
					<input type="hidden" id="custtype" value='productczdfirst'/>
					<script type="text/javascript">var custtype = 'productczdfirst';</script>
					<script src="../resource/js/area.js"></script>
					<script type="text/javascript">
					_init_area();
					</script>
            </td>
        </tr>
        <tr>
            <th class="td_right">联系人</th>
            <td style="text-align: left;">
                <s:textfield name="e.org_linkman" id="org_linkman" readonly="false" data-rule="org_linkman;length[1~16]"/>
            </td>

            <th class="td_right">联系人职位</th>
            <td style="text-align: left;">
                <s:textfield name="e.org_linkduty" id="org_linkduty" readonly="false" data-rule="org_linkduty;length[1~16]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">联系人电话</th>
            <td style="text-align: left;">
                <s:textfield name="e.org_linkcellphone" id="org_linkcellphone" readonly="false" data-rule="org_linkcellphone;length[1~16]"/>
            </td>

            <th class="td_right">联系人邮箱</th>
            <td style="text-align: left;">
                <s:textfield name="e.org_linkemail" id="org_linkemail" readonly="false" data-rule="org_linkemail:email;length[2~32]"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">客户经理</th>
            <td colspan="3">
            	<s:textfield name="e.custmanage" id="custmanage" readonly="false" data-rule="custmanage;length[1~8]"/>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.id=='' or e.id==null">
                    <button type="button" onclick="check('manage/tbotherorg!insert.action');" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button type="button" onclick="check('manage/tbotherorg!update.action');" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 保存
                    </button>
                </s:else>
            </td>
        </tr>
    </table>
</s:form>
<script type="text/javascript">
    var nameFal = true; //公司名称重复
    var codeFal = true; //组织结构代码重复

    function check(urlStr) {
     	var fal = true;
        
        var org_credit_id = $('#org_credit_id').val();
        if (org_credit_id == '') {
            $('#org_credit_id').err("组织机构代码不能为空！");
            fal = false;
        } else {
            var num = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
            if (!num.test(org_credit_id.trim())) {
                $('#org_credit_id').err("请填写正确的组织机构代码！");
                fal = false;
            }
        }
        
        var org_linkcellphone = $('#org_linkcellphone').val();
        if (org_linkcellphone == '') {
            $('#org_linkcellphone').err("联系人电话不能为空！");
            fal = false;
        } else {
            var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则
            if (reg.test(org_linkcellphone.trim())) {
                $('#org_linkcellphone').closeErr();
            } else {
                $('#org_linkcellphone').err("请正确的联系人电话！");
                fal = false;
            }
        }
        
        var org_name = $('#org_name').val().trim();
        if (org_name == '') {
            $('#org_name').err("其它机构名称不能为空！");
            fal = false;
        } else if (org_name.length > 64) {
         	$('#org_name').err("其它机构名称过长！");
            fal = false;
        }
        
        var org_type = $('#org_type').val().trim();
        if (org_type == '') {
            $('#org_type').err("请选择机构类型！");
            fal = false;
        }
        
        var org_linkduty = $('#org_linkduty').val().trim();
        if (org_linkduty == '') {
            $('#org_linkduty').err("联系人职位不能为空！");
            fal = false;
        } else if (org_linkduty.length > 16) {
         	$('#org_linkduty').err("联系人职位过长！");
            fal = false;
        }
        
        var org_linkman = $('#org_linkman').val().trim();
        if (org_linkman == '') {
            $('#org_linkman').err("联系人不能为空！");
            fal = false;
        } else if (org_linkman.length > 16) {
         	$('#org_linkman').err("联系人过长！");
            fal = false;
        }
        
        if (fal && nameFal && codeFal) { 
            $('#form').attr('action', urlStr);
            document.forms[0].submit();
        } else {
            msg.info("表单填写有错误，请检查后再重新提交！");
        }
    }
    //根据公司名字和机构代码查询是否存在相同的
    $(function () {
        $('#org_name').blur(function () {
            var obj = $(this);
            if(obj.val().trim() != '') {
                $.post('manage/tbotherorg!findOrg.action', { org_name : obj.val().trim(),orgId: $("#orgId").val()}, function(data) {
                    if(data.msg == 'no') {
                        obj.err("公司名称重复，请重新填写！");
                        nameFal = false;
                    } else {
                        obj.closeErr();
                        nameFal = true;
                    }
                }, 'json')
            }
        })

        $('#org_credit_id').blur(function() {
            var obj = $(this);
            if(obj.val().trim() != '') {
                $.post('manage/tbotherorg!findOrg.action', {org_credit_id : obj.val().trim(),orgId: $("#orgId").val()}, function(data) {
                    if(data.msg == 'no') {
                        obj.err("组织结构代码重复，请重新填写！");
                        codeFal = false;
                    } else {
                        obj.closeErr();
                        codeFal = true;
                    }
                }, 'json')
            }
        })
    })
</script>
</body>
</html>
