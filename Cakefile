exec = require('child_process').exec
spawn = require('child_process').spawn

fs = require 'fs'

recursiveFileAbsPaths = (dirName) ->
  fileAbsPathList = []
  dirAbsPath = fs.realpathSync dirName
  itemNameList = fs.readdirSync dirAbsPath
  for itemName in itemNameList
    itemPath = require('path').join dirAbsPath, itemName
    if fs.lstatSync(itemPath).isDirectory()
      fileAbsPathList = fileAbsPathList.concat recursiveFileAbsPaths itemPath
    else
      fileAbsPathList.push itemPath
  fileAbsPathList

# Build tasks
task 'build:server', 'Builds server Coffeescript to JS in root', ->
  build = spawn 'coffee', ['-c', '-o', '.', 'src/server']
  build.stdout.on 'data', (data) ->
    console.log "server build stdout: #{data}"
  build.stderr.on 'data', (data) ->
    console.log "server build stderr: #{data}"

task 'build:client', 'Builds client Coffeescript to JS in public/js', ->
  # Make js folder
  try
    fs.statSync 'public/js/'
  catch error
    fs.mkdir 'public/js/'

  # Concatonate
  JSFile = fs.createWriteStream 'src/clientBundle.coffee'
  coffeeFilePaths = recursiveFileAbsPaths 'src/client/'
  for coffeeFilePath in coffeeFilePaths
    JSFile.write fs.readFileSync coffeeFilePath, 'utf8'

  # Transpile
  build = spawn 'coffee', ['-c', '-o', 'public/js/', 'src/clientBundle.coffee']
  build.stdout.on 'data', (data) ->
    console.log "client build stdout: #{data}"
  build.stderr.on 'data', (data) ->
    console.log "client build stderr: #{data}"

task 'build', 'Builds server and client Coffeescript to JS', ->
  invoke 'build:server'
  invoke 'build:client'

# Start task
task 'start', 'Runs built code', ->
  start = exec 'foreman start'
  start.stdout.on 'data', (data) ->
    console.log "start stdout: #{data}"
  start.stderr.on 'data', (data) ->
    console.log "start stderr: #{data}"

task 'run', 'Builds and runs', ->
  build = exec 'cake build'
  build.stdout.on 'data', (data) ->
    console.log "build stdout: #{data}"
  build.stderr.on 'data', (data) ->
    console.log "build stderr: #{data}"
  build.on 'exit', (exitCode) ->
    invoke 'start'







# Clean task
task 'clean', 'Cleans out previously generated source', ->
  clean = exec 'rm *.js & rm src/clientBundle.coffee & rm -rf models/ & rm -rf public/js/'
  clean.stdout.on 'data', (data) ->
    console.log "clean stdout: #{data}"
  clean.stderr.on 'data', (data) ->
    console.log "clean stderr: #{data}"
