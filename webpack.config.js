/* eslint-disable no-undef */
const path = require("path");
const TerserPlugin = require("terser-webpack-plugin");

module.exports = {
  mode: "production",

  bail: true,

  devtool: "source-map",

  entry: {
    sagiri: "./src/index.js",
  },

  output: {
    path: path.resolve(__dirname, "source", "js"),
    filename: "[name].min.js",
    publicPath: "/",
  },

  resolve: {
    modules: ["node_modules"],
    extensions: [".js"],
  },

  module: {
    strictExportPresence: true,
    rules: [
      {
        test: /\.js$/,
        use: [
          {
            loader: require.resolve("babel-loader"),
            options: {
              compact: true,
              presets: ["@babel/preset-env"],
            },
          },
        ],
      },
    ],
  },

  optimization: {
    minimize: true,
    minimizer: [
      new TerserPlugin({
        extractComments: false,
      }),
    ],
  },
};
