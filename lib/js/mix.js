// subtitle
if (navigator.userAgent.match(/mobile/i)) {
  $(".menu-item").on("click", function () {
    const subtitle = $(this).find(".submenu");
    if (subtitle.length) {
      if (subtitle.height()) {
        subtitle.css({
          height: "",
        });
      } else {
        subtitle.css({
          height: subtitle[0].scrollHeight,
        });
      }
    }
  });
} else {
  $(".menu-item").hover(
    function () {
      const subtitle = $(this).find(".submenu");
      if (subtitle.length) {
        subtitle.css({
          height: subtitle[0].scrollHeight,
        });
      }
    },
    function () {
      const subtitle = $(this).find(".submenu");
      if (subtitle.length) {
        subtitle.css({
          height: "",
        });
      }
    }
  );
}
