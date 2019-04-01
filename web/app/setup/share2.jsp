<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="盈创动力十周年，免费请你看电影！速来领取!">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="盈创动力十周年，免费请你看电影！"/>
</jsp:include>
<script>
    window.onload=function (ev) {
        if('${info}'=='0'){
            $('.tenyear,.reg').show();
            var agent = navigator.userAgent.toLowerCase();
            if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
                if (agent.match(/MicroMessenger/i) == "micromessenger") {

                } else {
                    window.location.href="${pageContext.request.contextPath}/app/setup/onlyweixin.jsp";
                }
            }
            else {
                window.location.href="https://www.winpow.com";
            }
      }else{
            $('.tenyear').show();
        }
    }
</script>
<style>html{background: #211819;}</style>
<body>
<div class="tenyear" style="display: none;">
    <div class="box tc">
        <div class="intro">
            <img src="${pageContext.request.contextPath}/app/images/tenyear/tenyear1.png" alt="">
        </div>
        <div class="intro">
            <img src="${pageContext.request.contextPath}/app/images/tenyear/tenyear2.png" alt="">
            <video poster="${pageContext.request.contextPath}/attached/media/picture/tenyear.jpg" controls>
                <source src="${pageContext.request.contextPath}/attached/media/vedio/tenyear.mp4" type="video/mp4">
                <source src="http://appit.winpow.com/attached/media/vedio/tenyear.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        <div class="intro">
            <img src="${pageContext.request.contextPath}/app/images/tenyear/tenyear3.png" alt="">
            <div class="reg" style="display:none;">
                <div class="form">
                    <div class="inp">
                        <input type="number" name="cellphone" value="" placeholder="请输入注册手机号码" id="dianhuan">
                    </div>
                    <p id="regphone"></p>
                    <div class="inp">
                        <input type="number" name="msgcode" value="" placeholder="请输入短信验证码" id="writecode">
                        <span id="getcode" class="fr getcode">获取验证码</span>
                    </div>
                    <p id="regcode"></p>
                    <span class="getticket" id="getticket">领取电影票</span>
                </div>
                <div class="download tc" style="display: none;">
                    <img src="${pageContext.request.contextPath}/app/images/tenyear/get.png" alt="">
                    <h2 class="tip1">您离电影票只差一步啦</h2>
                    <h2 class="tip2">你已经领取过啦</h2>
                    <p>下载盈创动力APP，进入活动页查看</p>
                    <a href="${pageContext.request.contextPath}/app/shdo.action" class="getticket">立即下载APP</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function isPoneAvailable(str) {
        var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
        if (!myreg.test(str)) {
            return false;
        } else {
            return true;
        }
    }
    var validCode=true;
    $("#getcode").click (function  () {
        codereg="";
        if(!$(this).hasClass("gray")){
            var dianhuan=$('#dianhuan').val();
            if(dianhuan==""||isPoneAvailable(dianhuan)==false){
                $('#regphone').html('*手机号码有误');
                return false;
            }else{
                $('#regphone').html('');
                $.ajax({
                    type: "GET",
                    url: "/app/sendMsgCode.action",
                    crossDomain: true,
                    xhrFields: {
                        withCredentials: true
                    },
                    data:{
                        'msgtype':'10001',
                        'mobile':dianhuan
                    },
                    dataType: "json",
                    success: function(data){
                    }
                });
            }
            var time=60;
            var $code=$(this);
            if (validCode) {
                validCode=false;
                var t=setInterval(function  () {
                    time--;
                    $code.addClass('gray');
                    $code.html(time+"S重新获取");
                    if (time==0) {
                        clearInterval(t);
                        $code.removeClass('gray');
                        $code.html("重新获取");
                        validCode=true;
                    }
                },1000)
            }
        }
    })

    $('#getticket').click(function () {
        var dianhuan=$('#dianhuan').val();
        if(dianhuan==""||isPoneAvailable(dianhuan)==false){
            $('#regphone').html('*手机号码有误');
            return false;
        }
        $.ajax({
            type: "post",
            url: "/app/checkMsgCode.action",
            dataType: "json",
            async : false,
            crossDomain: true,
            xhrFields: {
                withCredentials: true
            },
            data:{
                'msgtype':'10001',
                'mobile':$('#dianhuan').val(),
                'msgcode':$('#writecode').val()
            },
            success: function(data){
                if(data.code==100){
                    $('#regcode').html('');
                    $.ajax({
                        type: "post",
                        url: "/app/tenregister.action",
                        dataType: "json",
                        async : false,
                        crossDomain: true,
                        xhrFields: {
                            withCredentials: true
                        },
                        data:{
                            'cellphone':$('#dianhuan').val(),
                            'msgcode':'${shareuserid}'
                        },
                        success: function(data){
                            console.log(data)
                            if(data.code==100){
                                $('.form').hide();
                                $('.tip1').show();
                                $('.download').show();
                            }else{
                                if(data.msg="手机号已被注册！"){
                                    $('.form').hide();
                                    $('.tip2').show();
                                    $('.download').show();
                                }
                            }
                        }
                    });
                }else{
                    $('#regcode').html('*短信验证码有误');
                }
            }
        });
    })
</script>
</body>
</html>