
window.onresize = function(){
    var img1Top = (parseInt($(".mid1").css("top")) + parseInt($(".mid1").children("img").css("height")) * 0.5) + 'px';
    $(".left1").css("top",img1Top);
    $(".right1").css("top",img1Top);
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
    var about1Top = parseInt($(".left1").css("top")) - parseInt($(".about-bg-01").children("img").css("height")) + 'px';
    $(".about-bg-01").css("top",about1Top);
    var about2Top = (parseInt($(".left3").css("top")) + parseInt($(".left3").children("img").css("height")) * 0.5) + 'px';
    $(".about-bg-02").css("top",about2Top);
    var about3Top = (parseInt($(".aboutContent").css("top")) + parseInt($(".aboutContent").children("p").css("height")) * 0.5) + 'px';
    $(".about-bg-03").css("top",about3Top);
    var about4Top = (parseInt($(".left2").css("top")) + parseInt($(".left2").children("img").css("height")) * 2 / 3) + 'px';
    $(".about-bg-04").css("top",about4Top);
    var about5Top = parseInt($(".right1").css("top")) - parseInt($(".about-bg-05").children("img").css("height")) + 'px';
    $(".about-bg-05").css("top",about5Top);
    var about6Top = (parseInt($(".right1").css("top")) + parseInt($(".right1").children("img").css("height")) * 4 / 5) + 'px';
    $(".about-bg-06").css("top",about6Top);
    var about7Top = parseInt($(".right4").css("top")) + 'px';
    $(".about-bg-07").css("top",about7Top);
    var about8Top = (parseInt($(".aboutContent").css("top"))) + 'px';
    $(".about-bg-08").css("top",about8Top);


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