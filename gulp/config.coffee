path = require 'path'

src   = path.resolve(__dirname, '../app')
build = path.resolve(__dirname, '../_build')

module.exports =
  directory:
    source: src
    build : build

  webpack:
    context: path.join src, '/dashboard/main.coffee'
    entry  : path.join src, '/dashboard/main.coffee'
    output :
      path    : path.join build, '/js'
      filename: 'bundle.js'
    module :
      loaders: [
        {test: /\.coffee$/, loader: 'coffee-loader'}
      ]

  views:
    path: path.join src, '/views/dashboard/index.jade'

  spotify:
    client_id: 'dcbceee645974fa3a525d6dc633a74ac'
    client_secret: 'be0c0c3b0f954d1a8486d8eba1438e88'
    redirect_uri: 'http://localhost:4000/callback'
    scopes: 'user-read-private user-read-email'