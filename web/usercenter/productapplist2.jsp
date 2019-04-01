<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.winpow.core.appUtil.AppUtil"%>
 
  <%@page import="com.winpow.core.FrontContainer"%>
<!DOCTYPE html>
<html>
<head >
    <title>盈创动力</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/massage.css"/>
        <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css" type="text/css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="../resource/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/copymessage.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.dialogBox.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/newlayer/layer.js"></script>
	<style>
	ul{margin:0;}
	.nav .nav_right .login_re .inputtext{padding-left: 10px!important;}
	.nav .nav_right .nav_type{height:autoimportant;margin-top:0px!important;}
	.hi{display: none;}
    
    .table-hover>tbody>tr:hover{background: #fadada;}
        .button button{border:0;background: none;color:blue;padding:0 2px;}
    .button button:hover{text-decoration: underline;}
	</style>
</head>
<body>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>
<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
	<%@ include file="leftnav.jsp"%>
	</div>
	<div class="list fr">
		<div class="rightbox">
			<!--培训活动   所有用户显示    -->
			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">已申请的债权融资</span><a href="/usercenter/toAppProductappinfo.html?productapp.t=a"><span id="CreateTBpxhd" class="update">债权融资申请</span></a></li></div>
			<table class="table table-bordered table-hover" id="ycacti">
            <thead>
                <!--<tr style="background-color: #dff0d8">-->
                    <!--<th colspan="8">待办列表</th>-->
                <!--</tr>-->
                <tr style="background-color: #ea5504;color:#fff;white-space: nowrap;">
                    <th>用户id</th>
                    <th>业务名称</th>
                    <th>公司名称</th>
                   <!--  <th>处理人id</th> -->
                    <!-- <th>处理人名称</th> -->
                    <th>申请金额</th>
                    <th>申请时间</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <s:iterator value="#request.list">
                    <tr>
                        <td>${userid }</td>
                        <td>${prodname }</td>
                        <td>${qiyemingcheng }</td>
                        <%-- <td>${checkuser }</td> --%>
                        <td>${loanamt }万</td>
                        <td style="white-space: nowrap;"><fmt:formatDate value="${lurushijian}" pattern="yyyy-MM-dd"/></td>
                        <td style="white-space: nowrap;"><% out.print(AppUtil.getCodeName(request.getAttribute("status")));%></td>
                        <td class="xgwk" nowrap="nowrap" >
                        <div class="button" >
                            <form action="">
                              <input  type="button" class=" an ck" lang="${status}" xxxx="${id_c}" value="查看">
                              <input type="button" class=" an tb" lang="${status}"  value="填报">
                              <input type="button" class=" an dc" lang="${status}" value="导出">
                              <input type="button" class=" an shjl" lang="${status}" productappid="${id_a }"  value="审核记录">
                              <input type="button" lang="${id_b }" name="${(czdstatus + 10) / 10 }" class="an fz" accesskey="${prodname}" value="复制">
                              <input type="hidden" name="productapp.id"  class="productappid" value="${id_a }"/>
                              <input type="hidden" name="czdbaseid"  class="czdbaseid" value="${id_b }"/>
                              <input type="hidden" name="productapp.t" class="productappt"  value="v"/>
                              <input type="hidden" name="id" class="eid" value="${empty id_c?id_a:id_b}" />
                              <input type="hidden" name="t" class="et" value="v"/>
                              <input type="hidden" name="exportt"  value="x"/>
                          </form>
                    </div>          
                        </td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
	<div class="shjlTab">
            <div class="shjl_tit ov">
                <h2 class="fl">审核记录</h2>
                <span class="fr shjl_close">&times;</span>
            </div>
            <div class="shjl_over">
                <table class="sbhzTab" >
                    <thead>
                        <tr class="TT">
                            <td>时间</td>
                            <td>节点名称</td>
                            <td>处理人</td>
                            <td>动作</td>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
            </div>
        </div>
        
			 
				<script type="text/javascript">
			
				
				
				//获取总共有多少条记录[显示当前所到的步骤]		
					var datas = $(".xgwk");
					var step = 0;
					var nowwidth = 0;
					var sceilwkwidth = $(".sceilwk").eq(0).width();
					var sceilwidth = (sceilwkwidth/10);
						//alert(sceilwidth);
					//遍历对每一条数据进行操作
					datas.each(function(i,v){
						//获取每一条的step值
						step = $(this).attr("lang");
						var prodname = $(this).children(".sceilwktitle").html();
						//alert($(this).attr('lang'));return;
					//	var optype = 1;//1 基础资料未提交  2 基础资料已经提交但未审核 3 基础资料已经审核 4 详细资料已经提交
					//	if(step==2 ||step==3) {
					//		optype = 2;
					//	}else if (step == 4) {
					//		optype = 3;
					//	}else if (step > 4) {
					//		optype = 4;
					//	}
					
						var ck = $(this).children(".button").eq(0).children("form").eq(0).children(".ck").eq(0);
						var tb = ck.next();
						var dc = ck.next().next();
						var fz = ck.next().next().next();
						var form = ck.parent();
						var status = ck.attr("lang");
						if (status!=14008 && status!=14001 && status!=14007){
							tb.addClass("hi");
						}
						ck.click(function(){
							var xxxx = $(this).attr("xxxx");//详细信息
							var cklang = $(this).attr("lang");//详细信息
							
							//基础资料/usercenter/getProductappinfo.html?productapp.id="+id+"&productapp.t=u";
							//详细资料/productczdbase/tostep1.html?e.id="+id+"&e.t=u";
							//导出/manage/czddownloadword.action?id="+id;
							if (cklang == "14008") {
								$(".et").val('v')
								form.attr('action','/productczdbase/tostep1.html');
							} else if (xxxx=="") {
								form.attr('action','/usercenter/getProductappinfo.html');
							} else  {
								/* if(prodname=='开行统借统还贷款'||prodname=='口行统借统还贷款') {
									form.attr('action','/usercenter/getProductappinfo.html');
								}else {
									form.attr('action','/productczdbase/tostep1.html');
								} */
								$(".et").val('v')
								form.attr('action','/productczdbase/tostep1.html');
							}
							form.submit();
						});
						tb.click(function(){
							
						
							if(prodname=='开行统借统还贷款'||prodname=='口行统借统还贷款' ) {
								
								if(status==14007||status==14001){ //基础信息
									form.attr('action','/usercenter/getProductappinfo.html');
									$(".productappt").val('u');
								}else if(status==14008 ){ //详细信息
									form.attr('action','/usercenter/getProductappinfo.html');
									$(".productappt").val('u');
								}else  {
									alert('当前状态不允许填报');
									return false;
								}
							}else {
								if(status==14007||status==14001) {
									form.attr('action','/usercenter/getProductappinfo.html');
									$(".productappt").val('u')
									$(".et").val('u')
								}else if(status==14008 ) {
									form.attr('action','/productczdbase/tostep1.html');
									$(".et").val('u')
								}else {
									alert('当前状态不允许填报');
									return false;
								}
							}
							form.submit();
						});
						dc.click(function(){
							var step = $(this).attr("lang");
							if (step=="14011" || step=="14012" || step=="14013" || step=="14014") {
							 	form.attr('action','/userextend/czddownloadword.html');
                             	form.submit();
							} else {
								alert('当前状态不提供资料导出');
								return ;
							}
						});
						
						//alert(ck.html()+"||"+ck.next().html()+"||"+ck.next().next().html());
					
						nowwidth = (step*10)+"%";
						//alert(nowwidth);
						//alert($(this).children(".sceilwk").eq(0).children(".hidediv").length);
						//获取每一条下面所有hidediv
						//alert($(this).children(".progress").eq(0).children(".progress-bar").eq(0).attr("class"));
						$(this).children(".progress").eq(0).children(".progress-bar").eq(0).attr("style","width:"+nowwidth);												
						$(this).children(".sceilwk").eq(0).children(".hidediv").eq(step-1).show(800);		
						$(this).children(".sceilwk").eq(0).children(".sceil").css("width",sceilwidth);		
						$(this).children(".sceilwk").eq(0).hover(function(i,v){
							$(this).children(".detail").stop().slideDown(200);
							$(this).addClass("lhover");
							//$(this).prev(".progress").children(".progress-bar").addClass("lhover");
						},function(){
							$(this).children(".detail").stop().slideUp(100);
							$(this).removeClass("lhover");
							//$(this).prev(".progress").children(".progress-bar").removeClass("lhover");
						});
					});
					
					
					
				
				
				
				
				
				
				var opls = $("#ycacti .opl");
				var oprs = $("#ycacti .opr");
				opls.each(function(){
					var stateinput= $(this).parent().prev().prev().children("label").html();
					if(stateinput=="审批中" || stateinput=="审批通过"){
						$(this).attr("disabled","false");
						$(this).removeClass("op").addClass("padd");
						//$(this).next().attr("disabled","false");
						//$(this).next().removeClass("op");
					}
					if(stateinput=="驳回"){
						$(this).parent().prev().prev().addClass("showh");
					}
					
				});
				$(".showh").hover(function(){
					$(this).children("span").show();
				},function(){
					$(this).children("span").hide();
				});
				
				//填报
				opls.click(function(){

						var id=$(this).attr("lang");
						location.href="/usercenter/getProductappinfo.html?productapp.id="+id+"&productapp.t=u";
				});
				oprs.click(function(){

					var id=$(this).attr("lang");
					location.href="/usercenter/getProductappinfo.html?productapp.id="+id+"&productapp.t=v";
			});
				
				
				
				
			
				
				
			 	</script>
			 	
			 	

			 	
			 	
			 	
			 	
			</div>
			
			
			 <%-- 列出可以申请的类别，(现阶段有5个)--%>
			 <div class="zqrz_list">
			 	<!-- <ul>
			 	<li><a style="background:url('../img/zqrzimg.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=成长贷"><span>成长贷</span></a></li>
			 	<li><a style="background:url('../img/zz.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=壮大贷"><span>壮大贷</span></a></li>
			 	<li><a style="background:url('../img/z.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=新创贷"><span>新创贷</span></a></li>
			 	<li><a style="background:url('../img/zzz.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=开行统借统还贷款"><span>开行统借统还</span></a></li>
			 	<li><a style="background:url('../img/zqrzimg.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=口行统借统还贷款"><span>口行统借统还</span></a></li>
			 	</ul>-->
			 	 <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/usercenter/pingankyb.png"/>
			 </div>
		 
		 
		 
		 
		 
			</div>
			</div>

</div>

<div id="ldksq">
    <div id="ldksq_c" style="min-height:280px;">
        <div id="ldksq_lose"></div>
        <form action="/productczdbase/copyproduct.html" name="copymessage" id="copymessage" method="post" style="padding-bottom: 10px;">
        <input type="hidden" id="copyid" name="e.id" value="<s:property value="e.id" />"/>
        <input type="hidden" name="e.status" id="status" value="<s:property value="e.status" />"/>
        <input type="hidden" name="e.userid" value="<s:property value="e.userid" />"/>
        <p class="tckselect" style="margin-top: 20px;">
            <span>贷款产品：<span style="color:red">*</span></span>
            <span><s:select list="#{'成长贷':'成长贷','壮大贷':'壮大贷','新创贷':'新创贷','期权贷':'期权贷','园保贷':'园保贷'}" id="prodname" name="e.daikuanpingz"  cssClass="input-medium" 
                                        listKey="key" listValue="value"   headerKey="" headerValue=""/></span>
        </p>
        
        <p class="tckselect" style="margin-top: 20px;">
            <span>贷款银行：<span style="color:red">*</span></span>
            <span><s:select list="#{'国家开发银行':'国家开发银行','进出口银行':'进出口银行','盈创动力分配银行':'盈创动力分配银行','成都银行科技支行':'成都银行科技支行','成都银行高新支行':'成都银行高新支行','盈创动力分配银行':'盈创动力分配银行','成都银行营业部':'成都银行营业部','成都银行华兴支行':'成都银行华兴支行','成都银行高新支行':'成都银行高新支行','成都银行琴台支行':'成都银行琴台支行','成都银行金河支行':'成都银行金河支行','成都银行长顺支行':'成都银行长顺支行','成都银行锦江支行':'成都银行锦江支行','成都银行成华支行':'成都银行成华支行','成都银行武侯支行':'成都银行武侯支行','成都银行德盛支行':'成都银行德盛支行','成都银行青羊支行':'成都银行青羊支行','成都银行高升桥支行':'成都银行高升桥支行','成都银行金牛支行':'成都银行金牛支行','成都银行沙湾支行':'成都银行沙湾支行','成都银行体育场路支行':'成都银行体育场路支行','成都银行科技支行':'成都银行科技支行','成都银行双流支行':'成都银行双流支行','工行高新支行':'工行高新支行'}" id="bank" name="e.daikuanyinhang"  cssClass="input-medium" 
                                        listKey="key" listValue="value"  headerKey="" headerValue=""  data-rule="贷款银行:required;daikuanyinhang"/></span>
        </p>
        <p class="tckselect" style="margin-top: 20px;">
            <span>担保公司：<span style="color:red">*</span></span>
            <span><s:select list="#{'无':'无','成都中小担':'成都中小担','成都高投担':'成都高投担'}" id="guranplant" name="e.danbaogongsi"  cssClass="input-medium" 
                                        listKey="key" listValue="value"  headerKey="" headerValue="" data-rule="担保公司:required;guranplant;length[1~32]" /></span>
        </p>
        
        <p class="tckselect" style="margin-top: 20px;">
            <span>贷款金额(万元)：<span style="color:red">*</span></span>
            <span><s:textfield onkeyup="value=value.replace(/[^\d]/g,'')" name="e.shenqingjine" data-rule="贷款金额;required;shenqingjine;length[0~128];" size="60" maxlength="60" style="width: 20%;"
                                        id="amt" /></span>
        </p>
       
        <p style="margin-top: 20px;">
            <button id="ldksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
                 取消
            </button>
            <span type="botton" class="btn btn-success" style="margin-left:20px;" onclick="return checkcopymessage()">
                 确定
            </span></p>
        </form>
    </div>
</div>

 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 
 	function checkcopymessage(){
	    var chedkcp = $("#prodname").val();
	    if(!chedkcp){alert("请选择贷款产品!");$("#prodname").focus();return false;}
	    var chedkyh = $("#bank").val();
	    if(!chedkyh){alert("请选择贷款银行 !");$("#bank").focus();return false;}
	    var chedbgs = $("#guranplant").val();
	    if(!chedbgs){alert("请选择担保公司 !");$("#guranplant").focus();return false;}
	    var chedkje = $("#amt").val();
	    if(!chedkje){alert("请填写贷款金额!");$("#amt").focus();return false;}
	    
	    $("#copymessage").submit();
	}
 
 	leftnav_init("debtsinfo");
	
	$(function(){
		 $('#ycacti>tbody>tr>td').each(function(){
			var text=$(this).text();
			 if(text=="已驳回"){
				 $(this).css('color','orangered');
			 }else if(text=="审核通过"){
				 $(this).css('color','forestgreen');
			 }else if(text=="审核中"){
				 $(this).css('color','cornflowerblue');
			 }else{
				 $(this).css('color','#999');
			 }
		 })
	})
 </script>

<script type="text/javascript">

$('.shjlTab .shjl_tit .shjl_close').click(function(){
      $('.shjlTab').fadeOut(200);
  })
  $('#peixunhuodong').delegate(' tr>td .shjl','click',function(e){
      e.stopPropagation();
      $('.shjlTab').fadeIn(200);
      var id=$(this).attr('productappid');
      $.ajax({
          cache: true,
          type: "POST",
          url:"/usercenter/getWorkFlowDetail.html?id="+id+"&tablename=tb_product_app",
          async: false,
          error: function(request) {
              // alert("请求出错");
          },
          success: function(data) {
              $('.sbhzTab tbody').html('');
              if(data.length==0||data==""){
                  $('.sbhzTab tbody').html('<p>暂无审核记录！</p>');
              }
              for(var i=0;i<data.length;i++){
            	  var dealuser =data[i].dealusername;
            	  if (dealuser==""){
            		  dealuser = data[i].dealuserid;
            		  dealuser = dealuser.substring(2);
            	  }
            	  var oper = data[i].operation;
            	  if (data[i].comments != "") {
            	  	oper += "（" + data[i].comments + "）";
            	  }
                  var tr="";
                  tr+='<tr><td>'+data[i].sendtime+'</td><td>'+data[i].nodename +'</td><td>'+dealuser+'</td><td>'+oper+'</td></tr>';
                  $('.sbhzTab tbody').append(tr);
              }
          }
      })
  })


if ('${msg}' != "") {
	layer.alert('${msg}', {icon: 7, title : '提示'});
}
</script>
</body>
</html>
 