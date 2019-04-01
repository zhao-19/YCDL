
		//说明：form表单id只能为“#form”。保存按钮只能是“.baocun”。提交按钮只能是“.tijiao”。页面加载完时默认添加失去焦点事件，
        var DataCheck = {
            isNotNull: function () {
                var ret = true;
                $('*[isNotNull]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var thisErrorSpanRadio = $(this).parent().parent().children("span");//专门对radio和checkbox的提示标签
                    var thisInputName = $(this).attr('name');//当前标签的InputName
                    var val = $(this).val();
                    var content = $(this).attr('isNotNull');
                    var nodeName = this.nodeName;
                    //console.log(11)
                    if (nodeName == 'INPUT') {
                        var type = $(this).attr('type');

                        if (type == 'radio' || type == 'checkbox') {
                            //if($(this).parent().find("input:checked").length <= 0) {
                            if(!($('input[name="'+thisInputName+'"]:checked').val())){
                                thisErrorSpanRadio.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpanRadio.html('').hide();
                            }

                        } else {

                            if (val == null || val == '') {
                                //console.log(222)
                                thisErrorSpan.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpan.html('').hide();
                            }
                        }
                    } else {
                        if (val == null || val == '') {
                            thisErrorSpan.html(content+'不能为空！').show();
                            ret = false;
                        } else {
                            thisErrorSpan.html('').hide();
                        }
                    }
                });
                return ret;
            },
            isInt: function () {
                var ret = true;

                $('*[isInt]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isInt');
                    //console.log(val);
                    //console.log(!typeof val === 'number' && obj % 1 === 0);
                    var zzInt = "^[-]{0,1}[0-9]+$";
                    reg = new RegExp(zzInt);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是整数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },
            isFint: function () {
                var ret = true;

                $('*[isFint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isFint');
                    //console.log(val);
                    //console.log(!typeof val === 'number' && obj % 1 === 0);

                    var zzInt = "^[-]{0,1}[0-9]+[.]{0,1}[0-9]{0,2}$";
                    reg = new RegExp(zzInt);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是数字,保留2位小数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },
            isBankZint: function () {
                var ret = true;
                $('*[isBankZint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isBankZint');
                    //console.log(val);
                    //console.log(!typeof val === 'number' && obj % 1 === 0);

                    var isBankZint = "^[-]*[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}(.){0,1}[0-9]{0,2}$";
                    reg = new RegExp(isBankZint);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是数字逗号型数字！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },
            isZint: function () {
                var ret = true;

                $('*[isZint]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isZint');
                    //console.log(val);
                    //console.log(!typeof val === 'number' && obj % 1 === 0);

                    var zzInt = "^[0-9]+[.]{0,1}[0-9]{0,2}$";
                    reg = new RegExp(zzInt);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是非负数字,保留2位小数！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }

                });
                return ret;
            },
            isDouble: function () {
                var ret = true;

                $('*[isDouble]').each(function () {
                    var val = $(this).val();
                    if(!val){return;}
                    var r = /^[1-9]?[0-9]*\.[0-9]*$/;
                    var content = $(this).attr("isDouble");

                    if (!r.test(val)) {
                        $(this).err(content + "必须是小数！");
                        ret = false;
                    } else {
                        $(this).closeErr();
                    }
                });
                return ret;
            },
            isLength: function () {
                var ret = true;

                $('*[isLength]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isLength');
                    content = eval(content);
                    if(content.length>1){
                        if(val.length<content[0] || val.length>content[1]){
                            content = content[0]+"~"+content[1]+'字符之内';
                            thisErrorSpan.html(content);
                            ret = false;
                        }else{
                            thisErrorSpan.html('').hide();
                        }


                    }else{
                        if(val.length<content[0]){
                            content = content[0]+"字符以上";
                            thisErrorSpan.html(content);
                            ret = false;
                        }else{
                            thisErrorSpan.html('').hide();
                        }

                    }

                });
                return ret;
            },
            isPhone: function () {
                var ret = true;

                $('*[isPhone]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isPhone');
                    var zzInt = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html(content+'有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            isZuzhi: function () {
                var ret = true;

                $('*[isZuzhi]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isZuzhi');
                    var zzInt = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html(content+'有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            isEmail: function () {
                var ret = true;

                $('*[isEmail]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('isEmail');

                    if (val.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                        thisErrorSpan.html("邮箱地址有误！");
                        ret = false;
                    } else {
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            },
            idCard: function () {
                var ret = true;

                $('*[idCard]').each(function () {
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    if(!val){return;}
                    var content = $(this).attr('idCard');
                    var zzInt = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
                    if(!(zzInt.test(val))){
                        thisErrorSpan.html('身份证号有误！').show();
                        ret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
                });
                return ret;
            }





        }



    //说明：isInt是整的数字,包括正整数和负整数；
    // isFint是负的数字，包括负的整数，负的小数，正的整数，正的小数；
    // isZint是正的数字或0，包括正整数，正小数，0;
    // isZuzhi是组织机构代码，三证合一代码；

      /*  var bzf = DataCheck.isNotNull();
        alert(bzf);
        var bzf = DataCheck.isInt();
        alert(bzf);
        var bzf = DataCheck.isFint();
        alert(bzf);
        var bzf = DataCheck.isZint();
        alert(bzf);*/


        $(function() {
        	//
        	$("#form input:not('.submit'),#form select,#form textarea").parent().append($('<span class="error"></span>'));
        	
	        //绑定失去焦点事件
	        var divid = "#form";
	        
	        $("#form input:not('.submit'),#form select,#form label,#form textarea").on('blur',function(){
	        	//alert(33);
	            var publickret = true;
	            //判断它是否有哪些属性
	            if($(this).attr('isNotNull') && publickret){	            	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var thisErrorSpanRadio = $(this).parent().parent().children("span");//专门对radio和checkbox的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isNotNull');
	                var nodeName = this.nodeName;
	                //console.log(11)
	                if (nodeName == 'INPUT') {
                        var type = $(this).attr('type');

                        if (type == 'radio' || type == 'checkbox') {
                            //if($(this).parent().find("input:checked").length <= 0) {
                            if(!($('input[name="'+thisInputName+'"]:checked').val())){
                                thisErrorSpanRadio.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpanRadio.html('').hide();
                            }

                        } else {

                            if (val == null || val == '') {
                                //console.log(222)
                                thisErrorSpan.html(content+'不能为空！').show();
                                ret = false;
                            } else {
                                thisErrorSpan.html('').hide();
                            }
                        }
                    } else {
                        if (val == null || val == '') {
                            thisErrorSpan.html(content+'不能为空！').show();
                            ret = false;
                        } else {
                            thisErrorSpan.html('').hide();
                        }
                    }
	            }
	            if($(this).attr('isLength') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isLength');
	                content = eval(content);
	                if(content.length>1){
	                	//alert(val+"**"+val.length);
	                    if(val.length<content[0] || val.length>content[1]){
	                        content = content[0]+"~"+content[1]+'字符之内';
	                        thisErrorSpan.html(content);
	                        publickret = false;
	                    }else{
	                        thisErrorSpan.html('').hide();
	                    }
	
	
	                }else{
	                    if(val.length<content[0]){
	                        content = content[0]+"字符以上";
	                        thisErrorSpan.html(content);
	                        publickret = false;
	                    }else{
	                        thisErrorSpan.html('').hide();
	                    }
	
	                }
	            }
	            if($(this).attr('isInt') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isInt');
	                //console.log(val);
	                //console.log(!typeof val === 'number' && obj % 1 === 0);
	                var zzInt = "^[-]{0,1}[0-9]+$";
	                reg = new RegExp(zzInt);
	                if(!(reg.test(val))){
	                    thisErrorSpan.html('必须是整数！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isFint') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isFint');
	                //console.log(val);
	                //console.log(!typeof val === 'number' && obj % 1 === 0);
	
	                var zzInt = "^[-]{0,1}[0-9]+[.]{0,1}[0-9]{0,2}$";
	                reg = new RegExp(zzInt);
	                if(!(reg.test(val))){
	                    thisErrorSpan.html('必须是数字,保留2位小数！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isZint') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isZint');
	                //console.log(val);
	                //console.log(!typeof val === 'number' && obj % 1 === 0);
	
	                var zzInt = "^[0-9]+[.]{0,1}[0-9]{0,2}$";
	                reg = new RegExp(zzInt);
	                if(!(reg.test(val))){
	                    thisErrorSpan.html('必须是非负数字,保留2位小数！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isBankZint') && publickret){
                    var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
                    var val = $(this).val();
                    var content = $(this).attr('isBankZint');
                    var isBankZint = "^[-]*[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}[0-9]{0,3}[,]{0,1}(.){0,1}[0-9]{0,2}$";
                    reg = new RegExp(isBankZint);
                    if(!(reg.test(val))){
                        thisErrorSpan.html('必须是数字逗号型数字！').show();
                        publickret = false;
                    }else{
                        thisErrorSpan.html('').hide();
                    }
	            }  
	            if($(this).attr('isZuzhi') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isZuzhi');
	                var zzInt = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;
	                if(!(zzInt.test(val))){
	                    thisErrorSpan.html('组织机构代码有误！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isPhone') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isPhone');
	                var zzInt = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
	                if(!(zzInt.test(val))){
	                    thisErrorSpan.html('手机号码有误！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('isEmail') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('isEmail');
	
	                if (val.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
	                    thisErrorSpan.html("邮箱地址有误！");
	                    publickret = false;
	                } else {
	                    thisErrorSpan.html('').hide();
	                }
	            }
	            if($(this).attr('idCard') && publickret){
	
	                var thisErrorSpan = $(this).parent().children("span");//一般input的提示标签
	                var val = $(this).val();
	                var content = $(this).attr('idCard');
	                var zzInt = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
	                if(!(zzInt.test(val))){
	                    thisErrorSpan.html('身份证号有误！').show();
	                    publickret = false;
	                }else{
	                    thisErrorSpan.html('').hide();
	                }
	            }
	
	
	        });
        })

        

       
        //测试动态创建的元素对绑定的blur事件是否依然生效[可以]
        $(".dongtai").click(function(){
            $(".namewk").clone(true).appendTo($("#form"));
        });

