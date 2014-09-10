logger = require './logger'
request = require 'request'

run = (jenkinsClient, job) ->
  logger.debug "Run job #{ job.name }"
  # Load a Jenkins Job
  jenkinsClient.getJob job.name, (jenkinsJob) ->
    # Jenkins Job Loaded
    logger.debug "job.lastSuccessfulBuild.number: #{ JSON.stringify jenkinsJob.get 'lastSuccessfulBuild.number' }"

schedule = (jenkinsClient, jobs) ->
  for job in jobs
    do (job) ->
      logger.debug "Schedule job #{ job.name } every #{ job.pollingInterval } minutes."
      #interval = job.pollingInterval * 60 * 1000
      interval = job.pollingInterval
      setInterval run, interval, jenkinsClient, job
      

exports.schedule = schedule
