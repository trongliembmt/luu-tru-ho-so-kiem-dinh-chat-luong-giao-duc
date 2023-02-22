$(document).ready(function () {
    new WOW().init();
    var html = '<ul class="nav-mobile">' + $('.main-nav .nav').html() + '</ul>';
    $('.mobile-wrap-menu .content').html(html);
    //Click event to scroll to top
    $('.scroll-to-top').click(function () {
        $('html').animate({ scrollTop: 0 }, 800);
        return 0;
    });
    $(".header .nav li").each(function () {
        if ($(this).has("ul").length) {
            $(this).find('a').eq(0).addClass('hassub');
        };
    });
    setMenuWidth();
    function setMenuWidth() {
        var menuW = $(".nav").width() * 110 / 100;
        var left = ($(".nav").width() - menuW) / 2;
        $(".nav > li > ul").css({
            'width': menuW,
            'left': left,
        });
    }
    $(".nav > li").hover(function () {
        $(this).addClass('show');
        $(this).find('li').eq(0).addClass('show');
    }, function () {
        $(this).removeClass('show');
    });
    $(".nav > li > ul > li").hover(function () {
        $(this).closest('ul').find('li').eq(0).removeClass('show');
        $(this).addClass('show');
    }, function () {
        $(this).removeClass('show');
        $(this).closest('ul').find('li').eq(0).addClass('show');
    });
    $(".nav li").each(function (index) {
        if ($(this).has("ul").length) {
            $(this).find('a').eq(0).addClass('hassub').attr('href', 'javascript:void(0)');
        };
    });
    //Mobile menu script
    if ($('.nav-mobile').length) {
        headHmtl = '<div class="head"><span class="icon closeSub"><i class="fa fa-arrow-left"></i></span><span class="head-text"></span></div>';
        $(".nav-mobile li").each(function (index, obj) {
            if ($(this).has("ul").length) {
                $(this).find('ul').eq(0).wrap('<div class="sub-menu"></div>').before(headHmtl);
                var headText = $(this).find('a').eq(0).html();
                $(this).find('.head-text').html(headText);
                $(this).find('a').eq(0).addClass('hassub').attr('href', 'javascript:void(0)');
            };
        });
        var html = '<ul class="lang">' + $('.header .lang').html() + '</ul>';
        $('.mobile-wrap-menu > .head').append(html);
        $('.nav-mobile li a').click(function (event) {
            $(this).closest('li').find('div').eq(0).attr('visible', 'true');
        });
        $('.mobile-wrap-menu .closeSub, .sub-menu .head .head-text').click(function (event) {
            $(this).closest('.sub-menu').attr('visible', 'false');
        });
        $('.trigger-menu').click(function () {
            $('.three-bars-icon').addClass('close');
            $('.slidebar').addClass('show');
            addOverlay('body');
        });
        $('.closeSidebar').click(function (event) {
            if ($('.slidebar').hasClass('show')) {
                $('.slidebar').removeClass('show');
            }
            if ($('.three-bars-icon').hasClass('close')) {
                $('.three-bars-icon').removeClass('close');
            }
            removeOverlay('body');
        });
        $('body').on('click', '.overlay', function (event) {
            event.preventDefault();
            if ($('.slidebar').hasClass('show')) {
                $('.slidebar').removeClass('show');
            }
            if ($('.three-bars-icon').hasClass('close')) {
                $('.three-bars-icon').removeClass('close');
            }
            removeOverlay('body');
        });
        function addOverlay(parent) {
            if (!$(parent + ' .overlay').length) {
                $(parent).prepend('<div class="overlay"></div>');
            }
        }
        function removeOverlay(parent) {
            if ($(parent + ' .overlay').length) {
                $(parent + ' .overlay').remove();
            }
        }
    }
    //End Mobile menu script
    $(window).resize(function () {
        clearTimeout(window.resizeEvt);
        window.resizeEvt = setTimeout(function () {
            if ($('.slidebar').hasClass('show')) {
                $('.slidebar').removeClass('show');
            }
            if ($('.three-bars-icon').hasClass('close')) {
                $('.three-bars-icon').removeClass('close');
            }
            setMenuWidth();
        }, 250);
    });
    $(window).bind('resize', function (e) {
        window.resizeEvt;
        $(window).resize(function () {
            clearTimeout(window.resizeEvt);
            window.resizeEvt = setTimeout(function () {
                if ($('.slidebar').hasClass('show')) {
                    $('.slidebar').removeClass('show');
                }
                if ($('.three-bars-icon').hasClass('close')) {
                    $('.three-bars-icon').removeClass('close');
                }
                setMenuWidth();
            }, 100);
        });
    });
});
$(function () {
    // if (jQuery(window).trigger('resize').trigger('scroll');) {}
    $(window).scroll(function () {
        if ($(this).scrollTop() > 40) {
            if ($(window).width() > 1024) {
                if (!$('.header').hasClass('small')) {
                    $('.header').addClass('small');
                }
                $('.header').css('background-color', '#fff');
            }
            else {
                $('.header').css('background-color', '#fff');
            }
        } else {
            if ($('.header').hasClass('small')) {
                $('.header').removeClass('small');
            }
            if ($(window).width() < 1024) {
                $('.header').css('background-color', 'rgba(255, 255, 255, 0.5)');
            }
            else {
                $('.header').removeAttr('style');
            }
        }

    });
})