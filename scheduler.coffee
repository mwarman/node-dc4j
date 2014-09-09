logger = require './logger'
request = require 'request'

config = {}

execute = (job) ->
  url = config.jenkins.url + 'job/' + job.name + '/api/json'
  request.get url, config.jenkins.credentials, (err, resp, body) ->
    if err || resp.statusCode isnt 200
      logger.warn "Unable to communicate with Jenkins."
    data = JSON.parse body
    logger.debug "Jenkins: #{ JSON.stringify data }"

run = (job) ->
  logger.debug "Running job #{ job.name } every #{ job.pollingInterval } minutes."
  interval = job.pollingInterval * 60 * 1000
  setInterval execute, interval, job

schedule = (configObj) ->
  config = configObj
  run job for job in configObj.jenkins.jobs 

exports.schedule = schedule
