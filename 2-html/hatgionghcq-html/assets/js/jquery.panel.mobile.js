(function ($) {
    $.fn.extend({

        mobilepanel: function (options) {

            // Đặt các giá trị mặc định
            var defaults = {
                panelLeft: true
            };

            var options = $.extend(defaults, options);

            return this.each(function () {
                var opts = options;

                // Đặt tên biến cho element (ul)
                var obj = $(this);
                // Thêm sự kiện click vào thẻ a
                $(".mobile-panel").css({ "left": "-100%", "right": "auto" });
                obj.click(function (event) {
                    $(".mobile-panel").css({ "left": "-100%", "right": "auto" });
                    $(this).toggleClass("open");
                    var items = $(this).attr("href");
                    $(items).height("auto");
                    if (opts.panelLeft) {
                        if ($(this).hasClass("open")) {
                            $("html,body").stop(true, true).animate({ scrollTop: 0 }, 300);
                            $(items).after('<div id="mask-left" data-id="' + items + '"></div>');
                            mymenuheight(items);
                            $(items).stop(true, true).animate({ "left": 0 }, 500, function () {
                                $("#wrapper").css({ "overflow": "visible" });
                            });
                        } else {
                            $("#wrapper").css({ "overflow": "hidden" });
                            $(items).stop(true, true).animate({ "left": "-100%", "height": "100%" }, 500, function () {
                                $("#mask-left[data-id='" + items + "']").remove();
                            });
                        }
                        $("#mask-left[data-id='" + items + "']").click(function () {
                            $("#wrapper").css({ "overflow": "hidden" });
                            $("html,body").stop(true, true).animate({ scrollTop: 0 }, 500);
                            $(items).stop(true, true).animate({ "left": "-100%", "height": "100%" }, 500, function () {
                                $("[href='" + items + "']").removeClass("open");
                                $("#mask-left[data-id='" + items + "']").remove();
                            });
                            return false;
                        });
                        $(items).find("[href='" + items + "']").click(function () {
                            $("#wrapper").css({ "overflow": "hidden" });
                            $(items).stop(false, false).animate({ "left": "-100%", "height": "100%" }, 500, function () {
                                $("[href='" + items + "']").removeClass("open");
                                $("#mask-left[data-id='" + items + "']").remove();
                            });
                            return false;
                        });
                        $(window).resize(function () {
                            mobileLeft(items);
                        });
                    } else {
                        $(items).css({ "right": "-100%", "left": "auto" });
                        if ($(this).hasClass("open")) {
                            $("html,body").stop(true, true).animate({ scrollTop: 0 }, 300);
                            $(items).after('<div id="mask-right" data-id="' + items + '"></div>');
                            mymenuheight(items);
                            $(items).stop(true, true).animate({ "right": 0 }, 500, function () {
                                $("#wrapper").css({ "overflow": "visible" });
                            });
                        } else {
                            $("#wrapper").css({ "overflow": "hidden" });
                            $(items).stop(true, true).animate({ "right": "-100%", "height": "100%" }, 500, function () {
                                $("#mask-right[data-id='" + items + "']").remove();
                            });
                        }
                        $("#mask-right[data-id='" + items + "']").click(function () {
                            $("#wrapper").css({ "overflow": "hidden" });
                            $("[href='" + items + "']").removeClass("open");
                            $("html,body").stop(true, true).animate({ scrollTop: 0 }, 500);
                            $(items).stop(true, true).animate({ "right": "-100%", "height": "100%" }, 500, function () {
                                $("#mask-right[data-id='" + items + "']").remove();
                            });
                            return false;
                        });
                        $(items).find("[href='" + items + "']").click(function () {
                            $("#wrapper").css({ "overflow": "hidden" });
                            $(items).stop(false, false).animate({ "right": "-100%", "height": "100%" }, 500, function () {
                                $("[href='" + items + "']").removeClass("open");
                                $("#mask-right[data-id='" + items + "']").remove();
                            });
                            return false;
                        });
                        $(window).resize(function () {
                            mobileRight(items);
                        });
                    }
                    return false;
                });
                function mobileLeft(idmenu) {
                    if ($(window).width() < 768 & obj.hasClass("open")) {
                        $(idmenu).stop(true, true).animate({ "left": 0 }, 500, function () {
                            mymenuheight(idmenu);
                            $("#mask-left[data-id='" + idmenu + "']").show();
                        });
                    } else {
                        $(idmenu).stop(false, true).animate({ "left": "-100%", "height": "100%" }, 500, function () {
                            $("#mask-left[data-id='" + idmenu + "']").hide();
                        });
                    }
                }
                function mobileRight(idmenu) {
                    if ($(window).width() < 768 & obj.hasClass("open")) {
                        $(idmenu).css({ "right" : "-100%", "left": "auto" });
                        $(idmenu).stop(true, true).animate({ "right": 0 }, 500, function () {
                            mymenuheight(idmenu);
                            $("#mask-right[data-id='" + idmenu + "']").show();
                        });
                    } else {
                        $(idmenu).stop(false, true).animate({ "right": "-100%", "height": "100%" }, 500, function () {
                            $("#mask-right[data-id='" + idmenu + "']").hide();
                            $(idmenu).css({"left" : "-100%", "right": "auto" });
                        });
                    }
                }
                function mymenuheight(idmenu) {
                    var hh = $(idmenu).find(".menu-mobile").height() + 30;
                    $(idmenu).height("auto");
                    if (hh > $(document).height()) {
                        $(idmenu).height(hh);
                    } else {
                        $(idmenu).height($(document).height());
                    }
                }
            });
        }
    });
})(jQuery);