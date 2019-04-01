<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@page import="com.winpow.services.manage.activities.bean.Activities" %>
<%@page import="com.winpow.core.util.StringUtil" %>
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
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/skin/default/layer.css"></script>

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
        
        
        	//方向二和方向三隐藏国家重大项目立项文件 ,只有方向四才显示
         $(function () {
            var nowval = $(".nssgpd select option:selected").val();
            selectShow(nowval);
            
            var nssgpd = $(".nssgpd select");
	   		//1.change事件
	    	nssgpd.change(function(){
				//alert($(this).val());
				var nowval = $(this).val();
		   		selectShow(nowval);
	    	});
	    	
	    	
	    	function selectShow(nowval){
	    		if(nowval=='方向四'  ){
		    		$('.lxwj').show();
		    		return;
		    	}
		    	if(nowval=='方向三' ||nowval=='方向二' ) {
		    	$('.lxwj').hide();
		    		return;
		    	}
		    	 
	    	}
    
    
    
    
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
<!-- <input type="hidden" id="t" value="<s:property value="t"/>"> -->
<input type="hidden" id="t" value="${t}"/>
<script type="text/javascript">

    $(window).load(function () {

        var typekjcxbt = $("#type").val();
        if(typekjcxbt=='kjcxbt'){var typeleibie = 2;}else{typeleibie = 1;}
        var backnotice = $("#backnotice").val();
        var backnoticebzf = $("#backnoticebzf").val();
        if (backnotice == 'success') {
            if(backnoticebzf=='1'){
	            ggts2("数据保存成功！");
	            setTimeout(function(){
	    			window.location="/interestapp/selectList.html?leibie="+typeleibie+"&type="+typekjcxbt+"&init=y";
	   			},1500);
		    }
		    if(backnoticebzf=='2'){
		    	ggts2("数据提交成功！");
		    	setTimeout(function(){
	    			window.location="/interestapp/selectList.html?leibie="+typeleibie+"&type="+typekjcxbt+"&init=y";
	   			},1500);
		    }
	    }
	    if (backnotice == 'erro') {
	    	if(backnoticebzf=='1'){
	            ggts2("数据保存失败！");
		    }
		    if(backnoticebzf=='2'){
		    	ggts2("数据提交失败！");
		    }
	    
	    }

        var t = $("#t").val();//v 查看   u 修改  a 新增
        //alert(t);
        if (t == 'v') {
            //表示查询
            $("#form1 input,radio,select,textarea,checkbox").attr('disabled', true);
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

        //点击保存,不验证isNotNull
        $('.baocun').click(function(){
            $('#buttonType').val('1');
        
            if(DataCheck.isLength()){

                if(DataCheck.isInt()){

                    if(DataCheck.isFint()){

                        if( DataCheck.isZint()){

                            if(DataCheck.isZuzhi()){

                                if(DataCheck.isPhone()){

                                    if(DataCheck.isEmail()){

                                        if(DataCheck.idCard()){
                                            //alert("可以保存!");
                                            //判断上传文件
                                            //alert(checkfilehidden(true))
                                            //return;
                                            buttonDefaultValue = $(this).val();
                                                countDown(this,5);
                                                nativeNum("isBankZint");//还原为数字
											$("#form1").submit();//改变链接并提交
                                        }else{
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
        



 		//点击提交
        $('.tijiao').click(function(){
            $('#buttonType').val('2');
            /* var bank=$($('.dkyhname')[0]).val();
            var same=true;
            $('.dkyhname').each(function(i,v){
                if($(this).val()!=bank){
                    same=false;
                }
            })
            if(!same){
               // alert("贷款银行(具体支行)必须一致!")
                
                
                layer.alert('贷款银行(具体支行)必须一致!', {icon: 7, title : '提示'});
                
                return false;
            } */

            if(DataCheck.isNotNull()){

                if(DataCheck.isLength()){

                    if(DataCheck.isInt()){

                        if(DataCheck.isFint()){

                            if( DataCheck.isZint()){

                                if(DataCheck.isZuzhi()){

                                    if(DataCheck.isPhone()){

                                        if(DataCheck.isEmail()){
                                        
                                        if(DataCheck.isBankZint()){

                                            if(DataCheck.idCard()){

                                                //alert("可以提交!");
                                                if(!checkEachNeedDate("form1")){return;}
	                                            //判断上传文件
	                                            if(checkfilehidden(true)){
	                                            buttonDefaultValue = $(this).val();
                                                countDown(this,5);
                                                nativeNum("isBankZint");//还原为数字
	                                            	$("#form1").submit();//改变链接并提交
	                                            }else{
	                                            	//alert("提交失败!");
	                                             	return;
	                                            }


	                                        }else{
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
    
    
function setdfb(dobj) {
	var dkje = $(dobj).parent().parent().prev().children().find("input").val();
	var dbfl = $(dobj).val();
	var dkf = $(dobj).parent().parent().next().children().find("input");
		//alert(dkje+" "+dbfl+" "+dkf);
	dkf.val(parseFloat(parseFloat(dkje)*(parseFloat(dbfl/100))).toFixed(2));
};


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

                <form id="form1" action="/interestapp/saveData.html" method="post">

                    <div class="title">
                        <li><span class="t">${policy_name }</span></li>
                    </div>
                    <input type="hidden" name="buttonType" id="buttonType">
                    <input type="hidden" name="id" id="id" value="<s:property value="e.id"/>">
                    <input type="hidden" value=${leibie} name="leibie">
                    <input type="hidden" value="${type}" name="type" id="type">
                    <input type="hidden" lang="企业基本情况表的id" name="rele_id" value="<s:property value='e.rele_id'/>"/>
                    <input type="hidden" lang="用户号" name="userid" value="<s:property value='e.userid'/>"/>
                    <input type="hidden" lang="删除图片时ajax提交的地址" id="url" value="/interestapp/deletepic.html"/>
                    <input type="hidden" name="qiyemingcheng" value="<s:property value="e.qiyemingcheng"/>">
                   
				<div class="inputtest inputtestl" style="width: 100%;">
                        <span class="leftname leftnamel"  style="width: 214px;">第三方评级结果：<span style="color:red">*</span></span>
					<span class="rightinfo">
                         <select isNotNull="评级结果" readonly="readonly"  name="e.dsfxypj" class="select">
  							<option></option>
                            <option value="AAA" <c:if test="${e.dsfxypj == 'AAA'}">selected</c:if>>AAA</option>
                            <option value="AA+" <c:if test="${e.dsfxypj == 'AA+'}">selected</c:if>>AA+</option>
                            <option value="AA" <c:if test="${e.dsfxypj == 'AA'}">selected</c:if>>AA</option>
                            <option value="AA-" <c:if test="${e.dsfxypj == 'AA-'}">selected</c:if>>AA-</option>
                            <option value="A+" <c:if test="${e.dsfxypj == 'A+'}">selected</c:if>>A+</option>
                            <option value="A" <c:if test="${e.dsfxypj == 'A'}">selected</c:if>>A</option>
                            <option value="A-" <c:if test="${e.dsfxypj == 'A-'}">selected</c:if>>A-</option>
                            <option value="BBB+" <c:if test="${e.dsfxypj == 'BBB+'}">selected</c:if>>BBB+</option>
                            <option value="BBB" <c:if test="${e.dsfxypj == 'BBB'}">selected</c:if>>BBB</option>
                            <option value="BBB-" <c:if test="${e.dsfxypj == 'BBB-'}">selected</c:if>>BBB-</option>
                            <option value="BB+" <c:if test="${e.dsfxypj == 'BB+'}">selected</c:if>>BB+</option>
                            <option value="BB" <c:if test="${e.dsfxypj == 'BB'}">selected</c:if>>BB</option>
                            <option value="BB-" <c:if test="${e.dsfxypj == 'BB-'}">selected</c:if>>BB-</option>
                            <option value="B+" <c:if test="${e.dsfxypj == 'B+'}">selected</c:if>>B+</option>
                            <option value="B" <c:if test="${e.dsfxypj == 'B'}">selected</c:if>>B</option>
                            <option value="B-" <c:if test="${e.dsfxypj == 'B-'}">selected</c:if>>B-</option>
                            
                             
                        </select>
					</span>
               </div>


				<div class="inputtest inputtestl" style="width:100%;">
						<span class="leftname leftnamel" style="width: 214px;">企业规模[<a target="_blank" href="http://www.miit.gov.cn/newweb/n1146285/n1146352/n3054355/n3057278/n3057286/c3592332/content.html">标准划分参考网址</a>]：<span style="color:red">*</span></span>
						<span class="rightinfo">
							<select class="select" name="e.qygm" isNotNull="企业规模" readonly="readonly">
				                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa090" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa090").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>大</option>
				                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa091" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa091").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>中</option>
				                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa092" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa092").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>小</option>
				                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa093" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa093").equals(request.getAttribute("e.qygm"))) { out.print("selected=selected");} %>>微型</option>
			               </select> 
						</span>
				</div>
                    
               		<div style="display:none" style="width:100%;">
						<span class="leftname leftnamel" style="width: 214px;line-height: 20px;">是否获得高新区政策性贷款：<span style="color:red">*</span><br><span style=" float: left; margin-left: 21px;">（成长贷、壮大贷、新创贷）</span></span>
						<span class="rightinfo">
							<select class="select" name="e.kykt" isNotNull="是否" readonly="readonly">
							
				                <option value="1"  selected ></option>
							
				                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004").equals(request.getAttribute("e.kykt"))) { out.print("selected=selected");} %>>是</option>
				                <option value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005" <%if (("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa005").equals(request.getAttribute("e.kykt"))) { out.print("selected=selected");} %>>否</option>
			               </select> 
						</span>
				</div>
				
				<div class="inputtest inputtestl" style="width:100%;">
						<span class="leftname leftnamel" style="width: 214px;line-height: 20px;">申请金额[<span style="color:red">保存后自动计算</span>]：<span style="color:red">*</span></span>
						<span class="rightinfo"><input readonly="readonly"   style="background-color:#dbdbdf;"  class="input iname ibg"
                                                   name="e.qysqje" type="text" value="${e.qysqje}"/></span>
				</div>
 
                    <div style="display:none"   >
                        <span class="leftname leftnamel" style="width: 214px;">支持方向：<span style="color:red">*</span></span>
                        <span class="rightinfo nssgpd">
                            <select isNotNull="支持方向" class="select" readonly="readonly" name="zcfx" id="zcfx">
                                <option value=""></option>
                                <option value="方向二"  selected>方向二</option>
                                <option value="方向三" <c:if test="${e.zcfx == '方向三'}">selected</c:if>>方向三</option>
                                <option value="方向四" <c:if test="${e.zcfx == '方向四'}">selected</c:if>>方向四</option>
                            </select>
                        </span>
                    </div>

                   
                   
                    <p class="jiange">申报明细
	                    <br/>
	                    <span style="color:red">
	                    1.本次补贴区间是2017-10-01到2018-09-30，每年4月份和10月份（二选一）进行申报。<br/>
	                    <!--2.本次申报限于单笔银行授信业务（如：在A银行和B银行都有贷款，本次申报只能选择A银行或者B银行贷款进行申报，最终补贴金额，以财政金融局审批结果为准）。-->
	                    </span>
                    </p>
                    <div id="dkk">
                        <c:if test="${fn:length(e.interestcoreList) > 0}">
                            <c:forEach items="${e.interestcoreList}" var="datas" varStatus="status">
                                <input type="hidden" name="interestcoreList[${status.index}].id" value="${datas.id}">
                                <div class="xkk" lang="firsttr">
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel" style="width:142px;margn-right:3px;margin-left:7px;">贷款银行(具体支行)：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="贷款银行" isLength="[0,32]" class="input iname dkyhname"
                                                               id="interestcoreList[${status.index}].dkyy"
                                                               name="interestcoreList[${status.index}].dkyy"
                                                               type="text"
                                                               value="${datas.dkyy}" style="width:190px;"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">贷款金额：<span
                                                style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="贷款金额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input iname ibg"
                                                               id="interestcoreList[${status.index}].dkje"
                                                               name="interestcoreList[${status.index}].dkje"
                                                               type="text"
                                                               value="${datas.dkje}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">担保费率（%）：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input onchange="setdfb(this)"  oninput="setdfb(this)"  isNotNull="担保费率（%）" isZint="担保费率" isLength="[0,18]"  class="input iname"
                                                               id="interestcoreList[${status.index}].dbfl"
                                                               name="interestcoreList[${status.index}].dbfl"
                                                               type="text"
                                                               value="${datas.dbfl}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">担保费：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="担保费" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"  class="input inumber ibg"
                                                               id="interestcoreList[${status.index}].dbf"
                                                               name="interestcoreList[${status.index}].dbf"
                                                               type="text" value="${datas.dbf}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">贷款利率（%）：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="贷款利率" isZint="贷款利率" isLength="[0,18]" class="input inumber"
                                                               id="interestcoreList[${status.index}].dkll"
                                                               name="interestcoreList[${status.index}].dkll"
                                                               type="text" value="${datas.dkll}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">已支付利息（元）：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="已支付利息" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" class="input iname"
                                                               id="interestcoreList[${status.index}].zflx"
                                                               name="interestcoreList[${status.index}].zflx"
                                                               type="text"
                                                               value="${datas.zflx}"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">实际放款日期：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate"
                                                               id="interestcoreList[${status.index}].fksj"
                                                               readonly="readonly"
                                                               name="interestcoreList[${status.index}].fksj"
                                                               type="text"
                                                               value="<fmt:parseDate value="${datas.fksj}" var="date1" pattern="yyyy-MM-dd"/><fmt:formatDate value="${date1}" pattern="yyyy-MM-dd"/>"/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">实际/拟还款日期：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate" readonly="readonly"
                                                               id="interestcoreList[${status.index}].dqsj"
                                                               name="interestcoreList[${status.index}].dqsj"
                                                               type="text"
                                                               value="<fmt:parseDate value="${datas.dqsj}" var="date2" pattern="yyyy-MM-dd"/><fmt:formatDate value="${date2}" pattern="yyyy-MM-dd"/>"/></span>
                                    </div>
                                    
                                    
                                  <div class="inputtest inputtestl">
                                   <span class="leftname leftnamel">是否政策性贷款：<span style="color:red">*</span></span>
                                    <span class="rightinfo">  
	                                    <select isNotNull="是否政策性贷款" onchange="setflag();" onkeyup="setflag();" class="select loanflag" index="${status.index}" val="${datas.policy_loan_flag}" readonly="readonly" name="interestcoreList[${status.index}].policy_loan_flag" id="interestcoreList[${status.index}].policy_loan_flag">
			                                <option value="0">否</option>
			                                <option value="1">是</option>
			                            </select>
                            
                                    </span>
                                    </div>
                                    
                                    
                                      <div class="inputtest inputtestl">
                               <span class="leftname leftnamel">产品名称：<span style="color:red">*</span></span>
                                    <span class="rightinfo">
                                    
                                     <select class="select loanname" val="${datas.policy_loan_name}" readonly="readonly" name="interestcoreList[${status.index}].policy_loan_name" id="interestcoreList[${status.index}].policy_loan_name">
                                <option value=""></option>
                                <option value="成长贷" <c:if test="${datas.policy_loan_name} == '成长贷'">selected</c:if>>成长贷</option>
                                <option value="壮大贷" <c:if test="${datas.policy_loan_name} == '壮大贷'">selected</c:if>>壮大贷</option>
                                <option value="新创贷" <c:if test="${datas.policy_loan_name} == '新创贷'">selected</c:if>>新创贷</option>
                                <option value="统借统还" <c:if test="${datas.policy_loan_name} == '统借统还'">selected</c:if>>统借统还</option>
                                <option value="双创信贷" <c:if test="${datas.policy_loan_name} == '双创信贷'">selected</c:if>>双创信贷</option>
                            </select>
                            
                            </span>
                                    </div>
                                    

                                    <div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
                                        <input
                                                class="adddel" type="button" name="adddel" value="增加">&nbsp;<input name="addde2"  class="addde2"
                                                                                                     type="button"
                                                                                                     value="删除" onclick="deleteCore(this, '${datas.id}')"></div>
                                </div>

                            </c:forEach>
                        </c:if>
                        <c:if test="${fn:length(e.interestcoreList) <= 0}">
                            <div class="xkk" lang="firsttr">
                                 
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">贷款银行：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="贷款银行" isLength="[0,32]" class="input iname"
                                                               id="interestcoreList[0].dkyy"
                                                               name="interestcoreList[0].dkyy"
                                                               type="text"
                                                               value=""/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">贷款金额：<span
                                                style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="贷款金额" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]" class="input iname ibg"
                                                               id="interestcoreList[0].dkje"
                                                               name="interestcoreList[0].dkje"
                                                               type="text"
                                                               value=""/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">担保费率（%）：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input onchange="setdfb(this)"  oninput="setdfb(this)"  isNotNull="担保费率（%）" isZint="担保费率" isLength="[0,18]"  class="input iname"
                                                               id="interestcoreList[0].dbfl"
                                                               name="interestcoreList[0].dbfl"
                                                               type="text"
                                                               value=""/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">担保费：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="担保费" isBankZint="isBankZint" onchange="this.value=formatNum(this.value)" isLength="[0,18]"  class="input inumber ibg"
                                                               id="interestcoreList[0].dbf"
                                                               name="interestcoreList[0].dbf"
                                                               type="text" value=""/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">贷款利率（%）：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isNotNull="贷款利率" isZint="贷款利率" isLength="[0,18]" class="input inumber"
                                                               id="interestcoreList[0].dkll"
                                                               name="interestcoreList[0].dkll"
                                                               type="text" value=""/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">已支付利息（元）：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input isBankZint="isBankZint" onchange="this.value=formatNum(this.value)"  isNotNull="已支付利息" class="input iname"
                                                               id="interestcoreList[0].zflx"
                                                               name="interestcoreList[0].zflx"
                                                               type="text"
                                                               value=""/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">实际放款日期：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate"
                                                               id="interestcoreList[0].fksj"
                                                               readonly="readonly"
                                                               name="interestcoreList[0].fksj"
                                                               type="text"
                                                               value=""/></span>
                                    </div>
                                    <div class="inputtest inputtestl">
                                        <span class="leftname leftnamel">实际/拟还款日期：<span style="color:red">*</span></span>
                                <span class="rightinfo"><input class="input laydate-icon needDate" readonly="readonly"
                                                               id="interestcoreList[0].dqsj"
                                                               name="interestcoreList[0].dqsj"
                                                               type="text"
                                                               value=""/></span>
                                    </div>

                                <div style="text-align:right;overflow: hidden;margin-bottom: 10px;clear: both;">
                                    <input
                                            class="adddel" type="button" name="adddel"  id="copy" value="增加">&nbsp;<input
                                        class="addde2"
                                        name="addde2"
                                        type="button"
                                        id="gbdel"
                                        value="删除" onclick="deleteCore(this, 0)"></div>

                            </div>
                        </c:if>
                    </div>
                   

                    <p class="jiange">上传文件清单<span style="color:red;">（利息凭证按照清单顺序扫描，一组凭证扫描成一个pdf文件，每组分别上传；贷款/担保合同按笔数扫描，每一笔扫描成一个pdf文件，每笔分别上传。）</span></p>

                    <div class="baobiao">
                     <div class="box-img">
                        <s:iterator value="#request.li" status="index" var="material">
                         	<div class="upwk">
			                    <div class="ck-img upspan" lang="picnum${index.index + 1}"  id="upspan${index.index + 1}" 
			                    	accesskey="${material.key }" index="${index.index + 1}">
			                    	<div class="nrk">
			                    	<span class="n nums${index.index + 1}">0</span>
			                    	<div id="picnum${index.index + 1}" class="picimg upspan${index.index + 1}">
			               		        <s:iterator value="#request.list" var="files">
			                				<s:if test="leixing==#material.key">
				                				 <div class="div"><div class="img"><img accesskey="${files.picurl }" lang="${files.id }" src="/image/pdf.jpg"></div></div>
			                			 	</s:if>	
			                			</s:iterator>
			                        </div>
			                        <span class="delimg">编辑</span>
			                        </div>
			                        <div class="t">${material.value }</div>
			                    </div>
			              
			              
			                    <!-- 如果是贷款贴息则输出利息清单的下载地址 -->
			                    <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx406'==#material.key">
			                     <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                 			 	</s:if>	
                			 	
                			 	 <!-- 如果是申请报告 -->
			                    <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx202'==#material.key">
			                     <div class="s s2"><a  href="/files/toList.html" target="_blank">模板下载</a></div>
                 			 	</s:if>	
                			 	
                			 	<!-- 如果是中小微企业证明 -->
                                <s:if test="'aaaaaaaaaaaaaaaaaaaaaaaaatplx410'==#material.key">
                                 <div class="s s2">
                                  <%
                                        if (SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx410") != null) {
                                            out.print("<a href=\"");
                                            out.print(SystemManager.YANGBEN.get("aaaaaaaaaaaaaaaaaaaaaaaaatplx410"));
                                            out.print("\" target=\"_blank\">查看样本</a>");
                                        } else {
                                            out.print("<a target=\"_blank\">暂无样本</a>");
                                        }
                                    %>
                                 </div>
                                </s:if> 
                			 	
			                			 	
			                </div>
	                    </s:iterator>
                     </div>
                 </div>

                    <div class="revise" id="zqxxxgbtn">
                        <input class="shenqingdkt baocun" lang="<s:property value='rele_id'/>" type="button"
                               value="保存"/>&nbsp;&nbsp;
                        <input class="shenqingdkt tijiao" type="button" value="提交"/>
                    </div>

                </form>
            </div>

        </div>

    </div>

</div>

<script type="text/javascript" src="../plupload/plupload.full.min.js"></script>

<script type="text/javascript">

var flaginit = 0;
function setflag(){
	$(".loanflag").each(function(){
		if (flaginit == 0) {
			$(this).val($(this).attr("val"));
		}
		var div = $(this).parent().parent().next();
		if ($(this).val() == 0) {
			div.hide();
		} else if ($(this).val() == 1) {
			div.show();
		}
	});
	flaginit = 1;
}
setflag();


	$(".loanname").each(function(){
		$(this).val($(this).attr("val"));
	});





//加载页面时有值就显示，
	//全部根据触发条件 是否备案条件来写逻辑
	//网页加载完时，如果”是否备案“的值为是，则让它后面一个元素显示，且给后面这个元素的子元素input框加上一个“isNotNull"属性,加上时间判断class类 needDate
	//如果为否，则不做任何处理
	
	var ifbeian = $(".ifbeian select");
    var beianshijian = $(".beianshijian .rightinfo input");
    
    //”是否备案“change事件如果值为是，则让它后面一个元素显示，且给后面这个元素的子元素input框加上一个“isNotNull"属性,加上时间判断class类 needDate
    //如果为否，则让它后面一个元素隐藏，赋值为空，且给后面这个元素的子元素input框取消一个“isNotNull"属性，取消时间判断class类 needDate
    
    //1.change事件
    ifbeian.each(function(){
    	$(this).change(function(){
			//alert($(this).val());
			var beianshijian =  $(this).parent().parent().next();
    		if($(this).val()=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004'){
	    		beianshijian.show();
	    		beianshijian.children().find("input").addClass("needDate");
	    	}else{
	    		beianshijian.hide();
	    		beianshijian.children().find("input").removeClass("needDate").val("");
	    	}
	    });
    	
    });
    
    //2.网页加载完
    $(function(){
    	//alert(33);
    	ifbeian.each(function(){
    		
    		var beianshijian =  $(this).parent().parent().next();
	    	if($(this).val()=='aaaaaaaaaaaaaaaaaaaaaaaaaaaaa004'){
	    		beianshijian.show();
	    		beianshijian.children().find("input").addClass("needDate");
	    	}else{
	    		beianshijian.hide();
	    		beianshijian.children().find("input").removeClass("needDate").val("");
	    	}
    	
    	});
    });
    
    


    var t = $("#t").val();
    if (t != 'v') {
 	$(".upspan").each(function(){
 	var index = $(this).attr('index'); 
 	$(this).find(".nums" + index).html($(this).find(".img").size());
	var path = "/goodaaa.action?uptarget=" + $(this).attr('id') + "&leixing=" + $(this).attr('accesskey')
			 + "&id=${e.id}" + "&table=${table_name}";
    var uploaderupspan = new plupload.Uploader({//创建实例的构造方法
        runtimes: 'html5,html4,silverlight,flash', //上传插件初始化选用那种方式的优先级顺序
        browse_button: 'upspan' + index, // 上传按钮
        multi_selection: true,
        url: path, //远程上传地址
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
            FilesAdded: function(up, files) { //文件上传前
                if ($("#picnum" + index).children(".div").length > 10) {
                    alert("您上传的文件太多了！");
                    uploaderupspan.destroy();
                } else {
                    var li = '';
                    plupload.each(files, function(file) { //遍历文件
                        li += "<div class='div' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></div>";
                    });
                    $("#picnum" + index).append(li);
                    eachimg("picnum" + index);
                    uploaderupspan.start();
                }
            },
            UploadProgress: function(up, file) { //上传中，显示进度条
         		var percent = file.percent;
                $("#" + file.id).find('.bar').css({"width": percent + "%"});
                $("#" + file.id).find(".percent").text(percent + "%");
            },
            FileUploaded: function(up, file, info) { //文件上传成功的时候触发
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
            Error: function(up, err) { //上传出错的时候触发
                alert(err.message);
            }
        }
    });
    uploaderupspan.init();
 });

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
            var uid = $(this).attr("accesskey"); 
            if (!(uid == "aaaaaaaaaaaaaaaaaaaaaaaaatplx283" || uid == "aaaaaaaaaaaaaaaaaaaaaaaaatplx285")) {
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

    })
</script>


<%@ include file="../footer.jsp" %>
<script type="text/javascript">
    leftnav_init("allbt");
</script>

<%@ include file="tanchudel.jsp" %>

<script type="text/javascript">

    $(window).load(function () {
//贷款银行到到期日期的8个元素的增加和删除
        $(".adddel").click(function () {
            var xkks = $("#dkk").children(".xkk");
            var nownum = xkks.length;//现在要添加的元素名称的序号

            var newElement = xkks.eq(0).clone(true).appendTo($("#dkk")).attr("lang", "");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
//		xkks.eq(0).clone(true).insertAfter($(this).parent().parent()).attr("lang","");//拷贝大框框下的第一个小框框的内容添加到大框框孩子的最后
            newElement.find('input[type=text]').each(function() {
                $(this).val('');
            })
            var lastxkk_inputs = $("#dkk").children(".xkk:last").children().find("input[type=text]");//找到大框框下的最后一个元素里面的所有input
//		var lastxkk_inputs = $(this).parent().parent().next().children().find("input");//找到大框框下的最后一个元素里面的所有input

		var lastxkk_inputs_buttons = $("#dkk").children(".xkk:last").children().find("input[type=button]");
		lastxkk_inputs_buttons.eq(1).attr('onclick',"deleteCore(this, 0)");
		
            lastxkk_inputs.each(function () {
                //var reg=/^[^a-zA-Z0-9]$/g;//匹配字符串中的非字母【即中文和数字】
                //var thisnewstr=$(this).attr("name").replace(reg,"");//把匹配到的中文和数字替换为空
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if(nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }
                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
                if ($(this).attr("value") == "增加" || $(this).attr("value") == "删除") {

                } else {
                    //if($(this).hasClass('dkyhname')){
                      //  $(this).val($($('.dkyhname')[0]).val())
                       // }else{
                        $(this).attr("value", "");
                    //}

                }
            });

            var lastxkk_selects = $("#dkk").children(".xkk:last").children().find("select");

            lastxkk_selects.each(function () {
                var nameStr = $(this).attr('name');
                var nameParentStrs = "";
                var nameStrs = "";

                if(nameStr != null) {
                    nameParentStrs = nameStr.split('.')[0];
                    nameStrs = nameStr.split('.')[1];
                }

                var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
            });


			setflag();
            //alert(xkks.length);
        });


        //给大框框下所有的日期input框动态添加日期事件
        var dkk_inamex = $("#dkk input[class='input laydate-icon needDate']");
        dkk_inamex.live('click', function () {
            var naowdate = $(this).attr("id");
            laydate({elem: '#' + naowdate});//绑定元素
        });

        //由于有validate验证，如何事先填写错误，就会加error样式，所以此时还需要动态调用一下date控件
        var dkk_inamex2 = $("#dkk input[class='input laydate-icon needDate error']");
        dkk_inamex2.live('click', function () {
            var naowdate2 = $(this).attr("id");
            laydate({elem: '#' + naowdate2});//绑定元素
        });

        //删除当前这个小框
        /*$(".addde2").click(function () {
            var parent = $(this).parent().parent();
            var parent_lang = parent.attr("lang");
            if (parent_lang != "firsttr") {
                parent.remove();
            }

            $("#dkk").children(".xkk").each(function (nownum) {
                var lastxkk_inputs = $(this).children().find("input");//找到大框框下的最后一个元素里面的所有input

                lastxkk_inputs.each(function () {
                    var nameParentStrs = $(this).attr("name").split('.')[0];
                    var nameStrs = $(this).attr("name").split('.')[1];
                    var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);
                    $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                });

                var lastxkk_selects = $(this).children().find("select");

                lastxkk_selects.each(function () {
                    var nameParentStrs = $(this).attr("name").split('.')[0];
                    var nameStrs = $(this).attr("name").split('.')[1];

                    var thisnewstr = nameParentStrs.substring(0, nameParentStrs.length - 2);

                    $(this).attr("name", thisnewstr + nownum + "]." + nameStrs);//把去掉数字序号的得到的字符串重新加一个序号付给name
                    $(this).attr("id", thisnewstr + nownum + "]." + nameStrs);//同事赋给id
                });
            })

            var lastxkk_laydates = $("#dkk").children(".xkk:last").children().find("input[class='input laydate-icon needDate']");
            lastxkk_laydates.each(function () {
                $(this).rules("add", {
                    required: true,
                    isDate: true,
                    messages: {required: "请输入", isDate: "日期格式如：2016-08-12"}
                })
            });
        });
*/
        //删除最后一个小框
        /*$("#gbdel").click(function(){
         var prev = $("#dkk").children(".xkk:last");
         var firsttr = prev.attr("lang");
         if(firsttr!="firsttr"){
         prev.remove();
         }

         });*/


    });


    !function () {
        laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#clri'});//绑定元素
        laydate({elem: '#dzsj'});//绑定元素
        laydate({elem: '#gsbgsj'});//绑定元素
        laydate({elem: '#jgbasj'});//绑定元素
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
    
    
    	$("#delSure .delsure").click(function(){
	    	$("#delSure").hide();
	    	var parent = $(objbl).parent().parent();
			var xkks = $("#dkk").children(".xkk");
			    //alert(xkks.length+"**");
			if (objid != 0 && xkks.length>1) {
					//alert(objid+"&&");
		            $.post('/interestapp/deleteCore.html',{ id : objid }, function (data) {
		
		                if (data.msg == 'erro'){
		                    alert("删除失败，请稍后再尝试！");
		                } else {
		                	//alert("删除成功！");
		                    removeCore(objbl);return false;
		                }
		            }, 'json');
		    }else if(objid != 0 && xkks.length==1){
		        	ggts2('至少留一栏！');return;
		        	
		    }else if(objid == 0 && xkks.length>1){
		            removeCore(objbl);return false;
		            
	        }else if(objid == 0 && xkks.length==1){
		            ggts2('至少留一栏！');return false;
	        }

			
		});
       $("#delSure .delcancel").click(function(){$("#delSure").hide();return false;});
    
    


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

                if(nameStr != null) {
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

                if(nameStr != null) {
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
</script>


</body>
</html>
 