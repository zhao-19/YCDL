/**
 * Created by admin on 2017/6/12.
 */
(function(doc, win) {
    var docEl = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
        recalc = function() {
            var clientWidth = docEl.clientWidth;
            if (!clientWidth) return;
            // if (clientWidth >= 640) {
            //     docEl.style.fontSize = '100px';
            // } else {
                docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
                // var div = document.createElement('div');//改为一个不常用的标签放在body下
                var div = document.createElement('strong');
                div.style.width = '1.4rem';
                div.style.height = '0';
                div.style.display = 'block';
                document.body.appendChild(div);
                var ideal = 140 * clientWidth / 750;
                var rmd = (div.clientWidth / ideal);
                if (rmd > 1.2 || rmd < 0.8) {
                    docEl.style.fontSize = 100 * (clientWidth / 750) / rmd + 'px';
                }
                document.body.removeChild(div);
            };
        // };
    if (!doc.addEventListener) return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);


$(function () {
    $('body').css('min-height',$(window).height())
});

