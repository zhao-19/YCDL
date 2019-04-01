/**
 * Created by hytim_000 on 2018/1/9.
 */
function bzDataList(page,type,flag,callback){
    $.ajax({
        url:basepath+'/app/ycdata.action',
        type:'post',
        cache:false,
        data:{
            t:type,
            page:page
        },
        dataType: 'json',
        beforeSend:function () {
        },
        success:function(result){
            if(callback instanceof Function){
                callback(result);
            }

            var total = result.total;
            var pagesize =  result.pagesize;
            var npage  =  total%pagesize==0?total/pagesize:total/pagesize+1;
            if(flag){
                if(page>npage){
                    flag.noData();
                    //$('.loading').show().html('亲，没有数据可以加载了！！！');
                    //flag;
                }

                if(result.list.length<=0 || !(result.list)){
                    flag.lock();
                    flag.noData();
                }
                flag.resetload();
            }
        },
        error:function () {
            //$('.loading').show().html('亲，没有数据可以加载了！！！');
            if(flag){
                flag.resetload();
            }
        }
    })
}