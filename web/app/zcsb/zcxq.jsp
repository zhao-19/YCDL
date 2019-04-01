<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="${sbpolicy.policy_name}"/>
</jsp:include>
<body class="zcxq">
    <div class="zcxq-wrap">
        <div class="zcxq-list">
            <span>政策名称：</span>${sbpolicy.policy_name}
        </div>
        <div class="zcxq-list">
            <span>申报项目和标准：</span>${sbpolicy.sub_describe}
        </div>
        <div class="zcxq-list">
            <span>补贴金额：</span>${sbpolicy.sub_amount}
        </div>
        <div class="zcxq-list">
            <span>申报条件：</span>
           ${sbpolicy.sub_condition}
        </div>
        <div class="zcxq-list">
            <span>申报资料：</span>
            ${sbpolicy.sub_materials}
        </div>
        <div class="zcxq-list">
            <span>申报时间：</span>${sbpolicy.sub_time}
        </div>
        <div class="zcxq-list">
            <span>受理部门：</span>${sbpolicy.accepting_department}
        </div>
        <div class="zcxq-list">
            <span>申报网址：</span>${sbpolicy.sub_platform}
        </div>
        <div class="zcxq-list">
            <span>更新时间：</span>${fn:substring(sbpolicy.pubdate, 0, 19)}
        </div>
        <div class="zcxq-list">
            <span>政策来源名称：</span>${sbpolicy.from_name}
        </div>
        <div class="zcxq-list">
            <span>政策来源网址：</span>${sbpolicy.from_sites}
        </div>
    </div>
    <a class="zcsb-btn tipbtn" id="shen">立即申报</a>
    <a class="zcsb-btn notOpen">暂未开放</a>


    <div class="mytip">
        请访问盈创动力网站<br>（https://www.winpow.com）<br>进行政策申报。
    </div>
 	<!--<div class="search clearfix">-->
	   <!--<input type="number" name="appmoney" class="search-box fl" id="searchinput" autocomplete="off"  placeholder="请输入申报金额（万元）" maxlength="18" value=""/>-->
	   <!--<input type="button" id="tjBtn" class="search-cancel" value="提交">-->
	<!--</div>-->
	<br/><br/>
	<div id="shenbao" style="display: none;"><%out.print(SystemManager.CONFIGS.get(Config.ZHENGCHESHENBAO));%></div>
    <script type="text/javascript">
        $('.tipbtn').click(function(){
            $('.mytip').fadeIn(300,function(){
                setTimeout("$('.mytip').fadeOut(300);",3000);
        })});
        function checkopen() {
        	var change = $.trim($('#shenbao').text());
        	var open_stat = '${sbpolicy.open_stat}';
            if (change == 1 && open_stat == 1) {
            	//已开放
                $('.zcsb-btn.tipbtn').css('display','block');
            } else {
            	//未开放
                $('.zcsb-btn.notOpen').css('display','block');
            }
        }
        checkopen()
        $("#shen").click(function(){
            $('.search').css('bottom',0);
        });
        $("#tjBtn").click(function(){
        	var re = /^[0-9]+.?[0-9]*$/; //判断正数
           	var obj = document.getElementById("searchinput");
	        var nubmer = obj.value;
	        if (!re.test(nubmer)) {
	            alert("请输入有效金额！");
	            obj.value = "";
	            return;
	        }
            $('.search').css('bottom', "-1.1rem");
            var number = $("#searchinput").val();
            var para = new Object();
			para.id = '${sbpolicy.id}';
			para.amount = number;
            if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
    			window.webkit.messageHandlers.zcsbsub.postMessage(para);
	    	} else {
	    		zcsbsub.zcsbsub(JSON.stringify(para));
	    	}
        });
    </script>
</body>
</html>