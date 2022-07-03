const Pjax = require("../../node_modules/pjax/index");

const NProgress = require("nprogress");

NProgress.configure({
  showSpinner: false,
  easing: "ease-out",
  speed: 1000,
});

var pjax = new Pjax({
  elements: 'a:not([target="_blank"])',
  selectors: ["#main", "title"],
  cacheBust: false,
  scrollTo: false,
  timeout: 5000,
});

document.addEventListener("pjax:send", function () {
  NProgress.start();
  scrollTo(0, document.querySelector(".site-brand-bg").offsetHeight - 56);
});

document.addEventListener("pjax:complete", function () {
  NProgress.done();

  require("./post-details")();
  require("./zoom")();
  require("./move")();

  document.querySelectorAll(".site-overview, .post-toc").forEach(function (el) {
    el.style.maxHeight = document.body.clientHeight - 164 + "px";
  });
});
