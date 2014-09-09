loader = require './loader'
scheduler = require './scheduler'
request = require 'request'

console.log "Starting..."

# Callback For Configuration Load Complete
onConfigurationLoaded = (configObj) ->
  console.log "Configuration: %j", configObj
  scheduler.schedule configObj

# Load Configuration
configFile = __dirname + '/config.json'
configuration = loader.load configFile, onConfigurationLoaded

