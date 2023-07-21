const { environment } = require('@rails/webpacker')

environment.config.node = {
  __dirname: true,
  __filename: true,
  global: true
}

environment.loaders.get('babel').use[0].options = {
  presets: ['@babel/preset-env']
};

module.exports = environment

