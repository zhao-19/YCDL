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

        select {
            height: auto;
        }
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

<s:form action="qiye!" namespace="/" theme="simple" id="form">
    <table class="table table-bordered">


        <tr style="display:none;">
            <th colspan="2">e.pk_qiyeid</th>
            <td colspan="2"><s:hidden name="e.pk_qiyeid"/></td>
            <th class="td_right">用户ID</th>
            <td style="text-align: left;">
                <s:textfield name="e.userid" id="userid" readonly="false"/>
            </td>
        </tr>

        <tr>


            <th class="td_right" style="width: 200px">企业名称</th>
            <td style="text-align: left;">
                <s:textfield name="e.qiyemingcheng" id="qiyemingcheng" readonly="false"
                             data-rule="qiyemingcheng;length[2~100]"/>
            </td>

            <th class="td_right">成立日期</th>
            <td style="text-align: left;">
                <s:textfield name="e.chengliriqi" id="chengliriqi" class="Wdate" onfocus="WdatePicker()" readonly="readonly"
                             data-rule="required;"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">注册资本(万元)</th>
            <td style="text-align: left;">
                <s:textfield name="e.zhuceziben" id="zhuceziben" readonly="false"
                             data-rule="required;"/>
            </td>

            <th class="td_right">注册资金币种：</th>
            <td style="text-align: left;">
                <s:select  list="%{#application.dic.aadf63ab73e949859574f6ed6bf34b4d.childs}" listKey="id"
                           listValue="name" name="e.zczjbz"
                           headerKey="" headerValue="" cssClass="select iselect"/>
            </td>
        </tr>
        <tr>
            <th class="td_right">办公(经营)地址</th>
            <td style="text-align: left;" colspan="3">
                <s:textfield name="e.dizhi" id="dizhi" readonly="false" data-rule="dizhi;length[2~128]"/>
            </td>

        </tr>

        <tr>
            <th class="td_right">法人代表姓名</th>
            <td style="text-align: left;">
                <s:textfield name="e.faren" id="faren" readonly="false" data-rule="法人代表姓名;faren;length[2~128]"/>
            </td>

            <th class="td_right">工商注册地</th>
            <td style="text-align: left;">
            <span class="rightinfo" id="gszcdspan">
                <select data-rule="required;" id="gszcd_province" name="e.gszcd_province"><s:property value="e.gszcd_province"/></select>  
                <select data-rule="required;" id="gszcd_city" name="e.gszcd_city"><s:property value="e.gszcd_city"/></select>  
                <select data-rule="required;" id="gszcd_county" name="e.gszcd_county"><s:property value="e.gszcd_county"/></select>
            </span>
                		
                		<input type="hidden" id="province" value='<s:property value="e.gszcd_province"/>'/>
                        <input type="hidden" id="city" value='<s:property value="e.gszcd_city"/>'/>
                        <input type="hidden" id="county" value='<s:property value="e.gszcd_county"/>'/>
						<input type="hidden" id="custtype" value='productczdfirst'/>

                        <script type="text/javascript">var custtype = 'productczdfirst';</script>	
                        <script src="../../resource/js/area.js"></script>
                        <script type="text/javascript">
                            //var custtype = '<s:property value="userType"/>';
                            _init_area();


                        </script>
            </td>
        </tr>

        <tr>
            <th class="td_right">组织机构代码（统一社会信用代码）</th>
            <td style="text-align: left;">
                <input type="text" name="e.zzjgdm" id="zzjgdm" class="n-valid" value="<s:property value="e.zzjgdm"/> ">
                <%--<s:textfield name="e.zzjgdm" id="zzjgdm" readonly="false" data-rule="zzjgdm;length[2~36]"/>--%>
            </td>

            <th class="td_right">企业性质</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.qylx.childs}" listKey="id" listValue="name" name="e.qiyexingzhiid"
                          label="企业性质"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">所属行业</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.c9a715e6c1b446c48c1818d80452c3ed.childs}" listKey="id"  
                          listValue="name" name="e.hangyeid" label="所属行业"
                />
            </td>

            <th class="td_right">所处阶段</th>
            <td style="text-align: left;">
                <s:select list="%{#request.scjdlist}" listKey="id"
                          listValue="name" name="e.suchujieduanid" label="所属行业"
                />

            </td>
        </tr>

        <tr>
            <th class="td_right">经营范围</th>
            <td colspan="3">
                <s:textarea name="e.jingyingfanwei" rows="3" cols="80" id="jingyingfanwei" readonly="false"
                            data-rule="jingyingfanwei;length[2~1024]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业基本介绍</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea name="e.qiyejieshao" rows="3" cols="80" id="qiyejieshao" readonly="false"
                            data-rule="qiyejieshao;length[2~4096]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">主营业务</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea name="e.zhuyingyewu" rows="3" cols="80" id="zhuyingyewu" readonly="false"
                            data-rule="zhuyingyewu;length[2~512]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">兼营业务</th>
            <td style="text-align: left;" colspan="3">
                <s:textarea name="e.jianyingyewu" rows="3" cols="80" id="jianyingyewu" readonly="false"
                            data-rule="jianyingyewu;length[2~512]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业认证</th>
            <td style="text-align: left;">
                <s:textfield name="e.qiyerenzheng" id="qiyerenzheng" readonly="false" data-rule="length[0~128]"/>
            </td>

            <th class="td_right">员工数</th>
            <td style="text-align: left;">
                <s:textfield name="e.yuangongshu" id="yuangongshu" readonly="false"
                             data-rule="yuangongshu;length[1~8]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">大专以上技术人员数</th>
            <td style="text-align: left;">
                <s:textfield name="e.dazhuanrenshu" id="dazhuanrenshu" readonly="false"
                             data-rule="dazhuanrenshu;length[1~8]"/>
            </td>

            <th class="td_right">从事研发人数</th>
            <td style="text-align: left;">
                <s:textfield name="e.yanfarenshu" id="yanfarenshu" readonly="false"
                             data-rule="yanfarenshu;length[1~8]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">本科以上占管理比例</th>
            <td style="text-align: left;">
                <s:textfield name="e.bkzglbl" id="bkzglbl" readonly="false" data-rule="bkzglbl;length[1~8]"/>
            </td>

            <th class="td_right">有无上市计划</th>
            <td style="text-align: left;">
                <s:select list="%{#application.dic.sf.childs}" listKey="id" listValue="name" name="e.shangshijihua"
                          label="有无上市计划"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">企业LOGO</th>
            <td style="text-align: left;">
                <s:textfield name="e.logo" id="logo" readonly="false" data-rule="logo;length[2~64]"/>
            </td>

            <th class="td_right">网址</th>
            <td style="text-align: left;">
                <s:textfield name="e.wangzhi" id="wangzhi" readonly="false" data-rule="wangzhi;length[2~64]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">联系人姓名</th>
            <td style="text-align: left;">
                <s:textfield name="e.xingming" id="xingming" readonly="false" data-rule="xingming;length[2~32]"/>
            </td>

            <th class="td_right">职务</th>
            <td style="text-align: left;">
                <s:textfield name="e.bumenzhiwu" id="bumenzhiwu" readonly="false" data-rule="bumenzhiwu;length[2~50]"/>
            </td>
        </tr>

        <tr>
            <th class="td_right">移动电话</th>
            <td style="text-align: left;">
                <s:textfield name="e.yidongdianhua" id="yidongdianhua" readonly="false"
                             data-rule="yidongdianhua;length[2~50]"/>
            </td>

            <th class="td_right">固定电话</th>
            <td style="text-align: left;">
                <s:textfield name="e.gudingdianhua" id="gudingdianhua" readonly="false"
                             data-rule="gudingdianhua;length[2~50]"/>
            </td>
        </tr>
        
		<s:if test="e.pk_qiyeid=='' or e.pk_qiyeid==null">
        </s:if>
        <s:else>
        <tr>
        	<th class="td_right">客户经理</th>
            <td style="text-align: left;">
                <input type="text" class="n-valid" value="<s:property value="e.custmanage"/> ">
                              
            </td>
            
            <th class="td_right">客户经理数据来源</th>
            <td style="text-align: left;">
                <input type="text" class="n-valid" value="<s:property value="e.custmanagesource"/> ">
            </td>
        </tr>
        </s:else>
        
        <tr>
            <th class="td_right">是否推荐</th>
            <td style="text-align: left;">

                <s:select list="%{#request.status2list}" listKey="id"
                          listValue="name" name="e.shifoutuijian" id="shifoutuijian" onchange="changetuijian()"
                          value="#request.e.shifoutuijian"/>
            </td>
            <th class="td_right">评级</th>
            <td style="text-align: left;">
                <select name="e.pingji" data-rule="评级:required;pingji;">
                	<option value=0 <s:if test="e.pingji == ''">selected</s:if>></option>
                    <option value=0 <s:if test="e.pingji == 0">selected</s:if>>0</option>
                    <option value=1 <s:if test="e.pingji == 1">selected</s:if>>1</option>
                    <option value=2 <s:if test="e.pingji == 2">selected</s:if>>2</option>
                    <option value=3 <s:if test="e.pingji == 3">selected</s:if>>3</option>
                    <option value=4 <s:if test="e.pingji == 4">selected</s:if>>4</option>
                    <option value=5 <s:if test="e.pingji == 5">selected</s:if>>5</option>
                </select>
                    <%--<s:textfield name="e.pingji" id="pingji" readonly="false" data-rule="评级:required;pingji;"/>--%>
            </td>
            
        </tr>
        


        <tr>
            <td colspan="4" style="text-align: center;">
                <s:if test="e.pk_qiyeid=='' or e.pk_qiyeid==null">
                    <button type="button" onclick="check('manage/qiye!insert.action');" class="btn btn-success">
                        <i class="icon-ok icon-white"></i> 新增
                    </button>
                </s:if>
                <s:else>
                    <button type="button" onclick="check('manage/qiye!update.action');" class="btn btn-success">
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

    //效验组织机构和移动电话
    function check(urlStr) {
        var zzjgdm = $('#zzjgdm').val();
        var yidongdianhua = $('#yidongdianhua').val();
        var fal = true;

        if (zzjgdm == '') {
            $('#zzjgdm').err("组织机构代码不能为空！");

            fal = false;
        } else {
            var num = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;

            if (num.test(zzjgdm.trim())) {
//                $('#zzjgdm').closeErr();
            } else {
                $('#zzjgdm').err("请填写正确的组织机构代码！");
                fal = false;
            }
        }

        if (yidongdianhua == '') {
            $('#yidongdianhua').err("移动电话不能为空！");
            fal = false;
        } else {
            var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则

            if (reg.test(yidongdianhua.trim())) {
                $('#yidongdianhua').closeErr();
            } else {
                $('#yidongdianhua').err("请正确的移动电话！");
                fal = false;
            }
        }

        var qiyemingcheng = $('#qiyemingcheng').val();

        if (qiyemingcheng.trim() == '') {
            $('#qiyemingcheng').err("企业名称不能为空！");
            fal = false;
        } else {
//            $('#qiyemingcheng').closeErr();
        }

        var bumenzhiwu = $('#bumenzhiwu').val();

        if (bumenzhiwu == '') {
            $('#bumenzhiwu').err("职务不能为空！");
            fal = false;
        } else {
            $('#bumenzhiwu').closeErr();
        }

        var xingming = $('#xingming').val();

        if (xingming == '') {
            $('#xingming').err("联系人姓名不能为空！");
            fal = false;
        } else {
            $('#xingming').closeErr();
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

        $('#qiyemingcheng').blur(function () {
            var obj = $(this);

            if(obj.val().trim() != '') {

                $.post('manage/qiye!findCompany.action', { companyName : obj.val().trim()}, function(data) {

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

        $('#zzjgdm').blur(function() {
            var obj = $(this);

            if(obj.val().trim() != '') {

                $.post('manage/qiye!findCompany.action', { organizationCode : obj.val().trim()}, function(data) {

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
