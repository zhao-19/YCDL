
//去空格
function checkspace(checkstr) {
    var str = '';
    for(i = 0; i < checkstr.length; i++)
    {
        str = str + ' ';
    }
    return (str == checkstr);
}

function fun(targ,selObj,restore){
    eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
    if (restore) selObj.selectedIndex=0;
}

function check_message(formlist){
    if (checkspace(formlist["appProductApply.productname"].value))
    {alert("请输入产品招募名称！");
        formlist["appProductApply.productname"].focus();
        return false;
    }
    if (checkspace(formlist['appProductApply.linkman'].value))
    {alert("请输入姓名！");
        formlist['appProductApply.linkman'].focus();
        return false;
    }
    if (checkspace(formlist['appProductApply.cellphone'].value))
    {alert("请输入联系电话！");
        formlist['appProductApply.cellphone'].focus();
        return false;
    }

    if (formlist['appProductApply.cellphone'].value.length < 11|| !formlist['appProductApply.cellphone'].value.match(/^1[345789]\d{9}$/)  )
    {
        alert("提示：请输入有效电话！");
        formlist['appProductApply.cellphone'].focus();
        return false;
    }
    if (checkspace(formlist['appProductApply.companyname'].value))
    {alert("请输入公司名称！");
        formlist['appProductApply.companyname'].focus();
        return false;
    }
    if (checkspace(formlist['appProductApply.job'].value))
    {alert("请输入职务！");
        formlist['appProductApply.job'].focus();
        return false;
    }
    if (checkspace(formlist['appProductApply.email'].value))
    {alert("请输入邮箱！");
        formlist['appProductApply.email'].focus();
        return false;
    }

    if (formlist['appProductApply.email'].value.length > 0 && !formlist['appProductApply.email'].value.match( /^.+@.+$/ ) )
    {
        alert("提示：请输入有效邮箱");
        formlist['appProductApply.email'].focus();
        return false;
    }
    return true;
}

function checkrz(formlist){
    if (checkspace(formlist["leixing"].value))
    {layer.msg("请选择融资类型！");
        return false;
    }
    if (checkspace(formlist['xingming'].value))
    {layer.msg("请完善信息后提交！");
        // formlist['xingming'].focus();
        return false;
    }
    if (checkspace(formlist['dianhuan'].value))
    {layer.msg("请完善信息后提交！");
        // formlist['dianhuan'].focus();
        return false;
    }
    if (formlist['dianhuan'].value.length < 11|| !formlist['dianhuan'].value.match(/^1[345789]\d{9}$/)  )
    {
        layer.msg("请输入有效联系电话！");
        // formlist['dianhuan'].focus();
        return false;
    }
    if (checkspace(formlist['msgcode'].value))
    {layer.msg("请输入短信验证码！");
        // formlist['msgcode'].focus();
        return false;
    }


    if (checkspace(formlist['jine'].value))
    {layer.msg("请完善信息后提交！");
        // formlist['jine'].focus();
        return false;
    }
    if (formlist['jine'].value.length < 0|| !formlist['jine'].value.match(/^\+?[1-9][0-9]*$/)  )
    {
        layer.msg("请输入整数金额！");
        // formlist['jine'].focus();
        return false;
    }
    if (checkspace(formlist['studio'].value))
    {layer.msg("请完善信息后提交！");
        // formlist['studio'].focus();
        return false;
    }

    if (checkspace(formlist['chegnliriqi'].value))
    {layer.msg("请完善信息后提交！");
        // formlist['chegnliriqi'].focus();
        return false;
    }
    if (formlist['chegnliriqi'].value)
    {
    	var val= formlist['chegnliriqi'].value;
    	var year=val.substr(0,4)
    	var month=val.substr(5,2)
    	var day=val.substr(8,2)
    	// console.log(year,month,day)
    	var now = new Date();
    	var time = now.getFullYear() + "-" +((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate();
    	var nowyear=now.getFullYear();
    	var nowmonth=((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1);
    	var nowday=(now.getDate()<10?"0":"")+now.getDate();

    	if(year>nowyear){
            layer.msg("成立日期不能大于当前日期！");
    		return false;
    	}else if(year==nowyear&&month>nowmonth){
            layer.msg("成立日期不能大于当前日期！");
    		return false;
    	}else if(year==nowyear&&month==nowmonth&&day>nowday){
            layer.msg("成立日期不能大于当前日期！");
    		return false;
    	}else{
    		formlist['chegnliriqi'].value=year+"-"+month+"-"+day
    	}
    }

    if (checkspace(formlist['rongziyongtu'].value))
    {layer.msg("请完善信息后提交！");
        // formlist['rongziyongtu'].focus();
        return false;
    }

    var mobile,msgcode;
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
            'mobile':formlist['dianhuan'].value,
            'msgcode':formlist['msgcode'].value
        },
        success: function(data){
            if(data.code==100){
                $.ajax({
                    url: "/app/loanapp.action",
                    dataType: "json",
                    async : false,
                    data:{
                        'leixing':formlist['leixing'].value,
                        'xingming':formlist['xingming'].value,
                        'dianhuan':formlist['dianhuan'].value,
                        'msgcode':formlist['msgcode'].value,
                        'jine':parseInt(formlist['jine'].value),
                        'chegnliriqi':formlist['chegnliriqi'].value,
                        'studio':formlist['studio'].value,
                        'rongziyongtu':formlist['rongziyongtu'].value
                    },
                    beforeSend:function(data){

                    },
                    success: function(data){
                        if(data.code==100){
                        	$('#rzform').hide();
                        	$('#pubtip').show();

                        }else{
                            layer.msg(data.msg);
                        }
                    },
                    error:function(data){
                    	$('#rzform').hide();
                    	$('#pubtip2').show();
                    }
                });
            }else{

                layer.msg(data.msg);
                return false;
            }
        }
    });


   return false;
}




