loader = require './loader'

console.log "Starting..."

# Callback For Configuration Load Complete
onConfigurationLoaded = (configObj) ->
  console.log "Configuration: %j", configObj


# Load Configuration
configFile = __dirname + '/config.json'
configuration = loader.load configFile, onConfigurationLoaded
