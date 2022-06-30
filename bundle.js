const { build } = require("esbuild");
const { stylusLoader } = require("esbuild-stylus-loader");

build({
  entryPoints: ["./lib/styl/index.js"],
  bundle: true,
  outdir: "./source/css",
  plugins: [
    stylusLoader({
      stylusOptions: {
        includeCss: true,
      },
    }),
  ],
}).then((result) => {});
