/**
 * @author Administrator
 */

function initValidator(){

    $("#thisForm").validate({
        onkeyup:false,
        rules: {
            "e.qiyemingcheng": {
                required: true,
                maxlength: 50
                },
            "e.zhuceziben": {
                required: true,
                isNumber: true
            },
            "e.chengliriqi": {
                required: true,
                isDate: true
            },
            "e.dizhi": {
                required: true,
                maxlength: 64
            },
            "e.fdr": {
                required: true
            },
            "e.farentele": {
                required: true,
                isPhone: true
            },
            "e.fzr": {
                required: true,
                maxlength: 16
            },
            "e.farentelezw": {
                required: true
            },
            "e.fzrtele": {
                required: true,
                isPhone: true
            },
            "e.lxr": {
                required: true
            },
            "e.farentelelx": {
                required: true
            },
            "e.lxrtlle": {
                required: true,
                isPhone: true
            },
            "e.dkyy": {
                required: true,
                maxlength: 64
            },
            "e.dkje": {
                required: true,
                isNumber: true
            },
            "e.dkll": {
                required: true,
                isNumber: true
            },
            "e.zflx": {
                required: true,
                isNumber: true
            },
            "e.fksj": {
                required: true,
                isDate: true
            },
            "e.dqsj": {
                required: true,
                isDate: true
            },
            "e.vcpe": {
                required: true,
                maxlength: 256
            },
            "e.dsfxypj": {
                required: true
            },
            "e.tjgxqk": {
                required: true,
                maxlength: 16
            },
            "e.zhuyingyewu": {
                required: true,
                maxlength: 512
            },
            "e.gsjngxszd": {
                required: true,
                maxlength: 8
            },
            "e.tjgxszd": {
                required: true,
                maxlength: 8
            },
            "e.dsjngxszd": {
                required: true,
                maxlength: 8
            },
            "e.yhxydj": {
                required: true,
                maxlength: 4
            },
            "e.zcze": {
                required: true,
                isNumber: true
            },
            "e.fzze": {
                required: true,
                isNumber: true
            },
            "e.ckchze": {
                required: true,
                isNumber: true
            },
            "e.cpsczyl": {
                required: true,
                isNumber: true
            }

        },
        messages: {
            "e.qiyemingcheng": {
                required: "请输入公司名称"
            },
            "e.zhuceziben": {
                required: "请输入注册资金",
                isNumber: "只能输入数字"
            },
            "e.chengliriqi": {
                required: "请输入成立日期",
                isDate: "请输入日期格式，如：2000-01-01"
            },
            "e.dizhi": {
                required: "请输入公司地址"
            },
            "e.fdr": {
                required: "请输入法定代表人姓名"
            },
            "e.farentele": {
                required: "请输入法定代表人电话",
                isPhone: "电话输入有误！"
            },
            "e.fzr": {
                required: "请输入负责人姓名"
            },
            "e.farentelezw": {
                required: "请输入负责人职务"
            },
            "e.fzrtele": {
                required: "请输入负责人电话",
                isPhone: "电话输入有误！"
            },
            "e.lxr": {
                required: "请输入联系人姓名"
            },
            "e.farentelelx": {
                required: "请输入联系人职务"
            },
            "e.lxrtlle": {
                required: "请输入联系人电话",
                isPhone: "电话输入有误！"
            },
            "e.dkyy": {
                required: "请输入贷款银行："
            },
            "e.dkje": {
                required: "请输入贷款金额",
                isNumber: "只能输入数字"
            },
            "e.dkll": {
                required: "请输入贷款利率",
                isNumber: "只能输入数字"
            },
            "e.zflx": {
                required: "请输入支付利息",
                isNumber: "只能输入数字"
            },
            "e.fksj": {
                required: "请输入放款日期",
                isDate: "请输入日期格式，如：2000-01-01"
            },
            "e.dqsj": {
                required: "请输入到期日期",
                isDate: "请输入日期格式，如：2000-01-01"
            },
            "e.vcpe": {
                required: "请输入引入vcpe情况"
            },
            "e.dsfxypj": {
                required: "请输入第三方信用评级结果"
            },
            "e.zhuyingyewu": {
                required: "请输入主营业务"
            },
            "e.tjgxszd": {
                required: "请输入统计关系所在地"
            },
            "e.gsjngxszd": {
                required: "请输入国税缴纳关系所在地"
            },
            "e.dsjngxszd": {
                required: "请输入地税缴纳关系所在地："
            },
            "e.yhxydj": {
                required: "请输入银行信用等级"
            },
            "e.zcze": {
                required: "请输入资产总额",
                isNumber: "只能输入数字"
            },
            "e.fzze": {
                required: "请输入负债总额",
                isNumber: "只能输入数字"
            },
            "e.ckchze": {
                required: "请输入出口创汇总额",
                isNumber: "只能输入数字"
            },
            "e.cpsczyl": {
                required: "请输入产品市场占有率",
                isNumber: "只能输入数字"
            }

        },
        errorElement:"font",
        errorPlacement: function(error, element){
            error.appendTo(element.parent().find(".tipinfo"));
        },success:"valid"
    });

}
