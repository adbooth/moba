### routes.coffee ###
# 3rd party imports
router = require('express').Router()

# Index route
router.get '/', (req, res) ->
  res.redirect '/play'

# Start routes
router.get '/start', (req, res) ->
  res.render 'start'
router.post '/start', (req, res) ->
  # TODO Check for username and credentials and stuff
  res.render 'start'

# Play route
router.get '/play', (req, res) ->
  res.render 'play'

module.exports = router
