### src/server/server.coffee ###
# 3rd party imports
eureca = require 'eureca.io'
# Module imports
game = require('./app').game


# Eureca server object
eurecaServer = new eureca.Server {
  allow: ['fingerprintToClient']
}
# Eureca server start and event handlers
eurecaServer.attach require('./app').server


# Define connect and disconnect handlers
eurecaServer.onConnect (connection) ->
  fingerprint = connection.id
  console.log "Connected with fingerprint: #{fingerprint}"
  eurecaServer.getClient(fingerprint).fingerprintToClient {
    fingerprint: fingerprint
  }

eurecaServer.onDisconnect (connection) ->
  fingerprint = connection.id
  console.log "Disconnected with fingerprint #{fingerprint}"
  game.removePlayer fingerprint


# eurecaServer.exports.
