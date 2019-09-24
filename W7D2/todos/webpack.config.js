const path = require("path");

module.exports = {
  context: __dirname,
  entry: "./frontend/todo_redux.jsx", // any time you edit this file, re-start webpack
  output: {
    path: path.resolve("app/assets/javascripts"),
    filename: "bundle.js"
  },
  resolve: {
    extensions: [".js", ".jsx", "*"]
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules)/,
        use: {
          loader: "babel-loader",
          query: {
            presets: ["@babel/env", "@babel/react"]
          }
        }
      }
    ]
  },
  devtool: "source-map"
};
