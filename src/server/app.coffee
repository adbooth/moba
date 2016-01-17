### app.coffee ###
# Node imports
path = require 'path'
# 3rd party imports
express = require 'express'

# Make Express.js app
app = express()
# Set up public folder
app.use express.static path.join __dirname, 'public'
# Set up Jade view engine
app.set 'view engine', 'jade'
# Set up routes
app.use '/', require './routes'

# Start server
app.set 'port', process.env.PORT or 5000
server = app.listen app.get('port'), ->
  host = server.address().address
  port = app.get 'port'
  console.log "Application server running at http://#{host}:#{port}"

exports.server = server
