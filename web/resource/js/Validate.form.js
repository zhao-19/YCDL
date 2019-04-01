$.extend(validatePrompt, {
    realname:{
        onFocus:"2-20位字符，可由中文或英文组成",
        succeed:"",
        isNull:"请输入联系人姓名",
        error:{
            badLength:"联系人姓名长度只能在2-20位字符之间",
            badFormat:"联系人姓名只能由中文或英文组成"
        }
    },
    department:{
        onFocus:"",
        succeed:"",
        isNull:"请选择联系人所在部门",
        error:""
    },
    tel:{
        onFocus:"请填写联系人常用的电话，以便于我们联系，如：0527-88105500",
        succeed:"",
        isNull:"请输入联系人固定电话",
        error:"电话格式错误，请重新输入"
    },
    mobile:{
        onFocus:"非北京、上海、广州三地客户，请在手机号前加“0”",
        succeed:"",
        isNull:"请输入您的手机号码",
        error:"手机号格式错误，请重新输入"
    },
    companyname:{
        onFocus:"请填写工商局注册的全称。4-40位字符，可由中英文、数字及“_”、“-”、()、（）组成",
        succeed:"",
        isNull:"请输入公司名称",
        error:{
            badLength:"公司名称长度只能在4-40位字符之间",
            badFormat:"公司名称只能由中文、英文、数字及“_”、“-”、()、（）组成"
        }
    },
    companyarea:{
        onFocus:"请选择公司所在地",
        succeed:"",
        isNull:"请选择公司所在地",
        error:""
    },
    companyaddr:{
        onFocus:"请详细填写公司经营地址　如：北京市海淀区苏州街20号银丰大厦B座3层",
        succeed:"",
        isNull:"请输入公司地址",
        error:{
            badLength:"公司地址长度只能在4-50位字符之间",
            badFormat:"公司地址只能由中文、英文、数字及“_”、“-”、()、（）、#组成"
        }
    },
    purpose:{
        onFocus:"",
        succeed:"",
        isNull:"请选择购买类型/用途",
        error:""
    },
    companysite:{
        onFocus:"如：http://www.360buy.com",
        succeed:"",
        isNull:"请输入公司网址",
        error:{
            badLength:"公司网址长度只能在80位字符之内",
            badFormat:"公司网址格式不正确。应如：http://www.360buy.com"
        }
    }
});

$.extend(validateFunction, {
    realname:function(option) {
        var length = validateRules.betweenLength(option.value.replace(/[^\x00-\xff]/g, "**"), 2, 20);
        var format = validateRules.isRealName(option.value);
        if (!length) {
            validateSettings.error.run(option, option.prompts.error.badLength);
        } else {
            if (!format) {
                validateSettings.error.run(option, option.prompts.error.badFormat);
            }
            else {
                validateSettings.succeed.run(option);
            }
        }
    },
    department:function(option) {
        var bool = (option.value == -1);
        if (bool) {
            validateSettings.isNull.run(option, "");
        }
        else {
            validateSettings.succeed.run(option);
        }
    },
    tel:function(option) {
        var format = validateRules.isTel(option.value);
        if (!format) {
            validateSettings.error.run(option, option.prompts.error);
        }
        else {
            validateSettings.succeed.run(option);
        }
    },
    mobile:function(option) {
        var format = validateRules.isMobile(option.value);
        if (!format) {
            validateSettings.error.run(option, option.prompts.error);
        }
        else {
            validateSettings.succeed.run(option);
        }
    },
    FORM_validate:function() {
        $("#username").jdValidate(validatePrompt.username, validateFunction.username, true);
        $("#pwd").jdValidate(validatePrompt.pwd, validateFunction.pwd, true)
        $("#pwd2").jdValidate(validatePrompt.pwd2, validateFunction.pwd2, true);
        $("#authcode").jdValidate(validatePrompt.authcode, validateFunction.authcode, true);
        $("#mail").jdValidate(validatePrompt.mail, validateFunction.mail, true);
        return validateFunction.FORM_submit(["#username","#pwd","#pwd2","#mail","#authcode"]);
    }
});




//默认下用户名框获得焦点
setTimeout(function() {
    $("#username").get(0).focus();
}, 0);
//用户名验证
$("#username").jdValidate(validatePrompt.username, validateFunction.username);
//密码验证
$("#pwd").bind("keyup",function(){
	validateFunction.pwdstrength();
}).jdValidate(validatePrompt.pwd, validateFunction.pwd)
//二次密码验证
$("#pwd2").jdValidate(validatePrompt.pwd2, validateFunction.pwd2);
//邮箱验证
$("#mail").jdValidate(validatePrompt.mail, validateFunction.mail);

//验证码验证
$("#authcode").jdValidate(validatePrompt.authcode, validateFunction.authcode);;
//显示密码事件
$("#viewpwd").bind("click", function() {
    if ($(this).attr("checked") == true) {
        validateFunction.showPassword("text");
        $("#o-password").addClass("pwdbg");
    } else {
        validateFunction.showPassword("password");
        $("#o-password").removeClass("pwdbg");
    }
});

//键盘输入验证码验证
$("#authcode").bind('keyup', function(event) {
    if (event.keyCode == 13) {
        $("#registsubmit").click();
    }
});
//确认协议才能提交
$("#protocol").click(function() {
    if ($("#protocol").attr("checked") != true) {
        $("#registsubmit").attr({ "disabled": "disabled" });
		$("#registsubmit").addClass("disabled");
    }
    else {
        $("#registsubmit").removeAttr("disabled");
		$("#registsubmit").removeClass("disabled");
    }
});
//表单提交验证和服务器请求
$("#registsubmit").click(function() {
    var flag = validateFunction.FORM_validate();
    if (flag) {
        //$(this).attr({"disabled":"disabled"}).attr({"value":"提交中,请稍等"});
        $.ajax({
            type: "POST",
            url: "/user/doRegister.html",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#form").serialize(),
            dataType: "json",
            success: function(result) {
                if (result.flag == 1) {
                	//alert(result.memo);
                    window.location ="/user/checkEmail.html";
                }else if (result.flag == 0)  {
                	$("#authcode_error").text("验证码错误");
                	$("#authcode_error").css("color","red");
                	$("#authcode_error").show();
                }else {
                	$("#authcode_error").val(result.memo);
                	
                }
            }
        });
    }
});