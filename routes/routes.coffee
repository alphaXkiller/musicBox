spotify = require('../gulp/config.coffee').spotify
querystring = require 'querystring'
request = require 'request'

module.exports = (app) ->
  app.get '/', (req, res) ->
    res.render 'index'

  app.get '/login', (req, res) ->
    authorizeURL = 'https://accounts.spotify.com/authorize?'
    authorizeObj = querystring.stringify
      scope: spotify.scope
      client_id: spotify.client_id
      response_type: 'code'
      redirect_uri: spotify.redirect_uri

    res.redirect authorizeURL + authorizeObj

  app.get '/callback', (req, res) ->
    code = req.query.code || null

    authOptions =
      url: 'https://accounts.spotify.com/api/token'
      form:
        code: code
        redirect_uri: spotify.redirect_uri
        grant_type: 'authorization_code'
      headers:
        Authorization: 'Basic ' + new Buffer(spotify.client_id + ':' + spotify.client_secret).toString('base64')
      json: true

    res.render 'login'
    # request.post authOptions, (err, response, body) ->
    #   if !err & response.statusCode == 200
    #     access_token = body.access_token
    #     refresh_token = body.refresh_token

    #     options =
    #       url: 'https://api.spotify.com/v1/me'
    #       headers:
    #         Authorization: 'Bearer ' + access_token
    #       json: true

    #   request.get options, (err, response, body) ->
    #     console.log body

    #   tokensParam = querystring.stringify
    #     access_token: access_token
    #     refresh_token: refresh_token

    #   res.redirect '/#' + tokensParam

  return app
