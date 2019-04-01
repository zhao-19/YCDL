<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.winpow.core.front.SystemManager" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
	<jsp:param name="title" value="政策申报汇总" />
</jsp:include>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body class="sbhz">
<div id="policyconfirm" style="display: none;"><%out.print(SystemManager.CONFIGS.get(Config.POLICYCONFIRM));%></div>
<ul class="newzcsb">
	<c:forEach items="${pager.list}" var="alist" varStatus="id">
	<li>
		<p><b>申报项目<i></i></b><i>:</i><span>${alist.type}</span></p>
		<p><b>类别<i></i></b><i>:</i><span>${tname == 'apppolicy' ? '政策申报辅导' : '高新区产业政策'}</span></p>
		<p><b>录入日期<i></i></b><i>:</i><span><fmt:parseDate value="${alist.lurushijian}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd "/></span></p>
		<p><b>状态<i></i></b><i>:</i>
			<c:if test="${alist.status eq '待审核'}">
				<span>--</span>
			</c:if>
			<c:if test="${alist.status ne '待审核'}">
				<span class="${alist.statustype}">${alist.status}</span>
			</c:if>
		</p>
		<p><b>金额<i></i></b><i>:</i><span>${alist.xtjsje == null ? '--' : ''.concat(alist.xtjsje).concat('万元') }</span></p>
		<div class="ov">
			<c:if test="${alist.status ne '未提交'}">
				<span href="${alist.id }" lang="${alist.policyid }" class="fr look">查看审核记录</span>
			</c:if>
			<c:if test="${alist.status eq '未提交'}">
				<span class='fr gray'>暂无审核记录</span>
			</c:if>
		<span lang="${alist.id}"  xtjsje="${alist.xtjsje }" status="${alist.status}" tname="${alist.tname}" amtconfirm="${alist.amt_confirm }" class="fr amtconf">确认金额</span>
		</div>
	</li>
	</c:forEach>
</ul>
<div class="mask">
	<div class="pop tc">
		<h2>
			<img src="${pageContext.request.contextPath}/app/images/shjl_tit.png" alt="">
		</h2>
		<div class="tab">
			<p style="display: none;">暂无审核记录！</p>
			<table>
				<thead>
				<tr>
					<th width="28%">时间</th>
					<th width="22%">动作</th>
					<th width="24%">处理人</th>
					<th width="26%">意见</th>
				</tr>
				</thead>
				<tbody>
				<!--<tr>-->
				<!--<td>2018-05-13 17:43:42</td>-->
				<!--<td>审批中</td>-->
				<!--<td>12346644</td>-->
				<!--<td>提交</td>-->
				<!--</tr>-->
				</tbody>
			</table>
		</div>
		<div class="close">知道了</div>
	</div>

</div>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/skin/layer.css">
<script src="${pageContext.request.contextPath}/app/js/layer.js"></script>
<script>
    $('.close').click(function() {
        $('.mask').fadeOut(300);
    });

    $('.newzcsb').delegate(' .look', 'click', function(e) {
        e.preventDefault();
        $('.mask').fadeIn(300);
        var id = $(this).attr('href');
        var policyid = $(this).attr('lang');
        $.ajax({
            cache: true,
            type: "POST",
            url:"declare_base/getReviewLog.html?id="+id+"&policyid="+policyid,
            async: false,
            error: function(request) {
                alert("请求出错");
            },
            success: function(data) {
                console.log(data);
                $('.tab tbody').html('');
                if(data.length==0){
                    $('.tab>p').show();
                    $('.tab>table').hide();
                }
                for(var i=0;i<data.length;i++){
                    $('.tab>p').hide();
                    $('.tab>table').show();
                    var tr="";
                    tr+='<tr><td>'+data[i].inputtime+'</td><td class="'+data[i].status+'">'+data[i].result +'</td><td>'+data[i].inputuser+'</td><td>'+data[i].review_opinion+'</td></tr>';
                    $('.tab tbody').append(tr);
                }
            }
        })
    })

    if ($("#policyconfirm").html() == "10001") {
        $(".amtconf").each(function(){
            console.log(1)
            if ($(this).attr("status") == '审批通过'
                && $(this).attr("amtconfirm") != '10001'
            ) {
                $(this).show();
                $(this).addClass("amtconfirm");
            }
        });
    }
    $('.amtconfirm').click(function() {
        var amtmsg = "请确认您本项政策审核批准的金额为" + $(this).attr('xtjsje') + "万元";
        var aid = $(this).attr('lang');
        var atype = $(this).attr('tname');
        layer.open({
            title: '提示',
            content: amtmsg,
            btn: ['确认', '取消'],
            yes: function (index) {
                $.ajax({
                    type: "post",
                    url: "/userextend/amtconfirm.html",
                    data: {id: aid, type: atype},
                    dataType: "text",
                    success: function (data) {
                        layer.open({
                            title: '提示',
                            content: data,
                            btn: '知道了',
                            yes: function () {
                                location.reload();
                            }
                        });
                    }
                });
            }
        });
    });
</script>

</body>
</html>