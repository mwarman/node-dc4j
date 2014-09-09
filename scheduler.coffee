request = require 'request'

config = {}

execute = (job) ->
  url = config.jenkins.url + 'job/' + job.name + '/api/json'
  request.get url, config.jenkins.credentials, (err, resp, body) ->
    if err || resp.statusCode isnt 200
      console.warn "Unable to communicate with Jenkins."
    data = JSON.parse body
    console.log "Jenkins: %j", data

run = (job) ->
  console.log "Running job %s every %d minutes.", job.name, job.pollingInterval
  setInterval execute, job.pollingInterval, job

schedule = (configObj) ->
  config = configObj
  run job for job in configObj.jenkins.jobs 

exports.schedule = schedule
