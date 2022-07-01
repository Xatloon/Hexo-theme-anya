/* const yaml = require("js-yaml");
const fs = require("fs");

const config = yaml.load(fs.readFileSync("../_config.yml", "utf8"));

console.log(config); */
import "./styl/main.styl";
import "../node_modules/nprogress/nprogress.css";
import "../node_modules/aplayer/dist/APlayer.min.css";
import "../node_modules/zoom-image/css/zoom-image.css";

window.APlayer = require("aplayer");

require("vanilla-lazyload");
require("./js/utils");
require("./js/post-details")();
require("./js/evanyou");
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
