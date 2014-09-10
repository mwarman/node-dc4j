logger = require './logger'
request = require 'request'

config = {}

execute = (job) ->
  logger.debug "Execute"

run = (job) ->
  logger.debug "Run job #{ job.name } every #{ job.pollingInterval } minutes."
  #interval = job.pollingInterval * 60 * 1000
  interval = job.pollingInterval
  setInterval execute, interval, job

schedule = (configObj) ->
  config = configObj
  run job for job in configObj.jenkins.jobs 

exports.schedule = schedule
