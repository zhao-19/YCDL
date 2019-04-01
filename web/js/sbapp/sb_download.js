//贴息申报step3删除图片
$(function () {
	
    //找到是哪个list页面
    //var listid = $("#id").val();
    
	$(".res").hide();
    $("input[class='an xzw op oprd']").click(function(){
    	
    	if(confirm("资料生成后需要到【文件下载】菜单下载文件，现在生成资料吗？")){
    		var url = "";
    		var type = $(this).attr("msg");
            var id = $(this).attr('lang');
            if (type == 'txdb') {
                url = 'declare_base/exportWord201710.html?type=txdb&policy_id=717fe76c435d48dc82557e17ecf7a118&id='+ id;
            } else if (type =='xypjbt') {
                url = 'declare_base/exportWord201710.html?type=xypjbt&policy_id=76e15fc2cd464f0c8c193484e1514636&id='+ id;
            } else if (type =='qygzbt') {
                url = 'declare_base/exportWord201710.html?type=qygzbt&policy_id=5ac1343dc9f44104bd1d35137a2e285f&id='+ id;
            } else if (type =='ipohjbt') {
                url = 'declare_base/exportWord201710.html?type=ipohjbt&policy_id=c97d10ee282c4e7492c6dfca2d8a81d8&id='+ id;
            } else if (type =='sscgbt') {
                url = 'declare_base/exportWord201710.html?type=sscgbt&policy_id=f17ec4b7496b41a99a8362432c377a97&id='+ id;
            } else if (type =='jwsscgbt') {
                url = 'declare_base/exportWord201710.html?type=jwsscgbt&policy_id=19405a8899fa44e1aeb2b2233d9e05f8&id='+ id;
            } else if (type =='zzgbbt') {
                url = 'declare_base/exportWord201710.html?type=zzgbbt&policy_id=6d00b081869f48bf9824124110b4258a&id='+ id;
            } else if (type =='yggqbt') {
                url = 'declare_base/exportWord201710.html?type=yggqbt&policy_id=96490c4236bd4672affc6e7a3da5cb58&id='+ id;
            } else if (type =='czbgbt') {
                url = 'declare_base/exportWord201710.html?type=czbgbt&policy_id=3b1ae2ef7d714f9aa0d23330aaaecc60&id='+ id;
            } else if (type =='rzznbt') {
                url = 'declare_base/exportWord201710.html?type=rzznbt&policy_id=217a3a328e9e471f8fb10ec9865fcf07&id='+ id;
            } else if (type =='kjbxbt') {
                url = 'declare_base/exportWord201710.html?type=kjbxbt&policy_id=24e4705e37684b52b70cbe9b9f2cf9d0&id='+ id;
            } else if (type =='zwrzbt') {
                url = 'declare_base/exportWord201710.html?type=zwrzbt&policy_id=b9f522a9b43f4d2e96e848dfd917921f&id='+ id;
            } else if (type =='hlwbt') {
                url = 'declare_base/exportWord201710.html?type=hlwbt&policy_id=3eff48cae44a41b1bb570b13b631a5b7&id='+ id;
            } else if (type =='kjcxbt') {
                url = 'declare_base/exportWord201710.html?type=kjcxbt&policy_id=3eff48cae44a41b1bb570b13b631a5b7&id='+ id;
            } else if (type =='interest') {
                 url = 'declare_base/exportWord201710.html?type=interest&policy_id=717fe76c435d48dc82557e17ecf7a118&id='+ id;
             } else if (type == "common" || type == "gp" || type == "border") {
                url = "declare_base/exportWord201710.html?policy_id=" + $(this).attr("pid") + "&id=" + id;
               // alert(url)
            }
    	showxtjsje(this,url);
        
    	}
    	
    });
});
