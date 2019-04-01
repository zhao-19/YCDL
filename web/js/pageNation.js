/**
 *
 * 对于kkpager的使用封装
 * pageNo 当前页数
 * pageTotal 总数据条数
 * pagerSize 总页数
 **/
 function pageNation(pageNo,pageTotal,pagerSize,callBack){
    $("#kkpager").empty();
    $("#kkpager").unbind();
    kkpager.init({
        pno : pageNo,
        mode : 'click', //设置为click模式
        //总页码
        total :pagerSize,
        //总数据条数
        totalRecords :  pageTotal,
//                mode:'click',
        //点击页码、页码输入框跳转、以及首页、下一页等按钮都会调用click
        //适用于不刷新页面，比如ajax
        click: function(n){
            //这里可以做自已的处理
            //...
            //处理完后可以手动条用selectPage进行页码选中切换

            this.selectPage(n);
            if(callBack){
                callBack(n);
            }

        }
//                //getHref是在click模式下链接算法，一般不需要配置，默认代码如下
//                getHref : function(n){
//                    return '#';
//                }
    });
    kkpager.generPageHtml();
}
