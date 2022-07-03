// Sidebar move
function move() {
  var sidebar = document.querySelector("#sidebar"),
    content = document.querySelector("#content"),
    topPadding = 70;

  document.addEventListener("scroll", function () {
    if (this.documentElement.scrollTop > content.offsetTop - topPadding) {
      sidebar.style.top = topPadding + "px";
      sidebar.style.left = sidebar.offsetLeft + "px";
      sidebar.style.position = "fixed";
    } else if (this.documentElement.scrollTop < content.offsetTop) {
      sidebar.style.position = "static";
      sidebar.style.float = "right";
    }
  });
}

module.exports = move;
