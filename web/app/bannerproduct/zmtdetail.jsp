<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="申请服务"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/skin/layer.css">
<script src="${pageContext.request.contextPath}/app/js/layer.js"></script>
<script src="${pageContext.request.contextPath}/app/js/check.js"></script>
<body class="zmtdetail siz">
 <span id="moveRight" class="zmtapply next1" onclick="checkzmtstep1($('#zmtform')[0])">下一步</span>
    <span id="moveRight2"  class="zmtapply next2" onclick="checkzmtstep2($('#zmtform')[0])">下一步</span>
    <input id="tijiao"  class="zmtapply next3" type="button" onclick="checkzmtstep3($('#zmtform')[0])" value="确认提交" disabled="disabled"/>
    <div class="pubpopbox tc">
        <!--加载-->
        <div class="pubpop zmtload">
            <img src="${pageContext.request.contextPath}/app/images/bannerproduct/loadball.gif" alt="" style="width: 0.64rem;">
            <p>正在提交申请,请稍后...</p>
        </div>
        <!--成功-->
        <div class="pubpop zmtsucc">
            <img src="${pageContext.request.contextPath}/app/images/bannerproduct/zmtsucc.png" alt="">
            <h2>提交成功</h2>
            <p>客户经理将在一个工作日内联系您</p>
            <span id="dsback" class="pubpopbtn">返回首页</span>
        </div>
        <!--失败-->
        <div class="pubpop zmterror">
            <img src="${pageContext.request.contextPath}/app/images/bannerproduct/zmterror.png" alt="">
            <h2>提交失败</h2>
            <p></p>
            <a href="javascript:location.reload();" class="pubpopbtn">点击重试</a>
        </div>
    </div>
   <form action="" id="zmtform">
     <input type="text" name="loanname" value="自贸通" id="loanname" style="display: none;">
      <input type="hidden" value="${trade.pkid}" id="pkid">
      <!--<input type="hidden" value="111" id="pkid">-->
       <input type="hidden" value="${trade.accessis}" id="accessis">
       <!--<input type="hidden" value="z1001,z1002,f1003" id="accessis">-->
      <div id="step1" class="step">
          <div class="stephead tc">
              <h2>基本情况</h2>
              <img src="${pageContext.request.contextPath}/app/images/bannerproduct/zmtstep1.png" alt="">
          </div>
          <div class="pubzmt">
              <div class="pubrz">
                  <div class="inputrow ov">
                      <span style="width: 28%;">申请企业名称</span>
                      <div class="fr" style="width: 72%;">
                          <input type="text" name="qiyename" value="${trade.qiyename}" placeholder="请输入申请企业名称" auto-complete auto-complete-data="autoCompleteData" maxlength="32" id="qiyename" >
                      </div>
                  </div>
                  <div class="inputrow ov">
                      <span>统一社会信用代码</span>
                      <div class="fr">
                          <input type="text" name="creditid" value="${trade.creditid}" placeholder="请输入统一社会信用代码" id="zzjgdm">
                      </div>
                  </div>
                  <div class="inputrow ov">
                      <span>成立日期</span>
                      <div class="fr ">
                          <input type="date" name=""  id="maxDate"   value="" onchange="showplace(this);">
                          <input type="text" name="regdate"  id="dateplace"  value="${trade.regdate}"  placeholder="请选择成立日期">
                      </div>
                  </div>
                  <div class="inputrow ov jine">
                      <span>注册资本（万元）</span>
                      <div class="fr">
                          <input type="number" name="regfunds" value="${trade.regfunds}" placeholder="请输入注册资本">
                      </div>
                  </div>
                  <div class="inputrow ov">
                      <span>法定代表人</span>
                      <div class="fr">
                          <input type="text" name="corp" value="${trade.corp}" placeholder="请输入法定代表人" >
                      </div>
                  </div>
                  <div class="inputrow ov">
                      <span>联系人</span>
                      <div class="fr">
                          <input type="text" name="linkman" value="${trade.linkman}" placeholder="请输入联系人" >
                      </div>
                  </div>
                  <div class="inputrow ov">
                      <span>联系电话</span>
                      <div class="fr">
                          <input type="number" name="linktel" value="${trade.linktel}" placeholder="请输入联系电话"  id="dianhuan">
                          <span id="call">${trade.linktel}</span>
                      </div>
                  </div>
                  <div class="inputrow ov" id="msgcodebox">
                      <span>验证码</span>
                      <div class="fr">
                          <input type="number" name="msgcode" value="" placeholder="请输入验证码"  id="writecode">
                          <span id="getcode">获取</span>
                      </div>
                  </div>

                  <div class="inputrow ov">
                      <span>注册地址</span>
                      <div class="fr">
                          <input type="text" name="address" value="${trade.address}" placeholder="请输入注册地址">
                      </div>
                  </div>
                  <div class="inputrow ov noborder">
                      <span>主营业务</span>
                  </div>
                  <div class="">
                      <textarea name="mainbusiness" rows="3" cols="20"  placeholder="请输入主营业务描述">${trade.mainbusiness}</textarea>
                  </div>
              </div>
          </div>
      </div>
      <div id="step2" class="step">
          <div class="stephead tc">
              <h2>业务情况</h2>
              <img src="${pageContext.request.contextPath}/app/images/bannerproduct/zmtstep2.png" alt="">
          </div>
          <div class="pubzmt">
              <div class="pubrz">
                  <div class="inputrow ov">
                      <span>进出口量(货物贸易)/年（万美元）</span>
                      <div class="fr">
                          <input type="number" name="goodstrade" value="${trade.goodstrade}" placeholder="请输入金额">
                      </div>
                  </div>
                  <div class="inputrow ov">
                      <span>进出口量(服务贸易)/年（万美元）</span>
                      <div class="fr">
                          <input type="number" name="servetrade" value="${trade.servetrade}" placeholder="请输入金额">
                      </div>
                  </div>
              </div>
          </div>
          <span id="moveLeft2" class="prevstep">&lt;上一步</span>

      </div>
      <div id="step3" class="step">
          <div class="stephead tc">
              <h2>准入情况</h2>
              <img src="${pageContext.request.contextPath}/app/images/bannerproduct/zmtstep3.png" alt="">
          </div>
          <div class="pubzmt">
              <div class="pubrz">
                  <h2>正面清单</h2>
                  <div class="listbox">
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="z1001">注册地址和纳税关系都在成都高新区的中小微货物贸易、服务贸易企业</label>
                              <input type="checkbox" name="accessis" value="z1001" id="z1001">
                          </div>
                      </div>
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="z1002">企业具有持续经营能力，具备真实贸易背景，且上年度纳税正常</label>
                              <input type="checkbox" name="accessis" value="z1002" id="z1002">
                          </div>
                      </div>
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="z1003">企业生产经营合法、合规，无不良征信记录</label>
                              <input type="checkbox" name="accessis" value="z1003" id="z1003">
                          </div>
                      </div>
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="z1004">外汇局评定的A类企业（仅限货物贸易企业）</label>
                              <input type="checkbox" name="accessis" value="z1004" id="z1004">
                          </div>
                      </div>
                  </div>
                  <h2>负面清单</h2>
                  <div class="listbox">
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="f1001">企业的法定代表人/负责人被判处刑罚，执行期满未逾三年</label>
                              <input type="checkbox" name="accessis" value="f1001" id="f1001">
                          </div>
                      </div>
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="f1002">企业受到成都市或成都高新区政府部门的重大行政处罚</label>
                              <input type="checkbox" name="accessis" value="f1002" id="f1002">
                          </div>
                      </div>
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="f1003">企业受到成都市或成都高新区政府部门的重大行政处罚</label>
                              <input type="checkbox" name="accessis" value="f1003" id="f1003">
                          </div>
                      </div>
                      <div class="inputrow ov">
                          <div class="fr leixing">
                              <label for="f1004">企业列入异常经营名录</label>
                              <input type="checkbox" name="accessis" value="f1004" id="f1004">
                          </div>
                      </div>
                  </div>
                  <div class="notice">
                      <p>1.企业在符合情况的选项"□"内打勾。</p>
                      <p>2.同时满足"正面清单"四项条件的企业即可准入。</p>
                      <p>3.有"负面清单"情形之一的企业不可准入。</p>
                  </div>
                  <p class="allow">*我公司特向成都银行提出申请“自贸通”金融服务，并保证以上信息准确、属实。</p>
              </div>
          </div>

          <span id="moveLeft" class="prevstep">&lt;上一步</span>

      </div>
   </form>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.app.js"></script>
