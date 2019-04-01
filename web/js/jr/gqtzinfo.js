function gqtzinfo(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    // var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
        var num = /^(\-|\+)?[0-9]+(,*[0-9]*)*[.]{0,1}[0-9]{0,2}$/;    //验证千分位保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("NumLength", function(value, element) {       
	    return !(value < -1000000000000 || value > 1000000000000);       
	}, "字符过长");
	jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话");
    $("#tbjrgqtzFormInfo").validate({
    	 onkeyup:false,
        rules: {
            "tbjrgqtz.project_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjrgqtz.project_ht_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjrgqtz.invest_amt": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.invets_ht_amt": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.invest_industry": {
                required: true,
                rangelength:[1,128]
            },
            "tbjrgqtz.invest_info": {
                required: true,
                rangelength:[1,512]
            },
            "tbjrgqtz.fund_scale": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.place_scale": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.invest_total_amt": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.staff_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjrgqtz.business_income": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.profit": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.fixed_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.intangible_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.salaries": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.added_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.income_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.other_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjrgqtz.contact_name": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrgqtz.contact_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrgqtz.leader_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjrgqtz.contact_duty": {
                required: true,
                rangelength:[1,16]
            },
            "tbjrgqtz.time_port": {
                required: true
            }
        },
        messages: {
        	"tbjrgqtz.project_count": {
            	required: "请输入投资项目个数",
            	isOCC:"投资项目个数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.project_ht_count": {
            	required: "请输入其中：高新区项目数",
            	isOCC:"其中：高新区项目数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.invest_amt": {
            	required: "请输入投资总额",
            	isNum:"投资总额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.invets_ht_amt": {
            	required: "请输入其中：投放给高新区企业",
            	isNum:"其中：投放给高新区企业请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.invest_info": {
            	required: "请输入累计募资、投资情况",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.fund_scale": {
            	required: "请输入基金规模",
            	isNum:"基金规模请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.place_scale": {
            	required: "请输入到位资金总额",
            	isNum:"其中：到位资金总额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.invest_total_amt": {
            	required: "请输入累计投资总额",
            	isNum:"累计投资总额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.staff_count": {
            	required: "请输入职工人数",
            	isOCC:"其中：职工人数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.business_income": {
            	required: "请输入营业收入",
            	isNum:"营业收入请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.profit": {
            	required: "请输入净利润",
            	isNum:"净利润请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.fixed_assets": {
            	required: "请输入固定资产折旧",
            	isNum:"固定资产折旧请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.intangible_assets": {
            	required: "请输入无形资产摊销",
            	isNum:"无形资产摊销请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.salaries": {
            	required: "请输入人员薪酬及福利",
            	isNum:"人员薪酬及福利请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.added_tax": {
            	required: "请输入增值税",
            	isNum:"增值税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.income_tax": {
            	required: "请输入所得税",
            	isNum:"所得税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.other_tax": {
            	required: "请输入其他税金及附加",
            	isNum:"其他税金及附加请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjrgqtz.contact_name": {
            	required: "请输入填报人姓名",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.contact_tele": {
            	required: "请输入填报人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.leader_tele": {
            	required: "请输入负责人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.contact_duty": {
            	required: "请输入填报人职务",
            	rangelength:"字符过长"
            },
            "tbjrgqtz.time_port": {
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
        	$("#tbjrgqtzSub,#tbjrgqtzSave").attr("disabled","disabled");
            form.submit();
        }        
    });
}