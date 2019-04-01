function tbnewecoInfo(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
		var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证正负数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("NumLength", function(value, element) {       
	    return !(value < -1000000000000 || value > 1000000000000);       
	}, "字符过长");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isDate", function(value, element) {       
	    var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
	    return this.optional(element) || (tel.test(value));       
	}, "请正确填写日期");
	jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话或传真号码");
	jQuery.validator.addMethod("isEmail", function(value, element) {       
	    return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);     
	}, "请正确填写邮箱格式");
    $("#tbnewecoFormInfo").validate({
    	 onkeyup:false,
        rules: {
        	"tbneweco.qiyemingcheng": {
                required: true,
                maxlength:128
            },
        	"tbneweco.main_product": {
                required: true,
                maxlength:128
            },
            "tbneweco.new_eco_field": {
                required: true
            },
            "tbneweco.incom": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.valuation": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.inbase": {
                required: true
            },
            "tbneweco.memo": {
                maxlength:128
            },
            "tbneweco.dizhi": {
                required: true,
                maxlength:128
            },
            "tbneweco.zhuyingyewu": {
                required: true,
                maxlength:256
            },
            "tbneweco.hangyeid": {
                required: true
            },
            "tbneweco.yuangongshu": {
                required: true,
                isOCC: true,
                maxlength: 9
            },
            "tbneweco.chengliriqi": {
                required: true,
                isDate: true
            },
            "tbneweco.xingming": {
                required: true,
                maxlength: 16
            },
            "tbneweco.yidongdianhua": {
                required: true,
                isTel: true,
                maxlength: 16
            },
            "tbneweco.previous_year_incom": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.last_year_incom": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.email": {
            	required: true,
                isEmail: true,
            	maxlength:64
            },
            "tbneweco.address": {
                required: true,
                maxlength:128
            },
            "tbneweco.legal_person": {
                required: true,
                maxlength:64
            },
            "tbneweco.science_num": {
                required: true,
                isOCC: true,
                maxlength: 9
            },
            "tbneweco.rdinput2016": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.incom2015": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.profit2015": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.taxamt2015": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.incom2016": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.profit2016": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.taxamt2016": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.incom2017": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.profit2017": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.taxamt2017": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbneweco.invest_status": {
                required: true,
                maxlength:512
            },
            "tbneweco.high_tech": {
                required: true
            }
        },
        messages: {
        	"tbneweco.qiyemingcheng": {
        		required: "请输入企业名称",
            	maxlength:"128字符以内"
            },
        	"tbneweco.main_product": {
            	required: "请输入主要产品",
            	maxlength:"128字符以内"
            },
            "tbneweco.new_eco_field": {
            	required: "请选择新经济领域",
            },
            "tbneweco.incom": {
            	required: "请输入2017年预计营业收入（万元）",
            	isNum:"2017年预计营业收入（万元）请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbneweco.valuation": {
            	required: "请输入企业估值（万元）",
            	isNum:"企业估值（万元）请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbneweco.inbase": {
            	required: "请选择是否上规入库",
            },
            "tbneweco.memo": {
            	maxlength:"128字符以内"
            },
            "tbneweco.dizhi": {
            	required: "请输入经营地址",
            	maxlength:"128字符以内"
            },
            "tbneweco.zhuyingyewu": {
            	required: "请输入主营业务",
            	maxlength:"256字符以内"
            },
            "tbneweco.hangyeid": {
            	required: "请选择所属行业",
            },
            "tbneweco.yuangongshu": {
            	required: "请输入企业人数",
            	isOCC: "企业人数请输入数字",
            	maxlength:"企业人数过长"
            },
            "tbneweco.chengliriqi": {
            	required: "请选择成立时间",
            	isDate: "成立时间格式不正确"
            },
            "tbneweco.xingming": {
            	required: "请输入联系人",
            	maxlength:"16字符以内"
            },
            "tbneweco.yidongdianhua": {
            	required: "请输入联系方式",
            	isTel: "联系方式格式不正确",
            	maxlength: "联系方式格式不正确"
            },
            "tbneweco.previous_year_incom": {
            	required: "请输入2015年营业收入（万元）",
            	isNum:"2015年营业收入（万元）请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbneweco.last_year_incom": {
            	required: "请输入2016年营业收入（万元）",
            	isNum:"2016年营业收入（万元）请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbneweco.email": {
            	required: "请输入电子邮箱",
                isEmail: "请正确输入电子邮箱",
            	maxlength:"64字符以内"
            },
            "tbneweco.address": {
                required: "请输入注册地址",
                maxlength:"128字符以内"
            },
            "tbneweco.legal_person": {
                required: "请输入企业法人",
                maxlength:"64字符以内"
            },
            "tbneweco.science_num": {
                required: "请输入科技活动人员数",
                isOCC: "请输入数字",
                maxlength: "字符过长"
            },
            "tbneweco.rdinput2016": {
                required: "请输入2016年研发投入（万元）",
                isNum:"2016年研发投入（万元）请输入数字(保留2位小数)",
                maxlength: "字符过长"
            },
            "tbneweco.incom2015": {
                required: "请输入2015营业收入（万元）",
                isNum:"2015营业收入（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.profit2015": {
                required: "请输入2015利润（万元）",
                isNum:"2015利润（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.taxamt2015": {
                required: "请输入2015税收（万元）",
                isNum:"2015税收（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.incom2016": {
                required: "请输入2016营业收入（万元）",
                isNum:"2016营业收入（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.profit2016": {
                required: "请输入2016利润（万元）",
                isNum:"2016利润（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.taxamt2016": {
                required: "请输入2016税收（万元）",
                isNum:"2016税收（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.incom2017": {
                required: "请输入2017营业收入（万元）",
                isNum:"2017营业收入（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.profit2017": {
                required: "请输入2017利润（万元）",
                isNum:"2017利润（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.taxamt2017": {
                required: "请输入2017税收（万元）",
                isNum:"2017税收（万元）请输入数字(保留2位小数)",
                maxlength:"字符过长"
            },
            "tbneweco.invest_status": {
                required: "请输入创投机构投资情况",
                maxlength:"512字符以内"
            },
            "tbneweco.high_tech": {
                required: "请选择是否高新技术企业"
            }
        },
        errorPlacement: function (error, element) {
        	if (element.is(':radio') || element.is(':checkbox')) { 
        	    var eid = element.attr('name');
        	    error.appendTo(element.parent()); 
        	} else {
        		error.insertAfter(element);
        	}
        },
        submitHandler: function(form){
        	$("select[name='tbneweco.new_eco_field']").attr("disabled", false);
        	$(".tbnewecobutton").attr("disabled","disabled");
            form.submit();
        }        
    });
}