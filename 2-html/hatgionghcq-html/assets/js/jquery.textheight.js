(function ($) {
    $.fn.extend({
        textHeight: function (options) {
            // Đặt các giá trị mặc định

            var defaults = {
                activetit: true,
                listcss: [{ cssname: ".product-name"}],
                wpointb: false,
                widthpont: 479,
                desbool: true,
                listpos: [{ cssnamepos: ".desription", cssheightnum: "3"}],
                max: true
            };

            var options = $.extend(defaults, options);

            return this.each(function () {

                var opts = options;
                // Đặt tên biến cho element (ul)
                var obj = $(this);
                // Lấy tất cả thẻ li trong ul
                var lenw = opts.listcss.length;
                var lendes = opts.listpos.length;
                myfunh();
                $(window).resize(function () {
                    myfunh();
                });
                function myfunh() {
                    if (opts.activetit) {
                        for (var i = 0; i < lenw; i++) {
                            $(opts.listcss[i].cssname, obj).height("auto");
                        }
                    }
                    if (opts.desbool) {
                        for (var j = 0; j < lendes; j++) {
                            $(opts.listpos[j].cssnamepos, obj).height("auto");
                            $(opts.listpos[j].cssheightnum, obj).height("auto");
                        }
                    }
                    if (opts.wpointb) {
                        if ($(window).outerWidth() >= opts.widthpont) {
                            myfunHeight();
                        }
                    } else {
                        myfunHeight();
                    }
                }
                function myfunHeight() {
                    if (opts.max) {
                        obj.each(function () {
                            if (opts.activetit) {
                                for (var i = 0; i < lenw; i++) {
                                    var maxHeight = Math.max.apply(null, $(opts.listcss[i].cssname, this).map(function () {
                                        return $(this).height();
                                    }).get());
                                    $(opts.listcss[i].cssname, this).height(maxHeight);
                                }
                            }
                            if (opts.desbool) {
                                for (var j = 0; j < lendes; j++) {
                                    var maxHeight2 = Math.max.apply(null, $(opts.listpos[j].cssnamepos, this).map(function () {
                                        return $(this).height();
                                    }).get());
                                    var lineh = parseInt($(opts.listpos[j].cssnamepos, this).css("line-height"));
                                    if (maxHeight2 > opts.listpos[j].cssheightnum * lineh) {
                                        $(opts.listpos[j].cssnamepos, this).height(opts.listpos[j].cssheightnum * lineh);
                                    } else {
                                        $(opts.listpos[j].cssnamepos, this).height(maxHeight2);
                                    }
                                }
                            }
                        });
                    } else {
                        obj.each(function () {
                            if (opts.activetit) {
                                for (var i = 0; i < lenw; i++) {
                                    var maxHeight = Math.min.apply(null, $(opts.listcss[i].cssname, this).map(function () {
                                        return $(this).height();
                                    }).get());
                                    $(opts.listcss[i].cssname, this).height(maxHeight);
                                }
                            }
                            if (opts.desbool) {
                                for (var j = 0; j < lendes; j++) {
                                    var maxHeight2 = Math.min.apply(null, $(opts.listpos[j].cssnamepos, this).map(function () {
                                        return $(this).height();
                                    }).get());
                                    var lineh = parseInt($(opts.listpos[j].cssnamepos, this).css("line-height"));
                                    if (maxHeight2 > opts.listpos[j].cssheightnum * lineh) {
                                        $(opts.listpos[j].cssnamepos, this).height(opts.listpos[j].cssheightnum * lineh);
                                    } else {
                                        $(opts.listpos[j].cssnamepos, this).height(maxHeight2);
                                    }
                                }
                            }
                        });
                    }
                }
            });
        }
    });
})(jQuery);