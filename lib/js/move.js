// Sidebar move
function move() {
  var $sidebar = $("#sidebar"),
    $content = $("#content"),
    $window = $(window),
    offset = $content.offset(),
    offset2 = $sidebar.offset(),
    topPadding = 70;

  $window.on("scroll", function () {
    if ($window.scrollTop() > offset.top - topPadding) {
      $sidebar.css({
        position: "fixed",
        top: topPadding,
        left: offset2.left,
      });
    } else if ($window.scrollTop() < offset.top) {
      $sidebar.css({
        float: "right",
        position: "static",
      });
    }
  });
}

module.exports = move;
