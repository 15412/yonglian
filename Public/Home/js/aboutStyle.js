
window.onresize = function(){
    var img2Top = (parseInt($(".left1").css("top")) + parseInt($(".left1").children("img").css("height")) * 0.98) + 'px';
    $(".left2").css("top",img2Top);
    $(".right2").css("top",img2Top);
    var img3Top = (parseInt($(".left2").css("top")) + parseInt($(".left2").children("img").css("height")) * 0.98) + 'px';
    $(".left3").css("top",img3Top);
    $(".right3").css("top",img3Top);
    var img4Top = (parseInt($(".left3").css("top")) + parseInt($(".left3").children("img").css("height")) * 0.98) + 'px';
    $(".left4").css("top",img4Top);
    $(".right4").css("top",img4Top);
    var img4Top = (parseInt($(".left3").css("top")) + parseInt($(".left3").children("img").css("height")) * 0.8) + 'px';
    $(".mid2").css("top",img4Top);
    var contentTop = (parseInt($(".mid2").css("top")) + parseInt($(".mid2").children("img").css("height")) * 1.33) + 'px';;
    $(".aboutContent").css("top",contentTop);
}

// var pswpElement = document.querySelectorAll('.pswp')[0];

// // build items array
// var items = [
//     {
//         src: 'https://placekitten.com/600/400',
//         w: 600,
//         h: 400
//     },
//     {
//         src: 'https://placekitten.com/1200/900',
//         w: 1200,
//         h: 900
//     }
// ];

// // define options (if needed)
// var options = {
//     // optionName: 'option value'
//     // for example:
//     index: 0 // start at first slide
// };

// // Initializes and opens PhotoSwipe
// var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
// gallery.init();