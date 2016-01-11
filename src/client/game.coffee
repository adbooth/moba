### game.coffee ###

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

protagonist = {}
playerList = {}
wasd = {}
mouseSprite = {}

game = new Phaser.Game $(window).width(), $(window).height(), Phaser.AUTO, 'phaser-example', {
  preload: preload
  create: eureceaClientSetup
  update: update
}

preload = ->
  $('canvas').css('cursor', 'none')

  game.load.image 'bullet', '/assets/bullet.png'
  game.load.image 'crosshair', '/assets/crosshair.png'

create = (gameSize, playerX, playerY) ->
  game.world.setBounds -gameSize/2, -gameSize/2, gameSize, gameSize
