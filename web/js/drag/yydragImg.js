

 /* 取得原始图片地址
 *
 * @param $src rewrited img's src path
 * @retrun string
 * @author CQ.H@paidai.com
 */
function getImgOriginalSrc($src) {
	// 有规定图片后缀[jpg/png/gif]结尾的不做处理
    var $pos1 = $src.indexOf('.jpg');
    var $pos2 = $src.indexOf('.JPG');
    var $pos3 = $src.indexOf('.png');
    var $pos4 = $src.indexOf('.PNG');
    var $pos5 = $src.indexOf('.gif');
    var $pos6 = $src.indexOf('.GIF');
    if($pos1 > 0 || $pos2 > 0 || $pos3 > 0 || $pos4 > 0 || $pos5 > 0 || $pos6 > 0) return $src;

    // 不是本站域名图片的不做处理
    if($src.indexOf('.paidai.com') < 0) return $src;

    var $s = $src.replace('thumbnail/2', 'uploadpath');
    var $i = $s.indexOf('/', 34);
    if($i != -1) {
        $rs = $s.substring(33, $i);
        var $map = {
            'g' : '.gif',
            'p' : '.png',
            'O' : '_',
            'z' : '-',
            'o' : '/',
            'A' : 'avatar_',
            'j' : '.jpg'
        };
        for(var $k in $map) {
            $rs = $rs.replace($k, $map[$k]);
        }
        return $s.substring(0, 33) + $rs;
    } else {
        return false;
    }
}

//-----------------------------图片放大弹层------------------------------//
$(document).ready(function() {
    if ($("yyimglayer_bg")[0] == null) {
        $("body").append('<div id="yyimglayer_bg"></div><div id="yyimglayer_border"><a href="javascript:;" id="yyimglayer_x" hidefocus="true" ></a><img id="yyimglayer_zoom" src="/image/imglayer_loading.gif" /></div>');
    }

    var docW = window.document.documentElement.clientWidth,
	    docH = window.document.documentElement.clientHeight,
	    imgBg = $('#yyimglayer_bg'),
	    imgBorder = $('#yyimglayer_border'),
	    startX = 0,
	    startY = 0,
	    dragObj = document.getElementById( 'yyimglayer_border' ),
	    dragTop = 0,
	    dragLeft = 0;

    //点击图片显示弹层 --文章内容部分
    $('#yytopic_content').click(function(e) {
        if($(this).find('img').attr('src')){
            var target = e.target || e.srcElement;
            if(target.tagName == 'IMG') {
                loadOriginalImg(target.src);
            }
        }
    });

    function loadOriginalImg($src) {
        imgBg.fadeTo('fast', 0.7).css('background-position','center center');
        var img = document.getElementById('yyimglayer_zoom');
        img.parentNode.removeChild(img);
        var newImg = new Image();
        newImg.id = 'yyimglayer_zoom';
        imgBorder.append(newImg);
        newImg.onload = function() {
            var newImg = document.getElementById('yyimglayer_zoom');
            imgBorder.fadeIn('fast').css({'top':(docH - newImg.clientHeight - 50)/2,'left':(docW - newImg.clientWidth - 50)/2});
            imgBg.css('background-position','0 5000px');
        };
        newImg.src = getImgOriginalSrc($src);
    }

  //点击图片显示弹层 --回复部分
	$('#reply_list').click(function(e){
		var target = e.target || e.srcElement;
		if(target.tagName == 'IMG') {
			var width = parseInt(target.width);
			if(width >= 100) {
				loadOriginalImg(target.src);
			}
		}
	})

    //点击X关闭弹层
    $('#yyimglayer_x').click(function() {
        imgBorder.fadeOut('fast');
        imgBg.fadeOut('fast');
    });

    //点击背景关闭弹层
    $('#yyimglayer_bg').click(function(e) {
        var target = e.target || e.srcElement;
        if(target.id == 'yyimglayer_bg') {
            $(this).fadeOut('fast');
            imgBorder.fadeOut('fast');
        }
    });

    //拖动图片弹层-开始
    $('#yyimglayer_border').mousedown(function(e){
        var event = e || window.event;
        event.preventDefault();
        window.getSelection ? window.getSelection().removeAllRanges():document.selection.empty();
        startX = event.screenX;
        startY = event.screenY;
        dragTop = parseInt( dragObj.style.top );        //内联样式，由fadeIn语句设定
        dragLeft = parseInt( dragObj.style.left );
        $( document ).bind( 'mousemove', dragMove );
        $( document ).bind( 'mouseup', dragOver );
    });
	
    //拖动
    function dragMove( e ) {
        var event = e || window.event;
        event.preventDefault();
        dragObj.style.left = dragLeft + event.screenX - startX + 'px';
        dragObj.style.top = dragTop + event.screenY - startY + 'px';
    };
	
    //结束
    function dragOver() {
        $( document ).unbind( 'mousemove', dragMove ).unbind( 'mouseup', dragOver);
    };
});

