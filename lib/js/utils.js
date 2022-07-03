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
};
