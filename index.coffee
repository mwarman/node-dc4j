logger = require './logger'
loader = require './loader'
scheduler = require './scheduler'
request = require 'request'

logger.debug "Starting..."

# Callback For Configuration Load Complete
onConfigurationLoaded = (configObj) ->
  logger.debug "Configuration: #{ JSON.stringify configObj }"
  scheduler.schedule configObj

# Load Configuration
configFile = __dirname + '/config.json'
configuration = loader.load configFile, onConfigurationLoaded

