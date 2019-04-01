<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/manage/system/common.jsp" %>
	<style>
		.alllist span{cursor:pointer;}
		.alllist li{font-size: 14px;list-style: none;color: #424e67;}
		.alllist li.active,.alllist li:hover{background: #f6faff;color: #3b8cff;}
		.alllist li>span{display: block;padding:15px 30px;cursor: pointer;}
		.alllist li>span>i{
			float:right;width: 18px;height: 18px;margin-top:1px;
			background-image: url("/resource/images/fenzhan/navicon.png");
			background-repeat: no-repeat;}
		.alllist li:nth-child(1)>span>i{background-position: 0 0}
		.alllist li:nth-child(2)>span>i{background-position: -28px 0}
		.alllist li:nth-child(3)>span>i{background-position: -196px 0}
		.alllist li:nth-child(4)>span>i{background-position: -56px 0}
		.alllist li:nth-child(5)>span>i{background-position: -84px 0}
		.alllist li:nth-child(6)>span>i{background-position: -112px 0}
		.alllist li:nth-child(7)>span>i{background-position: -140px 0}
		.alllist li:nth-child(8)>span>i{background-position: -168px 0}
		.alllist li:nth-child(9)>span>i{background-position: -224px 0}
		.alllist li:nth-child(10)>span>i{background-position: -252px 0}
		.alllist li:nth-child(11)>span>i{background-position: -280px 0}
		.alllist li:nth-child(12)>span>i{background-position: -308px 0}
		.alllist li.active>span>i,.alllist li:hover>span>i{background-image: url("/resource/images/fenzhan/navicon_on.png");}

		.username{padding:35px 0;color: #424e67;text-align: center;}
		.username>div{display:inline-block;padding-left:60px; margin-left: -15px;background:url("/resource/images/fenzhan/head.png") no-repeat 0 center ;}
		.username>div>h2{font-size: 20px;line-height: 18px;}

		.loginOut{margin:50px 0;}
		.loginOut>a,.loginOut>span{display:block;text-align:center;width: 140px;height: 34px;line-height: 34px;margin: 0 auto;}
		.loginOut>a{background: #f8645c;color: #fff;border-radius: 5px;}
		.loginOut>a:hover{background: #e9564f;}
	</style>
</head>

<body style="border-top:1px solid #eff5f8;padding:0;">
<div class="alllist">
	<div class="username">
			<div>
				<!--${session.manage_session_user_info.nickname}-->
				<h2>欢迎</h2>
				${session.manage_session_user_info.username }
				
			</div>
		</div>
<ul>
	<li class="active"><span href="/usermanage/wfList.html">首页 <i></i></span></li>
	<li><span href="/usermanage/custList.html">用户管理 <i></i></span></li>
	<li><span href="/usermanage/userList.html">管理员管理<i></i></span></li>
	<li><span href="/usermanage/productList.html">贷款产品<i></i></span></li>
	<li><span href="/usermanage/actiList.html">培训活动<i></i></span></li>
	<li><span href="/usermanage/actiAppList.html">培训活动报名<i></i></span></li>
	<li><span href="/usermanage/newsList.html">资讯管理<i></i></span></li>
	<li><span href="/usermanage/aboutusEdit.html">平台介绍<i></i></span></li>
	<li><span href="/usermanage/bannerList.html">banner管理<i></i></span></li>
	<li><span href="/usermanage/increList.html">中介服务<i></i></span></li>
	<li><span href="/usermanage/guquanList.html">股权融资<i></i></span></li>
	<li><span href="/usermanage/messageList.html">短信服务<i></i></span></li>
	<li><span href="/usermanage/parkList.html">园区服务<i></i></span></li>
</ul>
	<div class="loginOut">
		<a href="#" onclick="loginout()">退出登录</a>
		<span href="/usermanage/changePwd.html" id="changePSW">修改密码<i></i></span>
	</div>
</div>

<script type="text/javascript">
	$(".alllist ul li span").click(function(){
	    $(this).parent('li').addClass('active').siblings('.active').removeClass('active');
		$("frame[name='rightFrame']", window.parent.document).attr("src", $(this).attr("href"));
	});
	$('#changePSW').click(function(){
        $("frame[name='rightFrame']", window.parent.document).attr("src", $(this).attr("href"));
    });
	function loginout(){	//注销
		window.parent.location.href = "/usermanage/loginout.html";
	}
</script>
</body>
</html>
