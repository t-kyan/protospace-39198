const { environment } = require('@rails/webpacker')

environment.config.node = {
  __dirname: true,
  __filename: true,
  global: true
}

// Babelの設定を追加
environment.loaders.get('babel').options = {
  presets: ['@babel/preset-env']
};

module.exports = environment

