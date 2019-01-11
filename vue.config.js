const path = require('path');

// vue.config.js
module.exports = {
  chainWebpack: config => {

    // Purescript Loader
    config.module
      .rule('purescript')
      .test(/\.purs$/)
      .use('purs-loader')
      .loader('purs-loader')
      .tap(options => ({
        // psc: 'psa',
        src: [
          path.join('src', '**', '*.purs'),
          path.join('.spago', '**', 'src', '**', '*.purs'),
        ]
      }))
  }
}
