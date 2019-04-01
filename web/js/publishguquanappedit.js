/**
 * @author Administrator
 */
function publishguquanappedit(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isDate", function(value, element) {       
	    var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
	    return this.optional(element) || (tel.test(value));       
	}, "请正确填写日期");
	  jQuery.validator.addMethod("isIdcard", function(value, element) {
          var length = value.length;
          var isIdcard = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
          return this.optional(element) || (isIdcard.test(value));
      }, "请输入正确的身份证号码");
	  jQuery.validator.addMethod("isTel", function(value, element) {
          var length = value.length;
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");
    $("#publishguquanappedit").validate({
        rules: {
            "guquan.picture": {
                required: true,
                maxlength:256
            },
            "guquan.jihuashu": {
                required: true
            },
            "guquan.mingcheng": {
                required: true,
                rangelength:[2,20]
            },
            "guquan.hexinjzl": {
            	required: true,
            	rangelength:[2,10]
            },
            "guquan.jianjie": {
            	required: true,
            	maxlength:800
            },
            "guquan.mubiaoyonghu": {
            	required: true,
            	maxlength:200
            },
            "guquan.insertfile": {
            	required: false,
                maxlength:64
            },
            "guquan.tuijianpic": {
                required: true,
                maxlength:128
            },
            "guquan.leftpic": {
            	required: true,
                maxlength:128
            },
            "guquan.detailpic": {
                required: true,
                maxlength:128
            },
            "guquan.hangye": {
	        	required: true
	        },
            "guquan.rongziedu": {
                required: true,
                isNum:true,
                maxlength:32
            },
            "guquan.rongzhijieduan": {
                required: true,
                maxlength:16
            },
            "guquan.crgqbl": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "guquan.zhijinyongtu": {
            	required: true,
            	maxlength:400
            },
            "guquan.xiangmuzhuangtai": {
                required: true
            },
            "guquan.yewushuju": {
            	required: true,
            	maxlength:500
            },
            "guquan.weilaifazhanjihua": {
            	required: true,
            	maxlength:400
            },
            "guquan.shichangfenxi": {
            	required: true,
            	maxlength:500
            },
            "guquan.hangyejingzheng": {
            	required: true,
            	maxlength:400
            },
            "guquan.qitaxinxi": {
            	maxlength:400
            },
            "guquan.rongzizhuangtai": {
                required: true
            },
            "guquan.biaoqian": {
                required: true,
                maxlength:16
            },
            "guquan.fujianming": {
                required: true,
                maxlength:64
            },
            "guquan.fujianlujing": {
                required: true,
                maxlength:64
            },
            "riqi0": {
            	required: true,
                isDate:true
            },
            "shijian": {
                required: true,
                maxlength:64
            },
            "xingming": {
                required: true,
                maxlength:16
            },
            "tupian": {
                required: true,
                maxlength:54
            },
            "jianjie": {
                required: true,
                maxlength:256
            }
        },
        messages: {
        	"guquan.picture": {
	            required: "请上传图片",
	            maxlength:"图片路径在128字符以内"
	        },
	        "guquan.jihuashu": {
	            required: "请上传项目计划书文件"
	        },
	        "guquan.mingcheng": {
	            required: "请输入项目名称",
	            rangelength:"2~20字符以内"
	        },
	        "guquan.hexinjzl": {
	        	required: "请输入核心竞争力",
	        	rangelength:"2~10字符以内"
	        },
	        "guquan.jianjie": {
	        	required: "请输入项目/产品简介",
	        	maxlength:"800字符以内"
	        },
	        "guquan.mubiaoyonghu": {
	        	required: "请输入目标用户",
	        	maxlength:"200字符以内"
	        },
	        "guquan.insertfile": {
	        	required: "请输入项目计划书",
	            maxlength:"64字符以内"
	        },
	        "guquan.tuijianpic": {
	            required: "请上传项目图片",
	            maxlength:"图片路径128字符以内"
	            maxlength:"图片路径128字符以内"
	        },
	        "guquan.leftpic": {
	        	required: "请上传详细页小图",
	            maxlength:"图片路径在128字符以内"
	        },
	        "guquan.detailpic": {
	            required: "请上传详细页宽图",
	            maxlength:"图片路径128字符以内"
	        },
	        "guquan.hangye": {
	        	required: "请输入所属行业",
	        	maxlength:"32字符以内"
	        },
	        "guquan.rongziedu": {
	            required: "请输入融资额度",
	            isNum:"请填数字,保留2位小数",
	            maxlength:"32字符以内"
	        },
	        "guquan.rongzhijieduan": {
	            required: "请输入融资阶段",
	            maxlength:"16字符以内"
	        },
	        "guquan.crgqbl": {
	            required: "请输入出让股权比例",
	            isNum:"请填数字,保留2位小数",
	            maxlength:"18字符以内"
	        },
	        "guquan.zhijinyongtu": {
	        	required: "请输入资金用途",
	            maxlength:"400字符以内"
	        },
	        "guquan.xiangmuzhuangtai": {
	            required: "请选择项目所处阶段"
	        },
	        "guquan.yewushuju": {
	        	required: "请输入业务数据",
	            maxlength:"500字符以内"
	        },
	        "guquan.weilaifazhanjihua": {
	        	required: "请输入未来发展计划",
	            maxlength:"400字符以内"
	        },
	        "guquan.shichangfenxi": {
	        	required: "请输入市场情况分析",
	            maxlength:"500字符以内"
	        },
	        "guquan.hangyejingzheng": {
	        	required: "请输入行业竞争情况",
	            maxlength:"400字符以内"
	        },
	        "guquan.qitaxinxi": {
	            maxlength:"400字符以内"
	        },
	        "guquan.rongzizhuangtai": {
	            required: "请选择融资所处阶段"
	        },
	        "guquan.biaoqian": {
	            required: "请输入标签",
	            maxlength:"16字符以内"
	        },
	        "guquan.fujianming": {
	            required: "请输入附件名",
	            maxlength:"64字符以内"
	        },
	        "guquan.fujianlujing": {
	            required: "请输入附件路径",
	            maxlength:"64字符以内"
	        },
	        "riqi0": {
	        	required: "请输入事件进程时间点",
	            isDate:"请正确输入日期格式"
	        },
	        "shijian": {
	            required: "请输入事件内容",
	            maxlength:"64字符以内"
	        },
	        "xingming": {
	            required: "请输入成员姓名",
	            maxlength:"16字符以内"
	        },
	        "tupian": {
	            required: "请输入成员图片",
	            maxlength:"图片路径54字符以内"
	        },
	        "jianjie": {
	            required: "请输入成员简介",
	            maxlength:"256字符以内"
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
        	else{
        	       error.insertAfter(element);
        	       //element.html(error); 
    	     }
        	
    	},
        submitHandler: function(form){       	
        	//表单提交句柄,为一回调函数，带一个参数：form   
            //alert("提交表单");   return;
            //$(".select").attr("disabled","false");//取消条件为二时对下拉框的禁止
            //$(".fadeIndiv select").attr("disabled","true");//取消复审通过的里面的select框的禁止
    		$(".firstreaddiv input,.firstreaddiv radio,.firstreaddiv select,.firstreaddiv textarea,.firstreaddiv checkbox").removeAttr("disabled");
    		$(".fadeIndiv input,.fadeIndiv radio,.fadeIndiv select,.fadeIndiv textarea,.fadeIndiv checkbox").removeAttr("disabled");
    		form.submit();   //提交表单   
        }
    });
    
}
