function tbotherorgInfo(){
    jQuery.validator.addMethod("isNum", function(value, element) {
        var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
        return this.optional(element) || (num.test(value));
    }, "请正确填写数字");
    jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话");
    jQuery.validator.addMethod("isOCC", function(value, element) {
        var num = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;    //手写验证组织机构代码或统一社会信用代码  用竖线表示两个条件为或（共10位）
        return this.optional(element) ||  (num.test(value));
    }, "请正确【组织机构代码】或者【统一社会信用代码】");
    jQuery.validator.addMethod("isEmail", function(value, element) {
        return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);
    }, "请正确填写邮箱格式");
    $("#tbotherorgFormInfo").validate({
        onkeyup:false,
        rules: {
            "tbotherorg.org_credit_id": {
                required: true,
                isOCC:true,
                rangelength:[10,18]
            },
            "tbotherorg.org_name": {
                required: true,
                maxlength:64
            },
            "tbotherorg.org_type": {
                required: true,
            },
            "tbotherorg.gszcd_province": {
                required: true
            },
            "tbotherorg.gszcd_city": {
                required: true
            },
            "tbotherorg.gszcd_county": {
                required: true
            },
            "tbotherorg.regist_amt": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "tbotherorg.org_address": {
                required: true,
                maxlength:64
            },
            "tbotherorg.org_info": {
                required: true,
                maxlength:512
            },
            "tbotherorg.org_linkman": {
                required: true,
                maxlength:16
            },
            "tbotherorg.org_linkduty": {
                required: true,
                maxlength:16
            },
            "tbotherorg.org_linkcellphone": {
                required: true,
                isTel: true,
                maxlength:16
            },
            "tbotherorg.org_linkemail": {
                required: true,
                isEmail: true,
                maxlength:32
            }/*,
             "tbotherorg.custmanage": {
             required: true,
             maxlength:8
             }*/
        },
        messages: {
            "tbotherorg.org_credit_id": {
                required: "请输入组织机构代码或统一社会信用代码",
                isOCC:"请正确输入【组织机构代码】或者【统一社会信用代码】",
                rangelength:"10到18个字符"
            },
            "tbotherorg.org_name": {
                required: "请输入机构名称",
                maxlength:"64字符以内"
            },
            "tbotherorg.org_type": {
                required: "请选择机构类型",
            },
            "tbotherorg.gszcd_province": {
                required: "请选择省份"
            },
            "tbotherorg.gszcd_city": {
                required: "请选择城市"
            },
            "tbotherorg.gszcd_county": {
                required: "请选择区县"
            },
            "tbotherorg.regist_amt": {
                required: "请输入注册资本",
                isNum:"注册资本请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "tbotherorg.org_address": {
                required: "请输入办公地址",
                maxlength:"64字符以内"
            },
            "tbotherorg.org_info": {
                required: "请输入主营业务",
                maxlength:"512字符以内"
            },
            "tbotherorg.org_linkman": {
                required: "请输入联系人",
                maxlength:"16字符以内"
            },
            "tbotherorg.org_linkduty": {
                required: "请输入联系人职位",
                maxlength:"16字符以内"
            },
            "tbotherorg.org_linkcellphone": {
                required: "请输入联系人电话",
                isTel: "请正确输入联系人电话",
                maxlength:"16字符以内"
            },
            "tbotherorg.org_linkemail": {
                required: "请输入联系人邮箱",
                isEmail: "请正确输入联系人邮箱",
                maxlength:"32字符以内"
            }/*,
             "tbotherorg.custmanage": {
             required: "请输入客户经理",
             maxlength:"8字符以内"
             }*/
        }
    });
}

