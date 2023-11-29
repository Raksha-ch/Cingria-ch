$(window).load(function () {

    $('#masonry').masonry({
        singleMode: true,
        itemSelector: '.masonry_item'
    });

});

$(document).ready(function () {
    $(".masonry_item img").fullsize({
        shadow: true,
        forceTitleBar: false
    });

    $('#to_top, #signature_text').fadeTo(0, 0.5);
    $('#signature_arrow').fadeTo(0, 0);
    $('#to_top, #signature_text2').fadeTo(0, 0.5);
    $('#signature_arrow2').fadeTo(0, 0);

    $('#to_top').mouseover(function () {
        $(this).stop().fadeTo(100, 1);
    }).mouseout(function () {
        $(this).stop().fadeTo(500, 0.5);
    });

    $('#signature_text').hover(
        function () {
            $(this).stop().fadeTo(100, 1).animate({
                marginLeft: '6px'
            }, 80, function () {
                $('#signature_arrow').fadeTo(100, 1)
            });
        },
        function () {
            $(this).stop().fadeTo(500, 0.5).animate({
                marginLeft: '0'
            }, 120, function () {
                $('#signature_arrow').fadeTo(100, 0);
            });
        }
    );

    $('#signature_text2').hover(
        function () {
            $(this).stop().fadeTo(100, 1).animate({
                marginLeft: '6px'
            }, 80, function () {
                $('#signature_arrow2').fadeTo(100, 1)
            });
        },
        function () {
            $(this).stop().fadeTo(500, 0.5).animate({
                marginLeft: '0'
            }, 120, function () {
                $('#signature_arrow2').fadeTo(100, 0);
            });
        }
    );

    var list_items = $('#main_oc').find('li');
    $.each(list_items, function (key) {
        key = key + 1;
        $(this).prepend('<img src="img/icons/' + key + '.png" alt="' + key + '" />');
    });


    $('#hidden_contact').hide();
    $('#contribute').toggle(function () {
        $('#hidden_contact').fadeIn('300');
    }, function () {
        $('#hidden_contact').hide();
    });


    $('.book').hover(function () {
        $(this).children('.book_title').delay(120).stop().fadeIn();
    }, function () {
        $(this).children('.book_title').delay(120).stop().fadeOut();
    });

    $('#bio').find('p:nth-child(2)').hide();

    $('#show_more').click(function () {

        $('#bio').find('p:nth-child(2)').slideToggle('fast');
        text = $(this).text() == 'lire la suite de la notice' ? 'réduire la notice' : 'lire la suite de la notice';
        $(this).text(text);
    });

    $('#contact_info').hide();
    $('#contact').click(function () {

        $('#contact_info').slideToggle('fast');
        return false;

    });

    $('#to_top').click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 'slow');
    });

    $('blockquote').quovolver(500, 18000);

});

$(window).load(function () {
    setInterval(function () {
        $('#slides_main :nth-child(1)').next().show().end().fadeOut(1200).appendTo('#slides_main');
    }, 12000);
    setInterval(function () {
        $('#slides_main_right :nth-child(1)').next().show().end().fadeOut(1200).appendTo('#slides_main_right');
    }, 10000);
});

$('<?php print $slideshow_1 ?>').insertAfter('#main_text p:first-child');
$('<?php print $slideshow_2 ?>').insertAfter('#main_text p:nth-child(4)');

$(function () {
    $("#order_box").jScroll();
});


$('.sub').hide();
$('.toggler').click(function () {
    $(this).next('.sub').toggle();
    $(this).find('.toggle_btn').toggleClass('plus');

    if ($(this).find('.toggle_btn').hasClass('plus')) {

        $.scrollTo($(this).next('.sub'), 1400, {
            easing: "easeInOutExpo"
        });

    }

});


$('.close_sub').click(function () {

    $.scrollTo($(this).parent().parent().parent(), 1400, {
        easing: "easeInOutExpo"
    });


});

// Once the video is ready
_V_("example_video_1").ready(function () {

    var myPlayer = this; // Store the video object
    var aspectRatio = 9 / 16; // Make up an aspect ratio

    function resizeVideoJS() {
        // Get the parent element's actual width
        var width = document.getElementById(myPlayer.id).parentElement.offsetWidth;
        // Set width to fill parent element, Set height
        myPlayer.width(width).height(width * aspectRatio);
    }

    resizeVideoJS(); // Initialize the function
    window.onresize = resizeVideoJS; // Call the function on resize
});
