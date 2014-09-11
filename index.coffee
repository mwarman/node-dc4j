logger = require './logger'
loader = require './loader'
scheduler = require './scheduler'
jenkinsClient = require './jenkinsClient'

logger.debug "Starting..."

# Load Configuration
configFile = __dirname + '/config.json'
loader.load configFile, (config) ->
  # Configuration Loaded
  logger.debug "Configuration: #{ JSON.stringify config }"
  # Get Jenkins Client
  jenkinsClient = jenkinsClient.getInstance config.jenkins.url, config.jenkins.credentials
  # Schedule Jobs
  scheduler.schedule jenkinsClient, config.jobs