function checkSettedIn(formlist){

    if (checkspace(formlist['qiyename'].value))
    {layer.msg("请输入公司名称！");

        // formlist['xingming'].focus();
        return false;
    }
    if (checkspace(formlist['area'].value))
    {layer.msg("请输入需求面积！");
        // formlist['area'].focus();
        return false;
    }
    if (checkspace(formlist['linkman'].value))
    {layer.msg("请输入联系人！");
        // formlist['linkman'].focus();
        return false;
    }
    if (checkspace(formlist['phone'].value))
    {layer.msg("请输入联系电话！");
        // formlist['phone'].focus();
        return false;
    }
    // if (formlist['phone'].value.length < 11|| !formlist['phone'].value.match(/^1[345789]\d{9}$/)  )
    // {
    //     layer.msg("请输入有效联系电话！");
    //     // formlist['phone'].focus();
    //     return false;
    // }
    $('.subbutton').attr('disabled','true');
    var index;
    $.ajax({
        type: "post",
        url: "/app/application.action",
        dataType: "json",
        async : true,
        data:{
            'qiyename':formlist['qiyename'].value,
            'area':formlist['area'].value,
            'linkman':formlist['linkman'].value,
            'phone':formlist['phone'].value
        },
        beforeSend:function(data){
            index = layer.load(0, {shade: false});
        },
        success: function(data){
            if(data.code==100){
                layer.close(index)
                layer.alert('<p style="text-align: center;font-size: 20px;">发布成功！</p></br>客户经理将在一个工作日内联系您。', {
                    title:false,
                    closeBtn: 0,
                    btnAlign:'c'
                }, function(){
                    location.reload();
                });

            }else{
                layer.msg(data.msg);
            }
        },
        error:function(data){
            layer.alert('<p style="text-align: center;font-size: 20px;">发布失败！</p></br>请重新填写后提交。', {
                title:false,
                closeBtn: 0,
                btnAlign:'c'
            }, function(){
                location.reload();
            });
        }
    });


   return false;
}






