SagiriX.utils = {
  hasMobileUA: function () {
    var nav = window.navigator;
    var ua = nav.userAgent;
    var pa =
      /iPad|iPhone|Android|Opera Mini|BlackBerry|webOS|UCWEB|Blazer|PSP|IEMobile|Symbian/g;

    return pa.test(ua);
  },

  isMobile: function () {
    return window.screen.width < 767 && this.hasMobileUA();
  },

  /**
   * Escape meta symbols in jQuery selectors.
   *
   * @param selector
   * @returns {string|void|XML|*}
   */
  escapeSelector: function (selector) {
    return decodeURIComponent(selector).replace(
      /[!"$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g,
      "\\$&"
    );
  },

  getScrollbarWidth: function () {
    var $div = $("<div />").addClass("scrollbar-measure").prependTo("body");
    var div = $div[0];
    var scrollbarWidth = div.offsetWidth - div.clientWidth;

    $div.remove();

    return scrollbarWidth;
  },
};

$(function () {
  initSidebarDimension();
  /**
   * Init Sidebar & TOC inner dimensions on all pages and for all schemes.
   * Need for Sidebar/TOC inner scrolling if content taller then viewport.
   */
  function initSidebarDimension() {
    var updateSidebarHeightTimer;

    $(window).on("resize", function () {
      updateSidebarHeightTimer && clearTimeout(updateSidebarHeightTimer);

      updateSidebarHeightTimer = setTimeout(function () {
        var sidebarWrapperHeight = document.body.clientHeight - 164;

        updateSidebarHeight(sidebarWrapperHeight);
      }, 0);
    });

    // Initialize Sidebar & TOC Width.
    var scrollbarWidth = SagiriX.utils.getScrollbarWidth();
    if ($(".sidebar-panel").height() > document.body.clientHeight - 164) {
      $(".site-overview").css("width", "calc(100% + " + scrollbarWidth + "px)");
    }
    $(".post-toc").css("width", "calc(100% + " + scrollbarWidth + "px)");

    // Initialize Sidebar & TOC Height.
    updateSidebarHeight(document.body.clientHeight - 164);
  }

  function updateSidebarHeight(height) {
    height = height || "auto";
    $(".site-overview, .post-toc").css("max-height", height);
  }
});
