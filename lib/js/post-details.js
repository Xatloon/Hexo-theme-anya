const MenuScrollspy = require("../../node_modules/vanilla-js-menu-scrollspy/dist/menu-scrollspy");

function postDetails() {
  const menuScrollSpy = new MenuScrollspy({
    classMenuItem: ".nav-item",
  });

  document.querySelectorAll(".sidebar-nav li").forEach((el) => {
    el.addEventListener("click", function () {
      var activeTabClassName = "sidebar-nav-active";
      var activePanelClassName = "sidebar-panel-active";

      var currentTarget = document.querySelector("." + activePanelClassName);
      var target = document.querySelector("." + this.dataset["target"]);

      currentTarget.style.display = "none";
      currentTarget.classList.remove(activePanelClassName);
      target.style.display = "block";
      target.classList.add(activePanelClassName);

      [...el.parentElement.children].forEach((child) => {
        child.classList.remove(activeTabClassName);
      });
      el.classList.add(activeTabClassName);
    });
  });
}
module.exports = postDetails;
