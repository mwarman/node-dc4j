logger = require './logger'
loader = require './loader'
scheduler = require './scheduler'
jenkinsClient = require './jenkinsClient'

logger.debug "Starting..."

# Load Configuration
configFile = __dirname + '/config.json'
configuration = loader.load configFile, (config) ->
  # Configuration Loaded
  logger.debug "Configuration: #{ JSON.stringify config }"
  # Get Jenkins Client
  jenkinsClient = jenkinsClient.getInstance config.jenkins.url, config.jenkins.credentials
  # Load a Jenkins Job
  jenkinsClient.getJob 'apcapstone', (jenkinsJob) ->
    # Jenkins Job Loaded
    logger.debug "job: #{ jenkinsJob }"
  #scheduler.schedule configObj

