$.fn.odometer = function (setting) {
    setting = setting || {};
    $(this).each(function () {
        var options = $(this).data("odometer");
        if (!options) {
            options = $.extend({}, $.fn.odometer.defaults, setting);
            value = $(this).text();
            $(this).empty();
            options.value = value;
            $(this).data("odometer", options);
            $.fn.odometer.init.call(this);
        }
    });
};
$.fn.odometer.defaults = {};
$.fn.odometer.init = function () {
    var options = $(this).data("odometer");
    var value = options.value;
    function getRandom(value) {
        var v = parseInt(Math.random() * 10);
        if (v == value) v = getRandom();
        return v;
    }
    for (var i = 0; i < value.length; i++) {
        var item = $("<span>", {
            'class': 'odometer_item'
        });
        var random = getRandom(value.substr(i, 1));
        if (random >= 10) random = 0;
        item.html("<span class='odometer_space'>8</span><span class='odometer_text'><span>" + random + "</span><span>" + (random + 1) + "</span></span><span class='odometer_line'></span>");
        $(this).append(item);
        item.data("value", value.substr(i, 1));
        item.data("current", random + 1);
        item.data("max", i * 50);
        item.run(5);
    }
};
$.fn.run = function (time) {
    var current = $(this).data("current");
    var text = $(this).find(".odometer_text");
    var value = $(this).data("value");
    var max = $(this).data("max");
    var next = current + 1;
    if (next >= 10) next = 0;
    var that = this;
    if (time >= max) {
        text.find("span").eq(1).html(value);
        text.animate({
            top: -text.find("span").eq(0).height()
        }, 800)
    }
    else {
        text.animate({
            top: -text.find("span").eq(0).height()
        }, 100, function () {
            text.find("span").eq(0).html(current);
            text.find("span").eq(1).html(next);
            text.css({
                top: 0
            });
            $(that).data("current", next);
            $(that).run(time * 1.2);
        });
    }
};
jQuery(function ($) {
    //            $("#Span0").odometer();
                $("#Span1").odometer();
                $("#Span2").odometer();
                $("#Span3").odometer();
    $("#Span4").odometer();
    $("#Span5").odometer();
    $("#Span6").odometer();
    $("#Span7").odometer();
    $("#Span8").odometer();
});