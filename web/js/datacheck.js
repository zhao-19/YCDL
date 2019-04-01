/**
 * @author fengbing
 */

var DataCheck = {
    isNotNull: function () {
        var ret = true;

        $('*[isNotNull]').each(function () {
            var val = $(this).val();
            var content = $(this).attr('isNotNull');
            var nodeName = this.nodeName;

            if (nodeName == 'INPUT') {
                var type = $(this).attr('type');

                if (type == 'radio' || type == 'checkbox') {

                    if($(this).parent().find("input:checked").length <= 0) {
                        $(this).parent().err(content + '不能为空！');
                    } else {
                        $(this).parent().closeErr();
                    }
                    $(this).click(function() {
                        $(this).parent().closeErr();
                    })
                } else {
                    if (val == null || val == '') {
                        $(this).err(content + "不能为空！");
                        ret = false;
                    } else {
                        $(this).closeErr();
                    }
                }
            } else {
                if (val == null || val == '') {
                    $(this).err(content + "不能为空！");
                    ret = false;
                } else {
                    $(this).closeErr();
                }
            }
        })
        return ret;
    },
    isInt: function () {
        var ret = true;

        $('*[isInt]').each(function () {
            var val = $(this).val();
            var content = $(this).attr('isInt');
            console.log(val);
            console.log(!typeof val === 'number' && obj % 1 === 0);
            if (!typeof val === 'number' && obj % 1 === 0) {
                $(this).err(content + "必须是整数！");
                ret = false;
            } else {
                $(this).closeErr();
            }
        })
        return ret;
    },
    isDouble: function () {
        var ret = true;

        $('*[isDouble]').each(function () {
            var val = $(this).val();
            var r = /^[1-9]?[0-9]*\.[0-9]*$/;
            var content = $(this).attr("isDouble");

            if (!r.test(val)) {
                $(this).err(content + "必须是小数！");
                ret = false;
            } else {
                $(this).closeErr();
            }
        })
        return ret;
    },
    isPhone: function () {
        var ret = true;

        $('*[isPhone]').each(function () {
            var re = new RegExp(/^((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/);
            var val = $(this).val();
            var retu = val.match(re);
            var content = $(this).attr("isPhone");

            if (!retu) {
                $(this).err(content + "必须是手机号码！");
                ret = false;
            } else {
                $(this).closeErr();
            }
        })
        return ret;
    },
    isEmail: function () {
        var ret = true;

        $('*[isEmail]').each(function () {
            var val = $(this).val();
            var content = $(this).attr('isEmail');

            if (val.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                $(this).err(content + "必须是邮箱地址！");
                ret = false;
            } else {
                $(this).closeErr();
            }
        })
        return ret;
    }
}