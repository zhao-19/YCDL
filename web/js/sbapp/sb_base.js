/**
 * @author Administrator
 */
function qiyeappinfo() {

    jQuery.validator.addMethod("isOCC", function (value, element) {
        var num = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;    //手写验证组织机构代码或统一社会信用代码  用竖线表示两个条件为或（共10位）
        //var num = /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$/;//组织机构代码
        return this.optional(element) || (num.test(value));

    }, "请正确【组织机构代码】或者【统一社会信用代码】");
    jQuery.validator.addMethod("isNum", function (value, element) {
        var num = /^[-]{0,1}[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
        return this.optional(element) || (num.test(value));
    }, "请正确填写数字");
    jQuery.validator.addMethod("isZzs", function (value, element) {
        var num = /^[0-9]*$/;    //手写验正整数和0
        return this.optional(element) || (num.test(value));
    }, "请正确填写数字");

    //邮政编码验证
    jQuery.validator.addMethod("isEmail", function (value, element) {
        return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);
    }, "请正确填写邮箱格式");

    jQuery.validator.addMethod("isDate", function (value, element) {
        var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
        return this.optional(element) || (tel.test(value));
    }, "请正确填写日期");
    jQuery.validator.addMethod("isIdcard", function (value, element) {
        var length = value.length;
        var isIdcard = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
        return this.optional(element) || (isIdcard.test(value));
    }, "请输入正确的身份证号码");
    jQuery.validator.addMethod("isTel", function (value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话或传真号码");
    //onkeyup:false,取消及时提示，在光标移开时才提示
    $("#sb_base").validate({
        onkeyup: false,
        //onkeyup: function(element) {$(element).valid()},
        rules: {
            "qiyemingcheng": {
                required: true,
                maxlength: 64
            },
            "zzjgdm": {
                required: true,
                isOCC: true,
                maxlength: 32
            },
            "dizhi": {
                required: true,
                maxlength: 18
            },
            "sjdizhi": {
                required: true,
                maxlength: 64
            },
            "zhuceziben": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "shijiaoziben": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "sscy": {
                required: true,
                maxlength: 16
            },
            "zyyw": {
                required: true,
                maxlength: 256
            },
            "qylx": {
                required: true,
                maxlength: 16
            },
            "cyrs": {
                required: true,
                isZzs: true,
                maxlength: 18
            },
            "qncyrs": {
                required: true,
                isZzs: true,
                maxlength: 18
            },
            "fzr": {
                required: true,
                maxlength: 16
            },
            "fzrzw": {
                required: true,
                maxlength: 8
            },
            "fzrsj": {
                required: true,
                isTel: true,
                maxlength: 11
            },
            "lxr": {
                required: true,
                maxlength: 16
            },
            "lxrzw": {
                required: true,
                maxlength: 8
            },
            "lxrsj": {
                required: true,
                isTel: true,
                maxlength: 11
            },
            "gszcjg": {
                required: true,
                maxlength: 64
            },
            "gdsjnjg": {
                required: true,
                maxlength: 64
            },
            "tjgxszd": {
                required: true,
                maxlength: 64
            },
            "snmzzc": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "snmzfz": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "thirdsell": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "thirdinte": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "thirdtax": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "secondsell": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "secondinte": {
                required: true,
                maxlength: 18
            },
            "secondtax": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "firstsell": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "firstinte": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "firsttax": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "yrgqjg": {
                required: true,
                maxlength: 64
            },
            "yrgqsj": {
                required: true,
                isDate: true,
                maxlength: 10

            },
            "yrgqje": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "rzfs": {
                required: true,
                maxlength: 16
            },
            "qtrzfs": {
                required: true,
                maxlength: 16
            },
            "rzje": {
                required: true,
                isNum: true,
                maxlength: 18
            },
            "ywkdyzc": {
                required: true,
                maxlength: 16
            }

        },
        messages: {
            "qiyemingcheng": {
                required: "请输入企业名称",
                maxlength: "64字符以内"
            },
            "zzjgdm": {
                required: "请输入三证合一代码",
                isOCC: "请正确输入",
                maxlength: "32字符以内"
            },
            "dizhi": {
                required: "请输入注册地址",
                maxlength: "18字符以内"
            },
            "sjdizhi": {
                required: "请输入实际经营地址",
                maxlength: "64字符以内"
            },
            "zhuceziben": {
                required: "请输入注册资本",
                isNum: "请填数字",
                maxlength: "18字符以内"
            },
            "shijiaoziben": {
                required: "请输入实缴到位",
                isNum: "请填数字",
                maxlength: "18字符以内"
            },
            "sscy": {
                required: "请输入所属产业",
                maxlength: "16字符以内"
            },
            "zyyw": {
                required: "请输入主营业务",
                maxlength: "256字符以内"
            },
            "qylx": {
                required: "请输入企业类型",
                maxlength: "16字符以内"
            },
            "cyrs": {
                required: "请输入当前从业人数",
                isZzs: "请输入整数数字",
                maxlength: "18字符以内"
            },
            "qncyrs": {
                required: "请输入去年底从业人数",
                isZzs: "请输入整数数字",
                maxlength: "18字符以内"
            },
            "fzr": {
                required: "请输入法定代表人",
                maxlength: "16字符以内"
            },
            "fzrzw": {
                required: "请输入负责人职务",
                maxlength: "8字符以内"
            },
            "fzrsj": {
                required: "请输入法定代表人手机",
                isTel: "请正确输入手机号",
                maxlength: "11字符以内"
            },
            "lxr": {
                required: "请输入联系人",
                maxlength: "16字符以内"
            },
            "lxrzw": {
                required: "请输入联系人职务",
                maxlength: "8字符以内"
            },
            "lxrsj": {
                required: "请输入联系人手机",
                isTel: "请正确输入手机号",
                maxlength: "11字符以内"
            },
            "gszcjg": {
                required: "请输入工商注册机关",
                maxlength: "64字符以内"
            },
            "gdsjnjg": {
                required: "请输入国地税缴纳机关",
                maxlength: "64字符以内"
            },
            "tjgxszd": {
                required: "请输入统计关系所在地",
                maxlength: "64字符以内"
            },
            "snmzzc": {
                required: "请输入上年末总资产",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "snmzfz": {
                required: "请输入上年末总负债",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "thirdsell": {
                required: "请输入三年前的销售",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "thirdinte": {
                required: "请输入三年前的利润",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "thirdtax": {
                required: "请输入三年前的税收",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "secondsell": {
                required: "请输入二年前的销售",
                maxlength: "18字符以内"
            },
            "secondinte": {
                required: "请输入二年前的利润",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "secondtax": {
                required: "请输入二年前的税收",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "firstsell": {
                required: "请输入当年前的销售",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "firstinte": {
                required: "请输入当年前的利润",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "firsttax": {
                required: "请输入当年前的税收",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "yrgqjg": {
                required: "请输入引入股权投资机构名称",
                maxlength: "64字符以内"
            },
            "yrgqsj": {
                required: "请正确输入时间",
                isDate: "请正确输入时间格式",
                maxlength: "10字符以内"

            },
            "yrgqje": {
                required: "请输入引入股权投资金额",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "rzfs": {
                required: "请输入融资方式",
                maxlength: "16字符以内"
            },
            "qtrzfs": {
                required: "请输入其他融资方式",
                maxlength: "16字符以内"
            },
            "rzje": {
                required: "请输入融资金额",
                isNum: "请输入数字",
                maxlength: "18字符以内"
            },
            "ywkdyzc": {
                required: "请输入是否有可抵押资产",
                maxlength: "16字符以内"
            }
        },
        /*errorElement:"font",
         errorPlacement: function(error, element){
         error.appendTo(element.parent().find(".tipinfo"));
         },success:"valid"
         ,*/
        errorPlacement: function (error, element) {
            if (element.is(':radio') || element.is(':checkbox')) {
                //如果是radio或checkbox
                error.appendTo(element.parent());
                $("#gszcdspan lable.eq(0)").nextAll().remove();
                //将错误信息添加当前元素的父结点后面
            }
            else if (element.is('select[class*=ssx]')) {
                //把联动选择的提示只提示一个（思路：错误都一次放入容器最后，每次放入时，把第一个错误之后的错误节点删除）
                error.appendTo(element.parent()); //将错误信息添加当前元素的父结点后面
                $("#gszcdspan label").eq(0).nextAll().remove();
            }
            else {
                error.insertAfter(element);
                //element.html(error);
            }

        },
        submitHandler: function (form) {
            //表单提交句柄,为一回调函数，带一个参数：form
            //alert("提交表单");   return;
            form.submit();   //提交表单   
        }
    });

}
