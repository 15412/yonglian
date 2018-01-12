


window.onresize = function(){
    firstInitImg();
}


var firstInitImg = function(){
    var divHeight = parseInt($(".aboutDiv").width()) * 0.58854 + 'px';
    $(".aboutDiv").css("height",divHeight);

    // var midTop = parseInt($(".aboutDiv").height()) * 0.1416 + parseInt($(".navbar").height()) + 'px';
    var midTop = parseInt($(".aboutDiv").height()) * 0.1416  + parseInt($(".aboutDiv").offset().top) + 'px';
    $(".mid1").css("top",midTop);

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
    
    // var allHeight = (parseInt($(".about-bg-08").css("top")) + parseInt($(".about-bg-08").children("img").css("height"))) + 'px';
    // $(".about-empty").css("height",allHeight);

    
}
var initPhotoSwipeFromDOM = function(gallerySelector) {

    // parse slide data (url, title, size ...) from DOM elements 
    // (children of gallerySelector)
    var parseThumbnailElements = function(el) {
        var thumbElements = el.children,
            numNodes = thumbElements.length,
            items = [],
            figureEl,
            linkEl,
            size,
            item;

        for(var i = 0; i < numNodes; i++) {

            figureEl = thumbElements[i]; // <figure> element

            // include only element nodes 
            if(figureEl.nodeType !== 1) {
                continue;
            }

            linkEl = figureEl.children[0].children[0]; // <img> element

            size = linkEl.getAttribute('data-size').split('x');

            // create slide object
            item = {
                src: linkEl.getAttribute('src'),
                w: parseInt(size[0], 10),
                h: parseInt(size[1], 10)
            };



            if(figureEl.children.length > 1) {
                // <figcaption> content
                item.title = figureEl.children[1].innerHTML; 
            }

            if(linkEl.children.length > 0) {
                // <img> thumbnail element, retrieving thumbnail url
                item.msrc = linkEl.children[0].getAttribute('src');
            } 

            item.el = figureEl; // save link to element for getThumbBoundsFn
            items.push(item);
        }

        return items;
    };

    // find nearest parent element
    var closest = function closest(el, fn) {
        return el && ( fn(el) ? el : closest(el.parentNode, fn) );
    };

    // triggers when user clicks on thumbnail
    var onThumbnailsClick = function(e) {
        e = e || window.event;
        e.preventDefault ? e.preventDefault() : e.returnValue = false;

        var eTarget = e.target || e.srcElement;

        // find root element of slide
        var clickedListItem = closest(eTarget, function(el) {
            return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
        });

        if(!clickedListItem) {
            return;
        }

        // find index of clicked item by looping through all child nodes
        // alternatively, you may define index via data- attribute
        var clickedGallery = clickedListItem.parentNode,
            childNodes = clickedListItem.parentNode.children,
            numChildNodes = childNodes.length,
            nodeIndex = 0,
            index;

        for (var i = 0; i < numChildNodes; i++) {
            if(childNodes[i].nodeType !== 1) { 
                continue; 
            }

            if(childNodes[i] === clickedListItem) {
                index = nodeIndex;
                break;
            }
            nodeIndex++;
        }



        if(index >= 0) {
            // open PhotoSwipe if valid index found
            openPhotoSwipe( index, clickedGallery );
        }
        return false;
    };

    // parse picture index and gallery index from URL (#&pid=1&gid=2)
    var photoswipeParseHash = function() {
        var hash = window.location.hash.substring(1),
        params = {};

        if(hash.length < 5) {
            return params;
        }

        var vars = hash.split('&');
        for (var i = 0; i < vars.length; i++) {
            if(!vars[i]) {
                continue;
            }
            var pair = vars[i].split('=');  
            if(pair.length < 2) {
                continue;
            }           
            params[pair[0]] = pair[1];
        }

        if(params.gid) {
            params.gid = parseInt(params.gid, 10);
        }

        return params;
    };

    var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
        var pswpElement = document.querySelectorAll('.pswp')[0],
            gallery,
            options,
            items;

        items = parseThumbnailElements(galleryElement);

        // define options (if needed)
        options = {

            // define gallery index (for URL)
            galleryUID: galleryElement.getAttribute('data-pswp-uid'),

            getThumbBoundsFn: function(index) {
                // See Options -> getThumbBoundsFn section of documentation for more info
                var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                    pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                    rect = thumbnail.getBoundingClientRect(); 

                return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
            }

        };

        // PhotoSwipe opened from URL
        if(fromURL) {
            if(options.galleryPIDs) {
                // parse real index when custom PIDs are used 
                // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                for(var j = 0; j < items.length; j++) {
                    if(items[j].pid == index) {
                        options.index = j;
                        break;
                    }
                }
            } else {
                // in URL indexes start from 1
                options.index = parseInt(index, 10) - 1;
            }
        } else {
            options.index = parseInt(index, 10);
        }

        // exit if index not found
        if( isNaN(options.index) ) {
            return;
        }

        if(disableAnimation) {
            options.showAnimationDuration = 0;
        }

        // Pass data to PhotoSwipe and initialize it
        gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
        gallery.init();
    };

    // loop through all gallery elements and bind events
    var galleryElements = document.querySelectorAll( gallerySelector );

    for(var i = 0, l = galleryElements.length; i < l; i++) {
        galleryElements[i].setAttribute('data-pswp-uid', i+1);
        galleryElements[i].onclick = onThumbnailsClick;
    }

    // Parse URL and open gallery if it contains #&pid=3&gid=1
    var hashData = photoswipeParseHash();
    if(hashData.pid && hashData.gid) {
        openPhotoSwipe( hashData.pid ,  galleryElements[ hashData.gid - 1 ], true, true );
    }
};

window.onload = function () {
    initPhotoSwipeFromDOM('.my-gallery');
    firstInitImg();
};