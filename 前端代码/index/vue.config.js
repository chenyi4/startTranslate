const webpack = require('webpack')
module.exports = {
  runtimeCompiler: true, //路由的配置报错
  lintOnSave: false,
  devServer: {
    port: 7771,
    proxy: {
      '/': {
        // target: 'http://10.111111:8080', //
        // target: 'http://10.12.42.127:8090/', //
        target: 'http://localhost:3000',
        changeOrigin: true,
        pathRewrite: {
            "/login": "/"
        }
      }
    }
   },
  publicPath: './'
}