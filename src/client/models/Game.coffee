### src/client/models/game.coffee ###

# Resizes the game to the window size first thing
$(window).resize ->
  window.resizeGame()

# Function for chaning the size of the game to the window size
resizeGame = ->
  height = $(window).height()
  width = $(window).width()

  game.width = width
  game.height = height
  game.world.bounds.width = width
  game.world.bounds.height = height

  if game.renderType == Phaser.WEBGL
    game.renderer.resize width, height

# Game globals
protagonist = {}
wasd = {}
mouseSprite = {}


class Game
  @colors: {
    BLUE: 0x0000FF
    RED: 0xFF0000
    GREEN: 0x00FF00
    YELLOW: 0xFFFF00
    CYAN: 0x00FFFF
    FUCHSIA: 0xFF00FF
    WHITE: 0xFFFFFF
    BLACK: 0x000000
  }

  # Player management
  playerDict: {}
  playerList: []
  # Team management
  teamDict: {}
  teamList: []

  constructor: ->
    @phaserGame = new Phaser.Game $(window).width(), $(window).height(), Phaser.AUTO, 'phaser-example', {
      preload: preload
      create: eureceaClientSetup
      update: update
    }
    @protagonist = new Player

  addPlayer: (fingerprint) ->
    @playerList.push(@playerDict[fingerprint] = new Player)


# Loads assets
preload = ->
  $('canvas').css('cursor', 'none')

  game.load.image 'bullet', '/assets/bullet.png'
  game.load.image 'crosshair', '/assets/crosshair.png'

# Builds/initializes game world
create = (gameSize, playerX, playerY) ->
  game.world.setBounds -gameSize/2, -gameSize/2, gameSize, gameSize

update = ->
