(function ($) {
    $.fn.extend({

        jcarouselbox: function (options) {

            // Đặt các giá trị mặc định
            var defaults = {
                autos: true,
                pausehover: true,
                pager: true, //pager num
                timespees: 3000,
                wipont: [{ widthpoint: "768", numcount: "3" }, { widthpoint: "360", numcount: "2"}],
                wrapsroll: true
            };

            var options = $.extend(defaults, options);
            return this.each(function () {
                // Đặt tên biến cho element (ul)
                var obj = $(this);
                var opts = options;
                var jcarousel = $(this).find('.jcarousel');

                jcarousel.on('jcarousel:reload jcarousel:create', function () {
                    $(this).width("auto");
                    var carousel = $(this);
                    var width = carousel.width();
                    var widthw = 0;
                    var numsroll = 0;
                    var countli = $(this).find("li").size();
                    var numli = 0;
                    var lenw = opts.wipont.length;
                    for (var i = 0; i < lenw; i++) {
                        if (width > opts.wipont[i].widthpoint) {
                            numli = opts.wipont[i].numcount;
                            widthw = width / numli;
                            break;
                        } else {
                            numli = opts.wipont[i].numcount;
                            widthw = width / numli;
                        }
                    }
                    var wend = opts.wipont[lenw - 1].widthpoint;
                    if (width < wend) {
                        widthw = width;
                        numli = 1;
                    }
                    carousel.jcarousel('items').css('width', Math.ceil(widthw) + 'px');
                    $(this).width(Math.ceil(widthw) * numli);
                    if (numli < countli) {
                        $(this).parent().find(".navigation-btn").removeClass('inactive-none');
                    } else {
                        $(this).parent().find(".navigation-btn").addClass('inactive-none');
                    }
                    $(this).parent().find('.jcarousel-prev').jcarouselControl({
                        target: '-=1'
                    });
                    $(this).parent().find('.jcarousel-next').jcarouselControl({
                        target: '+=1'
                    });
                    if (opts.autos) {
                        $(this).jcarouselAutoscroll({
                            interval: opts.timespees,
                            autostart: opts.autos
                        });
                    }
                });
                // Thêm sự kiện 
                if (opts.wrapsroll) {
                    jcarousel.jcarousel({
                        wrap: 'circular'
                    });
                } else {
                    jcarousel.jcarousel({
                        wrap: 'both'
                    });
                }
                if (opts.autos) {
                    if (opts.pausehover) {
                        jcarousel.hover(function () {
                            $(this).jcarouselAutoscroll('stop');
                        }, function () {
                            $(this).jcarouselAutoscroll('start');
                        });
                    }
                }
                obj.swipe({
                    swipeLeft: function () {
                        obj.find('.jcarousel-next').trigger("click");
                    },
                    swipeRight: function () {
                        obj.find('.jcarousel-prev').trigger("click");
                    }
                });
//                var swipeOptions = {
//                    triggerOnTouchEnd: true,
//                    swipeStatus: swipeStatus
//                };
//                obj.swipe(swipeOptions);
//                /**
//                * Catch each phase of the swipe.
//                * move : we drag the div
//                * cancel : we animate back to where we were
//                * end : we animate to the next image
//                */
//                function swipeStatus(event, phase, direction, distance) {
//                    //If we are moving before swipe, and we are going L or R in X mode, or U or D in Y mode then drag.
//                    if (phase == "move" && (direction == "left" || direction == "right")) {
//                        if (direction == "left") {
//                            obj.find('.jcarousel-next').trigger("click");
//                        } else if (direction == "right") {
//                            obj.find('.jcarousel-prev').trigger("click");
//                        }

//                    } 
//                }
                // pager
                if (opts.pager) {
                    obj.append('<div class="jcarousel-pagination"></div>');

                    obj.find('.jcarousel-pagination').on('jcarouselpagination:active', 'a', function () {
                        $(this).addClass('active');
                    })
                        .on('jcarouselpagination:inactive', 'a', function () {
                            $(this).removeClass('active');
                        })
                        .on('click', function (e) {
                            e.preventDefault();
                        })
                        .jcarouselPagination({
                            perPage: 1,
                            item: function (page) {
                                return '<a href="#' + page + '">' + page + '</a>';
                            }
                        });
                }
            });
        }
    });
})(jQuery);