const MenuScrollspy = require("../../node_modules/vanilla-js-menu-scrollspy/dist/menu-scrollspy");

function postDetails() {
  window.addEventListener("load", function () {
    const menuScrollSpy = new MenuScrollspy({
      classMenuItem: ".nav-item",
    });
  });
}

module.exports = postDetails;
