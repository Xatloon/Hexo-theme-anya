require("regenerator-runtime/runtime");

window.FastClick = require("fastclick");
require("lazyload");

window.notie = require("corner-notie");
window.APlayer = require("aplayer");
window.DPlayer = require("dplayer");

require("./utils");
require("./motion");
require("./scrollspy");
require("./post-details")();
require("./bootstrap");
require("./evanyou");
require("./leancloud")();
require("./share")();
require("./scroll");
require("./since");
require("./title");
require("./type");
require("./mix");
require("./clipboard");
require("./pjax");
require("./search");
require("./zoom")();
require("./cursor-effects");
