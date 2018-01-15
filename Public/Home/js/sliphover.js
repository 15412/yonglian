/**
 * sliphover v2.0.5
 * require jquery 1.7+
 * wayou June 24, 2014,
 * MIT License
 * for more info pls visit :https://github.com/wayou/SlipHover
 */
!function (e, t) {
    function i(t, i) {
        this.element = t, this.settings = e.extend({}, r, i), this._defaults = r, this._name = o, this.version = "v2.0.5", this.init()
    }

    var o = "sliphover", r = {
        target: "img",
        caption: "title",
        duration: "fast",
        fontColor: "#fff",
        textAlign: "center",
        verticalMiddle: !0,
        backgroundColor: "rgba(0,0,0,.7)",
        backgroundColorAttr: null,
        reverse: !1,
        height: "100%",
        withLink: !0
    };
    i.prototype = {
        init: function () {
            if (!/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                var t = this, i = this.settings.target;
                e(this.element).off("mouseenter.sliphover", i).on("mouseenter.sliphover", i, function () {
                    var i = e(this), o = t.createContainer(i);
                    o.off("mouseenter.sliphover mouseleave.sliphover").on("mouseenter.sliphover mouseleave.sliphover", function (r) {
                        var n = t.getDirection(e(this), r);
                        if (n = t.settings.reverse ? n = (n + 2) % 4 : n, "mouseenter" === r.type) {
                            var s = o.find(".sliphover-overlay");
                            s.length || (s = t.createOverlay(t, n, i), e(this).html(s)), t.slideIn(t, s)
                        } else t.removeOverlay(t, e(this), n)
                    })
                })
            }
        }, createContainer: function (t) {
            var i = t.offset().top, o = t.offset().left, r = t.outerWidth(), n = t.outerHeight();
            zIndex = t.css("z-index");
            var s = e("<div>", {"class": "sliphover-container"}).css({
                width: r,
                height: n,
                position: "absolute",
                overflow: "hidden",
                top: i,
                left: o,
                borderRadius: t.css("border-radius"),
                zIndex: zIndex == +zIndex ? zIndex + 1 : 999
            });
            return e("body").append(s), s
        }, createOverlay: function (i, o, r) {
            var n, s, a, l, h, c;
            switch (o) {
                case 0:
                    s = 0, n = "100%";
                    break;
                case 1:
                    s = "100%", n = 0;
                    break;
                case 2:
                    s = 0, n = "-100%";
                    break;
                case 3:
                    s = "-100%", n = 0;
                    break;
                default:
                    t.console.error("error when get direction of the mouse")
            }
            if (h = i.settings.verticalMiddle ? e("<div>").css({
                    display: "table-cell",
                    verticalAlign: "middle"
                }).html(r.attr(i.settings.caption)) : r.attr(i.settings.caption), c = r.parent("a"), c.length && i.settings.withLink) {
                var d = c.attr("href"), f = c.attr("target");
                a = e("<a>", {
                    "class": "sliphover-overlay",
                    href: d || "#",
                    target: f || "_self"
                }).css({textDecoration: "none"})
            } else a = e("<div>", {"class": "sliphover-overlay"});
            return l = i.settings.backgroundColorAttr ? r.attr(i.settings.backgroundColorAttr) : i.settings.backgroundColor, a.css({
                width: "100%",
                height: i.settings.height,
                position: "absolute",
                left: s,
                bottom: n,
                display: i.settings.verticalMiddle ? "table" : "inline",
                textAlign: i.settings.textAlign,
                color: i.settings.fontColor,
                backgroundColor: l
            }).html(h), a
        }, slideIn: function (e, t) {
            t.stop().animate({left: 0, bottom: 0}, e.settings.duration)
        }, removeOverlay: function (e, i, o) {
            var r, n = i.find(".sliphover-overlay");
            switch (o) {
                case 0:
                    r = {bottom: "100%", left: 0};
                    break;
                case 1:
                    r = {bottom: 0, left: "100%"};
                    break;
                case 2:
                    r = {bottom: "-100%", left: 0};
                    break;
                case 3:
                    r = {bottom: 0, left: "-100%"};
                    break;
                default:
                    t.console.error("error when get direction of the mouse")
            }
            n.stop().animate(r, e.settings.duration, function () {
                i.remove()
            })
        }, getDirection: function (e, t) {
            var i = e.width(), o = e.height(), r = (t.pageX - e.offset().left - i / 2) * (i > o ? o / i : 1), n = (t.pageY - e.offset().top - o / 2) * (o > i ? i / o : 1), s = Math.round((Math.atan2(n, r) * (180 / Math.PI) + 180) / 90 + 3) % 4;
            return s
        }
    }, e.fn[o] = function (t) {
        return this.each(function () {
            e.data(this, "plugin_" + o) || e.data(this, "plugin_" + o, new i(this, t))
        }), this
    }
}(jQuery, window, document);