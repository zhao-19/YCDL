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
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/baobiao.css"/>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>

    <script language="javascript" type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/DataCheck.js"></script>
   <script type="text/javascript"
            src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/sbapp/sb_delimg.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/laydate.js"></script>

    <link rel="stylesheet" href="/resource/kindeditor-4.1.7/themes/default/default.css"/>

    <script charset="utf-8" src="/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script charset="utf-8" src="/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/resource/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">


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
        	$('#iscomplete').val('10002');
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
        	$('#iscomplete').val('10001');
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
                        $(this).append("<div class='qsc'>请上传文件！</div>");
                    }
                    ifreturn = 1;
                }
            }

        });
        if (ifreturn) {
            return false;
        }else{
        	return true;
        }
    }

</script>
</head>
<body>
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
            <div id="zaiquanxinxi-update" class="vipinfo">
                <form id="form1" name="sb_base" action="/userextend/saveBaseJg.html" namespace="/" method="post">
                    <div class="title">
                        <li><span class="t">成都高新区金融类企业基本情况表<span class="statusok">(<s:if
                                test="tbsbbasejg.iscomplete == 10001">已填写</s:if><s:else>未完整</s:else>)</span></span>
                        </li>
                    </div>
                    <input type="hidden" lang="ID" id="tbsbbasejg.id" name="tbsbbasejg.id" value="${tbsbbasejg.id }"/>
                    <input type="hidden" name="tbsbbasejg.business_no" value="${tbsbbasejg.business_no }"/>
                    <input type="hidden" name="tbsbbasejg.iscomplete" id="iscomplete"/>
                    <div class="inputtest inputtestl" style="width: 100%; display:none;">
                        <span class="leftname leftnamel">批次：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:620px;">
                        
                        <input style="width:600px;" isNotNull="批次"
                              isLength="[0,64]" class="input"
                              id="tbsbbasejg.pichi" name="tbsbbasejg.pichi"
                              type="text"
                              value="${tbsbbasejg.pichi }"/>

                        </span>
                    </div>
                    <div class="inputtest inputtestl" style="width: 100%;">
                        <span class="leftname leftnamel">机构名称：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:620px;">
                        
                        <input style="width:600px;" isNotNull="机构名称"
                              isLength="[0,64]" class="input"
                              id="tbsbbasejg.org_name" name="tbsbbasejg.org_name"
                              type="text"
                              value="${tbsbbasejg.org_name}"/>

                        </span>
                    </div>

                    <div class="inputtest inputtestl" style="width:100%;line-height: 36px;">
                        <span class="leftname leftnamel">工商注册地址：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:417px;"><input style="width:394px;" isNotNull="工商注册地址"
                                                                            isLength="[0,128]" class="input" id="tbsbbasejg.regist_add"
                                                                            name="tbsbbasejg.regist_add" type="text"
                                                                            value="${tbsbbasejg.regist_add}"/>
                                                                            </span>&nbsp;&nbsp;(与营业执照上的注册地址相同)
                    </div>
                    <div class="inputtest inputtestl" style="width:100%;">
                        <span class="leftname leftnamel">实际经营地址：<span style="color:red">*</span></span>
                        <span class="rightinfo" style="width:620px"><input style="width:600px;" isNotNull="实际经营地址"
                                                                           isLength="[0,128]" class="input" 
                                                                           id="tbsbbasejg.run_add" name="tbsbbasejg.run_add"
                                                                           type="text"
                                                                           value="${tbsbbasejg.run_add}"/></span>
                    </div>
                     <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">注册资金（承诺出资）：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="注册资金" isBankZint="isBankZint"
                                                       onchange="this.value=formatNum(this.value)" isLength="[0,18]"
                                                       class="input ibg" id="tbsbbasejg.regist_amt"
                                                       name="tbsbbasejg.regist_amt" type="text"
                                                       value="${tbsbbasejg.regist_amt}"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">目前到位资金：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="目前到位资金" isBankZint="isBankZint"
                                                       onchange="this.value=formatNum(this.value)" isLength="[0,18]"
                                                       class="input ibg"
                                                       id="tbsbbasejg.paid_amt" name="tbsbbasejg.paid_amt" type="text"
                                                       value="${tbsbbasejg.paid_amt}"/></span>
                    </div>
                   
                 
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">所属行业：<span style="color:red">*</span></span>
					<span class="rightinfo">
                         <select isNotNull="所属产业" readonly="readonly" name="tbsbbasejg.industry_owned" id="tbsbbasejg.industry_owned"  class="select selecthangye">
                               
                                 <option></option>
                                 <c:forEach items="${applicationScope.dic.otherorgtype.childs}" var="datas">
                                <option value="${datas.id}"
                                        <c:if test="${tbsbbasejg.industry_owned == datas.id}">selected</c:if>>${datas.name}</option>
                                </c:forEach>
                             
                            </select>
                    <script>
                   		 $("select[id='tbsbbasejg.industry_owned']").val('${tbsbbasejg.industry_owned}');
                    
                    	$(".selecthangye option[value='aaaaaaaaaaaaaaaaaaotherorgtype04']").remove(); //删除
                    	$(".selecthangye option[value='aaaaaaaaaaaaaaaaaaotherorgtype08']").remove(); //删除
                    	$(".selecthangye option[value='aaaaaaaaaaaaaaaaaaotherorgtype09']").remove(); //删除
                    	$(".selecthangye option[value='aaaaaaaaaaaaaaaaaaotherorgtype10']").remove(); //删除
                    	$(".selecthangye option[value='aaaaaaaaaaaaaaaaaaotherorgtype11']").remove(); //删除
                    	$(".selecthangye option[value='aaaaaaaaaaaaaaaaaaotherorgtype12']").remove(); //删除
                    	$(".selecthangye option[value='aaaaaaaaaaaaaaaaaaotherorgtype13']").remove(); //删除
                  
                   
                    </script>
					</span>
                    </div>
                    <div id="dkk">
                       <div  lang="firsttr" style="display:inline;border:0;">
                            <div class="inputtest inputtestl " >
                                    <span class="leftname leftnamel">成立时间：<span style="color:red">*</span></span>
		                 	<span class="rightinfo"><input class="input stext laydate-icon" readonly="readonly"
                                                           id="tbsbbasejg.open_date"
                                                           name="tbsbbasejg.open_date" type="text"
                                                           value="${fn:substring(tbsbbasejg.open_date, 0, 10)}" pattern="yyyy-MM-dd"/>
                                                           
                                                           </span>
                                </div>
                  </div>
                    </div>
                  
       
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业负责人：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业负责人" isLength="[0,16]" class="input" 
                        							   id="tbsbbasejg.chargeperson" name="tbsbbasejg.chargeperson"
                                                       type="text"
                                                       value="${tbsbbasejg.chargeperson}"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业负责人职务：<span style="color:red">*</span></span>
                        <span class="rightinfo">
                        				 <input isNotNull="企业负责人职务" isLength="[0,16]" class="input" 
                        				id="tbsbbasejg.charge_duty" name="tbsbbasejg.charge_duty" 
                                                       type="text"
                                                       value="${tbsbbasejg.charge_duty}"/> 
         
                        
						</span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">企业负责人手机：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="企业负责人手机" isPhone="企业负责人手机" isLength="[0,11]"
                                                       class="input" id="tbsbbasejg.charge_tele" name="tbsbbasejg.charge_tele" type="text"
                                                       value="${tbsbbasejg.charge_tele}"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人" isLength="[0,16]" class="input" id="tbsbbasejg.contacts" name="tbsbbasejg.contacts"
                                                       type="text"
                                                       value="${tbsbbasejg.contacts}"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人职务：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人职务" isLength="[0,8]" class="input" id="tbsbbasejg.contacts_duty" name=tbsbbasejg.contacts_duty
                                                       type="text"
                                                       value="${tbsbbasejg.contacts_duty}"/></span>
                    </div>
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">联系人手机：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="联系人手机" isPhone="联系人手机" isLength="[0,11]" class="input"
                                                      id="tbsbbasejg.contacts_tele" name="tbsbbasejg.contacts_tele" type="text"
                                                       value="${tbsbbasejg.contacts_tele}"/></span>
                    </div>
                    
                     <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">统计关系所在地：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input id="tbsbbasejg.rela_add" isNotNull="统计关系所在地" isLength="[0,64]" class="input"
                                                       name="tbsbbasejg.rela_add" type="text"
                                                       value="${tbsbbasejg.rela_add}"/></span>
                    </div>
                   
                    <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">国税关系所在地：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="国地税缴纳机关" isLength="[0,64]" class="input zcmoren"
                                                       id="tbsbbasejg.rela_nation_tax_add" name="tbsbbasejg.rela_nation_tax_add" type="text"
                                                       value="${tbsbbasejg.rela_nation_tax_add}"/></span>
                    </div>
                    
                     <div class="inputtest inputtestl">
                        <span class="leftname leftnamel">地税关系所在地：<span style="color:red">*</span></span>
                        <span class="rightinfo"><input isNotNull="国地税缴纳机关" isLength="[0,64]" class="input zcmoren"
                                                      id="tbsbbasejg.rela_local_tax_add" name="tbsbbasejg.rela_local_tax_add" type="text"
                                                       value="${tbsbbasejg.rela_local_tax_add}"/></span>
                    </div>
                   
                   
                    

 					
 					 <style>
				       .jyqk{border-collapse: collapse;width:100%;margin-bottom:20px;}
				       .jyqk td{border: 1px solid #ddd;padding:4px;text-align: center;width:10%;}
				       .jyqk tr td:first-child{width:150px;}
				       .jyqk .inputtestl{width:100%;margin-bottom:0;}
						.creditor .vipinfo .jyqk .input{width:85%;padding:5px;   border: 1px solid #E0E0E0}				      
				       
				   		.jyqk2 td{width:11%;}
				   		.jyqk tr:first-child td,.jyqk tr td:first-child{font-size:14px;color:#fff;background: #ea5504;}
				   		
				    </style>
 					<p class="jiange">经营指标<span style="font-weight:bold;font-size:14px;color:red;">（单位为万元 ，员工人数单位为个）</span></p>
 					<table class="jyqk">
					   
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
					  
					  <td>${tbsbbasejg.first_year}年</td>
					          <input isNotNull="营业收入" class="input ibg"  type="hidden"  
							  	id="tbsbbasejg.first_year" name="tbsbbasejg.first_year" value="${tbsbbasejg.first_year}"/>

					       

					      
					        <td>
							  <input isNotNull="营业收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input ibg"  type="text"  
							  	id="tbsbbasejg.firstsell" name="tbsbbasejg.firstsell" value="${tbsbbasejg.firstsell}"/>
					        </td>
					        <td>
							  <input isNotNull="利润" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.firstinte" name=tbsbbasejg.firstinte value="${tbsbbasejg.firstinte}"/>
					        </td>
					         <td>
							  <input isNotNull="营业税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.first_income_tax" name="tbsbbasejg.first_income_tax" value="${tbsbbasejg.first_income_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="增值税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.first_added_tax" name="tbsbbasejg.first_added_tax"  value="${tbsbbasejg.first_added_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="企业所得税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text" 
							  id="tbsbbasejg.first_sales_tax" name="tbsbbasejg.first_sales_tax" value="${tbsbbasejg.first_sales_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="纳税总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text" 
							   id="tbsbbasejg.firsttax" name="tbsbbasejg.firsttax" value="${tbsbbasejg.firsttax}"/>
					        </td>
					 
					        <td>
							  <input isNotNull="员工人数" isZint="员工人数" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.first_stuff_count" name="tbsbbasejg.first_stuff_count"  value="${tbsbbasejg.first_stuff_count}"/>
					        </td>
					        <td>
							  <input isNotNull="员工薪酬总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.first_salary_count" name="tbsbbasejg.first_salary_count" value="${tbsbbasejg.first_salary_count}"/>
					        </td>
					        <td>
							  <input isNotNull="固定资产折旧总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.first_depreciation_count" name="tbsbbasejg.first_depreciation_count" value="${tbsbbasejg.first_depreciation_count}"/>
					        </td>
					       
					    </tr>
					    <tr>
					        <td>${tbsbbasejg.first_year + 1 }年</td>
					          <td>
							  <input isNotNull="营业收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input ibg"  type="text"  
							  	id="tbsbbasejg.secondsell" name="tbsbbasejg.secondsell" value="${tbsbbasejg.secondsell}"/>
					        </td>
					        <td>
							  <input isNotNull="利润" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.secondinte" name=tbsbbasejg.secondinte value="${tbsbbasejg.secondinte}"/>
					        </td>
					         <td>
							  <input isNotNull="营业税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.second_income_tax" name="tbsbbasejg.second_income_tax" value="${tbsbbasejg.second_income_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="增值税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.second_added_tax" name="tbsbbasejg.second_added_tax"  value="${tbsbbasejg.second_added_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="企业所得税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text" 
							  id="tbsbbasejg.second_sales_tax" name="tbsbbasejg.second_sales_tax" value="${tbsbbasejg.second_sales_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="纳税总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text" 
							   id="tbsbbasejg.secondtax" name="tbsbbasejg.secondtax" value="${tbsbbasejg.secondtax}"/>
					        </td>
					        <td>
							  <input isNotNull="员工人数" isInt="isInt" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.second_stuff_count" name="tbsbbasejg.second_stuff_count"  value="${tbsbbasejg.second_stuff_count}"/>
					        </td>
					        <td>
							  <input isNotNull="员工薪酬总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.second_salary_count" name="tbsbbasejg.second_salary_count" value="${tbsbbasejg.second_salary_count}"/>
					        </td>
					        <td>
							  <input isNotNull="固定资产折旧总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.second_depreciation_count" name="tbsbbasejg.second_depreciation_count" value="${tbsbbasejg.second_depreciation_count}"/>
					        </td>
					    </tr>
					    <tr>
					        <td>${tbsbbasejg.first_year + 2 }年<br>（预计）</td>
					       <td>
							  <input isNotNull="营业收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input ibg"  type="text"  
							  	id="tbsbbasejg.thirdsell" name="tbsbbasejg.thirdsell" value="${tbsbbasejg.thirdsell}"/>
					        </td>
					        <td>
							  <input isNotNull="利润" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.thirdinte" name=tbsbbasejg.thirdinte value="${tbsbbasejg.thirdinte}"/>
					        </td>
					         <td>
							  <input isNotNull="营业税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.third_income_tax" name="tbsbbasejg.third_income_tax" value="${tbsbbasejg.third_income_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="增值税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.third_added_tax" name="tbsbbasejg.third_added_tax"  value="${tbsbbasejg.third_added_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="企业所得税" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text" 
							  id="tbsbbasejg.third_sales_tax" name="tbsbbasejg.third_sales_tax" value="${tbsbbasejg.third_sales_tax}"/>
					        </td>
					         <td>
							  <input isNotNull="纳税总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text" 
							   id="tbsbbasejg.thirdtax" name="tbsbbasejg.thirdtax" value="${tbsbbasejg.thirdtax}"/>
					        </td>
					        <td>
							  <input isNotNull="员工人数" isInt="isInt" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.third_stuff_count" name="tbsbbasejg.third_stuff_count"  value="${tbsbbasejg.third_stuff_count}"/>
					        </td>
					        <td>
							  <input isNotNull="员工薪酬总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.third_salary_count" name="tbsbbasejg.third_salary_count" value="${tbsbbasejg.third_salary_count}"/>
					        </td>
					        <td>
							  <input isNotNull="固定资产折旧总额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg"  type="text" 
							  id="tbsbbasejg.third_depreciation_count" name="tbsbbasejg.third_depreciation_count" value="${tbsbbasejg.third_depreciation_count}"/>
					        </td>
					    </tr>
					    
					</table>
					
					
				   <%-- <p class="jiange">分类指标<span style="font-weight:bold;font-size:14px;color:red;">（银行、证券、保险类公司填写，金额单位为万元，增长率单位为%）</span></p>
 					
 					<table class="jyqk jyqk2" id="typetable">
					    
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
					        <td>${tbsbbasejg.first_year }年</td>
					      
					        <td>
							  <input isNotNull="存款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.first_deposit_count" name="tbsbbasejg.first_deposit_count" value="${tbsbbasejg.first_deposit_count}"/>
					        </td>
					        <td>
							  <input isNotNull="存款余额增长率" isBankZint="isBankZint" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.first_deposit_rate" name="tbsbbasejg.first_deposit_rate" value="${tbsbbasejg.first_deposit_rate}"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.first_loan_count" name="tbsbbasejg.first_loan_count" value="${tbsbbasejg.first_loan_count }"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额增长率" isBankZint="isBankZint" isLength="[0,18]"class="input ibg" 
							  id="tbsbbasejg.first_loan_rate" name="tbsbbasejg.first_loan_rate"  value="${tbsbbasejg.first_loan_rate }"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.first_stock_rate" name="tbsbbasejg.first_stock_count" value="${tbsbbasejg.first_stock_rate }"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额增长率" isBankZint="isBankZint"  isLength="[0,18]"class="input ibg" 
							  id="tbsbbasejg.first_stock_rate" name="tbsbbasejg.first_stock_rate" value="${tbsbbasejg.first_stock_rate }"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.first_guara_count" name="tbsbbasejg.first_guara_count" value="${tbsbbasejg.first_guara_count }"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入增长率" isBankZint="isBankZint"  isLength="[0,18]"class="input ibg" type="text"
							   id="tbsbbasejg.first_guara_rate"  name="tbsbbasejg.first_guara_rate" value="${tbsbbasejg.first_guara_rate}"/>
					        </td>
					        
					       
					    </tr>
					    <tr>
					    <td>${tbsbbasejg.first_year + 1 }年</td>
					       <td>
							  <input isNotNull="存款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.second_deposit_count" name="tbsbbasejg.second_deposit_count" value="${tbsbbasejg.second_deposit_count}"/>
					        </td>
					        <td>
							  <input isNotNull="存款余额增长率" isBankZint="isBankZint" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.second_deposit_rate" name="tbsbbasejg.second_deposit_rate" value="${tbsbbasejg.second_deposit_rate}"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.second_loan_count" name="tbsbbasejg.second_loan_count" value="${tbsbbasejg.second_loan_count }"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额增长率" isBankZint="isBankZint"  isLength="[0,18]"class="input ibg" 
							  id="tbsbbasejg.second_loan_rate" name="tbsbbasejg.second_loan_rate"  value="${tbsbbasejg.second_loan_rate }"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.second_stock_rate" name="tbsbbasejg.second_stock_count" value="${tbsbbasejg.second_stock_rate }"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额增长率" isBankZint="isBankZint"  isLength="[0,18]"class="input ibg" 
							  id="tbsbbasejg.second_stock_rate" name="tbsbbasejg.second_stock_rate" value="${tbsbbasejg.second_stock_rate }"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.second_guara_count" name="tbsbbasejg.second_guara_count" value="${tbsbbasejg.second_guara_count }"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入增长率" isBankZint="isBankZint"  isLength="[0,18]"class="input ibg" type="text"
							   id="tbsbbasejg.second_guara_rate"  name="tbsbbasejg.second_guara_rate" value="${tbsbbasejg.second_guara_rate }"/>
					        </td>
					    </tr>
					    <tr>
					        <td>${tbsbbasejg.first_year + 2 }年<br>（预计）</td>
					     <td>
							  <input isNotNull="存款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.third_deposit_count" name="tbsbbasejg.third_deposit_count" value="${tbsbbasejg.third_deposit_count}"/>
					        </td>
					        <td>
							  <input isNotNull="存款余额增长率" isBankZint="isBankZint" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.third_deposit_rate" name="tbsbbasejg.third_deposit_rate" value="${tbsbbasejg.third_deposit_rate}"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.third_loan_count" name="tbsbbasejg.third_loan_count" value="${tbsbbasejg.third_loan_count }"/>
					        </td>
					         <td>
							  <input isNotNull="贷款余额增长率" isBankZint="isBankZint"  isLength="[0,18]"class="input ibg" 
							  id="tbsbbasejg.third_loan_rate" name="tbsbbasejg.third_loan_rate"  value="${tbsbbasejg.third_loan_rate }"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.third_stock_rate" name="tbsbbasejg.third_stock_count" value="${tbsbbasejg.third_stock_rate }"/>
					        </td>
					         <td>
							  <input isNotNull="证券交易额增长率"  isBankZint="isBankZint" isLength="[0,18]"class="input ibg" 
							  id="tbsbbasejg.third_stock_rate" name="tbsbbasejg.third_stock_rate" value="${tbsbbasejg.third_stock_rate }"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"class="input ibg" type="text"
							  id="tbsbbasejg.third_guara_count" name="tbsbbasejg.third_guara_count" value="${tbsbbasejg.third_guara_count }"/>
					        </td>
					        <td>
							  <input isNotNull="保费收入增长率" isBankZint="isBankZint" isLength="[0,18]"class="input ibg" type="text"
							   id="tbsbbasejg.third_guara_rate"  name="tbsbbasejg.third_guara_rate" value="${tbsbbasejg.third_guara_rate }"/>
					        </td>
					    </tr>
					    
					</table> --%>
					
					<p class="jiange">上传文件清单</p>
                    <div class="baobiao">
                        <div class="box-img">
                         
                            
                            <div class="upwk">
                                <div class="ck-img upspan" lang="picnum1" id="upspan1" for="photoimg"
                                     accesskey="aaaaaaaaaaaaaaaaaaaaaaaaatplx200">
                                    <div class="nrk">
                                        <span class="n">0</span>
                                        <div id="picnum1" class="picimg upspan1">


                                            <s:iterator value="#request.list" status="index">
                                                <s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaatplx200'">
                                                    <s:if test="picurl.lastIndexOf('pdf')>=0 || picurl.lastIndexOf('PDF')>=0">
                                                        <div class="div" id="">
                                                            <div class="img"><img
                                                                    accesskey="<s:property value="picurl"/>"
                                                                    lang="<s:property value="id" />"
                                                                    src="/image/pdf.jpg"></div>
                                                        </div>
                                                    </s:if>
                                                    <s:else>
                                                        <div class="div" id="">
                                                            <div class="img"><img
                                                                    accesskey="<s:property value="picurl"/>"
                                                                    lang="<s:property value="id" />"
                                                                    accesskey="<s:property value="reducepath" />"
                                                                    src="<s:property value="reducepath" />">
                                                            </div>
                                                        </div>
                                                    </s:else>
                                                </s:if>

                                            </s:iterator>
                                        </div>
                                        <span class="delimg">编辑</span>
                                    </div>
                                    <div class="t"><%=SystemManager.treeNodeMap.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx200").getName() %>
                                    </div>
                                </div>
                                <div class="s">
                                    <%
                                        if (SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx200") != null) {
                                            out.print("<a href=\"");
                                            out.print(SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx200"));

                                            out.print("\" target=\"_blank\">查看样本</a>");
                                        } else {
                                            out.print("<span>暂无样本</span>");
                                        }
                                    %>

                                </div>
                            </div>
                            
                            

                           <%--  <div class="upwk">
                                <div class="ck-img upspan" lang="picnum3" id="upspan3"
                                     accesskey="aaaaaaaaaaaaaaaaaaaaaaaaatplx202">
                                    <div class="nrk">
                                        <span class="n">0</span>
                                        <div id="picnum3" class="picimg upspan3">


                                            <s:iterator value="#request.list" status="index">
                                                <s:if test="leixing=='aaaaaaaaaaaaaaaaaaaaaaaaatplx202'">
                                                    <s:if test="picurl.lastIndexOf('pdf')>=0 || picurl.lastIndexOf('PDF')>=0">
                                                        <div class="div" id="">
                                                            <div class="img"><img
                                                                    accesskey="<s:property value="picurl"/>"
                                                                    lang="<s:property value="id" />"
                                                                    src="/image/pdf.jpg"></div>
                                                        </div>
                                                    </s:if>
                                                    <s:else>
                                                        <div class="div" id="">
                                                            <div class="img"><img
                                                                    accesskey="<s:property value="picurl"/>"
                                                                    lang="<s:property value="id" />"
                                                                    accesskey="<s:property value="reducepath" />"
                                                                    src="<s:property value="reducepath" />">
                                                            </div>
                                                        </div>
                                                    </s:else>
                                                </s:if>

                                            </s:iterator>

                                        </div>
                                        <span class="delimg">编辑</span>
                                    </div>
                                    <div class="t"><%=SystemManager.treeNodeMap.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx202").getName() %>
                                    </div>
                                </div>
                                <div class="s"><%
                                    if (SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx202") != null) {
                                        out.print("<a href='");
                                        out.print(SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx202"));

                                        out.print("' target=\"_blank\">查看样本</a>");
                                    } else {
                                        out.print("<span>暂无样本</span>");
                                    }
                                %></div>
                                <div class="s s2"><a
                                        href="http://www.winpow.com/download.action?number=2&id=84">模板下载</a></div>
                            </div> --%>


                        </div>
                    </div>
					
					
					
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
<script type="text/javascript" src="../plupload/plupload.full.min.js"></script>
<script type="text/javascript">
	if ('${flag}' != "") {
		alert('${flag}');
	}
    var zcmoren = "成都高新区";
    $(".zcmoren").each(function () {
        if ($(this).val().length < 1) {
            $(this).val(zcmoren);
        }
    });
</script>
<%@ include file="../footer.jsp" %>
<%@ include file="../sbapp/tanchudel.jsp" %>
<script type="text/javascript">
    leftnav_init("jrljbqkb");
</script>
<script type="text/javascript">
    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#tbsbbasejg.open_date'});//绑定元素
    }();
    
    var orgType = '${orgType}';
    //var orgType = "aaaaaaaaaaaaaaaaaaotherorgtype14";
   
    if (orgType == "aaaaaaaaaaaaaaaaaaotherorgtype01") {	//保险
  		  $('#typetable tr td:nth-child(-n+7) input').addClass('inputGray');
    
    } else if (orgType == "aaaaaaaaaaaaaaaaaaotherorgtype02") {	// 银行
    	$('#typetable tr td:nth-last-child(-n+4) input').addClass('inputGray');
    
    
    } else if (orgType == "aaaaaaaaaaaaaaaaaaotherorgtype14") {//证券
    	$('#typetable tr td:nth-child(-n+5) input').addClass('inputGray');
    	$('#typetable tr td:nth-last-child(-n+2) input').addClass('inputGray');
    
    
    } else {
    	$("#typetable input").addClass('inputGray');
    }
    
    $('.inputGray').attr('readonly','true').css("backgroundColor","#dcdfe1").css('color','#aaa').val('0');

    
    var t = $("#t").val();
    if (t != 'v') {
        var id = $("input[id='tbsbbasejg.id']").val();

        var uptarget1 = $("#upspan1").attr('id');
        var leixing1 = $("#upspan1").attr('accesskey');

        var uploaderupspan1 = new plupload.Uploader({//创建实例的构造方法
            runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
            browse_button: 'upspan1', // 上传按钮
            multi_selection: true,
            url: "/goodaaa.action?uptarget=" + uptarget1 + "&leixing=" + leixing1 + "&id=" + id + "&table=tb_sb_base_jg", //远程上传地址
            flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
            silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
            filters: {
                max_file_size: '100mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
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


       /*  var uptarget2 = $("#upspan2").attr('id');
        var leixing2 = $("#upspan2").attr('accesskey');
        var uploaderupspan2 = new plupload.Uploader({//创建实例的构造方法
            runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
            browse_button: 'upspan2', // 上传按钮
            multi_selection: true,
            url: "/goodaaa.action?uptarget=" + uptarget2 + "&leixing=" + leixing2 + "&id=" + id + "&table=tb_sb_base", //远程上传地址
            flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
            silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址
            filters: {
                max_file_size: '100mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
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
                max_file_size: '100mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
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
        uploaderupspan3.init(); */

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
    
</script>

</body>
</html>
 