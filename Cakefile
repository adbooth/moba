exec = require('child_process').exec
spawn = require('child_process').spawn

fs = require 'fs'

# Build tasks
task 'build:server', 'Builds server Coffeescript to JS in root', ->
  build = spawn 'coffee', ['-c', '-o', '.', 'src/server']
  build.stdout.on 'data', (data) ->
    console.log "server build stdout: #{data}"
  build.stderr.on 'data', (data) ->
    console.log "server build stderr: #{data}"

task 'build:client', 'Builds client Coffeescript to JS in public/js', ->
  # build = spawn 'coffee', ['-c', '--join', 'client.js', '-o', 'public/js', 'src/client']

  try
    fs.statSync 'public/js/'
  catch error
    fs.mkdir '/public/js/'
  coffeeFileNames = fs.readdirSync 'src/client/'
  JSFile = fs.createWriteStream 'public/js/client.js'
  for coffeeFileName in coffeeFileNames
    JSFile.write()



  build = exec 'coffee --compile --stdio > public/js/client.js'
  build.stdout.on 'data', (data) ->
    console.log "client build stdout: #{data}"
  build.stderr.on 'data', (data) ->
    console.log "client build stderr: #{data}"

task 'build', 'Builds server and client Coffeescript to JS', ->
  invoke 'build:server'
  invoke 'build:client'

# Start task
task 'start', 'Runs build code', ->
  start = exec 'foreman start'
  start.stdout.on 'data', (data) ->
    console.log "start stdout: #{data}"
  start.stderr.on 'data', (data) ->
    console.log "start stderr: #{data}"

# Clean task
task 'clean', 'Cleans out previously generated source', ->
  clean = exec 'rm *.js & rm -rf models/ & rm -rf public/js/'
  clean.stdout.on 'data', (data) ->
    console.log "clean stdout: #{data}"
  clean.stderr.on 'data', (data) ->
    console.log "clean stderr: #{data}"