var codereg="";
function checkzmtstep1(step){
    if (checkspace(step["qiyename"].value)){
        layer.msg("请完善信息后进行下一步！");
        // step['qiyename'].focus();
        return false;
    }
    if (checkspace(step['creditid'].value)){
        layer.msg("请完善信息后进行下一步！");
        // step['creditid'].focus();
        return false;
    }
    if (step['creditid'].value.length < 18|| !step['creditid'].value.match(/(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/)){
        layer.msg("请输入有效统一社会信用代码！");
        step['creditid'].focus();
        return false;
    }
    if (checkspace(step['regdate'].value)){
        layer.msg("请选择成立日期！");
        // step['regdate'].focus();
        return false;
    }
    if (step['regdate'].value) {
        var val= step['regdate'].value;
        var year=val.substr(0,4)
        var month=val.substr(5,2)
        var day=val.substr(8,2)
        // console.log(year,month,day)
        var now = new Date();
        var time = now.getFullYear() + "-" +((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate();
        var nowyear=now.getFullYear();
        var nowmonth=((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1);
        var nowday=(now.getDate()<10?"0":"")+now.getDate();

        if(year>nowyear){
            layer.msg("成立日期不能大于当前日期！");
            return false;
        }else if(year==nowyear&&month>nowmonth){
            layer.msg("成立日期不能大于当前日期！");
            return false;
        }else if(year==nowyear&&month==nowmonth&&day>nowday){
            layer.msg("成立日期不能大于当前日期！");
            return false;
        }else{
            step['regdate'].value=year+"-"+month+"-"+day
        }
    }

    if (checkspace(step['regfunds'].value)){
        layer.msg("请输入有效金额！");
        // step['regfunds'].focus();
        return false;
    }
    if (step['regfunds'].value.length < 0|| !step['regfunds'].value.match( /^\d{0,8}\.{0,1}(\d{1,2})?$/)){
        layer.msg("金额最多保留2位小数！");
        // step['regfunds'].focus();
        return false;
    }
    if (checkspace(step['corp'].value)){
        layer.msg("请完善信息后进行下一步！");
        // step['corp'].focus();
        return false;
    }
    if (checkspace(step['linkman'].value)){
        layer.msg("请完善信息后进行下一步！");
        // step['linkman'].focus();
        return false;
    }

    if (step['linktel'].value.length < 11|| !step['linktel'].value.match(/^1[345789]\d{9}$/)){
        layer.msg("请输入有效联系电话！");
        // step['linktel'].focus();
        return false;
    }
    if (checkspace(step['msgcode'].value)){
        layer.msg("请输入短信验证码！");
        // step['msgcode'].focus();
        return false;
    }
    if (checkspace(step['address'].value)){
        layer.msg("请完善信息后进行下一步！");
        // step['address'].focus();
        return false;
    }
    if (checkspace(step['mainbusiness'].value)){
        layer.msg("请完善信息后进行下一步！");
        // step['mainbusiness'].focus();
        return false;
    }

    if(codereg==""){
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
                'mobile':step['linktel'].value,
                'msgcode':step['msgcode'].value
            },
            success: function(data){
                if(data.code==100){
                    codereg=step['msgcode'].value;
                    $("#step2").css("display","block");
                    // $(".next2").css("display","block");
                    // $('.next1').css("display","none");
                    $(".next2").css("z-index","10");
                    $(".next1").css("z-index","0");
                    $("#step2").animate({left:'0px'},'500');
                    $("#step1").animate({left:'-100%'},"500",function(){
                        $(this).css("display","none");
                    });
                }else{
                    layer.msg(data.msg);
                    return false;
                }
            }
        });
    }else if(step['msgcode'].value!=codereg){
        layer.msg("验证码有误，请重新获取！");
        return false;
    }else{
        $("#step2").css("display","block");
        // $(".next2").css("display","block");
        // $('.next1').css("display","none");
        $(".next2").css("z-index","10");
        $(".next1").css("z-index","0");
        $("#step2").animate({left:'0px'},'500');
        $("#step1").animate({left:'-100%'},"500",function(){
            $(this).css("display","none");
        });
    }
}

function checkzmtstep2(step){
    if (checkspace(step['goodstrade'].value)){
        layer.msg("请输入有效金额！");
        // step['goodstrade'].focus();
        return false;
    }
    if (step['goodstrade'].value.length < 0|| !step['goodstrade'].value.match( /^\d{0,8}\.{0,1}(\d{1,2})?$/)){
        layer.msg("金额最多保留2位小数！");
        // step['goodstrade'].focus();
        return false;
    }
    if (checkspace(step['servetrade'].value)){
        layer.msg("请输入有效金额！");
        // step['servetrade'].focus();
        return false;
    }
    if (step['servetrade'].value.length < 0|| !step['servetrade'].value.match(/^\d{0,8}\.{0,1}(\d{1,2})?$/)){
        layer.msg("金额最多保留2位小数！");
        // step['servetrade'].focus();
        return false;
    }
    $("#step3").css("display","block");
    // $(".next3").css("display","block");
    // $(".next2").css("display","none");
    $(".next3").css("z-index","10");
    $(".next2").css("z-index","0");
    $("#step3").animate({left:'0px'},'500');
    $("#step2").animate({left:'-100%'},"500",function(){
        $(this).css("display","none");
    });

}

function checkzmtstep3(step){
    $('#tijiao').attr('disabled','true');
    $.ajax({
        type: "post",
        url: "/app/tradesubmit.action",
        dataType: "json",
        async : false,
        data:$(step).serialize(),
        beforeSend:function(data){
            $('.pubpopbox,.zmtload').show();
        },
        success: function(data){
            if(data.code==100){
                $('.zmtload').hide();
                $('.pubpopbox,.zmtsucc').show();
            }else{
                // layer.msg(data.msg);
                $('.zmtload').hide();
                $('.pubpopbox,.zmtsucc').show();
            }
        },
        error:function(data){
            $('.zmtload').hide();
            $('.pubpopbox,.zmterror').show();
        }
    });
}


function checkfund(formlist){
    var imgurl="";
    var imglength=$('.pinch-small').length-1;
    $('.pinch-small').each(function (i,v) {
        if(i<imglength){
            imgurl+=$(this).attr('src')+',';
        }else{
            imgurl+=$(this).attr('src');
        }
    });
    var long= $('#long').val();
    var address= $('#address').val();
    if (checkspace(formlist["lnglatname"].value))
    {layer.msg("请获取地理位置和经纬度！");
        return false;
    }
    if (checkspace(formlist['lnglat'].value))
    {layer.msg("请获取地理位置和经纬度！");
        return false;
    }
    if (checkspace(imgurl))
    {layer.msg("请上传现场照片！");
        return false;
    }
    $.ajax({
        type: "post",
        url: "/app/saveFund.action",
        dataType: "json",
        async : false,
        data:{
            'userid':$('#userid').val(),
            'pkid':$('#pkid').val(),
            'lnglat':long,
            'lnglatname':address,
            'scenepic':imgurl,
            'checkremark':$('#checkremark').val(),
            'chstatus':'14003'
        },
        beforeSend:function(data){

        },
        success: function(data){
            layer.msg(data.msg);
            function go() {
                location.reload();
                $(window).scrollTop(0);
            }
            setTimeout(go(),5000);

        },
        error:function(data){
            layer.msg(data.msg);
        }
    });
}


function checkvisit(formlist){
    var pkid=$('#pkid').val();
    var imgurl="";
    var imglength=$('.pinch-small').length-1;
    $('.pinch-small').each(function (i,v) {
        if(i<imglength){
            imgurl+=$(this).attr('src')+',';
        }else{
            imgurl+=$(this).attr('src');
        }
    })
    var long= $('#long').val();
    var address= $('#address').val();
    if (checkspace(formlist["qiyename"].value))
    {layer.msg("请输入拜访企业名称！");
        return false;
    }

    if (checkspace(formlist['visitdate'].value))
    {layer.msg("请输入外出日期！");
        return false;
    }
    if (checkspace(formlist['address'].value))
    {layer.msg("请输入企业地址！");
        return false;
    }
    if (checkspace(formlist['mainbusiness'].value))
    {layer.msg("请输入主营业务！");
        return false;
    }
    if (checkspace(formlist['income'].value))
    {layer.msg("请输入收入！");
        return false;
    }
    if (checkspace(formlist['netprofit'].value))
    {layer.msg("请输入净利润！");
        return false;
    }
    if (checkspace(formlist['staffsize'].value))
    {layer.msg("请输入员工规模！");
        return false;
    }
    if (checkspace(formlist['findemand'].value))
    {layer.msg("请选择融资需求！");
        return false;
    }
    if ($('.leixing input:checked').length==0)
    {layer.msg("请选择APP服务需求！");
        return false;
    }
    if (checkspace(formlist['linkman'].value))
    {layer.msg("请输入企业联系人！");
        return false;
    }
    if (checkspace(formlist['linktel'].value))
    {layer.msg("请输入联系电话！");
        return false;
    }
    if (formlist['linktel'].value.length < 11|| !formlist['linktel'].value.match(/^1[345789]\d{9}$/)){
        layer.msg("请输入有效联系电话！");
            return false;
        }
    if (checkspace(formlist['remark'].value))
    {layer.msg("请输入备注！");
        return false;
    }
    if (checkspace(imgurl))
    {layer.msg("请上传现场照片！");
        return false;
    }
    var obj = $(formlist).serialize();
    obj+=('&pictures='+imgurl);
    $.ajax({
        type: "post",
        url: "/app/saveVisitqiye.action",
        dataType: "json",
        async : false,
        data:obj,
        beforeSend:function(data){

        },
        success: function(data){
            layer.msg(data.msg);
            function go() {
                location.reload();
            }
            if(pkid==""){
                setTimeout(window.history.go(-1),5000);
            }else{
                setTimeout(go(),5000);
            }
        },
        error:function(data){
            layer.msg(data.msg);
        }
    });
}

function checkmarkete(formlist){
    var pkid=$('#pkid').val();
    var imgurl="";
    var imglength=$('.pinch-small').length-1;
    $('.pinch-small').each(function (i,v) {
        if(i<imglength){
            imgurl+=$(this).attr('src')+',';
        }else{
            imgurl+=$(this).attr('src');
        }
    })
    if (checkspace(formlist['commtype'].value))
    {layer.msg("请选择沟通类型！");
        return false;
    }
    if (checkspace(formlist["vistperson"].value))
    {layer.msg("请输入拜访人名称！");
        return false;
    }
    if (checkspace(formlist['visttele'].value))
    {layer.msg("请输入拜访人电话！");
        return false;
    }
    if (formlist['visttele'].value.length < 8){
        layer.msg("请输入有效联系电话！");
        return false;
    }
    // if (!formlist['visttele'].value.match(/^1[345789]\d{9}$|^0\d{2,3}-?\d{7,8}$|^\d{7,8}$/)){
    //     layer.msg("请输入有效联系电话！");
    //     return false;
    // }

    // if (checkspace(formlist["vistposition"].value))
    // {layer.msg("请输入拜访人职位！");
    //     return false;
    // }
    if (checkspace(formlist['commdate'].value))
    {layer.msg("请输入沟通时间！");
        return false;
    }
    // if (checkspace(formlist['commaddress'].value))
    // {layer.msg("请输入沟通地点！");
    //     return false;
    // }
    if (checkspace(formlist['maincontent'].value))
    {layer.msg("请输入主要沟通内容！");
        return false;
    }
    // if ($('.leixing input:checked').length==0)
    // {layer.msg("请选择客户需求！");
    //     return false;
    // }

    // if (checkspace(imgurl))
    // {layer.msg("请上传现场照片！");
    //     return false;
    // }


    var  markete = new Object();
    var  names = ["userid","pkid","qiyeid", "commtype", "vistperson", "visttele", "vistposition", "commdate", "commaddress", "maincontent",'longitude','latitude'];
    for (var i = 0; i < names.length; i++) {
        markete[names[i]] = $.trim($("[name=" + names[i] + "]").val());
    }
    var custdemandVal='';
    var custdemand=$('input[name="custdemand"]:checkbox:checked')
    custdemand.each(function (i,v) {
        console.log($(this).val())
        if(i<custdemand.length-1){
            custdemandVal+=$(this).val()+',';
        }else{
            custdemandVal+=$(this).val();
        }
    })
    var inputuserVal=$.trim($("[name=inputuser]").val())?$.trim($("[name=inputuser]").val()):$.trim($("[name=userid]").val());
    markete['custdemand']=custdemandVal;
    markete['inputuser']=inputuserVal;
    markete['commphoto']=imgurl;
    var obj = new Object();
    obj.markete = JSON.stringify(markete);
    var loadGif;
    $.ajax({
        type: "post",
        url: "/apps/marketeSave.action",
        dataType: "json",
        async : false,
        data:obj,
        beforeSend:function(data){
            loadGif=layer.load(0, {shade: false});
        },
        success: function(data){
            layer.close(loadGif)
            layer.alert('保存成功!', {
                title:'提示',
                icon: 1,
                closeBtn: 0,
                btnAlign: 'c',
                skin: 'layer-ext-moon',
                yes:function () {
                    window.history.go(-1)
                }
            })

        },
        error:function(data){
            layer.msg(data.msg);
        }
    });
}

