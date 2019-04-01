function bxinfo(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    // var num = /^(\-|\+)?[0-9]+,*[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    var num = /^(\-|\+)?[0-9]+(,*[0-9]*)*[.]{0,1}[0-9]{0,2}$/;    //验证千分位保留两位小数

	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("NumLength", function(value, element) {

	    return !(value < -1000000000000 || value > 1000000000000);       
	}, "字符过长");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话");
    $("#tbjrbxFormInfo").validate({
    	 onkeyup:false,
        rules: {
            "tbjrbx.insurance_income": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.insurance_payment": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.sum_insurance": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.business_income": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.profit": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.fixed_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.intangible_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.salaries": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.added_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.income_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.other_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrbx.staff_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjrbx.branche_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjrbx.contact_name": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrbx.contact_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrbx.leader_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrbx.contact_duty": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrbx.time_port": {
                required: true
            }
        },
        messages: {
        	"tbjrbx.insurance_income": {
            	required: "请输入全年保费收入",
            	isNum:"全年保费收入请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.insurance_payment": {
            	required: "请输入全年保险赔付",
            	isNum:"全年保险赔付请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.sum_insurance": {
            	required: "请输入高新区企业保额",
            	isNum:"高新区企业保额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.business_income": {
            	required: "请输入营业收入",
            	isNum:"营业收入请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.profit": {
            	required: "请输入净利润",
            	isNum:"净利润请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.fixed_assets": {
            	required: "请输入固定资产折旧",
            	isNum:"固定资产折旧请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.intangible_assets": {
            	required: "请输入无形资产摊销",
            	isNum:"无形资产摊销请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.salaries": {
            	required: "请输入人员薪酬及福利",
            	isNum:"人员薪酬及福利请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.added_tax": {
            	required: "请输入增值税",
            	isNum:"增值税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.income_tax": {
            	required: "请输入所得税",
            	isNum:"所得税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.other_tax": {
            	required: "请输入其他税金及附加",
            	isNum:"其他税金及附加请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrbx.staff_count": {
            	required: "请输入员工数",
            	isOCC:"员工数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjrbx.branche_count": {
            	required: "请输入网点数",
            	isOCC:"网点数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjrbx.contact_name": {
            	required: "请输入填报人姓名",
            	rangelength:"字符过长"
            },
            "tbjrbx.contact_tele": {
            	required: "请输入填报人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrbx.leader_tele": {
            	required: "请输入负责人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrbx.contact_duty": {
            	required: "请输入填报人职务",
            	rangelength:"字符过长"
            },
            "tbjrbx.time_port": {
                required: "请选择"
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
            nativeNum("isBankZint");//还原为数字
        	$("#tbjrbxSub,#tbjrbxSave").attr("disabled","disabled");
            form.submit();
        }        
    });
}