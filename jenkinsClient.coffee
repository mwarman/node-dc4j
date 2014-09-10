logger = require './logger'
request = require 'request'

class JenkinsJob
  constructor: (@model) ->
  
  get: (attr) ->
    if @model[attr]?
      @model[attr]
  
  toString: () ->
    JSON.stringify @model
  

class JenkinsClient
  constructor: (@baseUrl, @credentials) ->
  
  getJob: (jobname, callback) ->
    logger.debug "Get Jenkins Job #{ jobname }"
    url = @baseUrl + 'job/' + jobname + '/api/json'
    request.get url, @credentials, (err, resp, body) ->
      if err || resp.statusCode isnt 200
        logger.warn "Unable to communicate with Jenkins."
        throw err
      jobdata = JSON.parse body
      jenkinsJob = new JenkinsJob jobdata
      callback jenkinsJob

getInstance = (baseUrl, credentials) ->
  new JenkinsClient baseUrl, credentials
  
exports.getInstance = getInstance