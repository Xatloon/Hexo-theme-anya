// submenu
if (navigator.userAgent.match(/mobile/i)) {
  document.querySelectorAll(".menu-item").forEach((item) => {
    item.addEventListener("click", function () {
      const submenu = this.querySelectorAll(".submenu");
      if (submenu.length) {
        if (submenu.offsetHeight) {
          submenu.forEach((sub) => {
            sub.style.height = "";
          });
        } else {
          submenu.forEach((sub) => {
            sub.style.height = sub.scrollHeight + "px";
          });
        }
      }
    });
  });
} else {
  document.querySelectorAll(".menu-item").forEach((item) => {
    item.addEventListener("mouseover", function () {
      const submenu = this.querySelectorAll(".submenu");
      if (submenu.length) {
        submenu.forEach((sub) => {
          sub.style.height = sub.scrollHeight + "px";
        });
      }
    });
    item.addEventListener("mouseout", function (i) {
      const submenu = this.querySelectorAll(".submenu");
      if (submenu.length) {
        submenu.forEach((sub) => {
          sub.style.height = "";
        });
      }
    });
  });
}
