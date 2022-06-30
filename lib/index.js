import "./styl/main.styl";
import "../node_modules/aplayer/dist/APlayer.min.css";
import "../node_modules/zoom-image/css/zoom-image.css";
import "../node_modules/disqusjs/dist/styles/disqusjs.css";
import "../node_modules/nprogress/nprogress.css";

window.FastClick = require("fastclick");
require("vanilla-lazyload");

window.APlayer = require("aplayer");
window.DPlayer = require("dplayer");

require("./js/utils");
require("./js/post-details")();
require("./js/evanyou");
require("./js/share")();
require("./js/scroll");
require("./js/since");
require("./js/title");
require("./js/type");
require("./js/mix");
require("./js/clipboard");
require("./js/pjax");
require("./js/search");
require("./js/zoom")();
require("./js/cursor-effects");
require("./js/scrollspy");