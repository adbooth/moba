### src/client/models/client.coffee ###

class Client
  constructor: ->
    @eurecaClient = new Eureca.Client()
    @eurecaClient.ready (proxy) -> @eurecaServer = proxy

    @eurecaClient.exports.fingerprintToClient (fingerprint) ->
      @fingerprint = fingerprint
      
