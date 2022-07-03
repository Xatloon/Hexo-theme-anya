if (!Ania.utils.isMobile()) {
  // 判断位置控制 返回顶部的显隐
  var backTo = document.querySelector(".back-to-top");
  var backHeight = window.innerHeight - 980 + "px";
  document.addEventListener("scroll", function () {
    if (this.documentElement.scrollTop > 700 && backTo.style.top === "-900px") {
      backTo.style.top = backHeight + "";
    } else if (
      this.documentElement.scrollTop <= 700 &&
      backTo.style.top !== "-900px"
    ) {
      backTo.style.top = "-900px";
    }
  });

  //Back to top
  document.querySelector(".back-to-top").addEventListener("click", () => {
    window.scroll({
      top: 0,
      left: 0,
      behavior: "smooth",
    });
  });
}
