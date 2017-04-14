(function ($) {
    function pageLoad() {

    }
    $(window).load(function () {
        // slider banner
        $('#slidernopage').nivoSlider({
            pauseTime: 4000,
            pauseOnHover: false,
            controlNav: true,
            directionNav: false
        });
    });
    $(function () {
        $(".panel-left").mobilepanel();
        $(".panel-right").mobilepanel({ panelLeft: false });
        $("#menu > li").not(".home").clone().appendTo($(".menu-mobile > .menu-nav"));
        if ($(".product-slider").size() > 0) {
            $(".product-slider .jcarousel-wrapper").textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-name" }], // css text height
                wpointb: true,
                widthpont: 359,
                desbool: true,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                max: true //max or min 
            }).jcarouselbox({
                autos: true,
                pausehover: true,
                pager: false, //pager num
                wipont: [{ widthpoint: "970", numcount: "4" }, { widthpoint: "639", numcount: "3" }, { widthpoint: "359", numcount: "2" }],
                timespees: 3000,
                wrapsroll: true
            });
        }
        if ($('.details-four').size() > 0) {
            var countlis = $('.details-four .slick-iteams').size();
            if ($("#detailsImg").size() == 1) {
                $("#detailsImg").append('<div class="detail-mobile"><div class="details-mobile"></div></div>');
                $("#detailsImg .details-four .slick-iteams").each(function (e) {
                    $("#detailsImg .details-mobile").append('<div class="slick-iteams"></div>');
                    var srcimg = $(this).attr("data-img");
                    $("#detailsImg .details-mobile .slick-iteams:eq(" + e + ")").append('<img src="' + srcimg + '" alt=""/>');
                });
                $("#detailsImg .details-mobile").slick({
                    dots: true,
                    infinite: false
                });
            }
            $('.details-four').slick({
                dots: false,
                infinite: false,
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: false,
                autoplaySpeed: 3000
            });
            if (countlis < 2) {
                $(".wrap-small").hide();
            }
            $('.details-four .small-in').click(function () {
                $('.details-four .slick-slide').removeClass('current');
                $(this).parents('.slick-slide').addClass('current');
            });
            $('.details-four .slick-active:first .small-in').trigger("click");
        }
        mymenudes();
        menusroll();
        $("#sroltop a").click(function () {
            $("html, body").stop(true, true).animate({ scrollTop: 0 }, 500);
            return false;
        });
        mymap();
        mysroll();
        mapfooterre();
        
    });
    //function===============================================================================================
    // function mymenudes() use hover menu show menusub
    function mymenudes() {
        mymenusub();
        $(window).resize(function () {
            mymenusubre();
        });
        $("#menu li").hover(function () {
            $(this).find(".menu-sub:first").stop(true, true).slideDown();
        }, function () {
            $(this).find(".menu-sub:first").stop(true, true).slideUp();
        });
    }
    function mymenusub() {
        $("#menu").addClass("show-menu").find(".menu-sub").show();
        $("#menu li").each(function () {
            var wsub = $(this).find(".menu-sub:first").width();
            $(this).find(".menu-sub:first").width(wsub).attr("data-width", wsub);
            var position = $(this).position();
            var leftmenu = position.left;
            var menuw = $("#menu").width() - leftmenu;
            if (menuw < wsub) {
                $(this).find(".menu-sub:first").addClass("menu-right");
            }
        });
        $("#menu").removeClass("show-menu").find(".menu-sub").hide();
        //            $("#menu").removeClass("show-menu");
    }
    function mymenusubre() {
        $("#menu li").each(function () {
            var wsub = $(this).find(".menu-sub:first").attr("data-width");
            var position = $(this).position();
            var leftmenu = position.left;
            var menuw = $("#menu").width() - leftmenu;
            if (menuw < wsub) {
                $(this).find(".menu-sub:first").addClass("menu-right");
            } else {
                $(this).find(".menu-sub:first").removeClass("menu-right");
            }
        });
    }
    function mysroll() {
        mysrol();
        $(window).scroll(function () {
            mysrol();
        });
    }
    function mysrol() {
        var topsroll = $(window).scrollTop();
        if (topsroll > 100) {
            $("#sroltop").stop(true, true).animate({ "opacity": 0.5 }, 500);
        } else {
            $("#sroltop").stop(true, true).animate({ "opacity": 0 }, 500);
        }
    }
    // function menusroll() when scroll menu always top not scroll
    function menusroll() {
        var htop = $("#header").height();
        srollmenu(htop);
        $(window).scroll(function () {
            srollmenu(htop);
        });
    }
    function srollmenu(htop) {
        if ($(window).scrollTop() > htop) {
            $("#header-menu").addClass("header-sroll");
        } else {
            $("#header-menu").removeClass("header-sroll");
        }
    }
    function mapfooterre() {
        mapfooters();
        var timeout;
        $(window).resize(function () {
            clearTimeout(timeout);
            setTimeout(function () {
                mapfooters();
            }, 500);
        });
    }
    function mapfooters() {
        $('.map-footer').remove();
        if ($(window).width() > 768) {
            $('#sharemap').after('<div class="map-footer"><iframe id="iframe" src="mapfooter.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
        }
    }
    /*===============================*/
    function mymap() {
        mympp();
        var timeout;
        $(window).resize(function () {
            clearTimeout(timeout);
            setTimeout(function () {
                mympp();
            }, 500);
        });
    }
    function mympp() {
        $('#mapwrap').remove();
        if ($(window).width() > 768) {
            $('#map').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
        }
    }
})(jQuery);

