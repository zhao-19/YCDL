<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.winpow.core.front.SystemManager" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>

    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/jquery-1.11.3.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>

    <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css"/>

    <script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

    <script>
        KindEditor.ready(function (K) {
            var editor = K.editor({
                allowFileManager: false
            });


            K('#filemanager').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#logo').val(),
                        clickFn: function (url, title) {
                            K('#logo').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });

            K('#logo').click(function () {
                editor.loadPlugin('image', function () {
                    editor.plugin.imageDialog({
                        insertfile: K('#logo').val(),
                        clickFn: function (url, title) {
                            K('#logo').val(url);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
    </script>

</head>
<body>
<!--公共提示框-->
<!-- 
	<div class="ggts"></div> -->
<div id="ggts2"></div>


<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="${msg}">
<input type="hidden" id="backnoticebzf" value="${buttonType}">
<%--<input type="hidden" id="t" value="${t}">--%>
<input type="hidden" id="t" value=""/>
<script type="text/javascript">
    function ggts2(val) {
        $("#ggts2").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }
    <%--
        <s:if test="#request.msg == 'success'">$(function() {ggts2("企业基本情况表填写成功，请点击左侧政策项目进行填报");})</s:if>
    --%>
    $(window).load(function () {

        var backnotice = $("#backnotice").val();  //success  成功    erro 失败
        var backnoticebzf = $("#backnoticebzf").val();  // 1数据保存  2 数据提交
        //alert(backnotice+"**"+backnoticebzf);
        if (backnotice == 'success') {
            if (backnoticebzf == '1') {
                ggts2("数据暂存成功！");
                setTimeout(function () {
                    window.location = "/declare_base/toFrontBase.html?t=v";
                }, 1500);
            }
            if (backnoticebzf == '2') {
                ggts2("数据保存成功！");
                setTimeout(function () {
                    window.location = "/declare_base/toFrontBase.html?t=v";
                }, 1500);
            }
        }
        if (backnotice == 'erro') {
            if (backnoticebzf == '1') {
                ggts2("数据暂存失败！");
            }
            if (backnoticebzf == '2') {
                ggts2("数据保存失败！");
            }

        }

        var t = $("#t").val();//v 查看   u 修改  a 新增
//        alert(t);
        //<c:if test="${e.id != null}">
        if (t == 'v') {
            //表示查询
            $("#form1 input,select,textarea").attr('disabled', true);
            $('.shangyibu').attr('disabled', false);
            $('.xiaoyibu').attr('disabled', false);
            $(".baocun").hide();

        }
        else if (t == 'a') {
            //表示新增（在返回没有数据的情况可以新增）

            //qiyeappinfo();//调用验证
        } else if (t == 'u') {
            //表示修改
            //$("#qiyeappinfo").attr("action","/usercenter/updateQiyeinfo.html");

            //qiyeappinfo();//调用验证
        }
        //</c:if>


        //点击返回上一步
        $(".shangyibu").click(function () {
            //location.href = "/usercenter/getPublishguquanlist.html";
        });
        //提交的时候手动判断大框框下的小框框的第一个input框是否有值，如果没有，则这个小框框下的所有input的name去掉

        function checkIfval() {
            var xiaokks = $("#dkk").children(".xkk");
            xiaokks.each(function () {
                var xiaofirstval = $(this).children().find("input").eq(0).val();
                if (xiaofirstval.length < 1) {
                    $(this).children().find("input").attr("name", "");
                }
            });

        };

        //点击保存,不验证isNotNull
        $('.baocun').click(function () {
            $('#buttonType').val('1');

            if (DataCheck.isLength()) {

                if (DataCheck.isInt()) {

                    if (DataCheck.isFint()) {

                        if (DataCheck.isZint()) {

                            if (DataCheck.isZuzhi()) {

                                if (DataCheck.isPhone()) {

                                    if (DataCheck.isEmail()) {

                                        if (DataCheck.idCard()) {
                                            //检测如果没填小框框内容，则把inputdname去掉，避免传到后台。
                                            checkIfval();
                                            //alert("可以保存!");
                                            //判断上传文件
                                            //alert(checkfilehidden(true))
                                            //return;
                                            buttonDefaultValue = $(this).val();
                                            countDown(this, 5);
                                            nativeNum("isBankZint");//还原为数字
                                            $("#form1").submit();//改变链接并提交
                                        } else {
                                            alert("不可以保存!");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });

        //点击提交,sb_base.jsp页面只有一个按钮，是当成提交处理。
        $('.tijiao').click(function () {
            $('#buttonType').val('2');
            //点击保存提交对其它融资方式的判断，判断是否显示，且判断其值是否符合要求
            var qtrzfsinput = $(".qtrzfs .rightinfo input");

            if ($("#ifshowqtrz").val() == 1) {

                if (qtrzfsinput.val().length < 1) {
                    qtrzfsinput.parent().children("span").html("其它融资方式不能为空！");
                    return;
                } else {
                    qtrzfsinput.parent().children("span").html("");
                }
                if (qtrzfsinput.val().length > 16) {
                    qtrzfsinput.parent().children("span").html("0~16字符之内！");
                    return;
                } else {
                    qtrzfsinput.parent().children("span").html("");
                }

            }

            if (DataCheck.isNotNull()) {

                if (DataCheck.isLength()) {

                    if (DataCheck.isInt()) {

                        if (DataCheck.isFint()) {

                            if (DataCheck.isZint()) {

                                if (DataCheck.isZuzhi()) {

                                    if (DataCheck.isPhone()) {

                                        if (DataCheck.isEmail()) {

                                            if (DataCheck.isBankZint()) {

                                                if (DataCheck.idCard()) {
                                                    //alert("可以提交!");
                                                    if (!checkEachNeedDate("form1")) {
                                                        return;
                                                    }
                                                    //检测如果没填小框框内容，则把inputdname去掉，避免传到后台。
                                                    checkIfval();
                                                    //判断上传文件
                                                    if (checkfilehidden(true)) {

                                                        buttonDefaultValue = $(this).val();
                                                        countDown(this, 5);
                                                        nativeNum("isBankZint");//还原为数字
                                                        $("#form1").submit();//改变链接并提交
                                                    } else {
                                                        //alert("提交失败!");
                                                        return;
                                                    }


                                                } else {
                                                    alert("不可以提交!");
                                                }

                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });


    });
</script>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
    <div class="show fl">
        <%@ include file="../usercenter/leftnav.jsp" %>
    </div>


    <div class="list fr">
        <div class="rightbox">

            <!-- 债权信息修改    用户为企业时显示    -->
            <div id="zaiquanxinxi-update" class="vipinfo">

                <form id="form1" name="sb_base" action="/declare_base/saveBase.html" namespace="/" method="post">

                    <div class="title">
                        <li><span class="t">成都高新区金融类企业基本情况表<span class="statusok">(<s:if
                                test="e.id == null">未填写</s:if><s:else>已填写</s:else>)</span></span>
                            <%-- <a href="/declare_base/toFrontBase.html?t=a"><span id="CreateTBpxhd"
                                                                               class="update">企业基本信息修改</span></a>--%>
                        </li>
                    </div>
                    <input type="hidden" name="t" value="${t}"/>
                    <input type="hidden" name="leibie" value="${leibie}">
                    <input type="hidden" name="type" value="${type}">
                    <input type="hidden" lang="ID" name="id" value="<s:property value='e.id'/>"/>
                    <input type="hidden" lang="用户号" name="userid" value="<s:property value='e.userid'/>"/>
                    <input type="hidden" lang="删除图片时ajax提交的地址" id="url" value="/interestapp/deletepic.html"/>
                    <input type="hidden" id="buttonType" name="buttonType">

                    
                    <div class="inputtest inputtestl" style="width: 100%;">
                        <span class="leftname leftnamel">机构名称：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:620px;">
                        
                        <input style="width:595px;" isNotNull="机构名称"
                              isLength="[0,64]" class="input"
                              id="qiyemingcheng" name="org_name"
                              type="text"
                              value="<s:if test="#request.type != '' and #request.type != null"><s:property value='base.qiyemingcheng'/></s:if><s:else><s:property value='e.qiyemingcheng'/></s:else>"/>
                        
                        
                        
                        
                        
                        </span>
                    </div>

                    <div class="inputtest inputtestl" style="width:100%;line-height: 36px;">
                        <span class="leftname leftnamel">工商注册地址：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:417px;"><input style="width:394px;" isNotNull="工商注册地址"
                                                                            isLength="[0,128]" class="input" id="dizhi"
                                                                            name="regist_add" type="text"
                                                                            value="<s:if test="#request.type != '' and #request.type != null"><s:property value='base.dizhi'/></s:if><s:else><s:property value='e.dizhi'/></s:else>"/></span>&nbsp;&nbsp;(与营业执照上的注册地址相同)
                    </div>
                    <div class="inputtest inputtestl" style="width:100%;">
                        <span class="leftname leftnamel">实际经营地址：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:620px"><input style="width:595px;" isNotNull="实际经营地址"
                                                                           isLength="[0,128]" class="input"
                                                                           name="run_add"
                                                                           type="text"
                                                                           value="<s:if test="#request.type != '' and #request.type != null"><s:property value='base.sjdizhi'/></s:if><s:else><s:property value='e.sjdizhi'/></s:else>"/></span>
                    </div>
                     <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">注册资金（承诺出资）：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="注册资金" isBankZint="isBankZint"
                                                       onchange="this.value=formatNum(this.value)" isLength="[0,18]"
                                                       class="input ibg"
                                                       name="regist_amt" type="text"
                                                       value="<s:if test="#request.type != '' and #request.type != null"><s:property value='base.zhuceziben'/></s:if><s:else><s:property value='e.zhuceziben'/></s:else>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">目前到位资金：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="目前到位资金" isBankZint="isBankZint"
                                                       onchange="this.value=formatNum(this.value)" isLength="[0,18]"
                                                       class="input ibg"
                                                       name="paid_amt" type="text"
                                                       value="<s:property value='e.shijiaoziben'/>"/></span>
                    </div>
                   
                 
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">所属产业：<span style="color:red">*</span></span>
					<span class="rightinfo">
                        <select isNotNull="所属产业" isLength="[0,32]" readonly="readonly" name="industry_owned" class="select">
                            <option></option>
                            <c:if test="${!empty type}">
                                <c:forEach items="${applicationScope.dic.sscy.childs}" var="datas">
                                <option value="${datas.id}"
                                        <c:if test="${sscy == datas.id}">selected</c:if>>${datas.name}</option>
                                </c:forEach>
                            </c:if>
                             <c:if test="${empty type}">
                                 <c:forEach items="${applicationScope.dic.sscy.childs}" var="datas">
                                <option value="${datas.id}"
                                        <c:if test="${e.sscy == datas.id}">selected</c:if>>${datas.name}</option>
                                 </c:forEach>
                             </c:if>
                        </select>
					</span>
                    </div>
                    
                      
                            <div class="inputtest inputtestl " id="dkk">
                                    <span class="leftname leftnamel">成立时间：</span>
		                 	<span class="rightinfo"><input class="input stext laydate-icon" readonly="readonly"
                                                           id="declareBaseCoreList[0].dzsj"
                                                           name="open_date" type="text"
                                                           value=""/></span>
                                </div>
                  
                    
                  
       
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业负责人：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业负责人" isLength="[0,16]" class="input" name="chargeperson"
                                                       type="text"
                                                       value="<s:property value='e.fzr'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业负责人职务：<span style="color:red">*</span></span>
                        <span class="rightinfo">
                        				<!-- <input isNotNull="企业负责人职务" isLength="[0,16]" class="input" name="charge_duty"
                                                       type="text"
                                                       value="<s:property value='e.fzrzw'/>"/> -->
                             <select name="fzrzw" isNotNull="企业负责人职务" class="select">
                     
                             	
                             	<option value="法定代表人" <c:if test="${e.fzrzw == '法定代表人'}">selected</c:if>>法定代表人</option>
								<option value="董事长" <c:if test="${e.fzrzw == '董事长'}">selected</c:if>>董事长</option>
								<option value="执行董事" <c:if test="${e.fzrzw == '执行董事'}">selected</c:if>>执行董事</option>
								<option value="总经理" <c:if test="${e.fzrzw == '总经理'}">selected</c:if>>总经理</option>
								<option value="副总经理" <c:if test="${e.fzrzw == '副总经理'}">selected</c:if>>副总经理</option>
                             </select>
                        
						</span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业负责人手机：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业负责人手机" isPhone="企业负责人手机" isLength="[0,11]"
                                                       class="input" name="charge_tele" type="text"
                                                       value="<s:property value='e.fzrsj'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人" isLength="[0,16]" class="input" name="contacts"
                                                       type="text"
                                                       value="<s:property value='e.lxr'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人职务：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人职务" isLength="[0,8]" class="input" name="contacts_duty"
                                                       type="text"
                                                       value="<s:property value='e.lxrzw'/>"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人手机：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人手机" isPhone="联系人手机" isLength="[0,11]" class="input"
                                                       name="contacts_tele" type="text"
                                                       value="<s:property value='e.lxrsj'/>"/></span>
                    </div>
                    
                     <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">统计关系所在地：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input id="tjgxszd" isNotNull="统计关系所在地" isLength="[0,64]" class="input"
                                                       name="rela_add" type="text"
                                                       value="<s:property value='e.tjgxszd'/>"/></span>
                    </div>
                   
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">国税关系所在地：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="国地税缴纳机关" isLength="[0,64]" class="input zcmoren"
                                                       name="rela_nation_tax_add" type="text"
                                                       value="<s:property value='e.gdsjnjg'/>"/></span>
                    </div>
                    
                     <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">地税关系所在地：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="国地税缴纳机关" isLength="[0,64]" class="input zcmoren"
                                                       name="rela_local_tax_add" type="text"
                                                       value="<s:property value='e.gdsjnjg'/>"/></span>
                    </div>
                   
                   
                    

 					
 					 <style>
				       .jyqk{border-collapse: collapse;width:100%;margin-bottom:20px;}
				       .jyqk td{border: 1px solid #ddd;padding:4px;text-align: center;width:10%;}
				       .jyqk tr td:first-child{width:150px;}
				       .jyqk .inputtestl{width:100%;margin-bottom:0;}
						.creditor .vipinfo .jyqk .input{width:85%;padding:5px;   border: 1px solid #E0E0E0}				      
				       
				   		.jyqk2 td{width:11%;}
				    </style>
 					<p class="jiange">经营指标<span>（单位为万元 ，员工人数单位为个）</span></p>
 					<table class="jyqk">
					    <thead>
					    <tr>
					        <td>年份</td>
					        <td>营业收入</td>
					        <td>利润</td>
					        <td>营业税</td>
					        <td>增值税</td>
					        <td>企业所得税</td>
					        <td>纳税总额</td>
					        <td>员工人数</td>
					        <td>员工薪酬总额</td>
					        <td>固定资产折旧总额</td>
					       
					    </tr>
					    <tr>
					        <td>2015年</td>
					      
					        <td>
							  <input isNotNull="营业收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="firstsell " type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="利润" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="firstinte" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="营业税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_income_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="增值税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_added_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="企业所得税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_sales_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="纳税总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="firsttax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="员工人数" isInt="isInt" isLength="[0,18]"class="input ibg" name="first_stuff_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="员工薪酬总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_salary_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="固定资产折旧总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_depreciation_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					       
					    </tr>
					    <tr>
					        <td>2016年</td>
					          <td>
							  <input isNotNull="营业收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="secondsell " type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="利润" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="secondinte" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="营业税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_income_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="增值税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_added_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="企业所得税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_sales_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="纳税总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="secondtax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="员工人数" isInt="isInt" isLength="[0,18]"class="input ibg" name="second_stuff_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="员工薪酬总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_salary_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="固定资产折旧总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_depreciation_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					    </tr>
					    <tr>
					        <td>2017年<br>（预计）</td>
					      <td>
							  <input isNotNull="营业收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="thirdsell " type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="利润" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="thirdinte" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="营业税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_income_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="增值税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_added_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="企业所得税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_sales_tax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="纳税总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="thirdtax" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="员工人数" isInt="isInt" isLength="[0,18]"class="input ibg" name="third_stuff_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="员工薪酬总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_salary_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="固定资产折旧总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_depreciation_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					    </tr>
					    </thead>
					</table>
					
					
				   <p class="jiange">分类指标<span>（银行、证券、保险类公司填写，金额单位为万元，增长率单位为%）</span></p>
 					
 					<table class="jyqk jyqk2">
					    <thead>
					    <tr>
					        <td>年份</td>
					        <td>存款余额</td>
					        <td>存款余额增长率</td>
					        <td>贷款余额</td>
					        <td>贷款余额增长率</td>
					        <td>证券交易额</td>
					        <td>证券交易额增长率</td>
					        <td>保费收入</td>
					        <td>保费收入增长率</td>
					    </tr>
					    <tr>
					        <td>2015年</td>
					      
					        <td>
							  <input isNotNull="存款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_deposit_count " type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="存款余额增长率" isInt="isInt" isLength="[0,18]"class="input ibg" name="first_deposit_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_loan_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="first_loan_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_stock_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="first_stock_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="first_guara_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="first_guara_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        
					       
					    </tr>
					    <tr>
					    <td>2016年</td>
					       <td>
							  <input isNotNull="存款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_deposit_count " type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="存款余额增长率" isInt="isInt" isLength="[0,18]"class="input ibg" name="second_deposit_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_loan_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="second_loan_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_stock_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="second_stock_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="second_guara_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="second_guara_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					       
					    </tr>
					    <tr>
					        <td>2017年<br>（预计）</td>
					     <td>
							  <input isNotNull="存款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_deposit_count " type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="存款余额增长率" isInt="isInt" isLength="[0,18]"class="input ibg" name="third_deposit_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_loan_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="third_loan_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_stock_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="third_stock_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" name="third_guara_count" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入增长率" isInt="isInt"  isLength="[0,18]"class="input ibg" name="third_guara_rate" type="text"value="<s:property value='e.snmzzc'/>"/>
					        </td>
					        
					    </tr>
					    </thead>
					</table>
					


              
                   
                          

                    <div class="revise" id="zqxxxgbtn">

                        <input class="shenqingdkt baocun" lang="<s:property value='rele_id'/>" type="button"
                               value="暂存"/>&nbsp;&nbsp;
                        <input class="shenqingdkt tijiao" type="button" value="保存"/>
                    </div>


                </form>
            </div>

        </div>

    </div>

</div>

<input type="hidden" id="ifshowqtrz"/>

<script type="text/javascript" src="../plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="../plupload/Public/js/sucaihuo.js"></script>
<script type="text/javascript">
    //收入利润表格，要是没有填写的时候应该默认为0
    defaultNull(".niantable", "input", "0.0", "claignore");
    //工商注册机关和国地税缴纳机关默认是  ”成都高新区“
    var zcmoren = "成都高新区";
    $(".zcmoren").each(function () {
        if ($(this).val().length < 1) {
            $(this).val(zcmoren);
        }
    });


    //统计关系所在地，值默认为”成都高新区“
    var tjgxszd = $("#tjgxszd");
    if (tjgxszd.val().length < 1) {
//        alert(tjgxszd);
        tjgxszd.attr("value", "成都高新区");
    }

    //加载页面时有值就显示，
    var qtrzfsinput = $(".qtrzfs .rightinfo input");
    if (qtrzfsinput.val().length > 0) {

        $("#ifshowqtrz").val(1);

        $(".qtrzfs").show();
        $(".qtrzfs .rightinfo input").blur(function () {
            if ($(this).val().length < 1) {
                $(this).parent().children("span").html("其它融资方式不能为空！");
                return;
            } else {
                $(this).parent().children("span").html("");
            }
            if ($(this).val().length > 16) {
                $(this).parent().children("span").html("0~16字符之内！");
                return;
            } else {
                $(this).parent().children("span").html("");
            }

        });
    } else {
        $("#ifshowqtrz").val(0);
    }


    //融资方式的值为“其它”时，其它融资方式才显示且为必填
    $(".blurcheckbox").click(function () {


        //获取选中的值
        var inputcheck = $(".blurcheckbox input:checked");
        if (inputcheck.length < 1) {
            $(this).children("span").html("此项不能为空！！");
        } else {
            $(this).children("span").html("");
        }

        //同时遍历下面的选中的值，如果里面含有“其它”，则把其它融资方式加上【显示】
        var ifshow = 0;
        inputcheck.each(function () {
            //点击外框，判断其它是否勾选，去判断其它融资方式是否显示
            //alert($(this).val());isnotnull="其它融资方式"islength="[0,16]"
            if ($(this).val() == 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa310') {
                ifshow = 1;
            } else {
                ifshow = 0;
            }
        });

        if (ifshow == 1) {

            $("#ifshowqtrz").val(1);
            $(".qtrzfs").show();
            //若显示，则为其绑定失去焦点事件，判断其值是否符合要求
            $(".qtrzfs .rightinfo input").blur(function () {
                if ($(this).val().length < 1) {
                    $(this).parent().children("span").html("其它融资方式不能为空！");
                    return;
                } else {
                    $(this).parent().children("span").html("");
                }
                if ($(this).val().length > 16) {
                    $(this).parent().children("span").html("0~16字符之内！");
                    return;
                } else {
                    $(this).parent().children("span").html("");
                }

            });
        } else {
            $("#ifshowqtrz").val(0);
            $(".qtrzfs").hide();
            $("[name='qtrzfs']").val('');
        }
        ifshow = 0;

    });

    $(".blurcheckbox input:checked").each(function () {
        //alert($(this).val());

    });


    $(".rongzicheckbox input:checked").each(function () {
        //alert($(this).val());
    });


    var t = $("#t").val();
    if (t != 'v') {
        var id = $("#id").val();

        var uptarget1 = $("#upspan1").attr('id');
        var leixing1 = $("#upspan1").attr('accesskey');

        var uploaderupspan1 = new plupload.Uploader({//创建实例的构造方法
            runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
            browse_button: 'upspan1', // 上传按钮
            multi_selection: true,
            url: "/goodaaa.action?uptarget=" + uptarget1 + "&leixing=" + leixing1 + "&id=" + id + "&table=tb_sb_base", //远程上传地址
            flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
            silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
            filters: {
                max_file_size: '200mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                mime_types: [//允许文件上传类型
                    {title: "files", extensions: "pdf"}
                ]
            },
            multi_selection: true, //true:ctrl多文件上传, false 单文件上传
            init: {
                FilesAdded: function (up, files) { //文件上传前
                    if ($("#picnum1").children(".div").length > 10) {
                        alert("您上传的图片太多了！");
                        uploaderupspan1.destroy();
                    } else {

                        //这里是在上传之前就创建好上传成功时候回来放展示图片的框框
                        var li = '';
                        plupload.each(files, function (file) { //遍历文件
                            li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                        });

                        $("#picnum1").append(li);
                        uploaderupspan1.start();


                    }
                },
                /*BeforeUpload:function(up,file){
                 var size = file.size;//图片size在IE9及其以下均无法获取大小
                 var type = file.type;
                 //alert(size+"**"+type);
                 if(type=="image/png" || type=="image/jpeg" || type=="image/gif"){
                 if(size>6*1024*1024){
                 alert("图片文件不能大于6M");
                 uploaderupspan1.stop();//停止当前上传
                 uploaderupspan1.removeFile(file);//移除当前图片
                 //uploaderupspan1.destroy();
                 uploaderupspan1.refresh();//刷新上传队列
                 return;//返回
                 }
                 }

                 },*/
                UploadProgress: function (up, file) { //上传中，显示进度条
                    var percent = file.percent;
                    $("#" + file.id).find('.bar').css({"width": percent + "%"});
                    $("#" + file.id).find(".percent").text(percent + "%");
                },
                FileUploaded: function (up, file, info) { //文件上传成功的时候触发
                    var data = eval("(" + info.response + ")");

                    if (data.error != '0') {
                        alert(data.error);
                        $("#" + file.id + "").remove();

                    } else {

                        if (data.type == 1) {
                            $("#" + file.id).html("<div class='img'><img accesskey='" + data.reducepath + "' lang='" + data.id + "' src='" + data.pic + "'/></div>");
                            $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                        } else {
                            $("#" + file.id).html("<div class='img'><img accesskey='" + data.pic + "' lang='" + data.id + "' src='" + data.reducepath + "'/></div>");
                            $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                        }

                        eachimg("picnum1");

                    }

                },
                Error: function (up, err) { //上传出错的时候触发
                    alert(err.message);
                }
            }
        });
        uploaderupspan1.init();


        var uptarget2 = $("#upspan2").attr('id');
        var leixing2 = $("#upspan2").attr('accesskey');
        var uploaderupspan2 = new plupload.Uploader({//创建实例的构造方法
            runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
            browse_button: 'upspan2', // 上传按钮
            multi_selection: true,
            url: "/goodaaa.action?uptarget=" + uptarget2 + "&leixing=" + leixing2 + "&id=" + id + "&table=tb_sb_base", //远程上传地址
            flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
            silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
            filters: {
                max_file_size: '200mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                mime_types: [//允许文件上传类型
                    {title: "files", extensions: "pdf"}
                ]
            },
            multi_selection: true, //true:ctrl多文件上传, false 单文件上传
            init: {
                FilesAdded: function (up, files) { //文件上传前
                    if ($("#picnum2").children(".div").length > 10) {
                        alert("您上传的图片太多了！");
                        uploaderupspan2.destroy();
                    } else {
                        var li = '';

                        plupload.each(files, function (file) { //遍历文件
                            li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                        });

                        $("#picnum2").append(li);
                        uploaderupspan2.start();
                    }
                },
                UploadProgress: function (up, file) { //上传中，显示进度条
                    var percent = file.percent;
                    $("#" + file.id).find('.bar').css({"width": percent + "%"});
                    $("#" + file.id).find(".percent").text(percent + "%");
                },
                FileUploaded: function (up, file, info) { //文件上传成功的时候触发
                    var data = eval("(" + info.response + ")");
                    var percent = file.percent;

                    if (data.error != '0') {
                        alert(data.error);
                        $("#" + file.id + "").remove();

                    } else {

                        if (data.type == 1) {
                            $("#" + file.id).html("<div class='img'><img accesskey='" + data.reducepath + "' lang='" + data.id + "' src='" + data.pic + "'/></div>");
                            $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                        } else {
                            $("#" + file.id).html("<div class='img'><img accesskey='" + data.pic + "' lang='" + data.id + "' src='" + data.reducepath + "'/></div>");
                            $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                        }

                        eachimg("picnum2");

                    }
                },
                Error: function (up, err) { //上传出错的时候触发
                    alert(err.message);
                }
            }
        });
        uploaderupspan2.init();


        var uptarget3 = $("#upspan3").attr('id');
        var leixing3 = $("#upspan3").attr('accesskey');
        var uploaderupspan3 = new plupload.Uploader({//创建实例的构造方法
            runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
            browse_button: 'upspan3', // 上传按钮
            multi_selection: true,
            url: "/goodaaa.action?uptarget=" + uptarget3 + "&leixing=" + leixing3 + "&id=" + id + "&table=tb_sb_base", //远程上传地址
            flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
            silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
            filters: {
                max_file_size: '200mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
                mime_types: [//允许文件上传类型
                    {title: "files", extensions: "pdf"}
                ]
            },
            multi_selection: true, //true:ctrl多文件上传, false 单文件上传
            init: {
                FilesAdded: function (up, files) { //文件上传前
                    if ($("#picnum3").children(".div").length > 10) {
                        alert("您上传的图片太多了！");
                        uploaderupspan3.destroy();
                    } else {
                        var li = '';

                        plupload.each(files, function (file) { //遍历文件
                            li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                        });

                        $("#picnum3").append(li);
                        uploaderupspan3.start();
                    }
                },
                UploadProgress: function (up, file) { //上传中，显示进度条
                    var percent = file.percent;
                    $("#" + file.id).find('.bar').css({"width": percent + "%"});
                    $("#" + file.id).find(".percent").text(percent + "%");
                },
                FileUploaded: function (up, file, info) { //文件上传成功的时候触发
                    var data = eval("(" + info.response + ")");
                    var percent = file.percent;

                    if (data.error != '0') {
                        alert(data.error);
                        $("#" + file.id + "").remove();

                    } else {

                        if (data.type == 1) {
                            $("#" + file.id).html("<div class='img'><img accesskey='" + data.reducepath + "' lang='" + data.id + "' src='" + data.pic + "'/></div>");
                            $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                        } else {
                            $("#" + file.id).html("<div class='img'><img accesskey='" + data.pic + "' lang='" + data.id + "' src='" + data.reducepath + "'/></div>");
                            $("#" + file.id).append("<input type='hidden' value='" + data.id + "' name='fileIds'>");
                        }

                        eachimg("picnum3");

                    }
                },
                Error: function (up, err) { //上传出错的时候触发
                    alert(err.message);
                }
            }
        });
        uploaderupspan3.init();

    }
    //每次上传完时调取这个排列图片的left的函数
    function eachimg(target) {
        var target = "#" + target;
        var left = 0;
        var picimgs = $(target + " .div");
        //去除先提交情况下的提示框
        var qsc = $(target).parent().parent().children('.qsc');
        if (qsc) {
            qsc.remove()
        }

        picimgs.each(function (i, v) {
            left = i * 8;
            picimgs.eq(i).attr("style", "left:" + left + "px");
            $(this).parent().prev("span").html(i + 1);
        });

    }

    //点击保存按钮时检查每个文件框是否都已经传值
    function checkfilehidden() {
        var picimgupspan = $(".upspan");
        var ifreturn = 0;
        var tolength = picimgupspan.length;
        picimgupspan.each(function (i, v) {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            var ifqsc = $(this).children(".qsc").attr("class");//提示未上传的情况再提交不能再加提示了
            var picval = picimgss.attr("class");

            //if((i+1)<tolength && (i+1) != 2 && (i+1) != 3 && (i+1) != 4){
            if ((i + 1) <= tolength) {
                if (!picval) {
                    if (!ifqsc) {
                        $(this).append("<div class='qsc'>请上传图片！</div>");
                    }
                    ifreturn = 1;
                }
            }

        });
        if (ifreturn) {
            return false;
        } else {
            return true;
            //document.getElementById("sb_base").submit();
        }
    }


    //刷新时，如果有图片还是要把left位置从新固定一下
    $(document).ready(function () {

        var lefts = 0;
        var picimgupspan = $(".upspan");


        picimgupspan.each(function () {
            var picimgss = $(this).children(".nrk").children(".picimg").children(".div");
            picimgss.each(function (i, v) {
                lefts = i * 8;
                picimgss.eq(i).attr("style", "left:" + lefts + "px");
                $(this).parent().prev("span").html(i + 1);
            });

        })

    });


    //贷款银行到到期日期的8个元素的增加和删除
    $(".adddel").click(function () {
        var xkks = $("#dkk").children(".xkk");
        var nownum = xkks.length;//现在要添加的元素名称的序号
        var newElement = xkks.eq(0).clone(true).appendTo($("#dkk")).attr("lang", "");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
//		xkks.eq(0).clone(true).insertAfter($(this).parent().parent()).attr("lang","");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
        newElement.find('input[type=text]').each(function () {
            $(this).val('');
        })
        var lastxkk_inputs = $("#dkk").children(".xkk:last").children().find("input[type=text]");//找到大框框下的最后一个元素里面的所有input
//		var lastxkk_inputs = $(this).parent().parent().next().children().find("input");//找到大框框下的最后一个元素里面的所有input

        var lastxkk_inputs_buttons = $("#dkk").children(".xkk:last").children().find("input[type=button]");
        lastxkk_inputs_buttons.eq(1).attr('onclick', "deleteCore(this, 0)");

        lastxkk_inputs.each(function () {
            //var reg=/^[^a-zA-Z0-9]$/g;//匹配字符串中的非字母【即中文和数字】
            //var thisnewstr=$(this).attr("name").replace(reg,"");//把匹配到的中文和数字替换为空
            var nameParentStrs = $(this).attr("name").split('.')[0];
            var nameStrs = $(this).attr("name").split('.')[1];

            var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

            $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
            $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id

            if ($(this).attr("value") == "增加" || $(this).attr("value") == "删除") {

            } else {
                $(this).attr("value", "");
            }
        });

        //给大框框下所有的日期input框动态添加日期事件
        var dkk_inamex = $("#dkk input[class='input stext laydate-icon']");
        dkk_inamex.live('click', function () {
            var naowdate = $(this).attr("id");
            laydate({elem: '#' + naowdate});//绑定元素
        });
    });

    //给大框框下所有的日期input框动态添加日期事件
    var dkk_inamex = $("#dkk input[class='input stext laydate-icon']");
    dkk_inamex.live('click', function () {
        var naowdate = $(this).attr("id");
        laydate({elem: '#' + naowdate});//绑定元素
    });

    //    //删除
    //    $("#gbdel").click(function () {
    //        var prev = $("#dkk").children(".xkk:last");
    //        var firsttr = prev.attr("lang");
    //        if (firsttr != "firsttr") {
    //            prev.remove();
    //        }
    //
    //    });


</script>

<%@ include file="../footer.jsp" %>
<script type="text/javascript">
    leftnav_init("qysqjbxx");
</script>
<%@ include file="tanchudel.jsp" %>


<script type="text/javascript">
    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#yrgqsj'});//绑定元素
//        laydate({elem: '#pichi'});//绑定元素
        //laydate({elem: '#dqsj'});//绑定元素
    }();

    //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: laydate.now(), //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);

    //自定义日期格式
    laydate({
        elem: '#test1',
        format: 'YYYY年MM月DD日',
        festival: true, //显示节日
        choose: function (datas) { //选择日期完毕的回调
            alert('得到：' + datas);
        }
    });

    //日期范围限定在昨天到明天
    laydate({
        elem: '#hello3',
        min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
        max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
    });

    var objbl = '';
    var objid = '';
    function deleteCore(obj, id) {
        objbl = obj;
        objid = id;
        $("#delSure").show();
        $("#delSure h4").html("确定要删除此栏申报？");//显示，停留，隐藏
        $("#delSure .delsure").html('确定');
        $("#delSure .delcancel").html('取消');
    }


    $("#delSure .delsure").click(function () {
        $("#delSure").hide();
        var parent = $(objbl).parent().parent();
        var xkks = $("#dkk").children(".xkk");
        //alert(xkks.length+"**");
        if (id != 0 && xkks.length > 1) {
            //alert(objid+"&&");
            $.post('/declare_base/deleteCore.html', {id: objid}, function (data) {

                if (data.msg == 'erro') {
                    alert("删除失败，请稍后再尝试！");
                } else {
                    alert("删除成功！");
                    removeCore(objbl);
                    return false;
                }
            }, 'json');
        } else if (id != 0 && xkks.length == 1) {
            ggts2('至少留一栏！');
            return;

        } else if (id == 0 && xkks.length > 1) {
            removeCore(objbl);
            return false;

        } else if (id == 0 && xkks.length == 1) {
            ggts2('至少留一栏！');
            return false;
        }


    });
    $("#delSure .delcancel").click(function () {
        $("#delSure").hide();
        return false;
    });


    function removeCore(obj) {
        //alert(3);
        //2重新排序
        var parent = $(objbl).parent().parent();
        //1删除该栏
        parent.remove();
        var xkks = $("#dkk").children(".xkk");
        $("#dkk").children(".xkk").each(function (nownum) {
            var lastxkk_inputs = $(this).children().find("input");//找到大框框下的最后一个元素里面的所有input

            lastxkk_inputs.each(function () {

                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if (nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);
                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);
            });

            var lastxkk_selects = $(this).children().find("select");

            lastxkk_selects.each(function () {
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if (nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
            });
        })

        var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class=input laydate-icon]");
        lastxkk_laydates.each(function () {
            $(this).rules("add", {
                required: true,
                isDate: true,
                messages: {required: "请输入", isDate: "日期格式如：2016-08-12"}
            })
        });
    }

    $(function() {
        var zczjbz = $('#zczjbz').val();

        if (zczjbz == '') {
            $('#zczjbz').val('e66405d84c9d4f03b1f87624938174e3');
        }
    })
</script>

</body>
</html>
 