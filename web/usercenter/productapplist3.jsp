<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
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
            <div id="peixunhuodong" class="vipinfo" style="padding: 13px;" >
                <div class="title"><li><span class="t">已申请的债权融资</span>
              	<span style="color:red;font-size:12px;  padding-left: 10px;">7月25号之前发起的申请在此处理。</span>  
                <%-- <a href="/usercenter/toAppProductappinfo.html?productapp.t=a"><span id="CreateTBpxhd" class="update">债权融资申请</span></a> --%>
                </li></div>
                
    
                
                <!-- 循环输出进度条 -->
                <s:iterator value="#request.list" status="index" >
                 
                    <div class="xgwk"  lang="<s:property value="(status+10)/10"/>">
                    
                    <span  class="sceilwktitle"><s:property value="prodname"/></span>
                    
                <div class="progress">
        <!--    progress-bar-stripes
progress-bar-success
progress-bar-info
progress-bar-warning
progress-bar-danger
 -->    
                <s:if test="((status+10)/10)%5==1">
              <div class="progress-bar progress-bar-stripes" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: -30%">
                </s:if>
                <s:elseif test="((status+10)/10)%5==2">
              <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: -30%">
                </s:elseif>
                
                <s:elseif test="((status+10)/10)%5==3">
              <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: -30%">
                </s:elseif>
                <s:elseif test="((status+10)/10)%5==4">
              <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: -30%">
                </s:elseif>
                <s:elseif test="((status+10)/10)%5==0">
              <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: -30%">
                </s:elseif>
                
                    <span class="sr-only">20% Complete</span>
                  </div>
                </div>
                <div class="sceilwk">
                        <div class="detail">
                            <div class="cont">
                                <p  class="t"><span class="t">申请期限：</span><span class="c"><s:property value="daikuanqixian"/>个月</span><p>
                                <p><span class="t">金额：</span><span class="c"><s:property value="loanamt"/>万</span><p>
                                <p><span class="t">申请日期：</span><span class="c"><s:property value="lurushijian"/></span><p>
                            </div>
                        </div>  
                                
                            <s:if test="status==1">
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv1">被驳回（原因：<s:property value="memo"/>）</div>
                            </s:if>
                            <s:else >
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv1">请填报、提交基础资料</div>
                            </s:else>
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv2">基础资料已提交,正在资料审查中请耐心等待</div>
                                
                                <s:if test="status==21">
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv3">被驳回,请补充资料再填报（原因：<s:property value="memo"/>）</div>
                            </s:if>
                            <s:else >
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv3">请填报、提交详细资料</div>
                            </s:else>
                            
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv4">详细资料已提，正在资料审查中请耐心等待</div>
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv5">详细资料审查通过，正在项目评审中请耐心等待</div>
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv6">项目评审通过，担保公司评审中请耐心等待</div>
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv7">担保公司审批通过，银行审查中请耐心等待</div>
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv8">银行审批通过，金融办审查中请耐心等待</div>
                                <div class="sceil">&nbsp;</div><div class="hidediv hidediv9">金融办审批通过，银行准备放款中请耐心等待</div>
                                <div class="sceil sceillast">&nbsp;</div>   <div class="hidediv hidediv10">银行放款成功</div>
                    </div>          
                <div class="annui">
                          <form action="">
                              <button type="button" class="btn btn-info btn-xs ck" lang="<s:property value="(status+10)/10"/>" id="h-default-basic-start">查看</button>
                              <button type="button" class="btn btn-warning btn-xs tb" lang="<s:property value="(status+10)/10"/>" id="h-default-basic-start">填报</button>
                              <button type="button" class="btn btn-primary btn-xs dc" lang="<s:property value="(status+10)/10"/>" id="h-default-basic-start">导出</button>
                              <button type="button" class="btn btn-primary btn-xs fz" lang="<s:property value="id_b"/>" id="h-default-basic-start" name="<s:property value="(status+10)/10"/>" accesskey="<s:property value="prodname"/>">复制</button>
                              
                              <input type="hidden" name="productapp.id"  class="productappid" value="${id_a }"/>
                              <input type="hidden" name="czdbaseid"  class="czdbaseid" value="${id_b }"/>
                              <input type="hidden" name="productapp.t" class="productappt"  value="v"/>
                              <input type="hidden" name="id" class="eid" value="${empty id_c?id_a:id_b}" />
                              <input type="hidden" name="t" class="et" value="v"/>
                              <input type="hidden" name="exportt"  value="x"/>
                          </form>
                    </div>
                </div>
         </s:iterator>
         
        
         
         
         
         
         
             
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
                    //  var optype = 1;//1 基础资料未提交  2 基础资料已经提交但未审核 3 基础资料已经审核 4 详细资料已经提交
                    //  if(step==2 ||step==3) {
                    //      optype = 2;
                    //  }else if (step == 4) {
                    //      optype = 3;
                    //  }else if (step > 4) {
                    //      optype = 4;
                    //  }
                    
                        var ck = $(this).children(".annui").eq(0).children("form").eq(0).children(".ck").eq(0);
                        var tb = ck.next();
                        var dc = ck.next().next();
                        var fz = ck.next().next().next();
                        var form = ck.parent();
                        ck.click(function(){
                        
                            var step = $(this).attr("lang");
                            //基础资料/usercenter/getProductappinfo.html?productapp.id="+id+"&productapp.t=u";
                            //详细资料/productczdbase/tostep1.html?e.id="+id+"&e.t=u";
                            //导出/manage/czddownloadword.action?id="+id;
                            if(step==1 ||step==2 ) {
                                form.attr('action','/usercenter/getProductappinfo.html');
                            }else  {
                                if(prodname=='开行统借统还贷款'||prodname=='口行统借统还贷款') {
                                    form.attr('action','/usercenter/getProductappinfo.html');
                                }else {
                                    form.attr('action','/productczdbase/tostep1.html');
                                }
                            }
                            form.submit();
                        });
                        tb.click(function(){
                            var step = $(this).attr("lang");
                        
                            if(prodname=='开行统借统还贷款'||prodname=='口行统借统还贷款' ) {
                                
                                if(step==1 ||step==2){ //基础信息
                                    form.attr('action','/usercenter/getProductappinfo.html');
                                    $(".productappt").val('u');
                                }else if(step==3||step==4 ){ //详细信息
                                    form.attr('action','/usercenter/getProductappinfo.html');
                                    $(".productappt").val('u');
                                }else  {
                                    alert('当前状态不允许填报');
                                    return false;
                                }
                            }else {
                                if(step==1 ||step==2 ) {
                                    form.attr('action','/usercenter/getProductappinfo.html');
                                    $(".productappt").val('u')
                                }else if(step==3||step==4 ) {
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
                            
                            if(prodname=='开行统借统还贷款'||prodname=='口行统借统还贷款' ) {
                                alert('当前贷款品种不提供资料导出');
                                    return ;
                            }
                            
                            /* if(step >= 5 ) { */
                                    form.attr('action','/manage/czddownloadword.action?');
                                    form.submit();
                                /* }else  {
                                    alert('当前状态不提供资料导出');
                                    return ;
                                } */
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
             <%--    <ul>
                <li><a style="background:url('../img/zqrzimg.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=成长贷"><span>成长贷</span></a></li>
                <li><a style="background:url('../img/zz.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=壮大贷"><span>壮大贷</span></a></li>
                <li><a style="background:url('../img/z.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=新创贷"><span>新创贷</span></a></li>
                <li><a style="background:url('../img/zzz.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=开行统借统还贷款"><span>开行统借统还</span></a></li>
                <li><a style="background:url('../img/zqrzimg.png') no-repeat;" href="/usercenter/toAppProductappinfo.html?productapp.t=a&productapp.prodname=口行统借统还贷款"><span>口行统借统还</span></a></li>
                </ul> --%>
                <img src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/image/usercenter/pingankyb.png"/>
             </div>
         
         
         
         
         
            </div>
            </div>

</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
    leftnav_init("debtsinfo1");
 </script>
 
 
 <!--点击下一步弹出发送短信对话框 start-->
<div id="ldksq">
    <div id="ldksq_c" style="min-height:280px;">
        <div id="ldksq_lose"></div>
        <form action="/productczdbase/copyproduct.html" name="copymessage" id="copymessage" method="post" style="padding-bottom: 10px;">
        <input type="hidden" id="copyid" name="e.id" value="<s:property value="e.id" />"/>
        <input type="hidden" name="e.status" id="status" value="<s:property value="e.status" />"/>
        <input type="hidden" name="e.userid" value="<s:property value="e.userid" />"/>
        <p class="tckselect" style="margin-top: 20px;">
            <span>贷款产品：<span style="color:red">*</span></span>
            <span><s:select list="#{'成长贷':'成长贷','壮大贷':'壮大贷','新创贷':'新创贷','开行统借统还贷款':'开行统借统还贷款','口行统借统还贷款':'口行统借统还贷款'}" id="prodname" name="e.daikuanpingz"  cssClass="input-medium" 
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
<script type="text/javascript">
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
    //alert(chedkcp+"||"+chedkyh+"||"+chedbgs+"||"+chedkje);
}
if ('${msg}' != "") {
    layer.alert('${msg}', {icon: 7, title : '提示'});
}
</script>
</body>
</html>
 