<script>
    $('#qiyename').autocomplete({
        source: function(request, response) {
            var key = $("#qiyename").val();
            if ($.trim(key) == "") {
                return;
            }
            $.ajax({
                type: 'post',
                url: "/userextend/creditsearch.html",
                dataType: "json",
                data: {
                    "key": key
                },
                success: function(data) {
                    var reg = /<span style='color:red'>|<\/span>/ig;
                    $.each(data.data,
                        function(i, v) {
                            v.company_name = v.company_name.replace(reg, '')
                        })
                    response($.map(data.data,
                        function(item) {
                            return {
                                label: item.company_name,
                                value: item.company_name,
                                code: item.credit_code
                            }
                        }));
                }
            });
        },
        select: function(event, ui) {
            $('#zzjgdm').val(ui.item.code);
        },

        minLength: 2
    })
    var windheight =window.innerHeight;
    window.onresize=function(){//兼容安卓键盘弹起窗口 底部按钮定位不准确问题
        var docheight = window.innerHeight;
        if(docheight < windheight){
           $('.zmtapply').css('position','static')
        }else{
            $('.zmtapply').css('position','fixed')
        }
    }

        window.onload = function(){//查看模式
            if($('#pkid').val()!=''){
                $('#zmtform input,#zmtform textarea').attr('disabled','true');
                $('#msgcodebox,.prevstep,.zmtapply,.stephead img,.notice,.allow,#dianhuan').hide();
                $('.stephead').css('height','auto');
                $('.zmtdetail .step').show().css({
                    'position':'static',
                    'min-height':'0'
                });
               var checkboxval=($('#accessis').val()).split(',');
               $.each(checkboxval,function(i,v){
                  $('#'+v).prop("checked", true);
                  $('#'+v).prev('label').addClass('on');
               })
                $('#call').show();
            }else{
                $('.leixing>label').click(function(){
                    $(this).toggleClass('on')
                })
            }
            $("#moveLeft2").click(function(){//在第二步 点上一步
                $("#step1").css("display","block");
                $(".next1").css("z-index","10");
                $(".next2").css("z-index","0");
                $("#step1").animate({left:'0px'},"500");
                $("#step2").animate({left:'100%'},'500',function(){
                    $(this).css("display","none");

                });
            });
            $("#moveLeft").click(function(){
                $("#step2").css("display","block");
                // $(".next2").css("display","block");
                // $('.next3').css("display","none");
                $(".next2").css("z-index","10");
                $(".next3").css("z-index","0");
                $("#step2").animate({left:'0px'},"500");
                $("#step3").animate({left:'100%'},'500',function(){
                    $(this).css("display","none");
                });
            });
        }
        function showplace(dateinput){
            if($('#maxDate').val()==""){
                $('#dateplace').val('');
            }else{
                $('#dateplace').val($('#maxDate').val());
            }
        }
        $('#step3 .allow').click(function () {
            if($(this).hasClass('on')){
                $(this).removeClass('on');
                $('#tijiao').attr('disabled','true')
            }else{
                $(this).addClass('on');
                $('#tijiao').removeAttr('disabled')

            }

        })

        $('#rzform input,#rzform textarea').change(function(){
            $('.sub>.subbutton').removeAttr("disabled");
        })


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
                    layer.msg('请输入有效联系电话');
                    return false;
                }else{
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
                        $code.html(time+"S");
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
        var dsid='123';
        $('#dsback').click(function(){//返回首页
            if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
                window.webkit.messageHandlers.dsback.postMessage(dsid);
            } else {
                dsback.dsback(dsid);
            }
        });
    $('#call').click(function () {
        var phonenum=$(this).text();
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            window.webkit.messageHandlers.callPhone.postMessage(phonenum);
        } else {
            callPhone.callPhone(phonenum);
        }
    })
    </script>
</body>
</html>