function tbotherorgInfoZc(){
    jQuery.validator.addMethod("isNum", function(value, element) {
        var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
        return this.optional(element) || (num.test(value));
    }, "请正确填写数字");
    jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话");
    jQuery.validator.addMethod("isOCC", function(value, element) {
        var num = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;    //手写验证组织机构代码或统一社会信用代码  用竖线表示两个条件为或（共10位）
        return this.optional(element) ||  (num.test(value));
    }, "请正确【组织机构代码】或者【统一社会信用代码】");
    jQuery.validator.addMethod("isEmail", function(value, element) {
        return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);
    }, "请正确填写邮箱格式");
    $("#tbotherorgFormInfo").validate({
        onkeyup:false,
        rules: {
            "tbotherorg.org_credit_id": {
                required: true,
                isOCC:true,
                rangelength:[10,18]
            },
            "tbotherorg.org_name": {
                required: true,
                maxlength:64
            },
            "tbotherorg.org_type": {
                required: false,
            },
            "tbotherorg.gszcd_province": {
                required: false
            },
            "tbotherorg.gszcd_city": {
                required: false
            },
            "tbotherorg.gszcd_county": {
                required: false
            },
            "tbotherorg.regist_amt": {
                required: false,
                isNum: true,
                maxlength:18
            },
            "tbotherorg.org_address": {
                required: false,
                maxlength:64
            },
            "tbotherorg.org_info": {
                required: false,
                maxlength:512
            },
            "tbotherorg.org_linkman": {
                required: false,
                maxlength:16
            },
            "tbotherorg.org_linkduty": {
                required: false,
                maxlength:16
            },
            "tbotherorg.org_linkcellphone": {
                required: false,
                isTel: true,
                maxlength:16
            },
            "tbotherorg.org_linkemail": {
                required: false,
                isEmail: true,
                maxlength:32
            }/*,
             "tbotherorg.custmanage": {
             required: true,
             maxlength:8
             }*/
        },
        messages: {
            "tbotherorg.org_credit_id": {
                required: "请输入组织机构代码或统一社会信用代码",
                isOCC:"请正确输入【组织机构代码】或者【统一社会信用代码】",
                rangelength:"10到18个字符"
            },
            "tbotherorg.org_name": {
                required: "请输入机构名称",
                maxlength:"64字符以内"
            },
            "tbotherorg.org_type": {
                // required: "请选择机构类型",
            },
            "tbotherorg.gszcd_province": {
                // required: "请选择省份"
            },
            "tbotherorg.gszcd_city": {
                // required: "请选择城市"
            },
            "tbotherorg.gszcd_county": {
                // required: "请选择区县"
            },
            "tbotherorg.regist_amt": {
                // required: "请输入注册资本",
                isNum:"注册资本请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "tbotherorg.org_address": {
                // required: "请输入办公地址",
                maxlength:"64字符以内"
            },
            "tbotherorg.org_info": {
                // required: "请输入主营业务",
                maxlength:"512字符以内"
            },
            "tbotherorg.org_linkman": {
                // required: "请输入联系人",
                maxlength:"16字符以内"
            },
            "tbotherorg.org_linkduty": {
                // required: "请输入联系人职位",
                maxlength:"16字符以内"
            },
            "tbotherorg.org_linkcellphone": {
                // required: "请输入联系人电话",
                isTel: "请正确输入联系人电话",
                maxlength:"16字符以内"
            },
            "tbotherorg.org_linkemail": {
                // required: "请输入联系人邮箱",
                isEmail: "请正确输入联系人邮箱",
                maxlength:"32字符以内"
            }/*,
             "tbotherorg.custmanage": {
             required: "请输入客户经理",
             maxlength:"8字符以内"
             }*/
        },
        // errorPlacement: function (error, element) {
        //     if (element.is(':radio') || element.is(':checkbox')) {
        //         var eid = element.attr('name');
        //         error.appendTo(element.parent());
        //     } else {
        //         error.insertAfter(element);
        //     }
        // },
        submitHandler: function(form){
            $("#tbotherorgSub").attr("disabled","disabled");
            // form.submit();
        }
    });
}